typedef struct packed {
    reg Sign;
    reg [4:0] Exp;
    reg [4:0] Fract;
} FP;

module fpa(
    input clk,
    input reset,
    input FP A,
    input FP B,
    input FP C,
    input FP D,
    input pushin,
    output logic pushout,
    output FP Z
);

logic [4:0] A_fract, B_fract, C_fract, D_fract;
logic [4:0] A_fract_s1, B_fract_s1, C_fract_s1, D_fract_s1;
logic [4:0] A_exp, B_exp, C_exp, D_exp;
logic [4:0] A_exp_s1, B_exp_s1, C_exp_s1, D_exp_s1;
logic A_sign, B_sign, C_sign, D_sign;
logic A_sign_s1, B_sign_s1, C_sign_s1, D_sign_s1;
logic A_sign_s2, B_sign_s2, C_sign_s2, D_sign_s2;
logic A_sign_s3, B_sign_s3, C_sign_s3, D_sign_s3;

logic [12:0] pad_hidden_bit_A_guard, pad_hidden_bit_B_guard, pad_hidden_bit_C_guard, pad_hidden_bit_D_guard;
logic [12:0] pad_hidden_bit_A_guard_s2, pad_hidden_bit_B_guard_s2, pad_hidden_bit_C_guard_s2, pad_hidden_bit_D_guard_s2;
logic [4:0] max_exponent, max_exponent_s2, max_exponent_s3, max_exponent_s4;
logic [4:0] exponent_normalized, exponent_normalized_s5;
logic [4:0] exponent_saturate, exponent_saturate_s6;
logic [4:0] diff_A, diff_B, diff_C, diff_D;
logic [4:0] diff_A_s2, diff_B_s2, diff_C_s2, diff_D_s2;
logic [12:0] shift_A_guard, shift_B_guard, shift_C_guard, shift_D_guard;
logic [12:0] shift_A_guard_s3, shift_B_guard_s3, shift_C_guard_s3, shift_D_guard_s3;

logic [12:0] pos_neg_A, pos_neg_B, pos_neg_C, pos_neg_D;
logic [12:0] add_result, add_result_s4;
logic [12:0] add_adjusted;
logic [4:0] add_normalized, add_normalized_s5;
logic [4:0] add_saturate, add_saturate_s6;
logic sign, sign_s4, sign_s5, sign_s6;

logic select1, select2, select3;
logic [3:0] lm1, lm1_diff;
logic lm1_found;
logic add_carry, subtract_carry;

logic done, done_s1, done2, done2_s2, done3, done3_s3, done4, done4_s4, done5, done5_s5, done6, done6_s6;

// Separate sign, exponent, and fraction
always_comb begin
    if (pushin) begin
        A_fract = A.Fract;
        B_fract = B.Fract;
        C_fract = C.Fract;
        D_fract = D.Fract;
        A_exp = A.Exp;
        B_exp = B.Exp;
        C_exp = C.Exp;
        D_exp = D.Exp;
        A_sign = A.Sign;
        B_sign = B.Sign;
        C_sign = C.Sign;
        D_sign = D.Sign;
        done = 1;
    end else begin
        A_fract = 0;
        B_fract = 0;
        C_fract = 0;
        D_fract = 0;
        A_exp = 0;
        B_exp = 0;
        C_exp = 0;
        D_exp = 0;
        A_sign = 0;
        B_sign = 0;
        C_sign = 0;
        D_sign = 0;
        done = 0;
    end
end

// Pipeline 1: sign, exponent, and fraction registers
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        A_fract_s1 <= 0;
        B_fract_s1 <= 0;
        C_fract_s1 <= 0;
        D_fract_s1 <= 0;
        A_exp_s1 <= 0;
        B_exp_s1 <= 0;
        C_exp_s1 <= 0;
        D_exp_s1 <= 0;
        A_sign_s1 <= 0;
        B_sign_s1 <= 0;
        C_sign_s1 <= 0;
        D_sign_s1 <= 0;
        done_s1 <= 0;
    end else begin
        A_fract_s1 <= A_fract;
        B_fract_s1 <= B_fract;
        C_fract_s1 <= C_fract;
        D_fract_s1 <= D_fract;
        A_exp_s1 <= A_exp;
        B_exp_s1 <= B_exp;
        C_exp_s1 <= C_exp;
        D_exp_s1 <= D_exp;
        A_sign_s1 <= A_sign;
        B_sign_s1 <= B_sign;
        C_sign_s1 <= C_sign;
        D_sign_s1 <= D_sign;
        done_s1 <= done;
    end
end

// Compare exponents to largest exponent
always_comb begin
    if (done_s1) begin
        pad_hidden_bit_A_guard = {4'b0001, A_fract_s1, 4'b0000};
        pad_hidden_bit_B_guard = {4'b0001, B_fract_s1, 4'b0000};
        pad_hidden_bit_C_guard = {4'b0001, C_fract_s1, 4'b0000};
        pad_hidden_bit_D_guard = {4'b0001, D_fract_s1, 4'b0000};
        if (A_exp_s1 > B_exp_s1) begin
            max_exponent = A_exp_s1;
        end else begin
            max_exponent = B_exp_s1;
        end
        if (C_exp_s1 > max_exponent) begin
            max_exponent = C_exp_s1;
        end else begin
            max_exponent = max_exponent;
        end
        if (D_exp_s1 > max_exponent) begin
            max_exponent = D_exp_s1;
        end else begin
            max_exponent = max_exponent;
        end
        diff_A = max_exponent - A_exp_s1;
        diff_B = max_exponent - B_exp_s1;
        diff_C = max_exponent - C_exp_s1;
        diff_D = max_exponent - D_exp_s1;
        done2 = 1;
    end else begin
        max_exponent = 0;
        pad_hidden_bit_A_guard = 0;
        pad_hidden_bit_B_guard = 0;
        pad_hidden_bit_C_guard = 0;
        pad_hidden_bit_D_guard = 0;
        diff_A = 0;
        diff_B = 0;
        diff_C = 0;
        diff_D = 0;
        done2 = 0;
    end
end

// Pipeline 2: Matched exponent for fraction registers
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        max_exponent_s2 <= 0;
        pad_hidden_bit_A_guard_s2 <= 0;
        pad_hidden_bit_B_guard_s2 <= 0;
        pad_hidden_bit_C_guard_s2 <= 0;
        pad_hidden_bit_D_guard_s2 <= 0;
        diff_A_s2 <= 0;
        diff_B_s2 <= 0;
        diff_C_s2 <= 0;
        diff_D_s2 <= 0;
        A_sign_s2 <= 0;
        B_sign_s2 <= 0;
        C_sign_s2 <= 0;
        D_sign_s2 <= 0;
        done2_s2 <= 0;
    end else begin
        max_exponent_s2 <= max_exponent;
        pad_hidden_bit_A_guard_s2 <= pad_hidden_bit_A_guard;
        pad_hidden_bit_B_guard_s2 <= pad_hidden_bit_B_guard;
        pad_hidden_bit_C_guard_s2 <= pad_hidden_bit_C_guard;
        pad_hidden_bit_D_guard_s2 <= pad_hidden_bit_D_guard;
        diff_A_s2 <= diff_A;
        diff_B_s2 <= diff_B;
        diff_C_s2 <= diff_C;
        diff_D_s2 <= diff_D;
        A_sign_s2 <= A_sign_s1;
        B_sign_s2 <= B_sign_s1;
        C_sign_s2 <= C_sign_s1;
        D_sign_s2 <= D_sign_s1;
        done2_s2 <= done2;
    end
end

// Shift right to match exponent
always_comb begin
    if (done2_s2) begin
        shift_A_guard = pad_hidden_bit_A_guard_s2 >> diff_A_s2;
        shift_B_guard = pad_hidden_bit_B_guard_s2 >> diff_B_s2;
        shift_C_guard = pad_hidden_bit_C_guard_s2 >> diff_C_s2;
        shift_D_guard = pad_hidden_bit_D_guard_s2 >> diff_D_s2;
        done3 = 1;
    end else begin
        shift_A_guard = 0;
        shift_B_guard = 0;
        shift_C_guard = 0;
        shift_D_guard = 0;
        done3 = 0;
    end
end

// Pipeline 3: shift right registers
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_A_guard_s3 <= 0;
        shift_B_guard_s3 <= 0;
        shift_C_guard_s3 <= 0;
        shift_D_guard_s3 <= 0;
        max_exponent_s3 <= 0;
        A_sign_s3 <= 0;
        B_sign_s3 <= 0;
        C_sign_s3 <= 0;
        D_sign_s3 <= 0;
        done3_s3 <= 0;
    end else begin
        shift_A_guard_s3 <= shift_A_guard;
        shift_B_guard_s3 <= shift_B_guard;
        shift_C_guard_s3 <= shift_C_guard;
        shift_D_guard_s3 <= shift_D_guard;
        max_exponent_s3 <= max_exponent_s2;
        A_sign_s3 <= A_sign_s2;
        B_sign_s3 <= B_sign_s2;
        C_sign_s3 <= C_sign_s2;
        D_sign_s3 <= D_sign_s2;
        done3_s3 <= done3;
    end
end

// Add the four inputs. If sign bit is negative, take 2's complement
always_comb begin
    if (done3_s3) begin
        if (A_sign_s3) begin
            pos_neg_A = ~shift_A_guard_s3 + 1;
            //$display("here1");
        end else begin
            //$display("here2");
            pos_neg_A = shift_A_guard_s3;
        end
        if (B_sign_s3) begin
            pos_neg_B = ~shift_B_guard_s3 + 1;
        end else begin
            pos_neg_B = shift_B_guard_s3;
        end
        if (C_sign_s3) begin
            pos_neg_C = ~shift_C_guard_s3 + 1;
        end else begin
            pos_neg_C = shift_C_guard_s3;
        end
        if (D_sign_s3) begin
            pos_neg_D = ~shift_D_guard_s3 + 1;
        end else begin
            pos_neg_D = shift_D_guard_s3;
        end
        add_result = pos_neg_A + pos_neg_B + pos_neg_C + pos_neg_D;
        if (add_result[12]) begin
            sign = 1;
            add_result = ~add_result + 1;
        end else begin
            sign = 0;
            add_result = add_result;
        end
        done4 = 1;
    end else begin
        sign = 0;
        add_result = 0;
        done4 = 0;
    end
end

// Pipeline 4: add result and sign registers
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        sign_s4 <= 0;
        add_result_s4 <= 0;
        max_exponent_s4 <= 0;
        done4_s4 <= 0;
    end else begin
        sign_s4 <= sign;
        add_result_s4 <= add_result;
        max_exponent_s4 <= max_exponent_s3;
        done4_s4 <= done4;
    end
end

// Find the left most 1 and normalize the exponent and fraction
always_comb begin
    select3 = 0;
    if (done4_s4) begin
        if (add_result_s4[12:8] != 0) begin
            select1 = 1;
        end else if (add_result_s4[7:0] != 0) begin
            select1 = 1;
        end else begin
            select1 = 0;
        end
        if (select1) begin
            if (add_result_s4[12:10] != 0) begin
                select2 = 1;
            end else if (add_result_s4[9:8] != 0) begin
                select2 = 1;
            end else if (add_result_s4[7:4] != 0) begin
                select2 = 1;
            end else if (add_result_s4[3:0] != 0) begin
                select2 = 1;
            end else begin
                select2 = 0;
            end
        end else begin
            select2 = 0;
        end
        if (select2) begin
            if (add_result_s4[12]) begin
                lm1 = 12;
                lm1_found = 1;
            end else if (add_result_s4[11:10] != 0) begin
                select3 = 1;
                lm1_found = 0;
            end else if (add_result_s4[9]) begin
                lm1 = 9;
                lm1_found = 1;
            end else if (add_result_s4[8]) begin
                lm1 = 8;
                lm1_found = 1;
            end else if (add_result_s4[7:6] != 0) begin
                select3 = 1;
                lm1_found = 0;
            end else if (add_result_s4[5:4] != 0) begin
                select3 = 1;
                lm1_found = 0;
            end else if (add_result_s4[3:2] != 0) begin
                select3 = 1;
                lm1_found = 0;
            end else if (add_result_s4[1:0] != 0) begin
                select3 = 1;
                lm1_found = 0;
            end else begin
                select3 = 0;
                lm1_found = 0;
            end
        end else begin
            select3 = 0;
            lm1_found = 0;
        end
        if (select3 && !lm1_found) begin
            if (add_result_s4[11]) begin
                lm1 = 11;
            end else if (add_result_s4[10]) begin
                lm1 = 10;
            end else if (add_result_s4[7]) begin
                lm1 = 7;
            end else if (add_result_s4[6]) begin
                lm1 = 6;
            end else if (add_result_s4[5]) begin
                lm1 = 5;
            end else if (add_result_s4[4]) begin
                lm1 = 4;
            end else if (add_result_s4[3]) begin
                lm1 = 3;
            end else if (add_result_s4[2]) begin
                lm1 = 2;
            end else if (add_result_s4[1]) begin
                lm1 = 1;
            end else if (add_result_s4[0]) begin
                lm1 = 0;
            end else begin
                lm1 = 0;
            end
        end else if (lm1_found) begin
            lm1 = lm1;
        end else begin
            lm1 = 13;
        end
        if ((lm1 >= 9) && (lm1 <= 12)) begin
            lm1_diff = lm1 - 9;
            add_adjusted = add_result_s4 >> lm1_diff;
            add_normalized = add_adjusted[8:4];
            exponent_normalized = max_exponent_s4 + lm1_diff;
            add_carry = 1;
            subtract_carry = 0;
        end else if (lm1 < 9) begin
            lm1_diff = 9 - lm1;
            add_adjusted = add_result_s4 << lm1_diff;
            add_normalized = add_adjusted[8:4];
            exponent_normalized = max_exponent_s4 - lm1_diff;
            add_carry = 0;
            subtract_carry = 1;
        end else begin
            add_adjusted = add_result_s4;
            add_normalized = add_adjusted[8:4];
            exponent_normalized = 5'b00000;
            add_carry = 0;
            subtract_carry = 0;
        end
        done5 = 1;
    end else begin
        add_normalized = 0;
        exponent_normalized = 0;
        add_carry = 0;
        subtract_carry = 0;//subtract_carry;
        lm1 = 9;
        select1 = 0;
        select2 = 0;
        select3 = 0;
        done5 = 0;
    end
end

// Pipeline 5: normalize exponent and fraction registers
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        add_normalized_s5 <= 0;
        exponent_normalized_s5 <= 0;
        sign_s5 <= 0;
        done5_s5 <= 0;
    end else begin
        add_normalized_s5 <= add_normalized;
        exponent_normalized_s5 <= exponent_normalized;
        sign_s5 <= sign_s4;
        done5_s5 <= done5;
    end
end

// Saturation for addition and exponent
always_comb begin
    if (done5_s5) begin
        // If overflow or equal to the max value of normalization for addition and multiplication or over the max value of normalization of addition, set to max value
        if (((exponent_normalized_s5 >= 5'b11110) && (add_normalized_s5 >= 5'b11000)) || (exponent_normalized_s5 > 5'b11110)) begin
            add_saturate = 5'b11000;
            exponent_saturate = 5'b11110;
        // If the carry flag is high and addition normalization + carry is equal to max value
        end else if ((exponent_normalized_s5 == 5'b11110) && (add_carry)) begin
            add_saturate = add_normalized_s5;
            exponent_saturate = exponent_normalized_s5;
        // If underflow of addition normalization is less than lowest value, set to zero
        end else if ((exponent_normalized_s5 == 5'b00010) && (add_normalized_s5 != 0)) begin //(subtract_carry)) begin
            add_saturate = add_normalized_s5;
            exponent_saturate = exponent_normalized_s5;
            //$display("here1");
        // If no overflow or underflow, use data from pipeline 3 registers
        end else if (exponent_normalized_s5 <= 5'b00010) begin
            add_saturate = 5'b00000;
            exponent_saturate = 5'b00000;
            //$display("here2");

        end else begin
            add_saturate = add_normalized_s5;
            exponent_saturate = exponent_normalized_s5;
        end
        done6 = 1;
    end else begin
        add_saturate = 0;
        exponent_saturate = 0;
        done6 = 0;
    end
end

//Pipeline 6: Saturation for addition and exponent registers
always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
        add_saturate_s6 <= 0;
        exponent_saturate_s6 <= 0;
        sign_s6 <= 0;
        done6_s6 <= 0;
    end else begin
        add_saturate_s6 <= add_saturate;
        exponent_saturate_s6 <= exponent_saturate;
        sign_s6 <= sign_s5;
        done6_s6 <= done6;
    end
end

// Transfer results to Z sign, exponent, and fraction and pushout
always_comb begin
    if (done6_s6) begin
        Z.Sign = sign_s6;
        Z.Exp = exponent_saturate_s6;
        Z.Fract = add_saturate_s6;
        pushout = 1;
    end else begin
        Z.Sign = 0;
        Z.Exp = 0;
        Z.Fract = 0;
        pushout = 0;
    end
end

endmodule
