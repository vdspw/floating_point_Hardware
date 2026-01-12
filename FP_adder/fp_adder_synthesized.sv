
`include "defs.sv"


module fp11_add (
    input  logic        clk,
    input  logic        reset,
    input  FP11         a,
    input  FP11         b,
    output FP11         result
);
    // Pipeline Stage 1: Unpack and Compare
    logic        sign_a_s1, sign_b_s1;
    logic [4:0]  exp_a_s1, exp_b_s1;
    logic [5:0]  mant_a_s1, mant_b_s1;  // Include hidden 1
    logic [4:0]  exp_diff_s1;
    logic        swap_s1;

    // Pipeline Stage 2: Align
    logic        sign_out_s2;
    logic [4:0]  larger_exp_s2;
    logic [12:0] aligned_mant_a_s2;  // Extra bits for shift
    logic [12:0] aligned_mant_b_s2;

    // Pipeline Stage 3: Add/Subtract
    logic [13:0] sum_result_s3;  // Extra bit for carry
    logic        sign_out_s3;
    logic [4:0]  exp_out_s3;

    // Stage 1: Unpack and Compare
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sign_a_s1 <= '0;
            sign_b_s1 <= '0;
            exp_a_s1 <= '0;
            exp_b_s1 <= '0;
            mant_a_s1 <= '0;
            mant_b_s1 <= '0;
            exp_diff_s1 <= '0;
            swap_s1 <= '0;
        end else begin
            // Unpack inputs using FP11 struct
            sign_a_s1 <= a.sign;
            sign_b_s1 <= b.sign;
            exp_a_s1 <= a.exp;
            exp_b_s1 <= b.exp;
            mant_a_s1 <= {1'b1, a.mant};  // Add hidden 1
            mant_b_s1 <= {1'b1, b.mant};  // Add hidden 1

            // Compare exponents
            exp_diff_s1 <= (a.exp >= b.exp) ? 
                          (a.exp - b.exp) : 
                          (b.exp - a.exp);
            swap_s1 <= (a.exp < b.exp);
        end
    end

    // Stage 2: Alignment
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sign_out_s2 <= '0;
            larger_exp_s2 <= '0;
            aligned_mant_a_s2 <= '0;
            aligned_mant_b_s2 <= '0;
        end else begin
            // Select larger exponent
            larger_exp_s2 <= swap_s1 ? exp_b_s1 : exp_a_s1;

            // Align mantissas
            if (swap_s1) begin
                aligned_mant_a_s2 <= {mant_a_s1, 7'b0} >> exp_diff_s1;
                aligned_mant_b_s2 <= {mant_b_s1, 7'b0};
                sign_out_s2 <= sign_b_s1;
            end else begin
                aligned_mant_a_s2 <= {mant_a_s1, 7'b0};
                aligned_mant_b_s2 <= {mant_b_s1, 7'b0} >> exp_diff_s1;
                sign_out_s2 <= sign_a_s1;
            end
        end
    end

    // Stage 3: Add/Subtract and Normalize
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sum_result_s3 <= '0;
            sign_out_s3 <= '0;
            exp_out_s3 <= '0;
        end else begin
            sign_out_s3 <= sign_out_s2;
            
            // Add or subtract based on signs
            if (sign_a_s1 == sign_b_s1) begin
                sum_result_s3 <= aligned_mant_a_s2 + aligned_mant_b_s2;
                sign_out_s3 <= sign_a_s1;
            end else if (aligned_mant_a_s2 >= aligned_mant_b_s2) begin
                sum_result_s3 <= aligned_mant_a_s2 - aligned_mant_b_s2;
                sign_out_s3 <= sign_a_s1;
            end else begin
                sum_result_s3 <= aligned_mant_b_s2 - aligned_mant_a_s2;
                sign_out_s3 <= sign_b_s1;
            end
            
            exp_out_s3 <= larger_exp_s2;
        end
    end

    // Final Stage: Output
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            result <= '0;
        end else begin
            result.sign <= sign_out_s3;
            
            // Normalize result and adjust exponent
            if (sum_result_s3[13]) begin
                result.exp <= exp_out_s3 + 1'b1;
                result.mant <= sum_result_s3[12:8];
            end else if (sum_result_s3[12]) begin
                result.exp <= exp_out_s3;
                result.mant <= sum_result_s3[11:7];
            end else if (sum_result_s3[11]) begin
                result.exp <= exp_out_s3 - 1'b1;
                result.mant <= sum_result_s3[10:6];
            end else begin
                result.exp <= '0;
                result.mant <= '0;
            end
        end
    end

endmodule
