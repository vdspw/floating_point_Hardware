/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP5
// Date      : Sun Dec  1 03:58:12 2024
/////////////////////////////////////////////////////////////


module fp11_add ( clk, reset, .a({\a[sign] , \a[exp][4] , \a[exp][3] , 
        \a[exp][2] , \a[exp][1] , \a[exp][0] , \a[mant][4] , \a[mant][3] , 
        \a[mant][2] , \a[mant][1] , \a[mant][0] }), .b({\b[sign] , \b[exp][4] , 
        \b[exp][3] , \b[exp][2] , \b[exp][1] , \b[exp][0] , \b[mant][4] , 
        \b[mant][3] , \b[mant][2] , \b[mant][1] , \b[mant][0] }), .result({
        \result[sign] , \result[exp][4] , \result[exp][3] , \result[exp][2] , 
        \result[exp][1] , \result[exp][0] , \result[mant][4] , 
        \result[mant][3] , \result[mant][2] , \result[mant][1] , 
        \result[mant][0] }) );
  input clk, reset, \a[sign] , \a[exp][4] , \a[exp][3] , \a[exp][2] ,
         \a[exp][1] , \a[exp][0] , \a[mant][4] , \a[mant][3] , \a[mant][2] ,
         \a[mant][1] , \a[mant][0] , \b[sign] , \b[exp][4] , \b[exp][3] ,
         \b[exp][2] , \b[exp][1] , \b[exp][0] , \b[mant][4] , \b[mant][3] ,
         \b[mant][2] , \b[mant][1] , \b[mant][0] ;
  output \result[sign] , \result[exp][4] , \result[exp][3] , \result[exp][2] ,
         \result[exp][1] , \result[exp][0] , \result[mant][4] ,
         \result[mant][3] , \result[mant][2] , \result[mant][1] ,
         \result[mant][0] ;
  wire   sign_a_s1, sign_b_s1, swap_s1, N18, N19, N20, N21, N28, N29, N30, N31,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83,
         sign_out_s3, N113, N114, N115, N116, N117, N118, N119, N121, N142,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n288, n291,
         n293, n294, n295, n296, n297, n298, n299, n300, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n314, n316, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n490, n492, n493, n494, n495, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n599, n601, n603, n604,
         n605, n606, n607, n608, n609, n610, n612, n613, n614, n615, n618,
         n619, n620, n621, n622, n623, n625, n626, n627, n628, n629, n630,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n643, n644,
         n645, n646, n647, n648, n650, n651, n652, n653, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n726, n727, n728, n729, n730, n731, n732, n733, n734,
         n735, n736, n737, n738, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, n775, n776, n777, n778,
         n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822,
         n823, n824, n825, n826, n827, n828, n829, n830, n831, n832, n833,
         n834, n835, n836, n837, n838, n839, n840, n841, n842, n843, n844,
         n845, n846, n847, n848, n849, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859, n860, n861, n862, n863, n864, n865, n866,
         n867, n868, n869, n870, n871, n872, n873, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, n899,
         n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921,
         n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n950, n951, n952, n953, n954,
         n955, n956, n957, n958, n959, n960, n961, n962, n963, n964, n965,
         n966, n967, n968, n969, n970, n971, n972, n973, n974, n975, n976,
         n977, n978, n979, n980, n981, n982, n983, n984, n985, n986, n987,
         n988, n989, n990, n991, n992, n993, n994, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038,
         n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088;
  wire   [4:0] exp_a_s1;
  wire   [4:0] exp_b_s1;
  wire   [5:0] mant_a_s1;
  wire   [5:0] mant_b_s1;
  wire   [4:0] exp_diff_s1;
  wire   [4:0] larger_exp_s2;
  wire   [12:0] aligned_mant_a_s2;
  wire   [12:0] aligned_mant_b_s2;
  wire   [13:6] sum_result_s3;
  wire   [4:0] exp_out_s3;

  DFFSR swap_s1_reg ( .D(n604), .CLK(clk), .R(n1081), .S(1'b1), .Q(swap_s1) );
  DFFSR sign_a_s1_reg ( .D(\a[sign] ), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        sign_a_s1) );
  DFFSR sign_b_s1_reg ( .D(\b[sign] ), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        sign_b_s1) );
  DFFSR \exp_a_s1_reg[4]  ( .D(n500), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        exp_a_s1[4]) );
  DFFSR \exp_a_s1_reg[3]  ( .D(n499), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        exp_a_s1[3]) );
  DFFSR \exp_a_s1_reg[2]  ( .D(n1083), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        exp_a_s1[2]) );
  DFFSR \exp_a_s1_reg[1]  ( .D(n1086), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        exp_a_s1[1]) );
  DFFSR \exp_a_s1_reg[0]  ( .D(n595), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        exp_a_s1[0]) );
  DFFSR \exp_b_s1_reg[4]  ( .D(n1084), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        exp_b_s1[4]) );
  DFFSR \exp_b_s1_reg[3]  ( .D(n493), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        exp_b_s1[3]) );
  DFFSR \exp_b_s1_reg[2]  ( .D(n1085), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        exp_b_s1[2]) );
  DFFSR \exp_b_s1_reg[1]  ( .D(n1082), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        exp_b_s1[1]) );
  DFFSR \exp_b_s1_reg[0]  ( .D(n475), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        exp_b_s1[0]) );
  DFFSR \mant_a_s1_reg[4]  ( .D(\a[mant][4] ), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(mant_a_s1[4]) );
  DFFSR \mant_a_s1_reg[3]  ( .D(\a[mant][3] ), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(mant_a_s1[3]) );
  DFFSR \mant_a_s1_reg[2]  ( .D(\a[mant][2] ), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(mant_a_s1[2]) );
  DFFSR \mant_a_s1_reg[1]  ( .D(\a[mant][1] ), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(mant_a_s1[1]) );
  DFFSR \mant_a_s1_reg[0]  ( .D(\a[mant][0] ), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(mant_a_s1[0]) );
  DFFSR \mant_b_s1_reg[4]  ( .D(\b[mant][4] ), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(mant_b_s1[4]) );
  DFFSR \mant_b_s1_reg[3]  ( .D(\b[mant][3] ), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(mant_b_s1[3]) );
  DFFSR \mant_b_s1_reg[2]  ( .D(\b[mant][2] ), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(mant_b_s1[2]) );
  DFFSR \mant_b_s1_reg[1]  ( .D(\b[mant][1] ), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(mant_b_s1[1]) );
  DFFSR \mant_b_s1_reg[0]  ( .D(\b[mant][0] ), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(mant_b_s1[0]) );
  DFFSR \exp_diff_s1_reg[4]  ( .D(n1088), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        exp_diff_s1[4]) );
  DFFSR \exp_diff_s1_reg[3]  ( .D(N21), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        exp_diff_s1[3]) );
  DFFSR \exp_diff_s1_reg[2]  ( .D(N20), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        exp_diff_s1[2]) );
  DFFSR \exp_diff_s1_reg[1]  ( .D(N19), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        exp_diff_s1[1]) );
  DFFSR \exp_diff_s1_reg[0]  ( .D(N18), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        exp_diff_s1[0]) );
  DFFSR \aligned_mant_b_s2_reg[12]  ( .D(N83), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_b_s2[12]) );
  DFFSR \aligned_mant_b_s2_reg[11]  ( .D(N82), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_b_s2[11]) );
  DFFSR \aligned_mant_b_s2_reg[10]  ( .D(N81), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_b_s2[10]) );
  DFFSR \aligned_mant_b_s2_reg[9]  ( .D(N80), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_b_s2[9]) );
  DFFSR \aligned_mant_b_s2_reg[8]  ( .D(N79), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_b_s2[8]) );
  DFFSR \aligned_mant_b_s2_reg[7]  ( .D(N78), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_b_s2[7]) );
  DFFSR \aligned_mant_b_s2_reg[6]  ( .D(N77), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_b_s2[6]) );
  DFFSR \aligned_mant_b_s2_reg[5]  ( .D(N76), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_b_s2[5]) );
  DFFSR \aligned_mant_b_s2_reg[4]  ( .D(N75), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_b_s2[4]) );
  DFFSR \aligned_mant_b_s2_reg[3]  ( .D(N74), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_b_s2[3]) );
  DFFSR \aligned_mant_b_s2_reg[2]  ( .D(N73), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_b_s2[2]) );
  DFFSR \aligned_mant_b_s2_reg[1]  ( .D(N72), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_b_s2[1]) );
  DFFSR \aligned_mant_b_s2_reg[0]  ( .D(N71), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_b_s2[0]) );
  DFFSR \larger_exp_s2_reg[4]  ( .D(N31), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        larger_exp_s2[4]) );
  DFFSR \larger_exp_s2_reg[3]  ( .D(N30), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        larger_exp_s2[3]) );
  DFFSR \larger_exp_s2_reg[2]  ( .D(N29), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        larger_exp_s2[2]) );
  DFFSR \larger_exp_s2_reg[1]  ( .D(N28), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        larger_exp_s2[1]) );
  DFFSR \larger_exp_s2_reg[0]  ( .D(n1087), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(larger_exp_s2[0]) );
  DFFSR \aligned_mant_a_s2_reg[12]  ( .D(N70), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_a_s2[12]) );
  DFFSR \aligned_mant_a_s2_reg[11]  ( .D(N69), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_a_s2[11]) );
  DFFSR \aligned_mant_a_s2_reg[10]  ( .D(N68), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_a_s2[10]) );
  DFFSR \aligned_mant_a_s2_reg[9]  ( .D(N67), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_a_s2[9]) );
  DFFSR \aligned_mant_a_s2_reg[8]  ( .D(N66), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_a_s2[8]) );
  DFFSR \aligned_mant_a_s2_reg[7]  ( .D(N65), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_a_s2[7]) );
  DFFSR \aligned_mant_a_s2_reg[6]  ( .D(N64), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_a_s2[6]) );
  DFFSR \aligned_mant_a_s2_reg[5]  ( .D(N63), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_a_s2[5]) );
  DFFSR \aligned_mant_a_s2_reg[4]  ( .D(N62), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_a_s2[4]) );
  DFFSR \aligned_mant_a_s2_reg[3]  ( .D(N61), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_a_s2[3]) );
  DFFSR \aligned_mant_a_s2_reg[2]  ( .D(N60), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_a_s2[2]) );
  DFFSR \aligned_mant_a_s2_reg[1]  ( .D(N59), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(aligned_mant_a_s2[1]) );
  DFFSR \aligned_mant_a_s2_reg[0]  ( .D(N58), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(aligned_mant_a_s2[0]) );
  DFFSR \exp_out_s3_reg[4]  ( .D(larger_exp_s2[4]), .CLK(clk), .R(n1081), .S(
        1'b1), .Q(exp_out_s3[4]) );
  DFFSR \exp_out_s3_reg[3]  ( .D(larger_exp_s2[3]), .CLK(clk), .R(n1081), .S(
        1'b1), .Q(exp_out_s3[3]) );
  DFFSR \exp_out_s3_reg[2]  ( .D(larger_exp_s2[2]), .CLK(clk), .R(n1081), .S(
        1'b1), .Q(exp_out_s3[2]) );
  DFFSR \exp_out_s3_reg[1]  ( .D(larger_exp_s2[1]), .CLK(clk), .R(n1081), .S(
        1'b1), .Q(exp_out_s3[1]) );
  DFFSR \exp_out_s3_reg[0]  ( .D(larger_exp_s2[0]), .CLK(clk), .R(n1081), .S(
        1'b1), .Q(exp_out_s3[0]) );
  DFFSR \sum_result_s3_reg[13]  ( .D(n608), .CLK(clk), .R(n1081), .S(1'b1), 
        .Q(sum_result_s3[13]) );
  DFFSR \sum_result_s3_reg[12]  ( .D(N119), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(sum_result_s3[12]) );
  DFFSR \sum_result_s3_reg[11]  ( .D(N118), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(sum_result_s3[11]) );
  DFFSR \sum_result_s3_reg[10]  ( .D(N117), .CLK(clk), .R(n1080), .S(1'b1), 
        .Q(sum_result_s3[10]) );
  DFFSR \sum_result_s3_reg[9]  ( .D(N116), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        sum_result_s3[9]) );
  DFFSR \sum_result_s3_reg[8]  ( .D(N115), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        sum_result_s3[8]) );
  DFFSR \sum_result_s3_reg[7]  ( .D(N114), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        sum_result_s3[7]) );
  DFFSR \sum_result_s3_reg[6]  ( .D(N113), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        sum_result_s3[6]) );
  DFFSR sign_out_s3_reg ( .D(N121), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        sign_out_s3) );
  DFFSR \result_reg[sign]  ( .D(n574), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        \result[sign] ) );
  DFFSR \result_reg[exp][4]  ( .D(n218), .CLK(clk), .R(n1081), .S(1'b1), .Q(
        \result[exp][4] ) );
  DFFSR \result_reg[exp][3]  ( .D(n219), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        \result[exp][3] ) );
  DFFSR \result_reg[exp][2]  ( .D(n220), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        \result[exp][2] ) );
  DFFSR \result_reg[exp][1]  ( .D(n221), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        \result[exp][1] ) );
  DFFSR \result_reg[exp][0]  ( .D(n222), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        \result[exp][0] ) );
  DFFSR \result_reg[mant][4]  ( .D(N142), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        \result[mant][4] ) );
  DFFSR \result_reg[mant][3]  ( .D(n226), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        \result[mant][3] ) );
  DFFSR \result_reg[mant][2]  ( .D(n225), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        \result[mant][2] ) );
  DFFSR \result_reg[mant][1]  ( .D(n224), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        \result[mant][1] ) );
  DFFSR \result_reg[mant][0]  ( .D(n223), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        \result[mant][0] ) );
  DFFSR \mant_a_s1_reg[5]  ( .D(1'b1), .CLK(clk), .R(n1080), .S(1'b1), .Q(
        mant_a_s1[5]) );
  AND2X1 U270 ( .A(n329), .B(n903), .Y(n916) );
  AND2X1 U271 ( .A(n332), .B(n878), .Y(n892) );
  AND2X1 U272 ( .A(n503), .B(n957), .Y(n964) );
  AND2X1 U273 ( .A(n326), .B(n988), .Y(n1000) );
  AND2X1 U274 ( .A(n484), .B(n999), .Y(n976) );
  OR2X1 U275 ( .A(n1046), .B(n389), .Y(n790) );
  OR2X1 U276 ( .A(n800), .B(n389), .Y(n726) );
  AND2X1 U277 ( .A(n633), .B(n1084), .Y(n634) );
  OR2X1 U278 ( .A(n843), .B(n481), .Y(n847) );
  INVX1 U279 ( .A(n819), .Y(n280) );
  INVX1 U280 ( .A(n339), .Y(n232) );
  INVX1 U281 ( .A(n633), .Y(n233) );
  INVX1 U282 ( .A(n294), .Y(n638) );
  INVX1 U283 ( .A(\a[exp][0] ), .Y(n620) );
  INVX1 U284 ( .A(\b[exp][3] ), .Y(n492) );
  INVX1 U285 ( .A(\a[exp][1] ), .Y(n314) );
  NAND2X1 U286 ( .A(n603), .B(n354), .Y(n643) );
  NOR2X1 U287 ( .A(n612), .B(n619), .Y(n632) );
  NOR2X1 U288 ( .A(\b[exp][1] ), .B(n314), .Y(n619) );
  INVX1 U289 ( .A(n288), .Y(n621) );
  NAND2X1 U290 ( .A(n314), .B(\b[exp][1] ), .Y(n288) );
  INVX1 U291 ( .A(n227), .Y(n246) );
  INVX1 U292 ( .A(n627), .Y(n228) );
  NAND2X1 U293 ( .A(n445), .B(n228), .Y(n227) );
  INVX1 U294 ( .A(n229), .Y(n625) );
  INVX1 U295 ( .A(n636), .Y(n230) );
  NAND2X1 U296 ( .A(n596), .B(n230), .Y(n229) );
  BUFX4 U297 ( .A(\b[exp][0] ), .Y(n475) );
  OAI21X1 U298 ( .A(n615), .B(n321), .C(n231), .Y(n599) );
  NAND2X1 U299 ( .A(n233), .B(n232), .Y(n231) );
  INVX1 U300 ( .A(\a[exp][2] ), .Y(n235) );
  INVX1 U301 ( .A(n234), .Y(n635) );
  NAND2X1 U302 ( .A(n614), .B(n613), .Y(n234) );
  NAND2X1 U303 ( .A(n615), .B(n493), .Y(n294) );
  NOR2X1 U304 ( .A(n235), .B(\b[exp][2] ), .Y(n612) );
  INVX1 U305 ( .A(n236), .Y(n628) );
  INVX1 U306 ( .A(n596), .Y(n237) );
  INVX1 U307 ( .A(n635), .Y(n238) );
  INVX1 U308 ( .A(n495), .Y(n239) );
  AOI21X1 U309 ( .A(n239), .B(n238), .C(n237), .Y(n236) );
  INVX1 U310 ( .A(n240), .Y(n613) );
  INVX1 U311 ( .A(n539), .Y(n241) );
  INVX1 U312 ( .A(n632), .Y(n242) );
  NOR2X1 U313 ( .A(n242), .B(n241), .Y(n240) );
  NAND2X1 U314 ( .A(n632), .B(n310), .Y(n274) );
  OAI21X1 U315 ( .A(n601), .B(n274), .C(n444), .Y(n603) );
  NAND2X1 U316 ( .A(n299), .B(n294), .Y(n261) );
  OR2X2 U317 ( .A(n810), .B(n434), .Y(n809) );
  INVX1 U318 ( .A(n809), .Y(n244) );
  OR2X2 U319 ( .A(n543), .B(n433), .Y(n848) );
  INVX1 U320 ( .A(n848), .Y(n245) );
  AND2X2 U321 ( .A(n704), .B(n703), .Y(n734) );
  AND2X2 U322 ( .A(n761), .B(n760), .Y(n798) );
  AND2X2 U323 ( .A(n737), .B(n736), .Y(n738) );
  INVX1 U324 ( .A(n738), .Y(n247) );
  AND2X2 U325 ( .A(n1046), .B(n350), .Y(n741) );
  INVX1 U326 ( .A(n741), .Y(n248) );
  AND2X2 U327 ( .A(n800), .B(n350), .Y(n801) );
  INVX1 U328 ( .A(n801), .Y(n249) );
  OR2X2 U329 ( .A(n664), .B(n428), .Y(n669) );
  INVX1 U330 ( .A(n669), .Y(n250) );
  OR2X1 U331 ( .A(n316), .B(n510), .Y(n681) );
  INVX1 U332 ( .A(n681), .Y(n251) );
  OR2X2 U333 ( .A(n425), .B(n244), .Y(n815) );
  INVX1 U334 ( .A(n815), .Y(n252) );
  OR2X2 U335 ( .A(n302), .B(n449), .Y(n839) );
  INVX1 U336 ( .A(n839), .Y(n253) );
  OR2X2 U337 ( .A(n424), .B(n245), .Y(n854) );
  INVX1 U338 ( .A(n854), .Y(n254) );
  OR2X2 U339 ( .A(n507), .B(n531), .Y(n902) );
  INVX1 U340 ( .A(n902), .Y(n255) );
  OR2X2 U341 ( .A(n1017), .B(n419), .Y(n911) );
  INVX1 U342 ( .A(n911), .Y(n256) );
  OR2X2 U343 ( .A(n1021), .B(n537), .Y(n915) );
  INVX1 U344 ( .A(n915), .Y(n257) );
  OR2X2 U345 ( .A(n954), .B(n530), .Y(n930) );
  INVX1 U346 ( .A(n930), .Y(n258) );
  OR2X2 U347 ( .A(n962), .B(n536), .Y(n938) );
  INVX1 U348 ( .A(n938), .Y(n259) );
  OR2X2 U349 ( .A(n967), .B(n450), .Y(n947) );
  INVX1 U350 ( .A(n947), .Y(n260) );
  BUFX2 U351 ( .A(n1079), .Y(n262) );
  AND2X2 U352 ( .A(n481), .B(n479), .Y(n663) );
  INVX1 U353 ( .A(n663), .Y(n263) );
  AND2X2 U354 ( .A(n433), .B(n434), .Y(n667) );
  INVX1 U355 ( .A(n667), .Y(n264) );
  AND2X2 U356 ( .A(n439), .B(n442), .Y(n673) );
  INVX1 U357 ( .A(n673), .Y(n265) );
  OR2X2 U358 ( .A(n805), .B(n479), .Y(n808) );
  INVX1 U359 ( .A(n808), .Y(n266) );
  INVX1 U360 ( .A(n847), .Y(n267) );
  AND2X2 U361 ( .A(n433), .B(n543), .Y(n852) );
  INVX1 U362 ( .A(n852), .Y(n268) );
  AND2X2 U363 ( .A(n439), .B(n546), .Y(n859) );
  INVX1 U364 ( .A(n859), .Y(n269) );
  BUFX2 U365 ( .A(n1059), .Y(n270) );
  BUFX2 U366 ( .A(n1036), .Y(n271) );
  AND2X2 U367 ( .A(n408), .B(n487), .Y(n677) );
  INVX1 U368 ( .A(n677), .Y(n275) );
  OR2X2 U369 ( .A(n411), .B(n432), .Y(n662) );
  INVX1 U370 ( .A(n662), .Y(n276) );
  AND2X2 U371 ( .A(n405), .B(n418), .Y(n826) );
  INVX1 U372 ( .A(n826), .Y(n277) );
  OR2X2 U373 ( .A(n555), .B(n411), .Y(n807) );
  INVX1 U374 ( .A(n807), .Y(n278) );
  AND2X2 U375 ( .A(n434), .B(n810), .Y(n813) );
  INVX1 U376 ( .A(n813), .Y(n279) );
  AND2X1 U377 ( .A(n442), .B(n558), .Y(n819) );
  OR2X2 U378 ( .A(n820), .B(n441), .Y(n822) );
  INVX1 U379 ( .A(n822), .Y(n281) );
  AND2X2 U380 ( .A(n414), .B(n417), .Y(n865) );
  INVX1 U381 ( .A(n865), .Y(n282) );
  OR2X2 U382 ( .A(n844), .B(n432), .Y(n846) );
  INVX1 U383 ( .A(n846), .Y(n283) );
  OR2X2 U384 ( .A(n1061), .B(n451), .Y(n1057) );
  INVX1 U385 ( .A(n1057), .Y(n284) );
  INVX1 U386 ( .A(n619), .Y(n291) );
  INVX1 U387 ( .A(n612), .Y(n293) );
  INVX1 U388 ( .A(n638), .Y(n295) );
  BUFX2 U389 ( .A(n1053), .Y(n296) );
  BUFX2 U390 ( .A(n749), .Y(n297) );
  AND2X2 U391 ( .A(\b[exp][2] ), .B(n659), .Y(n655) );
  INVX1 U392 ( .A(n655), .Y(n298) );
  INVX1 U393 ( .A(n655), .Y(n299) );
  BUFX2 U394 ( .A(sum_result_s3[11]), .Y(n300) );
  AND2X2 U395 ( .A(n413), .B(n420), .Y(n883) );
  INVX1 U396 ( .A(n883), .Y(n302) );
  INVX1 U397 ( .A(n883), .Y(n303) );
  AND2X2 U398 ( .A(n412), .B(n942), .Y(n943) );
  INVX1 U399 ( .A(n943), .Y(n304) );
  INVX1 U400 ( .A(n943), .Y(n305) );
  BUFX2 U401 ( .A(n935), .Y(n306) );
  BUFX2 U402 ( .A(n925), .Y(n307) );
  BUFX2 U403 ( .A(n884), .Y(n308) );
  INVX1 U404 ( .A(n599), .Y(n309) );
  INVX1 U405 ( .A(n599), .Y(n310) );
  INVX1 U406 ( .A(\a[exp][3] ), .Y(n615) );
  AND2X1 U407 ( .A(n587), .B(n541), .Y(n777) );
  INVX1 U408 ( .A(n320), .Y(n311) );
  INVX1 U409 ( .A(n891), .Y(n316) );
  INVX1 U410 ( .A(n983), .Y(n318) );
  INVX1 U411 ( .A(n318), .Y(n319) );
  INVX1 U412 ( .A(\b[exp][3] ), .Y(n320) );
  INVX1 U413 ( .A(n320), .Y(n321) );
  INVX1 U414 ( .A(n324), .Y(n322) );
  INVX1 U415 ( .A(n322), .Y(n323) );
  AND2X2 U416 ( .A(n436), .B(n441), .Y(n932) );
  INVX1 U417 ( .A(n932), .Y(n324) );
  INVX1 U418 ( .A(n327), .Y(n325) );
  INVX1 U419 ( .A(n325), .Y(n326) );
  AND2X2 U420 ( .A(n584), .B(n551), .Y(n989) );
  INVX1 U421 ( .A(n989), .Y(n327) );
  INVX1 U422 ( .A(n330), .Y(n328) );
  INVX1 U423 ( .A(n328), .Y(n329) );
  AND2X2 U424 ( .A(n583), .B(n553), .Y(n904) );
  INVX1 U425 ( .A(n904), .Y(n330) );
  INVX1 U426 ( .A(n333), .Y(n331) );
  INVX1 U427 ( .A(n331), .Y(n332) );
  AND2X1 U428 ( .A(n480), .B(n578), .Y(n879) );
  INVX1 U429 ( .A(n879), .Y(n333) );
  INVX1 U430 ( .A(n974), .Y(n334) );
  INVX1 U431 ( .A(n334), .Y(n335) );
  INVX1 U432 ( .A(n338), .Y(n336) );
  INVX1 U433 ( .A(n336), .Y(n337) );
  BUFX2 U434 ( .A(n992), .Y(n338) );
  INVX1 U435 ( .A(n618), .Y(n339) );
  INVX1 U436 ( .A(n342), .Y(n340) );
  INVX1 U437 ( .A(n340), .Y(n341) );
  BUFX2 U438 ( .A(n725), .Y(n342) );
  INVX1 U439 ( .A(n343), .Y(n725) );
  INVX1 U440 ( .A(n711), .Y(n344) );
  INVX1 U441 ( .A(n712), .Y(n345) );
  INVX1 U442 ( .A(n713), .Y(n346) );
  NOR2X1 U443 ( .A(n346), .B(n347), .Y(n343) );
  NOR2X1 U444 ( .A(n344), .B(n345), .Y(n348) );
  INVX1 U445 ( .A(n348), .Y(n347) );
  INVX1 U446 ( .A(n351), .Y(n349) );
  INVX1 U447 ( .A(n349), .Y(n350) );
  BUFX2 U448 ( .A(n799), .Y(n351) );
  INVX1 U449 ( .A(n538), .Y(n352) );
  INVX1 U450 ( .A(n352), .Y(n353) );
  INVX1 U451 ( .A(n352), .Y(n354) );
  INVX1 U452 ( .A(n357), .Y(n355) );
  INVX1 U453 ( .A(n355), .Y(n356) );
  BUFX2 U454 ( .A(n789), .Y(n357) );
  INVX1 U455 ( .A(n358), .Y(n789) );
  INVX1 U456 ( .A(n770), .Y(n359) );
  INVX1 U457 ( .A(n771), .Y(n360) );
  INVX1 U458 ( .A(n772), .Y(n361) );
  NOR2X1 U459 ( .A(n361), .B(n362), .Y(n358) );
  NOR2X1 U460 ( .A(n359), .B(n360), .Y(n363) );
  INVX1 U461 ( .A(n363), .Y(n362) );
  INVX1 U462 ( .A(n366), .Y(n364) );
  INVX1 U463 ( .A(n364), .Y(n365) );
  AND2X2 U464 ( .A(n708), .B(n707), .Y(n722) );
  INVX1 U465 ( .A(n722), .Y(n366) );
  INVX1 U466 ( .A(n369), .Y(n367) );
  INVX1 U467 ( .A(n367), .Y(n368) );
  AND2X2 U468 ( .A(n766), .B(n765), .Y(n786) );
  INVX1 U469 ( .A(n786), .Y(n369) );
  INVX1 U470 ( .A(n372), .Y(n370) );
  INVX1 U471 ( .A(n370), .Y(n371) );
  BUFX2 U472 ( .A(exp_out_s3[2]), .Y(n372) );
  INVX1 U473 ( .A(n375), .Y(n373) );
  INVX1 U474 ( .A(n373), .Y(n374) );
  AND2X1 U475 ( .A(n581), .B(n764), .Y(n739) );
  INVX1 U476 ( .A(n739), .Y(n375) );
  INVX1 U477 ( .A(n941), .Y(n376) );
  INVX1 U478 ( .A(n376), .Y(n377) );
  INVX1 U479 ( .A(n380), .Y(n378) );
  INVX1 U480 ( .A(n378), .Y(n379) );
  AND2X2 U481 ( .A(n549), .B(n585), .Y(n993) );
  INVX1 U482 ( .A(n993), .Y(n380) );
  INVX1 U483 ( .A(n984), .Y(n381) );
  INVX1 U484 ( .A(n381), .Y(n382) );
  INVX1 U485 ( .A(n889), .Y(n383) );
  INVX1 U486 ( .A(n383), .Y(n384) );
  INVX1 U487 ( .A(n387), .Y(n385) );
  INVX1 U488 ( .A(n385), .Y(n386) );
  OR2X1 U489 ( .A(n1062), .B(n564), .Y(n1049) );
  INVX1 U490 ( .A(n1049), .Y(n387) );
  INVX1 U491 ( .A(n390), .Y(n388) );
  INVX1 U492 ( .A(n388), .Y(n389) );
  AND2X2 U493 ( .A(n534), .B(n699), .Y(n756) );
  INVX1 U494 ( .A(n756), .Y(n390) );
  BUFX2 U495 ( .A(n305), .Y(n391) );
  INVX1 U496 ( .A(n394), .Y(n392) );
  INVX1 U497 ( .A(n392), .Y(n393) );
  AND2X2 U498 ( .A(n582), .B(n559), .Y(n907) );
  INVX1 U499 ( .A(n907), .Y(n394) );
  INVX1 U500 ( .A(n397), .Y(n395) );
  INVX1 U501 ( .A(n395), .Y(n396) );
  AND2X2 U502 ( .A(n443), .B(n568), .Y(n926) );
  INVX1 U503 ( .A(n926), .Y(n397) );
  INVX1 U504 ( .A(n400), .Y(n398) );
  INVX1 U505 ( .A(n398), .Y(n399) );
  AND2X2 U506 ( .A(n560), .B(n870), .Y(n898) );
  INVX1 U507 ( .A(n898), .Y(n400) );
  INVX1 U508 ( .A(n403), .Y(n401) );
  INVX1 U509 ( .A(n401), .Y(n402) );
  AND2X2 U510 ( .A(n692), .B(n688), .Y(n745) );
  INVX1 U511 ( .A(n745), .Y(n403) );
  INVX1 U512 ( .A(n406), .Y(n404) );
  INVX1 U513 ( .A(n404), .Y(n405) );
  BUFX2 U514 ( .A(n824), .Y(n406) );
  INVX1 U515 ( .A(n675), .Y(n407) );
  INVX1 U516 ( .A(n407), .Y(n408) );
  INVX1 U517 ( .A(n679), .Y(n409) );
  INVX1 U518 ( .A(n409), .Y(n410) );
  AND2X1 U519 ( .A(n692), .B(n541), .Y(n769) );
  BUFX2 U520 ( .A(swap_s1), .Y(n1046) );
  INVX1 U521 ( .A(\a[exp][2] ), .Y(n659) );
  INVX1 U522 ( .A(n568), .Y(n412) );
  OR2X1 U523 ( .A(n942), .B(n412), .Y(n945) );
  OR2X2 U524 ( .A(n429), .B(n419), .Y(n834) );
  OR2X2 U525 ( .A(n422), .B(n530), .Y(n863) );
  OR2X1 U526 ( .A(n447), .B(n531), .Y(n874) );
  OR2X1 U527 ( .A(n547), .B(n436), .Y(n861) );
  OR2X2 U528 ( .A(n867), .B(n584), .Y(n869) );
  OR2X1 U529 ( .A(n554), .B(n435), .Y(n818) );
  OR2X1 U530 ( .A(n856), .B(n437), .Y(n858) );
  OR2X2 U531 ( .A(n557), .B(n545), .Y(n812) );
  OR2X1 U532 ( .A(n849), .B(n438), .Y(n851) );
  OR2X1 U533 ( .A(n440), .B(n438), .Y(n666) );
  OR2X1 U534 ( .A(n437), .B(n435), .Y(n672) );
  OR2X1 U535 ( .A(n830), .B(n553), .Y(n832) );
  OR2X2 U536 ( .A(n827), .B(n551), .Y(n829) );
  INVX1 U537 ( .A(n570), .Y(n436) );
  INVX1 U538 ( .A(n569), .Y(n443) );
  INVX1 U539 ( .A(n542), .Y(n411) );
  AND2X1 U540 ( .A(n504), .B(n1011), .Y(n1023) );
  INVX1 U541 ( .A(n834), .Y(n413) );
  INVX1 U542 ( .A(n863), .Y(n414) );
  INVX1 U543 ( .A(n874), .Y(n415) );
  INVX1 U544 ( .A(n1021), .Y(n416) );
  INVX1 U545 ( .A(n954), .Y(n417) );
  OR2X1 U546 ( .A(n1075), .B(n448), .Y(n1072) );
  INVX1 U547 ( .A(n967), .Y(n418) );
  AND2X1 U548 ( .A(n777), .B(n581), .Y(n751) );
  INVX1 U549 ( .A(n535), .Y(n536) );
  INVX1 U550 ( .A(n528), .Y(n419) );
  INVX1 U551 ( .A(n1017), .Y(n420) );
  OR2X1 U552 ( .A(n534), .B(n486), .Y(n778) );
  INVX1 U553 ( .A(n869), .Y(n421) );
  INVX1 U554 ( .A(n861), .Y(n422) );
  INVX1 U555 ( .A(n858), .Y(n423) );
  INVX1 U556 ( .A(n851), .Y(n424) );
  AND2X1 U557 ( .A(n594), .B(n534), .Y(n740) );
  INVX1 U558 ( .A(n812), .Y(n425) );
  INVX1 U559 ( .A(n818), .Y(n426) );
  AND2X1 U560 ( .A(n586), .B(n549), .Y(n997) );
  OR2X2 U561 ( .A(n582), .B(n560), .Y(n1011) );
  AND2X2 U562 ( .A(n560), .B(n582), .Y(n1012) );
  INVX1 U563 ( .A(n672), .Y(n427) );
  INVX1 U564 ( .A(n666), .Y(n428) );
  INVX1 U565 ( .A(n832), .Y(n429) );
  INVX1 U566 ( .A(n829), .Y(n430) );
  INVX2 U567 ( .A(n1046), .Y(n800) );
  OR2X1 U568 ( .A(n578), .B(n480), .Y(n878) );
  INVX1 U569 ( .A(n585), .Y(n586) );
  INVX1 U570 ( .A(n293), .Y(n431) );
  INVX1 U571 ( .A(n555), .Y(n432) );
  INVX1 U572 ( .A(n556), .Y(n433) );
  INVX1 U573 ( .A(n543), .Y(n434) );
  INVX1 U574 ( .A(n561), .Y(n435) );
  INVX1 U575 ( .A(n554), .Y(n437) );
  INVX1 U576 ( .A(n557), .Y(n438) );
  INVX1 U577 ( .A(n558), .Y(n439) );
  INVX1 U578 ( .A(n544), .Y(n440) );
  INVX1 U579 ( .A(n547), .Y(n441) );
  INVX1 U580 ( .A(n546), .Y(n442) );
  AOI21X1 U581 ( .A(n261), .B(n309), .C(n634), .Y(n444) );
  NOR2X1 U582 ( .A(n1084), .B(n494), .Y(n445) );
  INVX1 U583 ( .A(\a[exp][4] ), .Y(n633) );
  INVX1 U584 ( .A(\b[exp][4] ), .Y(n618) );
  BUFX2 U585 ( .A(sum_result_s3[7]), .Y(n446) );
  OR2X1 U586 ( .A(n552), .B(n583), .Y(n872) );
  INVX1 U587 ( .A(n872), .Y(n447) );
  BUFX2 U588 ( .A(n1065), .Y(n448) );
  OR2X1 U589 ( .A(n835), .B(n578), .Y(n837) );
  INVX1 U590 ( .A(n837), .Y(n449) );
  INVX1 U591 ( .A(n945), .Y(n450) );
  AND2X1 U592 ( .A(n1051), .B(n562), .Y(n1056) );
  INVX1 U593 ( .A(n1056), .Y(n451) );
  BUFX2 U594 ( .A(n880), .Y(n452) );
  BUFX2 U595 ( .A(n887), .Y(n453) );
  BUFX2 U596 ( .A(n893), .Y(n454) );
  BUFX2 U597 ( .A(n905), .Y(n455) );
  BUFX2 U598 ( .A(n912), .Y(n456) );
  BUFX2 U599 ( .A(n917), .Y(n457) );
  BUFX2 U600 ( .A(n933), .Y(n458) );
  BUFX2 U601 ( .A(n940), .Y(n459) );
  BUFX2 U602 ( .A(n948), .Y(n460) );
  BUFX2 U603 ( .A(n959), .Y(n461) );
  INVX1 U604 ( .A(n431), .Y(n462) );
  XOR2X1 U605 ( .A(n635), .B(n639), .Y(n606) );
  AND2X2 U606 ( .A(n620), .B(n475), .Y(n464) );
  BUFX2 U607 ( .A(n965), .Y(n465) );
  BUFX2 U608 ( .A(n969), .Y(n466) );
  BUFX2 U609 ( .A(n990), .Y(n467) );
  BUFX2 U610 ( .A(n996), .Y(n468) );
  BUFX2 U611 ( .A(n1001), .Y(n469) );
  BUFX2 U612 ( .A(n1013), .Y(n470) );
  BUFX2 U613 ( .A(n1019), .Y(n471) );
  BUFX2 U614 ( .A(n1024), .Y(n472) );
  BUFX2 U615 ( .A(n733), .Y(n473) );
  BUFX2 U616 ( .A(n797), .Y(n474) );
  AND2X2 U617 ( .A(n298), .B(n462), .Y(n656) );
  INVX1 U618 ( .A(n656), .Y(n476) );
  AND2X2 U619 ( .A(n1064), .B(n562), .Y(n1076) );
  INVX1 U620 ( .A(n1076), .Y(n477) );
  INVX1 U621 ( .A(n1072), .Y(n478) );
  BUFX2 U622 ( .A(aligned_mant_a_s2[0]), .Y(n479) );
  BUFX2 U623 ( .A(aligned_mant_b_s2[12]), .Y(n480) );
  BUFX2 U624 ( .A(aligned_mant_b_s2[0]), .Y(n481) );
  AND2X2 U625 ( .A(n696), .B(n695), .Y(n730) );
  INVX1 U626 ( .A(n730), .Y(n482) );
  AND2X2 U627 ( .A(n753), .B(n752), .Y(n794) );
  INVX1 U628 ( .A(n794), .Y(n483) );
  INVX1 U629 ( .A(n997), .Y(n484) );
  BUFX2 U630 ( .A(n1067), .Y(n485) );
  BUFX2 U631 ( .A(exp_diff_s1[4]), .Y(n486) );
  OR2X2 U632 ( .A(n660), .B(n427), .Y(n962) );
  INVX1 U633 ( .A(n962), .Y(n487) );
  OR2X2 U634 ( .A(n335), .B(n513), .Y(n1021) );
  OR2X2 U635 ( .A(n804), .B(n426), .Y(n967) );
  OR2X2 U636 ( .A(n337), .B(n430), .Y(n1017) );
  OR2X2 U637 ( .A(n842), .B(n423), .Y(n954) );
  BUFX2 U638 ( .A(mant_b_s1[4]), .Y(n488) );
  AND2X2 U639 ( .A(n622), .B(n623), .Y(n636) );
  INVX1 U640 ( .A(n636), .Y(n490) );
  INVX1 U641 ( .A(n492), .Y(n493) );
  BUFX2 U642 ( .A(\b[exp][1] ), .Y(n1082) );
  BUFX2 U643 ( .A(n633), .Y(n494) );
  INVX1 U644 ( .A(n615), .Y(n499) );
  BUFX2 U645 ( .A(n630), .Y(n495) );
  INVX1 U646 ( .A(n494), .Y(n500) );
  INVX1 U647 ( .A(n464), .Y(n501) );
  INVX1 U648 ( .A(n958), .Y(n502) );
  INVX1 U649 ( .A(n502), .Y(n503) );
  INVX1 U650 ( .A(n1012), .Y(n504) );
  INVX1 U651 ( .A(n506), .Y(n505) );
  BUFX2 U652 ( .A(mant_a_s1[4]), .Y(n506) );
  INVX1 U653 ( .A(n508), .Y(n507) );
  BUFX2 U654 ( .A(n1009), .Y(n508) );
  OR2X1 U655 ( .A(n553), .B(n583), .Y(n903) );
  INVX1 U656 ( .A(n903), .Y(n509) );
  INVX1 U657 ( .A(n878), .Y(n510) );
  INVX1 U658 ( .A(n931), .Y(n511) );
  INVX1 U659 ( .A(n511), .Y(n512) );
  BUFX2 U660 ( .A(n987), .Y(n513) );
  BUFX2 U661 ( .A(n721), .Y(n514) );
  BUFX2 U662 ( .A(n785), .Y(n515) );
  BUFX2 U663 ( .A(sign_b_s1), .Y(n516) );
  INVX1 U664 ( .A(n518), .Y(n517) );
  BUFX2 U665 ( .A(sum_result_s3[10]), .Y(n518) );
  INVX1 U666 ( .A(n976), .Y(n519) );
  INVX1 U667 ( .A(n521), .Y(n520) );
  BUFX2 U668 ( .A(sum_result_s3[9]), .Y(n521) );
  INVX1 U669 ( .A(n892), .Y(n522) );
  INVX1 U670 ( .A(n916), .Y(n523) );
  AND2X2 U671 ( .A(n323), .B(n511), .Y(n939) );
  INVX1 U672 ( .A(n939), .Y(n524) );
  INVX1 U673 ( .A(n964), .Y(n525) );
  INVX1 U674 ( .A(n1000), .Y(n526) );
  INVX1 U675 ( .A(n1023), .Y(n527) );
  INVX1 U676 ( .A(n909), .Y(n528) );
  INVX1 U677 ( .A(n928), .Y(n529) );
  INVX1 U678 ( .A(n529), .Y(n530) );
  OR2X1 U679 ( .A(n870), .B(n560), .Y(n900) );
  INVX1 U680 ( .A(n900), .Y(n531) );
  INVX1 U681 ( .A(n728), .Y(n532) );
  AND2X2 U682 ( .A(n297), .B(n693), .Y(n728) );
  AND2X2 U683 ( .A(n297), .B(n748), .Y(n792) );
  INVX1 U684 ( .A(n792), .Y(n533) );
  BUFX2 U685 ( .A(exp_diff_s1[2]), .Y(n534) );
  INVX1 U686 ( .A(n956), .Y(n535) );
  INVX1 U687 ( .A(n1011), .Y(n537) );
  NAND2X1 U688 ( .A(n595), .B(n610), .Y(n538) );
  NAND2X1 U689 ( .A(n595), .B(n610), .Y(n539) );
  INVX1 U690 ( .A(n541), .Y(n540) );
  BUFX2 U691 ( .A(exp_diff_s1[0]), .Y(n541) );
  INVX1 U692 ( .A(aligned_mant_a_s2[1]), .Y(n542) );
  INVX1 U693 ( .A(aligned_mant_a_s2[2]), .Y(n543) );
  INVX1 U694 ( .A(aligned_mant_a_s2[3]), .Y(n544) );
  INVX1 U695 ( .A(n544), .Y(n545) );
  INVX1 U696 ( .A(aligned_mant_a_s2[4]), .Y(n546) );
  INVX1 U697 ( .A(aligned_mant_a_s2[7]), .Y(n547) );
  INVX1 U698 ( .A(aligned_mant_a_s2[8]), .Y(n548) );
  INVX1 U699 ( .A(n548), .Y(n549) );
  INVX1 U700 ( .A(aligned_mant_a_s2[9]), .Y(n550) );
  INVX1 U701 ( .A(n550), .Y(n551) );
  INVX1 U702 ( .A(aligned_mant_a_s2[11]), .Y(n552) );
  INVX1 U703 ( .A(n552), .Y(n553) );
  INVX1 U704 ( .A(aligned_mant_b_s2[5]), .Y(n554) );
  INVX1 U705 ( .A(aligned_mant_b_s2[1]), .Y(n555) );
  INVX1 U706 ( .A(aligned_mant_b_s2[2]), .Y(n556) );
  INVX1 U707 ( .A(aligned_mant_b_s2[3]), .Y(n557) );
  INVX1 U708 ( .A(aligned_mant_b_s2[4]), .Y(n558) );
  INVX1 U709 ( .A(aligned_mant_b_s2[10]), .Y(n559) );
  INVX1 U710 ( .A(n559), .Y(n560) );
  INVX1 U711 ( .A(aligned_mant_a_s2[5]), .Y(n561) );
  AND2X1 U712 ( .A(n590), .B(n1075), .Y(n1063) );
  INVX1 U713 ( .A(n1063), .Y(n562) );
  INVX1 U714 ( .A(n564), .Y(n563) );
  BUFX2 U715 ( .A(exp_out_s3[0]), .Y(n564) );
  INVX1 U716 ( .A(n566), .Y(n565) );
  BUFX2 U717 ( .A(mant_b_s1[1]), .Y(n566) );
  BUFX2 U718 ( .A(mant_a_s1[1]), .Y(n567) );
  INVX1 U719 ( .A(aligned_mant_a_s2[6]), .Y(n568) );
  INVX1 U720 ( .A(aligned_mant_b_s2[6]), .Y(n569) );
  INVX1 U721 ( .A(aligned_mant_b_s2[7]), .Y(n570) );
  BUFX2 U722 ( .A(mant_b_s1[0]), .Y(n571) );
  BUFX2 U723 ( .A(mant_a_s1[0]), .Y(n572) );
  INVX1 U724 ( .A(n790), .Y(n573) );
  BUFX2 U725 ( .A(sign_out_s3), .Y(n574) );
  BUFX2 U726 ( .A(exp_out_s3[4]), .Y(n575) );
  BUFX2 U727 ( .A(sign_a_s1), .Y(n576) );
  BUFX2 U728 ( .A(sum_result_s3[8]), .Y(n577) );
  BUFX2 U729 ( .A(aligned_mant_a_s2[12]), .Y(n578) );
  BUFX2 U730 ( .A(mant_b_s1[3]), .Y(n579) );
  BUFX2 U731 ( .A(mant_a_s1[3]), .Y(n580) );
  BUFX2 U732 ( .A(mant_a_s1[5]), .Y(n581) );
  BUFX2 U733 ( .A(aligned_mant_a_s2[10]), .Y(n582) );
  BUFX2 U734 ( .A(aligned_mant_b_s2[11]), .Y(n583) );
  BUFX2 U735 ( .A(aligned_mant_b_s2[9]), .Y(n584) );
  INVX1 U736 ( .A(aligned_mant_b_s2[8]), .Y(n585) );
  BUFX2 U737 ( .A(exp_diff_s1[1]), .Y(n587) );
  AND2X2 U738 ( .A(n540), .B(n587), .Y(n774) );
  BUFX2 U739 ( .A(mant_b_s1[2]), .Y(n588) );
  BUFX2 U740 ( .A(mant_a_s1[2]), .Y(n589) );
  BUFX2 U741 ( .A(sum_result_s3[12]), .Y(n590) );
  BUFX2 U742 ( .A(exp_out_s3[1]), .Y(n591) );
  BUFX2 U743 ( .A(exp_out_s3[3]), .Y(n592) );
  INVX1 U744 ( .A(n726), .Y(n593) );
  BUFX2 U745 ( .A(exp_diff_s1[3]), .Y(n594) );
  BUFX2 U746 ( .A(\a[exp][0] ), .Y(n595) );
  BUFX2 U747 ( .A(n603), .Y(n604) );
  BUFX2 U748 ( .A(n295), .Y(n596) );
  AND2X2 U749 ( .A(n288), .B(n684), .Y(n601) );
  NAND2X1 U750 ( .A(n620), .B(n475), .Y(n684) );
  INVX1 U751 ( .A(n298), .Y(n609) );
  AOI21X1 U752 ( .A(n648), .B(n298), .C(n431), .Y(n623) );
  NAND2X1 U753 ( .A(n298), .B(n601), .Y(n622) );
  NOR2X1 U754 ( .A(n601), .B(n648), .Y(n647) );
  NAND2X1 U755 ( .A(n604), .B(n606), .Y(n605) );
  OAI21X1 U756 ( .A(n604), .B(n607), .C(n605), .Y(n640) );
  XOR2X1 U757 ( .A(n490), .B(n639), .Y(n607) );
  AND2X1 U758 ( .A(n683), .B(n1025), .Y(n608) );
  INVX1 U759 ( .A(n922), .Y(n841) );
  INVX1 U760 ( .A(n647), .Y(n653) );
  INVX1 U761 ( .A(n475), .Y(n610) );
  INVX1 U762 ( .A(n840), .Y(n922) );
  INVX1 U763 ( .A(n314), .Y(n1086) );
  INVX1 U764 ( .A(n618), .Y(n1084) );
  NOR2X1 U765 ( .A(n615), .B(n311), .Y(n630) );
  INVX1 U766 ( .A(n495), .Y(n637) );
  AOI21X1 U767 ( .A(n462), .B(n621), .C(n609), .Y(n614) );
  INVX1 U768 ( .A(n637), .Y(n626) );
  INVX1 U769 ( .A(n291), .Y(n648) );
  NOR2X1 U770 ( .A(n626), .B(n625), .Y(n627) );
  AOI21X1 U771 ( .A(n634), .B(n628), .C(n246), .Y(n629) );
  INVX1 U772 ( .A(n629), .Y(n1088) );
  AND2X2 U773 ( .A(n596), .B(n637), .Y(n639) );
  INVX1 U774 ( .A(n640), .Y(N21) );
  OAI21X1 U775 ( .A(n603), .B(n464), .C(n643), .Y(n645) );
  XNOR2X1 U776 ( .A(n1082), .B(n1086), .Y(n644) );
  XNOR2X1 U777 ( .A(n645), .B(n644), .Y(n646) );
  INVX1 U778 ( .A(n646), .Y(N19) );
  INVX1 U779 ( .A(n648), .Y(n650) );
  AOI21X1 U780 ( .A(n353), .B(n650), .C(n621), .Y(n651) );
  NAND2X1 U781 ( .A(n603), .B(n651), .Y(n652) );
  OAI21X1 U782 ( .A(n603), .B(n653), .C(n652), .Y(n657) );
  XNOR2X1 U783 ( .A(n657), .B(n476), .Y(n658) );
  INVX1 U784 ( .A(n658), .Y(N20) );
  INVX1 U785 ( .A(reset), .Y(n1080) );
  INVX1 U786 ( .A(reset), .Y(n1081) );
  INVX1 U787 ( .A(n659), .Y(n1083) );
  NOR2X1 U788 ( .A(n412), .B(n443), .Y(n956) );
  NOR2X1 U789 ( .A(n441), .B(n436), .Y(n931) );
  NOR2X1 U790 ( .A(n536), .B(n512), .Y(n675) );
  NOR2X1 U791 ( .A(n442), .B(n439), .Y(n660) );
  NAND2X1 U792 ( .A(n432), .B(n411), .Y(n661) );
  OAI21X1 U793 ( .A(n263), .B(n276), .C(n661), .Y(n670) );
  NOR2X1 U794 ( .A(n434), .B(n433), .Y(n664) );
  NAND2X1 U795 ( .A(n438), .B(n440), .Y(n665) );
  OAI21X1 U796 ( .A(n264), .B(n428), .C(n665), .Y(n668) );
  AOI21X1 U797 ( .A(n670), .B(n250), .C(n668), .Y(n935) );
  NAND2X1 U798 ( .A(n435), .B(n437), .Y(n671) );
  OAI21X1 U799 ( .A(n265), .B(n427), .C(n671), .Y(n961) );
  NAND2X1 U800 ( .A(n443), .B(n412), .Y(n958) );
  OAI21X1 U801 ( .A(n503), .B(n512), .C(n323), .Y(n674) );
  AOI21X1 U802 ( .A(n961), .B(n408), .C(n674), .Y(n676) );
  OAI21X1 U803 ( .A(n306), .B(n275), .C(n676), .Y(n1022) );
  NOR2X1 U804 ( .A(n509), .B(n537), .Y(n679) );
  NOR2X1 U805 ( .A(n549), .B(n586), .Y(n974) );
  NOR2X1 U806 ( .A(n551), .B(n584), .Y(n987) );
  NAND2X1 U807 ( .A(n410), .B(n416), .Y(n888) );
  OAI21X1 U808 ( .A(n484), .B(n513), .C(n326), .Y(n1020) );
  OAI21X1 U809 ( .A(n504), .B(n509), .C(n329), .Y(n678) );
  AOI21X1 U810 ( .A(n1020), .B(n410), .C(n678), .Y(n889) );
  OAI21X1 U811 ( .A(n510), .B(n384), .C(n332), .Y(n680) );
  AOI21X1 U812 ( .A(n1022), .B(n251), .C(n680), .Y(n682) );
  INVX1 U813 ( .A(n682), .Y(n683) );
  XOR2X1 U814 ( .A(n516), .B(n576), .Y(n882) );
  INVX1 U815 ( .A(n882), .Y(n1025) );
  BUFX2 U816 ( .A(\b[exp][2] ), .Y(n1085) );
  NAND2X1 U817 ( .A(n354), .B(n501), .Y(N18) );
  NAND2X1 U818 ( .A(n581), .B(n800), .Y(n687) );
  NOR3X1 U819 ( .A(n594), .B(n800), .C(n778), .Y(n717) );
  NOR2X1 U820 ( .A(n587), .B(n541), .Y(n685) );
  BUFX2 U821 ( .A(n685), .Y(n764) );
  INVX1 U822 ( .A(n374), .Y(n780) );
  NAND2X1 U823 ( .A(n717), .B(n780), .Y(n686) );
  NAND2X1 U824 ( .A(n687), .B(n686), .Y(N70) );
  NAND2X1 U825 ( .A(n506), .B(n800), .Y(n690) );
  INVX1 U826 ( .A(n587), .Y(n692) );
  INVX1 U827 ( .A(n581), .Y(n691) );
  NAND2X1 U828 ( .A(n541), .B(n691), .Y(n688) );
  AOI21X1 U829 ( .A(n540), .B(n505), .C(n402), .Y(n721) );
  NAND2X1 U830 ( .A(n717), .B(n514), .Y(n689) );
  NAND2X1 U831 ( .A(n690), .B(n689), .Y(N69) );
  INVX1 U832 ( .A(n717), .Y(n716) );
  AOI21X1 U833 ( .A(n587), .B(n691), .C(n777), .Y(n749) );
  INVX1 U834 ( .A(n580), .Y(n701) );
  AOI22X1 U835 ( .A(n701), .B(n764), .C(n505), .D(n769), .Y(n693) );
  NAND2X1 U836 ( .A(n580), .B(n800), .Y(n694) );
  OAI21X1 U837 ( .A(n716), .B(n532), .C(n694), .Y(N68) );
  NAND2X1 U838 ( .A(n589), .B(n800), .Y(n698) );
  AOI22X1 U839 ( .A(n580), .B(n769), .C(n774), .D(n506), .Y(n696) );
  AOI21X1 U840 ( .A(n589), .B(n764), .C(n751), .Y(n695) );
  NAND2X1 U841 ( .A(n717), .B(n482), .Y(n697) );
  NAND2X1 U842 ( .A(n698), .B(n697), .Y(N67) );
  NOR2X1 U843 ( .A(n594), .B(n486), .Y(n699) );
  AOI22X1 U844 ( .A(n567), .B(n800), .C(n780), .D(n593), .Y(n706) );
  INVX1 U845 ( .A(n589), .Y(n700) );
  AOI22X1 U846 ( .A(n505), .B(n777), .C(n700), .D(n769), .Y(n704) );
  INVX1 U847 ( .A(n567), .Y(n702) );
  AOI22X1 U848 ( .A(n702), .B(n764), .C(n701), .D(n774), .Y(n703) );
  NAND2X1 U849 ( .A(n717), .B(n734), .Y(n705) );
  NAND2X1 U850 ( .A(n706), .B(n705), .Y(N66) );
  AOI22X1 U851 ( .A(n572), .B(n800), .C(n514), .D(n593), .Y(n710) );
  AOI22X1 U852 ( .A(n769), .B(n567), .C(n777), .D(n580), .Y(n708) );
  AOI22X1 U853 ( .A(n764), .B(n572), .C(n774), .D(n589), .Y(n707) );
  NAND2X1 U854 ( .A(n717), .B(n365), .Y(n709) );
  NAND2X1 U855 ( .A(n710), .B(n709), .Y(N65) );
  NAND2X1 U856 ( .A(n589), .B(n777), .Y(n713) );
  NAND2X1 U857 ( .A(n572), .B(n769), .Y(n712) );
  NAND2X1 U858 ( .A(n567), .B(n774), .Y(n711) );
  NAND2X1 U859 ( .A(n717), .B(n341), .Y(n714) );
  OAI21X1 U860 ( .A(n532), .B(n726), .C(n714), .Y(N64) );
  AOI22X1 U861 ( .A(n567), .B(n777), .C(n572), .D(n774), .Y(n733) );
  NAND2X1 U862 ( .A(n593), .B(n482), .Y(n715) );
  OAI21X1 U863 ( .A(n473), .B(n716), .C(n715), .Y(N63) );
  AND2X1 U864 ( .A(n777), .B(n572), .Y(n718) );
  INVX1 U865 ( .A(n594), .Y(n779) );
  NOR3X1 U866 ( .A(n779), .B(n800), .C(n778), .Y(n731) );
  AOI22X1 U867 ( .A(n718), .B(n717), .C(n780), .D(n731), .Y(n720) );
  NAND2X1 U868 ( .A(n593), .B(n734), .Y(n719) );
  NAND2X1 U869 ( .A(n720), .B(n719), .Y(N62) );
  NAND2X1 U870 ( .A(n731), .B(n514), .Y(n724) );
  NAND2X1 U871 ( .A(n593), .B(n365), .Y(n723) );
  NAND2X1 U872 ( .A(n724), .B(n723), .Y(N61) );
  INVX1 U873 ( .A(n731), .Y(n729) );
  NAND2X1 U874 ( .A(n593), .B(n341), .Y(n727) );
  OAI21X1 U875 ( .A(n729), .B(n532), .C(n727), .Y(N60) );
  NAND2X1 U876 ( .A(n731), .B(n482), .Y(n732) );
  OAI21X1 U877 ( .A(n473), .B(n726), .C(n732), .Y(N59) );
  INVX1 U878 ( .A(n740), .Y(n803) );
  MUX2X1 U879 ( .B(n572), .A(n734), .S(n594), .Y(n742) );
  NAND2X1 U880 ( .A(n534), .B(n777), .Y(n735) );
  NAND2X1 U881 ( .A(n779), .B(n735), .Y(n737) );
  INVX1 U882 ( .A(n486), .Y(n736) );
  AOI21X1 U883 ( .A(n740), .B(n374), .C(n247), .Y(n799) );
  AOI21X1 U884 ( .A(n803), .B(n742), .C(n248), .Y(N58) );
  NAND2X1 U885 ( .A(n1046), .B(n581), .Y(n744) );
  NOR3X1 U886 ( .A(n594), .B(n1046), .C(n778), .Y(n781) );
  NAND2X1 U887 ( .A(n781), .B(n780), .Y(n743) );
  NAND2X1 U888 ( .A(n744), .B(n743), .Y(N83) );
  NAND2X1 U889 ( .A(n1046), .B(n488), .Y(n747) );
  INVX1 U890 ( .A(n488), .Y(n758) );
  AOI21X1 U891 ( .A(n540), .B(n758), .C(n402), .Y(n785) );
  NAND2X1 U892 ( .A(n781), .B(n515), .Y(n746) );
  NAND2X1 U893 ( .A(n747), .B(n746), .Y(N82) );
  INVX1 U894 ( .A(n781), .Y(n776) );
  INVX1 U895 ( .A(n579), .Y(n759) );
  AOI22X1 U896 ( .A(n759), .B(n764), .C(n758), .D(n769), .Y(n748) );
  NAND2X1 U897 ( .A(n1046), .B(n579), .Y(n750) );
  OAI21X1 U898 ( .A(n776), .B(n533), .C(n750), .Y(N81) );
  NAND2X1 U899 ( .A(n1046), .B(n588), .Y(n755) );
  AOI22X1 U900 ( .A(n579), .B(n769), .C(n774), .D(n488), .Y(n753) );
  AOI21X1 U901 ( .A(n764), .B(n588), .C(n751), .Y(n752) );
  NAND2X1 U902 ( .A(n781), .B(n483), .Y(n754) );
  NAND2X1 U903 ( .A(n755), .B(n754), .Y(N80) );
  AOI22X1 U904 ( .A(n1046), .B(n566), .C(n780), .D(n573), .Y(n763) );
  INVX1 U905 ( .A(n588), .Y(n757) );
  AOI22X1 U906 ( .A(n758), .B(n777), .C(n757), .D(n769), .Y(n761) );
  AOI22X1 U907 ( .A(n565), .B(n764), .C(n759), .D(n774), .Y(n760) );
  NAND2X1 U908 ( .A(n781), .B(n798), .Y(n762) );
  NAND2X1 U909 ( .A(n763), .B(n762), .Y(N79) );
  AOI22X1 U910 ( .A(n1046), .B(n571), .C(n515), .D(n573), .Y(n768) );
  AOI22X1 U911 ( .A(n769), .B(n566), .C(n777), .D(n579), .Y(n766) );
  AOI22X1 U912 ( .A(n764), .B(n571), .C(n774), .D(n588), .Y(n765) );
  NAND2X1 U913 ( .A(n781), .B(n368), .Y(n767) );
  NAND2X1 U914 ( .A(n768), .B(n767), .Y(N78) );
  NAND2X1 U915 ( .A(n588), .B(n777), .Y(n772) );
  NAND2X1 U916 ( .A(n571), .B(n769), .Y(n771) );
  NAND2X1 U917 ( .A(n566), .B(n774), .Y(n770) );
  NAND2X1 U918 ( .A(n781), .B(n356), .Y(n773) );
  OAI21X1 U919 ( .A(n533), .B(n790), .C(n773), .Y(N77) );
  AOI22X1 U920 ( .A(n566), .B(n777), .C(n571), .D(n774), .Y(n797) );
  NAND2X1 U921 ( .A(n573), .B(n483), .Y(n775) );
  OAI21X1 U922 ( .A(n474), .B(n776), .C(n775), .Y(N76) );
  AND2X1 U923 ( .A(n777), .B(n571), .Y(n782) );
  NOR3X1 U924 ( .A(n1046), .B(n779), .C(n778), .Y(n795) );
  AOI22X1 U925 ( .A(n782), .B(n781), .C(n780), .D(n795), .Y(n784) );
  NAND2X1 U926 ( .A(n573), .B(n798), .Y(n783) );
  NAND2X1 U927 ( .A(n784), .B(n783), .Y(N75) );
  NAND2X1 U928 ( .A(n795), .B(n515), .Y(n788) );
  NAND2X1 U929 ( .A(n573), .B(n368), .Y(n787) );
  NAND2X1 U930 ( .A(n788), .B(n787), .Y(N74) );
  INVX1 U931 ( .A(n795), .Y(n793) );
  NAND2X1 U932 ( .A(n573), .B(n356), .Y(n791) );
  OAI21X1 U933 ( .A(n793), .B(n533), .C(n791), .Y(N73) );
  NAND2X1 U934 ( .A(n795), .B(n483), .Y(n796) );
  OAI21X1 U935 ( .A(n474), .B(n790), .C(n796), .Y(N72) );
  MUX2X1 U936 ( .B(n571), .A(n798), .S(n594), .Y(n802) );
  AOI21X1 U937 ( .A(n803), .B(n802), .C(n249), .Y(N71) );
  AOI22X1 U938 ( .A(n443), .B(n568), .C(n436), .D(n547), .Y(n824) );
  NOR2X1 U939 ( .A(n558), .B(n442), .Y(n804) );
  INVX1 U940 ( .A(n481), .Y(n805) );
  NAND2X1 U941 ( .A(n411), .B(n555), .Y(n806) );
  OAI21X1 U942 ( .A(n266), .B(n278), .C(n806), .Y(n816) );
  INVX1 U943 ( .A(n433), .Y(n810) );
  NAND2X1 U944 ( .A(n440), .B(n557), .Y(n811) );
  OAI21X1 U945 ( .A(n425), .B(n279), .C(n811), .Y(n814) );
  AOI21X1 U946 ( .A(n816), .B(n252), .C(n814), .Y(n941) );
  NAND2X1 U947 ( .A(n435), .B(n554), .Y(n817) );
  OAI21X1 U948 ( .A(n426), .B(n280), .C(n817), .Y(n966) );
  INVX1 U949 ( .A(n443), .Y(n942) );
  INVX1 U950 ( .A(n436), .Y(n820) );
  NAND2X1 U951 ( .A(n441), .B(n820), .Y(n821) );
  OAI21X1 U952 ( .A(n304), .B(n281), .C(n821), .Y(n823) );
  AOI21X1 U953 ( .A(n966), .B(n405), .C(n823), .Y(n825) );
  OAI21X1 U954 ( .A(n377), .B(n277), .C(n825), .Y(n1018) );
  INVX1 U955 ( .A(n583), .Y(n830) );
  NOR2X1 U956 ( .A(n559), .B(n582), .Y(n909) );
  NOR2X1 U957 ( .A(n585), .B(n549), .Y(n992) );
  INVX1 U958 ( .A(n584), .Y(n827) );
  INVX1 U959 ( .A(n480), .Y(n835) );
  NAND2X1 U960 ( .A(n551), .B(n827), .Y(n828) );
  OAI21X1 U961 ( .A(n379), .B(n430), .C(n828), .Y(n1016) );
  NAND2X1 U962 ( .A(n553), .B(n830), .Y(n831) );
  OAI21X1 U963 ( .A(n393), .B(n429), .C(n831), .Y(n833) );
  AOI21X1 U964 ( .A(n1016), .B(n413), .C(n833), .Y(n884) );
  NAND2X1 U965 ( .A(n578), .B(n835), .Y(n836) );
  OAI21X1 U966 ( .A(n449), .B(n308), .C(n836), .Y(n838) );
  AOI21X1 U967 ( .A(n1018), .B(n253), .C(n838), .Y(n840) );
  AND2X2 U968 ( .A(n882), .B(n841), .Y(n1015) );
  NOR2X1 U969 ( .A(n568), .B(n443), .Y(n928) );
  NOR2X1 U970 ( .A(n546), .B(n439), .Y(n842) );
  INVX1 U971 ( .A(n435), .Y(n856) );
  INVX1 U972 ( .A(n479), .Y(n843) );
  INVX1 U973 ( .A(n411), .Y(n844) );
  NAND2X1 U974 ( .A(n432), .B(n844), .Y(n845) );
  OAI21X1 U975 ( .A(n267), .B(n283), .C(n845), .Y(n855) );
  INVX1 U976 ( .A(n440), .Y(n849) );
  NAND2X1 U977 ( .A(n438), .B(n849), .Y(n850) );
  OAI21X1 U978 ( .A(n268), .B(n424), .C(n850), .Y(n853) );
  AOI21X1 U979 ( .A(n855), .B(n254), .C(n853), .Y(n925) );
  NAND2X1 U980 ( .A(n437), .B(n856), .Y(n857) );
  OAI21X1 U981 ( .A(n269), .B(n423), .C(n857), .Y(n953) );
  NAND2X1 U982 ( .A(n436), .B(n547), .Y(n860) );
  OAI21X1 U983 ( .A(n396), .B(n422), .C(n860), .Y(n862) );
  AOI21X1 U984 ( .A(n953), .B(n414), .C(n862), .Y(n864) );
  OAI21X1 U985 ( .A(n307), .B(n282), .C(n864), .Y(n1010) );
  INVX1 U986 ( .A(n582), .Y(n870) );
  INVX1 U987 ( .A(n549), .Y(n866) );
  NOR2X1 U988 ( .A(n866), .B(n586), .Y(n983) );
  INVX1 U989 ( .A(n551), .Y(n867) );
  NOR2X1 U990 ( .A(n319), .B(n421), .Y(n1009) );
  AND2X1 U991 ( .A(n415), .B(n508), .Y(n877) );
  NAND2X1 U992 ( .A(n586), .B(n866), .Y(n984) );
  NAND2X1 U993 ( .A(n584), .B(n867), .Y(n868) );
  OAI21X1 U994 ( .A(n382), .B(n421), .C(n868), .Y(n1008) );
  NAND2X1 U995 ( .A(n583), .B(n552), .Y(n871) );
  OAI21X1 U996 ( .A(n399), .B(n447), .C(n871), .Y(n873) );
  AOI21X1 U997 ( .A(n1008), .B(n415), .C(n873), .Y(n875) );
  INVX1 U998 ( .A(n875), .Y(n876) );
  AOI21X1 U999 ( .A(n1010), .B(n877), .C(n876), .Y(n880) );
  XOR2X1 U1000 ( .A(n452), .B(n892), .Y(n881) );
  NAND2X1 U1001 ( .A(n1015), .B(n881), .Y(n897) );
  AND2X2 U1002 ( .A(n882), .B(n922), .Y(n1028) );
  INVX1 U1003 ( .A(n303), .Y(n886) );
  INVX1 U1004 ( .A(n308), .Y(n885) );
  AOI21X1 U1005 ( .A(n1018), .B(n886), .C(n885), .Y(n887) );
  XOR2X1 U1006 ( .A(n453), .B(n892), .Y(n895) );
  INVX1 U1007 ( .A(n888), .Y(n891) );
  INVX1 U1008 ( .A(n384), .Y(n890) );
  AOI21X1 U1009 ( .A(n1022), .B(n891), .C(n890), .Y(n893) );
  XOR2X1 U1010 ( .A(n454), .B(n522), .Y(n894) );
  AOI22X1 U1011 ( .A(n1028), .B(n895), .C(n894), .D(n1025), .Y(n896) );
  NAND2X1 U1012 ( .A(n897), .B(n896), .Y(N119) );
  INVX1 U1013 ( .A(n1008), .Y(n899) );
  OAI21X1 U1014 ( .A(n531), .B(n899), .C(n399), .Y(n901) );
  AOI21X1 U1015 ( .A(n1010), .B(n255), .C(n901), .Y(n905) );
  XOR2X1 U1016 ( .A(n455), .B(n916), .Y(n906) );
  NAND2X1 U1017 ( .A(n1015), .B(n906), .Y(n921) );
  INVX1 U1018 ( .A(n1016), .Y(n908) );
  OAI21X1 U1019 ( .A(n419), .B(n908), .C(n393), .Y(n910) );
  AOI21X1 U1020 ( .A(n1018), .B(n256), .C(n910), .Y(n912) );
  XOR2X1 U1021 ( .A(n456), .B(n916), .Y(n919) );
  INVX1 U1022 ( .A(n1020), .Y(n913) );
  OAI21X1 U1023 ( .A(n537), .B(n913), .C(n504), .Y(n914) );
  AOI21X1 U1024 ( .A(n1022), .B(n257), .C(n914), .Y(n917) );
  XOR2X1 U1025 ( .A(n457), .B(n523), .Y(n918) );
  AOI22X1 U1026 ( .A(n1028), .B(n919), .C(n918), .D(n1025), .Y(n920) );
  NAND2X1 U1027 ( .A(n921), .B(n920), .Y(N118) );
  INVX1 U1028 ( .A(n516), .Y(n924) );
  INVX1 U1029 ( .A(n576), .Y(n923) );
  MUX2X1 U1030 ( .B(n924), .A(n923), .S(n922), .Y(N121) );
  INVX1 U1031 ( .A(n307), .Y(n955) );
  INVX1 U1032 ( .A(n953), .Y(n927) );
  OAI21X1 U1033 ( .A(n530), .B(n927), .C(n396), .Y(n929) );
  AOI21X1 U1034 ( .A(n955), .B(n258), .C(n929), .Y(n933) );
  XOR2X1 U1035 ( .A(n458), .B(n939), .Y(n934) );
  NAND2X1 U1036 ( .A(n934), .B(n1015), .Y(n952) );
  INVX1 U1037 ( .A(n306), .Y(n963) );
  INVX1 U1038 ( .A(n961), .Y(n936) );
  OAI21X1 U1039 ( .A(n536), .B(n936), .C(n503), .Y(n937) );
  AOI21X1 U1040 ( .A(n963), .B(n259), .C(n937), .Y(n940) );
  XOR2X1 U1041 ( .A(n459), .B(n524), .Y(n950) );
  INVX1 U1042 ( .A(n377), .Y(n968) );
  INVX1 U1043 ( .A(n966), .Y(n944) );
  OAI21X1 U1044 ( .A(n450), .B(n944), .C(n391), .Y(n946) );
  AOI21X1 U1045 ( .A(n968), .B(n260), .C(n946), .Y(n948) );
  XOR2X1 U1046 ( .A(n460), .B(n939), .Y(n949) );
  AOI22X1 U1047 ( .A(n1025), .B(n950), .C(n949), .D(n1028), .Y(n951) );
  NAND2X1 U1048 ( .A(n952), .B(n951), .Y(N114) );
  AOI21X1 U1049 ( .A(n955), .B(n417), .C(n953), .Y(n959) );
  INVX1 U1050 ( .A(n536), .Y(n957) );
  XOR2X1 U1051 ( .A(n461), .B(n964), .Y(n960) );
  NAND2X1 U1052 ( .A(n960), .B(n1015), .Y(n973) );
  AOI21X1 U1053 ( .A(n963), .B(n487), .C(n961), .Y(n965) );
  XOR2X1 U1054 ( .A(n465), .B(n525), .Y(n971) );
  AOI21X1 U1055 ( .A(n968), .B(n418), .C(n966), .Y(n969) );
  XOR2X1 U1056 ( .A(n466), .B(n964), .Y(n970) );
  AOI22X1 U1057 ( .A(n1025), .B(n971), .C(n970), .D(n1028), .Y(n972) );
  NAND2X1 U1058 ( .A(n973), .B(n972), .Y(N113) );
  INVX1 U1059 ( .A(n335), .Y(n999) );
  XNOR2X1 U1060 ( .A(n1010), .B(n976), .Y(n975) );
  NAND2X1 U1061 ( .A(n975), .B(n1015), .Y(n980) );
  XNOR2X1 U1062 ( .A(n1022), .B(n519), .Y(n978) );
  XNOR2X1 U1063 ( .A(n1018), .B(n976), .Y(n977) );
  AOI22X1 U1064 ( .A(n1025), .B(n978), .C(n977), .D(n1028), .Y(n979) );
  NAND2X1 U1065 ( .A(n980), .B(n979), .Y(N115) );
  BUFX2 U1066 ( .A(sum_result_s3[13]), .Y(n1062) );
  INVX1 U1067 ( .A(n300), .Y(n1037) );
  NOR3X1 U1068 ( .A(n1062), .B(n590), .C(n1037), .Y(n1073) );
  NAND2X1 U1069 ( .A(sum_result_s3[6]), .B(n1073), .Y(n982) );
  INVX1 U1070 ( .A(n1062), .Y(n1075) );
  AOI22X1 U1071 ( .A(n1062), .B(n577), .C(n446), .D(n1063), .Y(n981) );
  NAND2X1 U1072 ( .A(n982), .B(n981), .Y(n223) );
  INVX1 U1073 ( .A(n319), .Y(n986) );
  INVX1 U1074 ( .A(n382), .Y(n985) );
  AOI21X1 U1075 ( .A(n1010), .B(n986), .C(n985), .Y(n990) );
  INVX1 U1076 ( .A(n513), .Y(n988) );
  XOR2X1 U1077 ( .A(n467), .B(n1000), .Y(n991) );
  NAND2X1 U1078 ( .A(n1015), .B(n991), .Y(n1005) );
  INVX1 U1079 ( .A(n337), .Y(n995) );
  INVX1 U1080 ( .A(n379), .Y(n994) );
  AOI21X1 U1081 ( .A(n1018), .B(n995), .C(n994), .Y(n996) );
  XOR2X1 U1082 ( .A(n468), .B(n1000), .Y(n1003) );
  INVX1 U1083 ( .A(n484), .Y(n998) );
  AOI21X1 U1084 ( .A(n1022), .B(n999), .C(n998), .Y(n1001) );
  XOR2X1 U1085 ( .A(n469), .B(n526), .Y(n1002) );
  AOI22X1 U1086 ( .A(n1028), .B(n1003), .C(n1002), .D(n1025), .Y(n1004) );
  NAND2X1 U1087 ( .A(n1005), .B(n1004), .Y(N116) );
  NAND2X1 U1088 ( .A(n446), .B(n1073), .Y(n1007) );
  AOI22X1 U1089 ( .A(n1062), .B(n521), .C(n577), .D(n1063), .Y(n1006) );
  NAND2X1 U1090 ( .A(n1007), .B(n1006), .Y(n224) );
  AOI21X1 U1091 ( .A(n1010), .B(n508), .C(n1008), .Y(n1013) );
  XOR2X1 U1092 ( .A(n470), .B(n1023), .Y(n1014) );
  NAND2X1 U1093 ( .A(n1015), .B(n1014), .Y(n1030) );
  AOI21X1 U1094 ( .A(n1018), .B(n420), .C(n1016), .Y(n1019) );
  XOR2X1 U1095 ( .A(n471), .B(n1023), .Y(n1027) );
  AOI21X1 U1096 ( .A(n1022), .B(n416), .C(n1020), .Y(n1024) );
  XOR2X1 U1097 ( .A(n472), .B(n527), .Y(n1026) );
  AOI22X1 U1098 ( .A(n1028), .B(n1027), .C(n1026), .D(n1025), .Y(n1029) );
  NAND2X1 U1099 ( .A(n1030), .B(n1029), .Y(N117) );
  NAND2X1 U1100 ( .A(n577), .B(n1073), .Y(n1032) );
  AOI22X1 U1101 ( .A(n1062), .B(n518), .C(n521), .D(n1063), .Y(n1031) );
  NAND2X1 U1102 ( .A(n1032), .B(n1031), .Y(n225) );
  OAI21X1 U1103 ( .A(n590), .B(n520), .C(n1075), .Y(n1033) );
  NAND2X1 U1104 ( .A(n300), .B(n1033), .Y(n1034) );
  OAI21X1 U1105 ( .A(n517), .B(n562), .C(n1034), .Y(n226) );
  AOI21X1 U1106 ( .A(n518), .B(n1075), .C(n590), .Y(n1036) );
  NAND2X1 U1107 ( .A(n1062), .B(n590), .Y(n1035) );
  OAI21X1 U1108 ( .A(n1037), .B(n271), .C(n1035), .Y(N142) );
  INVX1 U1109 ( .A(exp_a_s1[0]), .Y(n1039) );
  INVX1 U1110 ( .A(exp_b_s1[0]), .Y(n1038) );
  MUX2X1 U1111 ( .B(n1039), .A(n1038), .S(n1046), .Y(n1087) );
  INVX1 U1112 ( .A(exp_a_s1[1]), .Y(n1041) );
  INVX1 U1113 ( .A(exp_b_s1[1]), .Y(n1040) );
  MUX2X1 U1114 ( .B(n1041), .A(n1040), .S(n1046), .Y(N28) );
  INVX1 U1115 ( .A(exp_a_s1[2]), .Y(n1043) );
  INVX1 U1116 ( .A(exp_b_s1[2]), .Y(n1042) );
  MUX2X1 U1117 ( .B(n1043), .A(n1042), .S(n1046), .Y(N29) );
  INVX1 U1118 ( .A(exp_a_s1[3]), .Y(n1045) );
  INVX1 U1119 ( .A(exp_b_s1[3]), .Y(n1044) );
  MUX2X1 U1120 ( .B(n1045), .A(n1044), .S(n1046), .Y(N30) );
  INVX1 U1121 ( .A(exp_a_s1[4]), .Y(n1048) );
  INVX1 U1122 ( .A(exp_b_s1[4]), .Y(n1047) );
  MUX2X1 U1123 ( .B(n1048), .A(n1047), .S(n1046), .Y(N31) );
  INVX1 U1124 ( .A(n1073), .Y(n1068) );
  AOI22X1 U1125 ( .A(n562), .B(n564), .C(n1068), .D(n386), .Y(n222) );
  INVX1 U1126 ( .A(n386), .Y(n1050) );
  OAI21X1 U1127 ( .A(n563), .B(n1073), .C(n1050), .Y(n1051) );
  AND2X1 U1128 ( .A(n564), .B(n1062), .Y(n1055) );
  INVX1 U1129 ( .A(n591), .Y(n1060) );
  AOI22X1 U1130 ( .A(n591), .B(n451), .C(n1055), .D(n1060), .Y(n1052) );
  NAND3X1 U1131 ( .A(n1060), .B(n563), .C(n1073), .Y(n1053) );
  NAND2X1 U1132 ( .A(n1052), .B(n296), .Y(n221) );
  INVX1 U1133 ( .A(n296), .Y(n1054) );
  AOI21X1 U1134 ( .A(n1055), .B(n591), .C(n1054), .Y(n1059) );
  INVX1 U1135 ( .A(n371), .Y(n1061) );
  MUX2X1 U1136 ( .B(n1062), .A(n1073), .S(n591), .Y(n1058) );
  AOI22X1 U1137 ( .A(n270), .B(n1061), .C(n1058), .D(n284), .Y(n220) );
  NAND3X1 U1138 ( .A(n371), .B(n591), .C(n564), .Y(n1065) );
  NAND3X1 U1139 ( .A(n1061), .B(n1060), .C(n563), .Y(n1067) );
  AOI22X1 U1140 ( .A(n1062), .B(n448), .C(n1073), .D(n485), .Y(n1064) );
  INVX1 U1141 ( .A(n592), .Y(n1066) );
  AOI22X1 U1142 ( .A(n592), .B(n477), .C(n478), .D(n1066), .Y(n1070) );
  NOR3X1 U1143 ( .A(n592), .B(n1068), .C(n485), .Y(n1071) );
  INVX1 U1144 ( .A(n1071), .Y(n1069) );
  NAND2X1 U1145 ( .A(n1070), .B(n1069), .Y(n219) );
  AOI21X1 U1146 ( .A(n478), .B(n592), .C(n1071), .Y(n1079) );
  NAND2X1 U1147 ( .A(n592), .B(n1073), .Y(n1074) );
  OAI21X1 U1148 ( .A(n592), .B(n1075), .C(n1074), .Y(n1077) );
  OAI21X1 U1149 ( .A(n1077), .B(n477), .C(n575), .Y(n1078) );
  OAI21X1 U1150 ( .A(n262), .B(n575), .C(n1078), .Y(n218) );
endmodule

