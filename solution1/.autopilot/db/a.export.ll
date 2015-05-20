; ModuleID = '/Xilinx/QAM_Runner/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str2 = private unnamed_addr constant [7 x i8] c"ap_vld\00", align 1
@p_str3 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str4 = private unnamed_addr constant [6 x i8] c"m_axi\00", align 1
@p_str5 = private unnamed_addr constant [11 x i8] c"ap_ctrl_hs\00", align 1
@llvm_global_ctors_0 = appending global [2 x i32] [i32 65535, i32 65535]
@llvm_global_ctors_1 = appending global [2 x void ()*] [void ()* @_GLOBAL__I_a, void ()* @_GLOBAL__I_a23]
@i_reg_V = internal unnamed_addr global i28 0
@phase_angle_V = internal unnamed_addr global i16 0
@str = internal constant [11 x i8] c"qam_runner\00"
@cos_lut = internal unnamed_addr constant [1024 x i15] [i15 -1, i15 -1, i15 -1, i15 -1, i15 -1, i15 -1, i15 -1, i15 -2, i15 -2, i15 -3, i15 -4, i15 -5, i15 -6, i15 -7, i15 -8, i15 -9, i15 -10, i15 -11, i15 -12, i15 -14, i15 -15, i15 -17, i15 -19, i15 -20, i15 -22, i15 -24, i15 -26, i15 -28, i15 -30, i15 -32, i15 -35, i15 -37, i15 -39, i15 -42, i15 -45, i15 -47, i15 -50, i15 -53, i15 -56, i15 -59, i15 -62, i15 -65, i15 -68, i15 -71, i15 -75, i15 -78, i15 -82, i15 -85, i15 -89, i15 -93, i15 -96, i15 -100, i15 -104, i15 -108, i15 -112, i15 -117, i15 -121, i15 -125, i15 -130, i15 -134, i15 -139, i15 -143, i15 -148, i15 -153, i15 -158, i15 -163, i15 -168, i15 -173, i15 -178, i15 -183, i15 -189, i15 -194, i15 -200, i15 -205, i15 -211, i15 -217, i15 -222, i15 -228, i15 -234, i15 -240, i15 -246, i15 -253, i15 -259, i15 -265, i15 -272, i15 -278, i15 -285, i15 -291, i15 -298, i15 -305, i15 -312, i15 -319, i15 -326, i15 -333, i15 -340, i15 -347, i15 -355, i15 -362, i15 -370, i15 -377, i15 -385, i15 -392, i15 -400, i15 -408, i15 -416, i15 -424, i15 -432, i15 -440, i15 -449, i15 -457, i15 -465, i15 -474, i15 -482, i15 -491, i15 -500, i15 -509, i15 -517, i15 -526, i15 -535, i15 -544, i15 -554, i15 -563, i15 -572, i15 -582, i15 -591, i15 -601, i15 -610, i15 -620, i15 -630, i15 -639, i15 -649, i15 -659, i15 -669, i15 -680, i15 -690, i15 -700, i15 -711, i15 -721, i15 -731, i15 -742, i15 -753, i15 -763, i15 -774, i15 -785, i15 -796, i15 -807, i15 -818, i15 -830, i15 -841, i15 -852, i15 -864, i15 -875, i15 -887, i15 -898, i15 -910, i15 -922, i15 -934, i15 -946, i15 -958, i15 -970, i15 -982, i15 -994, i15 -1007, i15 -1019, i15 -1031, i15 -1044, i15 -1057, i15 -1069, i15 -1082, i15 -1095, i15 -1108, i15 -1121, i15 -1134, i15 -1147, i15 -1160, i15 -1174, i15 -1187, i15 -1200, i15 -1214, i15 -1228, i15 -1241, i15 -1255, i15 -1269, i15 -1283, i15 -1297, i15 -1311, i15 -1325, i15 -1339, i15 -1353, i15 -1368, i15 -1382, i15 -1396, i15 -1411, i15 -1426, i15 -1440, i15 -1455, i15 -1470, i15 -1485, i15 -1500, i15 -1515, i15 -1530, i15 -1545, i15 -1561, i15 -1576, i15 -1591, i15 -1607, i15 -1622, i15 -1638, i15 -1654, i15 -1670, i15 -1686, i15 -1701, i15 -1718, i15 -1734, i15 -1750, i15 -1766, i15 -1782, i15 -1799, i15 -1815, i15 -1832, i15 -1848, i15 -1865, i15 -1882, i15 -1899, i15 -1915, i15 -1932, i15 -1949, i15 -1967, i15 -1984, i15 -2001, i15 -2018, i15 -2036, i15 -2053, i15 -2071, i15 -2088, i15 -2106, i15 -2124, i15 -2142, i15 -2160, i15 -2178, i15 -2196, i15 -2214, i15 -2232, i15 -2250, i15 -2269, i15 -2287, i15 -2306, i15 -2324, i15 -2343, i15 -2361, i15 -2380, i15 -2399, i15 -2418, i15 -2437, i15 -2456, i15 -2475, i15 -2494, i15 -2514, i15 -2533, i15 -2552, i15 -2572, i15 -2591, i15 -2611, i15 -2631, i15 -2650, i15 -2670, i15 -2690, i15 -2710, i15 -2730, i15 -2750, i15 -2771, i15 -2791, i15 -2811, i15 -2832, i15 -2852, i15 -2873, i15 -2893, i15 -2914, i15 -2935, i15 -2955, i15 -2976, i15 -2997, i15 -3018, i15 -3039, i15 -3061, i15 -3082, i15 -3103, i15 -3125, i15 -3146, i15 -3168, i15 -3189, i15 -3211, i15 -3233, i15 -3254, i15 -3276, i15 -3298, i15 -3320, i15 -3342, i15 -3364, i15 -3387, i15 -3409, i15 -3431, i15 -3454, i15 -3476, i15 -3499, i15 -3521, i15 -3544, i15 -3567, i15 -3590, i15 -3613, i15 -3636, i15 -3659, i15 -3682, i15 -3705, i15 -3728, i15 -3752, i15 -3775, i15 -3798, i15 -3822, i15 -3846, i15 -3869, i15 -3893, i15 -3917, i15 -3941, i15 -3965, i15 -3989, i15 -4013, i15 -4037, i15 -4061, i15 -4085, i15 -4110, i15 -4134, i15 -4158, i15 -4183, i15 -4208, i15 -4232, i15 -4257, i15 -4282, i15 -4307, i15 -4332, i15 -4357, i15 -4382, i15 -4407, i15 -4432, i15 -4457, i15 -4483, i15 -4508, i15 -4534, i15 -4559, i15 -4585, i15 -4610, i15 -4636, i15 -4662, i15 -4688, i15 -4714, i15 -4740, i15 -4766, i15 -4792, i15 -4818, i15 -4844, i15 -4871, i15 -4897, i15 -4924, i15 -4950, i15 -4977, i15 -5003, i15 -5030, i15 -5057, i15 -5084, i15 -5111, i15 -5138, i15 -5165, i15 -5192, i15 -5219, i15 -5246, i15 -5274, i15 -5301, i15 -5329, i15 -5356, i15 -5384, i15 -5411, i15 -5439, i15 -5467, i15 -5495, i15 -5522, i15 -5550, i15 -5578, i15 -5606, i15 -5635, i15 -5663, i15 -5691, i15 -5719, i15 -5748, i15 -5776, i15 -5805, i15 -5833, i15 -5862, i15 -5891, i15 -5920, i15 -5948, i15 -5977, i15 -6006, i15 -6035, i15 -6065, i15 -6094, i15 -6123, i15 -6152, i15 -6182, i15 -6211, i15 -6240, i15 -6270, i15 -6300, i15 -6329, i15 -6359, i15 -6389, i15 -6419, i15 -6448, i15 -6478, i15 -6509, i15 -6539, i15 -6569, i15 -6599, i15 -6629, i15 -6660, i15 -6690, i15 -6720, i15 -6751, i15 -6782, i15 -6812, i15 -6843, i15 -6874, i15 -6905, i15 -6935, i15 -6966, i15 -6997, i15 -7029, i15 -7060, i15 -7091, i15 -7122, i15 -7153, i15 -7185, i15 -7216, i15 -7248, i15 -7279, i15 -7311, i15 -7343, i15 -7374, i15 -7406, i15 -7438, i15 -7470, i15 -7502, i15 -7534, i15 -7566, i15 -7598, i15 -7630, i15 -7663, i15 -7695, i15 -7727, i15 -7760, i15 -7792, i15 -7825, i15 -7858, i15 -7890, i15 -7923, i15 -7956, i15 -7989, i15 -8022, i15 -8055, i15 -8088, i15 -8121, i15 -8154, i15 -8187, i15 -8220, i15 -8254, i15 -8287, i15 -8320, i15 -8354, i15 -8387, i15 -8421, i15 -8455, i15 -8489, i15 -8522, i15 -8556, i15 -8590, i15 -8624, i15 -8658, i15 -8692, i15 -8726, i15 -8760, i15 -8795, i15 -8829, i15 -8863, i15 -8898, i15 -8932, i15 -8967, i15 -9001, i15 -9036, i15 -9071, i15 -9105, i15 -9140, i15 -9175, i15 -9210, i15 -9245, i15 -9280, i15 -9315, i15 -9350, i15 -9385, i15 -9421, i15 -9456, i15 -9491, i15 -9527, i15 -9562, i15 -9598, i15 -9633, i15 -9669, i15 -9704, i15 -9740, i15 -9776, i15 -9812, i15 -9848, i15 -9884, i15 -9920, i15 -9956, i15 -9992, i15 -10028, i15 -10064, i15 -10100, i15 -10137, i15 -10173, i15 -10210, i15 -10246, i15 -10283, i15 -10319, i15 -10356, i15 -10393, i15 -10429, i15 -10466, i15 -10503, i15 -10540, i15 -10577, i15 -10614, i15 -10651, i15 -10688, i15 -10725, i15 -10762, i15 -10800, i15 -10837, i15 -10874, i15 -10912, i15 -10949, i15 -10987, i15 -11024, i15 -11062, i15 -11100, i15 -11137, i15 -11175, i15 -11213, i15 -11251, i15 -11289, i15 -11327, i15 -11365, i15 -11403, i15 -11441, i15 -11479, i15 -11517, i15 -11556, i15 -11594, i15 -11632, i15 -11671, i15 -11709, i15 -11748, i15 -11787, i15 -11825, i15 -11864, i15 -11903, i15 -11941, i15 -11980, i15 -12019, i15 -12058, i15 -12097, i15 -12136, i15 -12175, i15 -12214, i15 -12253, i15 -12293, i15 -12332, i15 -12371, i15 -12411, i15 -12450, i15 -12489, i15 -12529, i15 -12568, i15 -12608, i15 -12648, i15 -12687, i15 -12727, i15 -12767, i15 -12807, i15 -12847, i15 -12887, i15 -12927, i15 -12967, i15 -13007, i15 -13047, i15 -13087, i15 -13127, i15 -13167, i15 -13208, i15 -13248, i15 -13289, i15 -13329, i15 -13369, i15 -13410, i15 -13451, i15 -13491, i15 -13532, i15 -13573, i15 -13613, i15 -13654, i15 -13695, i15 -13736, i15 -13777, i15 -13818, i15 -13859, i15 -13900, i15 -13941, i15 -13982, i15 -14023, i15 -14065, i15 -14106, i15 -14147, i15 -14189, i15 -14230, i15 -14272, i15 -14313, i15 -14355, i15 -14396, i15 -14438, i15 -14480, i15 -14521, i15 -14563, i15 -14605, i15 -14647, i15 -14689, i15 -14731, i15 -14773, i15 -14815, i15 -14857, i15 -14899, i15 -14941, i15 -14983, i15 -15025, i15 -15068, i15 -15110, i15 -15152, i15 -15195, i15 -15237, i15 -15280, i15 -15322, i15 -15365, i15 -15407, i15 -15450, i15 -15493, i15 -15535, i15 -15578, i15 -15621, i15 -15664, i15 -15707, i15 -15750, i15 -15793, i15 -15836, i15 -15879, i15 -15922, i15 -15965, i15 -16008, i15 -16051, i15 -16095, i15 -16138, i15 -16181, i15 -16225, i15 -16268, i15 -16312, i15 -16355, i15 16369, i15 16326, i15 16282, i15 16239, i15 16195, i15 16151, i15 16108, i15 16064, i15 16020, i15 15976, i15 15932, i15 15888, i15 15844, i15 15800, i15 15756, i15 15712, i15 15668, i15 15624, i15 15580, i15 15535, i15 15491, i15 15447, i15 15402, i15 15358, i15 15314, i15 15269, i15 15225, i15 15180, i15 15136, i15 15091, i15 15046, i15 15002, i15 14957, i15 14912, i15 14867, i15 14823, i15 14778, i15 14733, i15 14688, i15 14643, i15 14598, i15 14553, i15 14508, i15 14463, i15 14418, i15 14373, i15 14327, i15 14282, i15 14237, i15 14192, i15 14146, i15 14101, i15 14056, i15 14010, i15 13965, i15 13919, i15 13874, i15 13828, i15 13783, i15 13737, i15 13691, i15 13646, i15 13600, i15 13554, i15 13508, i15 13463, i15 13417, i15 13371, i15 13325, i15 13279, i15 13233, i15 13187, i15 13141, i15 13095, i15 13049, i15 13003, i15 12957, i15 12910, i15 12864, i15 12818, i15 12772, i15 12725, i15 12679, i15 12633, i15 12586, i15 12540, i15 12493, i15 12447, i15 12400, i15 12354, i15 12307, i15 12261, i15 12214, i15 12167, i15 12121, i15 12074, i15 12027, i15 11980, i15 11934, i15 11887, i15 11840, i15 11793, i15 11746, i15 11699, i15 11652, i15 11605, i15 11558, i15 11511, i15 11464, i15 11417, i15 11370, i15 11323, i15 11276, i15 11228, i15 11181, i15 11134, i15 11087, i15 11039, i15 10992, i15 10945, i15 10897, i15 10850, i15 10802, i15 10755, i15 10707, i15 10660, i15 10612, i15 10565, i15 10517, i15 10469, i15 10422, i15 10374, i15 10326, i15 10279, i15 10231, i15 10183, i15 10135, i15 10088, i15 10040, i15 9992, i15 9944, i15 9896, i15 9848, i15 9800, i15 9752, i15 9704, i15 9656, i15 9608, i15 9560, i15 9512, i15 9464, i15 9416, i15 9368, i15 9319, i15 9271, i15 9223, i15 9175, i15 9127, i15 9078, i15 9030, i15 8982, i15 8933, i15 8885, i15 8836, i15 8788, i15 8740, i15 8691, i15 8643, i15 8594, i15 8546, i15 8497, i15 8449, i15 8400, i15 8351, i15 8303, i15 8254, i15 8206, i15 8157, i15 8108, i15 8059, i15 8011, i15 7962, i15 7913, i15 7864, i15 7816, i15 7767, i15 7718, i15 7669, i15 7620, i15 7571, i15 7522, i15 7473, i15 7425, i15 7376, i15 7327, i15 7278, i15 7229, i15 7180, i15 7130, i15 7081, i15 7032, i15 6983, i15 6934, i15 6885, i15 6836, i15 6787, i15 6737, i15 6688, i15 6639, i15 6590, i15 6541, i15 6491, i15 6442, i15 6393, i15 6343, i15 6294, i15 6245, i15 6195, i15 6146, i15 6097, i15 6047, i15 5998, i15 5948, i15 5899, i15 5850, i15 5800, i15 5751, i15 5701, i15 5652, i15 5602, i15 5553, i15 5503, i15 5453, i15 5404, i15 5354, i15 5305, i15 5255, i15 5205, i15 5156, i15 5106, i15 5057, i15 5007, i15 4957, i15 4907, i15 4858, i15 4808, i15 4758, i15 4709, i15 4659, i15 4609, i15 4559, i15 4510, i15 4460, i15 4410, i15 4360, i15 4310, i15 4260, i15 4211, i15 4161, i15 4111, i15 4061, i15 4011, i15 3961, i15 3911, i15 3861, i15 3812, i15 3762, i15 3712, i15 3662, i15 3612, i15 3562, i15 3512, i15 3462, i15 3412, i15 3362, i15 3312, i15 3262, i15 3212, i15 3162, i15 3112, i15 3062, i15 3012, i15 2962, i15 2912, i15 2861, i15 2811, i15 2761, i15 2711, i15 2661, i15 2611, i15 2561, i15 2511, i15 2461, i15 2411, i15 2360, i15 2310, i15 2260, i15 2210, i15 2160, i15 2110, i15 2060, i15 2009, i15 1959, i15 1909, i15 1859, i15 1809, i15 1758, i15 1708, i15 1658, i15 1608, i15 1558, i15 1507, i15 1457, i15 1407, i15 1357, i15 1307, i15 1256, i15 1206, i15 1156, i15 1106, i15 1055, i15 1005, i15 955, i15 905, i15 854, i15 804, i15 754, i15 704, i15 653, i15 603, i15 553, i15 503, i15 452, i15 402, i15 352, i15 302, i15 251, i15 201, i15 151, i15 101, i15 50]

define weak void @_ssdm_op_SpecWire(...) nounwind {
entry:
  ret void
}

declare i13 @llvm.part.select.i13(i13, i32, i32) nounwind readnone

declare i32 @llvm.cttz.i32(i32, i1) nounwind readnone

declare i17 @llvm.part.select.i17(i17, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

declare void @_GLOBAL__I_a23() nounwind section ".text.startup"

define i1 @qam_runner(i32 %sourceAddress, i32 %destinationAddress, i32 %iterations, float %control_in_qam, i8 %control_in_lf_p, i8 %control_in_lf_i, i8 %control_in_lf_out_gain, i1 %control_in_reg_clr, float %control_in_reg_init, i32* %m_mm2s_ctl, i32* %m_s2mm_ctl, i128* %s_in_V_V, i128* %s_out_V_V) {
  %p_Val2_s = alloca i12, align 2
  %p_Val2_1 = alloca i12, align 2
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %sourceAddress), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %destinationAddress), !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %iterations), !map !17
  call void (...)* @_ssdm_op_SpecBitsMap(float %control_in_qam), !map !21
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %control_in_lf_p), !map !25
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %control_in_lf_i), !map !29
  call void (...)* @_ssdm_op_SpecBitsMap(i8 %control_in_lf_out_gain), !map !33
  call void (...)* @_ssdm_op_SpecBitsMap(i1 %control_in_reg_clr), !map !37
  call void (...)* @_ssdm_op_SpecBitsMap(float %control_in_reg_init), !map !41
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %m_mm2s_ctl), !map !45
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %m_s2mm_ctl), !map !51
  call void (...)* @_ssdm_op_SpecBitsMap(i128* %s_in_V_V), !map !55
  call void (...)* @_ssdm_op_SpecBitsMap(i128* %s_out_V_V), !map !61
  call void (...)* @_ssdm_op_SpecBitsMap(i1 false) nounwind, !map !65
  call void (...)* @_ssdm_op_SpecTopModule([11 x i8]* @str) nounwind
  %control_in_reg_init_read = call float @_ssdm_op_Read.ap_vld.float(float %control_in_reg_init)
  %control_in_reg_clr_read = call i1 @_ssdm_op_Read.ap_vld.i1(i1 %control_in_reg_clr)
  %control_in_lf_out_gain_read = call i8 @_ssdm_op_Read.ap_vld.i8(i8 %control_in_lf_out_gain)
  %control_in_lf_i_read = call i8 @_ssdm_op_Read.ap_vld.i8(i8 %control_in_lf_i)
  %control_in_lf_p_read = call i8 @_ssdm_op_Read.ap_vld.i8(i8 %control_in_lf_p)
  %iterations_read = call i32 @_ssdm_op_Read.ap_vld.i32(i32 %iterations)
  %destinationAddress_read = call i32 @_ssdm_op_Read.ap_vld.i32(i32 %destinationAddress)
  %sourceAddress_read = call i32 @_ssdm_op_Read.ap_vld.i32(i32 %sourceAddress)
  call void (...)* @_ssdm_op_SpecWire(i32 %iterations, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i32 %iterations, [7 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i32 %destinationAddress, [7 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i32 %destinationAddress, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i32 %sourceAddress, [7 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i32 %sourceAddress, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i128* %s_out_V_V, [5 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 1000, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i128* %s_in_V_V, [5 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 1000, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i32* %m_s2mm_ctl, [6 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  call void (...)* @_ssdm_op_SpecWire(i32* %m_mm2s_ctl, [6 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1)
  call void (...)* @_ssdm_op_SpecWire(float %control_in_qam, i8 %control_in_lf_p, i8 %control_in_lf_i, i8 %control_in_lf_out_gain, i1 %control_in_reg_clr, float %control_in_reg_init, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(float %control_in_qam, i8 %control_in_lf_p, i8 %control_in_lf_i, i8 %control_in_lf_out_gain, i1 %control_in_reg_clr, float %control_in_reg_init, [7 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i32 0, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  call void (...)* @_ssdm_op_SpecWire(i32 0, [11 x i8]* @p_str5, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str1, [1 x i8]* @p_str1, [1 x i8]* @p_str1) nounwind
  %p_req17 = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  %empty = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_mm2s_ctl)
  %m_mm2s_ctl_req15 = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_mm2s_ctl, i32 0)
  %m_mm2s_ctl_resp16 = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_mm2s_ctl)
  %m_s2mm_ctl_addr = getelementptr i32* %m_s2mm_ctl, i64 12
  %p_req27 = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  %empty_82 = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr)
  %m_s2mm_ctl_addr_req25 = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr, i32 0)
  %m_s2mm_ctl_addr_resp26 = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_s2mm_ctl_addr)
  %m_mm2s_ctl_load_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  %m_mm2s_ctl_read = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_mm2s_ctl)
  %tmp_13 = call i29 @_ssdm_op_PartSelect.i29.i32.i32.i32(i32 %m_mm2s_ctl_read, i32 3, i32 31)
  %tmp_15 = trunc i32 %m_mm2s_ctl_read to i2
  %m_mm2s_ctl_assign = call i32 @_ssdm_op_BitConcatenate.i32.i29.i1.i2(i29 %tmp_13, i1 true, i2 %tmp_15)
  %m_mm2s_ctl_req13 = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_mm2s_ctl, i32 %m_mm2s_ctl_assign)
  %m_mm2s_ctl_resp14 = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_mm2s_ctl)
  %m_s2mm_ctl_load_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  %m_s2mm_ctl_addr_read = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr)
  %tmp_18 = call i29 @_ssdm_op_PartSelect.i29.i32.i32.i32(i32 %m_s2mm_ctl_addr_read, i32 3, i32 31)
  %tmp_21 = trunc i32 %m_s2mm_ctl_addr_read to i2
  %tmp = call i32 @_ssdm_op_BitConcatenate.i32.i29.i1.i2(i29 %tmp_18, i1 true, i2 %tmp_21)
  %m_s2mm_ctl_addr_req23 = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr, i32 %tmp)
  %m_s2mm_ctl_addr_resp24 = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_s2mm_ctl_addr)
  %p_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  %empty_83 = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_mm2s_ctl)
  %m_mm2s_ctl_req11 = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_mm2s_ctl, i32 0)
  %m_mm2s_ctl_resp12 = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_mm2s_ctl)
  %p_req22 = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  %empty_84 = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr)
  %m_s2mm_ctl_addr_req20 = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr, i32 0)
  %m_s2mm_ctl_addr_resp21 = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_s2mm_ctl_addr)
  %m_mm2s_ctl_load_1_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  %m_mm2s_ctl_read_1 = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_mm2s_ctl)
  %tmp_29 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %m_mm2s_ctl_read_1, i32 1, i32 31)
  %tmp_1 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %tmp_29, i1 true)
  %m_mm2s_ctl_req9 = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_mm2s_ctl, i32 %tmp_1)
  %m_mm2s_ctl_resp10 = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_mm2s_ctl)
  %m_mm2s_ctl_load_2_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  %m_mm2s_ctl_read_2 = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_mm2s_ctl)
  %tmp_31 = call i19 @_ssdm_op_PartSelect.i19.i32.i32.i32(i32 %m_mm2s_ctl_read_2, i32 13, i32 31)
  %tmp_34 = trunc i32 %m_mm2s_ctl_read_2 to i12
  %tmp_2 = call i32 @_ssdm_op_BitConcatenate.i32.i19.i1.i12(i19 %tmp_31, i1 true, i12 %tmp_34)
  %m_mm2s_ctl_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_mm2s_ctl, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_mm2s_ctl, i32 %tmp_2)
  %m_mm2s_ctl_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_mm2s_ctl)
  %m_mm2s_ctl_addr = getelementptr i32* %m_mm2s_ctl, i64 6
  %m_mm2s_ctl_addr_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_mm2s_ctl_addr, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_mm2s_ctl_addr, i32 %sourceAddress_read)
  %m_mm2s_ctl_addr_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_mm2s_ctl_addr)
  %read_length = shl i32 %iterations_read, 4
  %m_mm2s_ctl_addr_1 = getelementptr i32* %m_mm2s_ctl, i64 10
  %m_mm2s_ctl_addr_1_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_mm2s_ctl_addr_1, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_mm2s_ctl_addr_1, i32 %read_length)
  %m_mm2s_ctl_addr_1_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_mm2s_ctl_addr_1)
  %m_s2mm_ctl_load_1_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  %m_s2mm_ctl_addr_read_1 = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr)
  %tmp_37 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %m_s2mm_ctl_addr_read_1, i32 1, i32 31)
  %tmp_4 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %tmp_37, i1 true)
  %m_s2mm_ctl_addr_req18 = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr, i32 %tmp_4)
  %m_s2mm_ctl_addr_resp19 = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_s2mm_ctl_addr)
  %m_s2mm_ctl_load_2_req = call i1 @_ssdm_op_ReadReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  %m_s2mm_ctl_addr_read_2 = call i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr)
  %tmp_44 = call i19 @_ssdm_op_PartSelect.i19.i32.i32.i32(i32 %m_s2mm_ctl_addr_read_2, i32 13, i32 31)
  %tmp_45 = trunc i32 %m_s2mm_ctl_addr_read_2 to i12
  %tmp_5 = call i32 @_ssdm_op_BitConcatenate.i32.i19.i1.i12(i19 %tmp_44, i1 true, i12 %tmp_45)
  %m_s2mm_ctl_addr_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_s2mm_ctl_addr, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr, i32 %tmp_5)
  %m_s2mm_ctl_addr_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_s2mm_ctl_addr)
  %m_s2mm_ctl_addr_1 = getelementptr i32* %m_s2mm_ctl, i64 18
  %m_s2mm_ctl_addr_1_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_s2mm_ctl_addr_1, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr_1, i32 %destinationAddress_read)
  %m_s2mm_ctl_addr_1_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_s2mm_ctl_addr_1)
  %m_s2mm_ctl_addr_2 = getelementptr i32* %m_s2mm_ctl, i64 22
  %m_s2mm_ctl_addr_2_req = call i1 @_ssdm_op_WriteReq.m_axi.i32P(i32* %m_s2mm_ctl_addr_2, i32 1)
  call void @_ssdm_op_Write.m_axi.volatile.i32P(i32* %m_s2mm_ctl_addr_2, i32 %read_length)
  %m_s2mm_ctl_addr_2_resp = call i1 @_ssdm_op_WriteResp.m_axi.i32P(i32* %m_s2mm_ctl_addr_2)
  %d_assign_2 = fpext float %control_in_reg_init_read to double
  %ireg_V_2 = bitcast double %d_assign_2 to i64
  %tmp_46 = trunc i64 %ireg_V_2 to i63
  %tmp_39 = icmp eq i63 %tmp_46, 0
  %p_this_assign = select i1 %tmp_39, i28 0, i28 -134217728
  %sel_tmp34 = xor i1 %tmp_39, true
  %sh_i_cast = sext i8 %control_in_lf_p_read to i9
  %isNeg = call i1 @_ssdm_op_BitSelect.i1.i8.i32(i8 %control_in_lf_p_read, i32 7)
  %tmp_10_i = sub i9 0, %sh_i_cast
  %sh_assign = select i1 %isNeg, i9 %tmp_10_i, i9 %sh_i_cast
  %sh_assign_1_i_cast1 = zext i9 %sh_assign to i28
  %sh_assign_1_i_cast = zext i9 %sh_assign to i32
  %tmp_15_i_cast = sext i8 %control_in_lf_i_read to i9
  %sh_assign_1 = add i9 %tmp_15_i_cast, 9
  %isNeg_1 = call i1 @_ssdm_op_BitSelect.i1.i9.i32(i9 %sh_assign_1, i32 8)
  %tmp_16_i = sub i9 -9, %tmp_15_i_cast
  %sh_assign_2 = select i1 %isNeg_1, i9 %tmp_16_i, i9 %sh_assign_1
  %sh_assign_3_i_cast1 = sext i9 %sh_assign_2 to i28
  %sh_assign_3_i_cast = sext i9 %sh_assign_2 to i32
  %sh_1_i_cast = sext i8 %control_in_lf_out_gain_read to i9
  %isNeg_2 = call i1 @_ssdm_op_BitSelect.i1.i8.i32(i8 %control_in_lf_out_gain_read, i32 7)
  %tmp_26_i = sub i9 0, %sh_1_i_cast
  %sh_assign_3 = select i1 %isNeg_2, i9 %tmp_26_i, i9 %sh_1_i_cast
  %sh_assign_5_i_cast1 = zext i9 %sh_assign_3 to i28
  %sh_assign_5_i_cast = zext i9 %sh_assign_3 to i32
  br label %1

; <label>:1                                       ; preds = %_ifconv, %0
  %i = phi i32 [ 0, %0 ], [ %i_1, %_ifconv ]
  %tmp_6 = icmp slt i32 %i, %iterations_read
  %i_1 = add nsw i32 %i, 1
  br i1 %tmp_6, label %_ifconv, label %2

_ifconv:                                          ; preds = %1
  %p_Val2_load = load i12* %p_Val2_s, align 2
  %p_Val2_1_load = load i12* %p_Val2_1, align 2
  %tmp_V_14 = call i128 @_ssdm_op_Read.axis.volatile.i128P(i128* %s_in_V_V)
  %first_r_V = call i32 @_ssdm_op_PartSelect.i32.i128.i32.i32(i128 %tmp_V_14, i32 96, i32 127)
  %second_r_V = call i32 @_ssdm_op_PartSelect.i32.i128.i32.i32(i128 %tmp_V_14, i32 64, i32 95)
  %v_assign = bitcast i32 %first_r_V to float
  %v_assign_1 = bitcast i32 %second_r_V to float
  %d_assign = fpext float %v_assign to double
  %d_assign_1 = fpext float %v_assign_1 to double
  %ireg_V = bitcast double %d_assign to i64
  %tmp_56 = trunc i64 %ireg_V to i63
  %isneg = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %ireg_V, i32 63)
  %exp_tmp_V = call i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64 %ireg_V, i32 52, i32 62)
  %tmp_3 = zext i11 %exp_tmp_V to i12
  %tmp_62 = trunc i64 %ireg_V to i52
  %tmp_7 = call i53 @_ssdm_op_BitConcatenate.i53.i1.i52(i1 true, i52 %tmp_62)
  %p_Result_28 = zext i53 %tmp_7 to i54
  %man_V_1 = sub i54 0, %p_Result_28
  %man_V_2 = select i1 %isneg, i54 %man_V_1, i54 %p_Result_28
  %tmp_8 = icmp eq i63 %tmp_56, 0
  %F2 = sub i12 1075, %tmp_3
  %tmp_9 = icmp sgt i12 %F2, 13
  %tmp_10 = add i12 %F2, -13
  %tmp_11 = sub i12 13, %F2
  %sh_amt = select i1 %tmp_9, i12 %tmp_10, i12 %tmp_11
  %sh_amt_cast = sext i12 %sh_amt to i32
  %tmp_12 = icmp eq i12 %F2, 13
  %tmp_78 = trunc i54 %man_V_2 to i16
  %tmp_14 = icmp ult i12 %sh_amt, 54
  %tmp_80 = call i8 @_ssdm_op_PartSelect.i8.i12.i32.i32(i12 %sh_amt, i32 4, i32 11)
  %icmp = icmp eq i8 %tmp_80, 0
  %tmp_16 = zext i32 %sh_amt_cast to i54
  %tmp_17 = ashr i54 %man_V_2, %tmp_16
  %tmp_90 = trunc i54 %tmp_17 to i16
  %p_s = select i1 %isneg, i16 -1, i16 0
  %tmp_19 = sext i16 %tmp_78 to i32
  %tmp_20 = shl i32 %tmp_19, %sh_amt_cast
  %tmp_100 = trunc i32 %tmp_20 to i16
  %sel_tmp1 = xor i1 %tmp_8, true
  %sel_tmp2 = and i1 %tmp_12, %sel_tmp1
  %sel_tmp6_demorgan = or i1 %tmp_8, %tmp_12
  %sel_tmp6 = xor i1 %sel_tmp6_demorgan, true
  %sel_tmp7 = and i1 %tmp_9, %sel_tmp6
  %sel_tmp8 = and i1 %sel_tmp7, %tmp_14
  %sel_tmp14_demorgan = or i1 %sel_tmp6_demorgan, %tmp_9
  %sel_tmp = xor i1 %sel_tmp14_demorgan, true
  %sel_tmp3 = and i1 %icmp, %sel_tmp
  %sel_tmp4 = xor i1 %tmp_14, true
  %sel_tmp5 = and i1 %sel_tmp7, %sel_tmp4
  %newSel = select i1 %sel_tmp5, i16 %p_s, i16 %tmp_100
  %or_cond = or i1 %sel_tmp5, %sel_tmp3
  %newSel1 = select i1 %sel_tmp8, i16 %tmp_90, i16 %tmp_78
  %or_cond1 = or i1 %sel_tmp8, %sel_tmp2
  %newSel2 = select i1 %or_cond, i16 %newSel, i16 %newSel1
  %or_cond2 = or i1 %or_cond, %or_cond1
  %newSel3 = select i1 %or_cond2, i16 %newSel2, i16 0
  %ireg_V_1 = bitcast double %d_assign_1 to i64
  %tmp_110 = trunc i64 %ireg_V_1 to i63
  %isneg_1 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %ireg_V_1, i32 63)
  %exp_tmp_V_1 = call i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64 %ireg_V_1, i32 52, i32 62)
  %tmp_22 = zext i11 %exp_tmp_V_1 to i12
  %tmp_112 = trunc i64 %ireg_V_1 to i52
  %tmp_23 = call i53 @_ssdm_op_BitConcatenate.i53.i1.i52(i1 true, i52 %tmp_112)
  %p_Result_29 = zext i53 %tmp_23 to i54
  %man_V_4 = sub i54 0, %p_Result_29
  %man_V_5 = select i1 %isneg_1, i54 %man_V_4, i54 %p_Result_29
  %tmp_24 = icmp eq i63 %tmp_110, 0
  %F2_1 = sub i12 1075, %tmp_22
  %tmp_25 = icmp sgt i12 %F2_1, 13
  %tmp_26 = add i12 %F2_1, -13
  %tmp_27 = sub i12 13, %F2_1
  %sh_amt_1 = select i1 %tmp_25, i12 %tmp_26, i12 %tmp_27
  %sh_amt_1_cast = sext i12 %sh_amt_1 to i32
  %tmp_28 = icmp eq i12 %F2_1, 13
  %tmp_113 = trunc i54 %man_V_5 to i16
  %tmp_30 = icmp ult i12 %sh_amt_1, 54
  %tmp_114 = call i8 @_ssdm_op_PartSelect.i8.i12.i32.i32(i12 %sh_amt_1, i32 4, i32 11)
  %icmp1 = icmp eq i8 %tmp_114, 0
  %tmp_32 = zext i32 %sh_amt_1_cast to i54
  %tmp_33 = ashr i54 %man_V_5, %tmp_32
  %tmp_115 = trunc i54 %tmp_33 to i16
  %p_1 = select i1 %isneg_1, i16 -1, i16 0
  %tmp_35 = sext i16 %tmp_113 to i32
  %tmp_36 = shl i32 %tmp_35, %sh_amt_1_cast
  %tmp_116 = trunc i32 %tmp_36 to i16
  %sel_tmp9 = xor i1 %tmp_24, true
  %sel_tmp10 = and i1 %tmp_28, %sel_tmp9
  %sel_tmp30_demorgan = or i1 %tmp_24, %tmp_28
  %sel_tmp11 = xor i1 %sel_tmp30_demorgan, true
  %sel_tmp12 = and i1 %tmp_25, %sel_tmp11
  %sel_tmp13 = and i1 %sel_tmp12, %tmp_30
  %sel_tmp38_demorgan = or i1 %sel_tmp30_demorgan, %tmp_25
  %sel_tmp14 = xor i1 %sel_tmp38_demorgan, true
  %sel_tmp15 = and i1 %icmp1, %sel_tmp14
  %sel_tmp16 = xor i1 %tmp_30, true
  %sel_tmp17 = and i1 %sel_tmp12, %sel_tmp16
  %newSel4 = select i1 %sel_tmp17, i16 %p_1, i16 %tmp_116
  %or_cond3 = or i1 %sel_tmp17, %sel_tmp15
  %newSel5 = select i1 %sel_tmp13, i16 %tmp_115, i16 %tmp_113
  %or_cond4 = or i1 %sel_tmp13, %sel_tmp10
  %newSel6 = select i1 %or_cond3, i16 %newSel4, i16 %newSel5
  %or_cond5 = or i1 %or_cond3, %or_cond4
  %newSel7 = select i1 %or_cond5, i16 %newSel6, i16 0
  %isneg_12 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %ireg_V_2, i32 63)
  %exp_tmp_V_2 = call i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64 %ireg_V_2, i32 52, i32 62)
  %tmp_s = zext i11 %exp_tmp_V_2 to i12
  %exp_V = add i12 %tmp_s, -1023
  %tmp_118 = trunc i64 %ireg_V_2 to i52
  %tmp_38 = call i53 @_ssdm_op_BitConcatenate.i53.i1.i52(i1 true, i52 %tmp_118)
  %p_Result_30 = zext i53 %tmp_38 to i54
  %man_V_7 = sub i54 0, %p_Result_30
  %man_V_17 = select i1 %isneg_12, i54 %man_V_7, i54 %p_Result_30
  %F2_2 = sub i12 1075, %tmp_s
  %tmp_40 = icmp sgt i12 %F2_2, 26
  %tmp_41 = add i12 %F2_2, -26
  %tmp_42 = sub i12 26, %F2_2
  %sh_amt_2 = select i1 %tmp_40, i12 %tmp_41, i12 %tmp_42
  %sh_amt_2_cast = sext i12 %sh_amt_2 to i32
  %tmp_43 = icmp eq i12 %F2_2, 26
  %tmp_119 = trunc i54 %man_V_17 to i28
  %tmp_49 = icmp ult i12 %sh_amt_2, 54
  %tmp_50 = icmp ult i12 %sh_amt_2, 28
  %tmp_51 = zext i32 %sh_amt_2_cast to i54
  %tmp_52 = ashr i54 %man_V_17, %tmp_51
  %tmp_120 = trunc i54 %tmp_52 to i28
  %p_2 = select i1 %isneg_12, i28 -1, i28 0
  %tmp_54 = sext i28 %tmp_119 to i32
  %tmp_55 = shl i32 %tmp_54, %sh_amt_2_cast
  %tmp_123 = trunc i32 %tmp_55 to i28
  %sel_tmp18 = select i1 %tmp_43, i28 %tmp_119, i28 0
  %sel_tmp19 = xor i1 %tmp_43, true
  %sel_tmp20 = and i1 %tmp_40, %sel_tmp19
  %sel_tmp21 = and i1 %sel_tmp20, %tmp_49
  %sel_tmp22 = select i1 %sel_tmp21, i28 %tmp_120, i28 %sel_tmp18
  %sel_tmp23 = icmp slt i12 %F2_2, 26
  %sel_tmp24 = and i1 %sel_tmp23, %tmp_50
  %sel_tmp25 = select i1 %sel_tmp24, i28 %tmp_123, i28 %sel_tmp22
  %sel_tmp26 = xor i1 %tmp_49, true
  %sel_tmp27 = and i1 %sel_tmp20, %sel_tmp26
  %p_Val2_4 = select i1 %sel_tmp27, i28 %p_2, i28 %sel_tmp25
  %tmp_57 = icmp sgt i12 %exp_V, 0
  %pos1 = add i12 %F2_2, 2
  %pos1_cast = sext i12 %pos1 to i32
  %pos2 = add i12 %F2_2, 3
  %pos2_cast = sext i12 %pos2 to i32
  %newsignbit = call i1 @_ssdm_op_BitSelect.i1.i28.i32(i28 %p_Val2_4, i32 27)
  %tmp_58 = icmp slt i12 %pos1, 54
  %tmp_125 = call i1 @_ssdm_op_BitSelect.i1.i12.i32(i12 %pos1, i32 11)
  %rev = xor i1 %tmp_125, true
  %tmp_59 = zext i32 %pos1_cast to i54
  %tmp_60 = ashr i54 %man_V_17, %tmp_59
  %lD = trunc i54 %tmp_60 to i1
  %tmp1 = and i1 %lD, %rev
  %Range1_all_ones_1 = and i1 %tmp1, %tmp_58
  %tmp_127 = call i1 @_ssdm_op_BitSelect.i1.i12.i32(i12 %pos2, i32 11)
  %rev1 = xor i1 %tmp_127, true
  %tmp_61 = icmp slt i12 %pos2, 54
  %or_cond88_i = and i1 %tmp_61, %rev1
  %tmp_63 = zext i32 %pos2_cast to i54
  %Range2_V_1 = lshr i54 %man_V_17, %tmp_63
  %r_V = lshr i54 -1, %tmp_63
  %Range2_all_ones = icmp eq i54 %Range2_V_1, %r_V
  %Range2_all_ones_1_i = select i1 %or_cond88_i, i1 %Range2_all_ones, i1 %rev1
  %or_cond89_i = and i1 %tmp_61, %rev
  %Range1_all_ones = and i1 %Range2_all_ones_1_i, %Range1_all_ones_1
  %tmp_64 = icmp eq i54 %Range2_V_1, 0
  %Range1_all_zeros = xor i1 %Range1_all_ones_1, true
  %p_93_i = and i1 %tmp_64, %Range1_all_zeros
  %tmp_65 = icmp eq i12 %pos2, 54
  %Range1_all_zeros_1 = icmp eq i54 %man_V_17, 0
  %sel_tmp28 = xor i1 %tmp_58, true
  %tmp2 = or i1 %rev, %sel_tmp28
  %sel_tmp29 = or i1 %tmp2, %Range1_all_zeros_1
  %tmp_63_not = xor i1 %tmp_61, true
  %sel_tmp30 = or i1 %tmp_125, %tmp_63_not
  %tmp3 = and i1 %tmp_65, %sel_tmp30
  %sel_tmp31 = and i1 %tmp3, %tmp_58
  %sel_tmp32 = select i1 %sel_tmp31, i1 %Range1_all_zeros, i1 %sel_tmp29
  %sel_tmp33 = and i1 %tmp_58, %or_cond89_i
  %deleted_zeros_0_i = select i1 %sel_tmp33, i1 %p_93_i, i1 %sel_tmp32
  %sel_tmp35 = select i1 %sel_tmp31, i1 %Range1_all_ones_1, i1 %tmp2
  %deleted_ones_0_i = select i1 %sel_tmp33, i1 %Range1_all_ones, i1 %sel_tmp35
  %sel_tmp36 = or i1 %tmp_58, %newsignbit
  %neg_src = and i1 %isneg_12, %sel_tmp36
  %deleted_zeros_0_not_i = xor i1 %deleted_zeros_0_i, true
  %brmerge_i = or i1 %newsignbit, %deleted_zeros_0_not_i
  %tmp_67 = xor i1 %isneg_12, true
  %overflow = and i1 %brmerge_i, %tmp_67
  %brmerge92_demorgan_i = and i1 %newsignbit, %deleted_ones_0_i
  %brmerge92_i = xor i1 %brmerge92_demorgan_i, true
  %underflow = and i1 %neg_src, %brmerge92_i
  %brmerge_i_i = or i1 %underflow, %overflow
  %sign_assign_not = xor i1 %neg_src, true
  %tmp4 = or i1 %overflow, %sign_assign_not
  %brmerge = or i1 %tmp4, %brmerge92_demorgan_i
  %this_assign_mux = select i1 %brmerge_i_i, i28 134217727, i28 %p_Val2_4
  %tmp_66 = or i1 %tmp_39, %underflow
  %sel_tmp37 = select i1 %tmp_66, i28 %p_this_assign, i28 %p_Val2_4
  %sel_tmp93_demorgan = or i1 %tmp_39, %tmp_57
  %sel_tmp38 = select i1 %sel_tmp93_demorgan, i28 %sel_tmp37, i28 %p_Val2_4
  %tmp67 = and i1 %brmerge, %sel_tmp34
  %sel_tmp39 = and i1 %tmp67, %tmp_57
  %p_5 = select i1 %sel_tmp39, i28 %this_assign_mux, i28 %sel_tmp38
  %OP1_V = sext i16 %newSel3 to i28
  %OP2_V = sext i12 %p_Val2_load to i28
  %p_Val2_5 = mul i28 %OP1_V, %OP2_V
  %OP1_V_1 = sext i16 %newSel7 to i28
  %OP2_V_1 = sext i12 %p_Val2_1_load to i28
  %p_Val2_6 = mul i28 %OP1_V_1, %OP2_V_1
  %tmp_68 = call i16 @_ssdm_op_PartSelect.i16.i28.i32.i32(i28 %p_Val2_5, i32 11, i32 26)
  %tmp_1_i_i = call i27 @_ssdm_op_BitConcatenate.i27.i16.i11(i16 %tmp_68, i11 0)
  %tmp_1_i_i_cast = sext i27 %tmp_1_i_i to i29
  %tmp_2_i_i = zext i28 %p_Val2_6 to i29
  %p_Val2_7 = sub i29 %tmp_1_i_i_cast, %tmp_2_i_i
  %p_Val2_61 = call i16 @_ssdm_op_PartSelect.i16.i29.i32.i32(i29 %p_Val2_7, i32 11, i32 26)
  %p_Val2_8 = mul i28 %OP1_V, %OP2_V_1
  %p_Val2_9 = mul i28 %OP1_V_1, %OP2_V
  %tmp_111 = call i16 @_ssdm_op_PartSelect.i16.i28.i32.i32(i28 %p_Val2_8, i32 11, i32 26)
  %tmp_6_i_i = call i27 @_ssdm_op_BitConcatenate.i27.i16.i11(i16 %tmp_111, i11 0)
  %tmp_6_i_i_cast = sext i27 %tmp_6_i_i to i29
  %tmp_7_i_i = zext i28 %p_Val2_9 to i29
  %p_Val2_10 = add i29 %tmp_6_i_i_cast, %tmp_7_i_i
  %p_Val2_63 = call i16 @_ssdm_op_PartSelect.i16.i29.i32.i32(i29 %p_Val2_10, i32 11, i32 26)
  %isneg_13 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_7, i32 26)
  %p_Val2_12 = call i5 @_ssdm_op_PartSelect.i5.i29.i32.i32(i29 %p_Val2_7, i32 20, i32 24)
  %newsignbit_1 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_7, i32 24)
  %p_Result_i = call i2 @_ssdm_op_PartSelect.i2.i29.i32.i32(i29 %p_Val2_7, i32 25, i32 26)
  %p_not_i1_i = icmp ne i2 %p_Result_i, 0
  %brmerge_i1_i = or i1 %newsignbit_1, %p_not_i1_i
  %tmp_9_i = xor i1 %isneg_13, true
  %overflow_1 = and i1 %brmerge_i1_i, %tmp_9_i
  %newsignbit_0_not_i1_i = xor i1 %newsignbit_1, true
  %p_not38_i1_i = icmp ne i2 %p_Result_i, -1
  %brmerge39_i1_i = or i1 %p_not38_i1_i, %newsignbit_0_not_i1_i
  %underflow_1 = and i1 %brmerge39_i1_i, %isneg_13
  %brmerge_i_i1_i = or i1 %underflow_1, %overflow_1
  %underflow_not_i = xor i1 %underflow_1, true
  %brmerge8_i = or i1 %overflow_1, %underflow_not_i
  %p_Val2_34_mux_i = select i1 %brmerge_i_i1_i, i5 15, i5 %p_Val2_12
  %p_Val2_i = select i1 %underflow_1, i5 -16, i5 %p_Val2_12
  %clip_i_V = select i1 %brmerge8_i, i5 %p_Val2_34_mux_i, i5 %p_Val2_i
  %isneg_14 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_10, i32 26)
  %p_Val2_14 = call i5 @_ssdm_op_PartSelect.i5.i29.i32.i32(i29 %p_Val2_10, i32 20, i32 24)
  %newsignbit_2 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_10, i32 24)
  %p_Result_3_i = call i2 @_ssdm_op_PartSelect.i2.i29.i32.i32(i29 %p_Val2_10, i32 25, i32 26)
  %p_not_i_i = icmp ne i2 %p_Result_3_i, 0
  %brmerge_i_i1 = or i1 %newsignbit_2, %p_not_i_i
  %tmp_3_i = xor i1 %isneg_14, true
  %overflow_2 = and i1 %brmerge_i_i1, %tmp_3_i
  %newsignbit_0_not_i_i = xor i1 %newsignbit_2, true
  %p_not38_i_i = icmp ne i2 %p_Result_3_i, -1
  %brmerge39_i_i = or i1 %p_not38_i_i, %newsignbit_0_not_i_i
  %underflow_2 = and i1 %brmerge39_i_i, %isneg_14
  %brmerge_i_i_i = or i1 %underflow_2, %overflow_2
  %underflow_1_not_i = xor i1 %underflow_2, true
  %brmerge9_i = or i1 %overflow_2, %underflow_1_not_i
  %p_Val2_36_mux_i = select i1 %brmerge_i_i_i, i5 15, i5 %p_Val2_14
  %p_Val2_1_i = select i1 %underflow_2, i5 -16, i5 %p_Val2_14
  %clip_q_V = select i1 %brmerge9_i, i5 %p_Val2_36_mux_i, i5 %p_Val2_1_i
  %tmp_132 = call i1 @_ssdm_op_BitSelect.i1.i5.i32(i5 %clip_i_V, i32 4)
  %tmp_i = call i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1 %tmp_132, i1 true)
  %p_Result_31 = call i5 @_ssdm_op_PartSet.i5.i5.i2.i32.i32(i5 undef, i2 %tmp_i, i32 3, i32 4)
  %tmp_133 = call i1 @_ssdm_op_BitSelect.i1.i5.i32(i5 %clip_q_V, i32 4)
  %tmp_1_i = call i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1 %tmp_133, i1 true)
  %p_Result_32 = call i5 @_ssdm_op_PartSet.i5.i5.i2.i32.i32(i5 undef, i2 %tmp_1_i, i32 3, i32 4)
  %OP1_V_2 = sext i5 %p_Result_31 to i21
  %OP2_V_2 = sext i16 %p_Val2_63 to i21
  %p_Val2_32 = mul i21 %OP2_V_2, %OP1_V_2
  %isneg_15 = call i1 @_ssdm_op_BitSelect.i1.i21.i32(i21 %p_Val2_32, i32 20)
  %p_Val2_35 = call i14 @_ssdm_op_PartSelect.i14.i21.i32.i32(i21 %p_Val2_32, i32 5, i32 18)
  %newsignbit_3 = call i1 @_ssdm_op_BitSelect.i1.i21.i32(i21 %p_Val2_32, i32 18)
  %p_Result_i1 = call i2 @_ssdm_op_PartSelect.i2.i21.i32.i32(i21 %p_Val2_32, i32 19, i32 20)
  %p_not_i_i1 = icmp ne i2 %p_Result_i1, 0
  %brmerge_i_i2 = or i1 %newsignbit_3, %p_not_i_i1
  %tmp_4_i = xor i1 %isneg_15, true
  %overflow_3 = and i1 %brmerge_i_i2, %tmp_4_i
  %newsignbit_0_not_i_i1 = xor i1 %newsignbit_3, true
  %p_not38_i_i1 = icmp ne i2 %p_Result_i1, -1
  %brmerge39_i_i1 = or i1 %p_not38_i_i1, %newsignbit_0_not_i_i1
  %underflow_3 = and i1 %brmerge39_i_i1, %isneg_15
  %brmerge_i_i_i1 = or i1 %underflow_3, %overflow_3
  %underflow_not_i1 = xor i1 %underflow_3, true
  %brmerge_i1 = or i1 %overflow_3, %underflow_not_i1
  %p_Val2_47_mux_i = select i1 %brmerge_i_i_i1, i14 8191, i14 %p_Val2_35
  %p_Val2_i1 = select i1 %underflow_3, i14 -8192, i14 %p_Val2_35
  %p_Val2_36 = select i1 %brmerge_i1, i14 %p_Val2_47_mux_i, i14 %p_Val2_i1
  %OP1_V_3 = sext i5 %p_Result_32 to i21
  %OP2_V_3 = sext i16 %p_Val2_61 to i21
  %p_Val2_11 = mul i21 %OP2_V_3, %OP1_V_3
  %tmp_6_i = call i19 @_ssdm_op_BitConcatenate.i19.i14.i5(i14 %p_Val2_36, i5 0)
  %tmp_6_i_cast = sext i19 %tmp_6_i to i21
  %p_Val2_37 = sub i21 %tmp_6_i_cast, %p_Val2_11
  %isneg_16 = call i1 @_ssdm_op_BitSelect.i1.i21.i32(i21 %p_Val2_37, i32 20)
  %p_Val2_38 = call i14 @_ssdm_op_PartSelect.i14.i21.i32.i32(i21 %p_Val2_37, i32 5, i32 18)
  %newsignbit_4 = call i1 @_ssdm_op_BitSelect.i1.i21.i32(i21 %p_Val2_37, i32 18)
  %tmp_69 = call i2 @_ssdm_op_PartSelect.i2.i21.i32.i32(i21 %p_Val2_37, i32 19, i32 20)
  %p_not_i_i_i = icmp ne i2 %tmp_69, 0
  %brmerge_i_i4_i = or i1 %newsignbit_4, %p_not_i_i_i
  %tmp_9_i1 = xor i1 %isneg_16, true
  %overflow_4 = and i1 %brmerge_i_i4_i, %tmp_9_i1
  %newsignbit_0_not_i_i_i = xor i1 %newsignbit_4, true
  %p_not38_i_i_i = icmp ne i2 %tmp_69, -1
  %brmerge39_i_i_i = or i1 %p_not38_i_i_i, %newsignbit_0_not_i_i_i
  %underflow_4 = and i1 %brmerge39_i_i_i, %isneg_16
  %brmerge_i_i_i_i = or i1 %underflow_4, %overflow_4
  %underflow_4_not_i = xor i1 %underflow_4, true
  %brmerge1_i = or i1 %overflow_4, %underflow_4_not_i
  %ssdm_int_14_1024_0_true_V_write_assign = select i1 %brmerge_i_i_i_i, i14 8191, i14 %p_Val2_38
  %p_Val2_2_i = select i1 %underflow_4, i14 -8192, i14 %p_Val2_38
  %ph_est_V = select i1 %brmerge1_i, i14 %ssdm_int_14_1024_0_true_V_write_assign, i14 %p_Val2_2_i
  %tmp_i2 = call i28 @_ssdm_op_BitConcatenate.i28.i14.i14(i14 %ph_est_V, i14 0)
  %tmp_11_i = sext i28 %tmp_i2 to i32
  %tmp_12_i = shl i32 %tmp_11_i, %sh_assign_1_i_cast
  %tmp_14_i = ashr i28 %tmp_i2, %sh_assign_1_i_cast1
  %tmp_14_i_cast = zext i28 %tmp_14_i to i32
  %p_Val2_0_i_i121_in_i = select i1 %isNeg, i32 %tmp_12_i, i32 %tmp_14_i_cast
  %p_Val2_43 = trunc i32 %p_Val2_0_i_i121_in_i to i28
  %tmp_18_i = shl i32 %tmp_11_i, %sh_assign_3_i_cast
  %tmp_20_i = ashr i28 %tmp_i2, %sh_assign_3_i_cast1
  %tmp_20_i_cast = zext i28 %tmp_20_i to i32
  %p_in_i = select i1 %isNeg_1, i32 %tmp_18_i, i32 %tmp_20_i_cast
  %p_Val2_40 = trunc i32 %p_in_i to i28
  %p_Val2_41 = load i28* @i_reg_V, align 4
  %p_Val2_42 = add i28 %p_Val2_41, %p_Val2_40
  %tmp_21_i = sext i28 %p_Val2_42 to i29
  %tmp_22_i = sext i28 %p_Val2_43 to i29
  %p_Val2_44 = add i29 %tmp_22_i, %tmp_21_i
  %isneg_17 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_44, i32 28)
  %p_Val2_45 = trunc i29 %p_Val2_44 to i28
  %newsignbit_5 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_44, i32 27)
  %tmp_24_i = xor i1 %newsignbit_5, true
  %underflow_5 = and i1 %isneg_17, %tmp_24_i
  %brmerge_i_i_i2 = xor i1 %isneg_17, %newsignbit_5
  %isneg_not_i = xor i1 %isneg_17, true
  %brmerge_i2 = or i1 %newsignbit_5, %isneg_not_i
  %p_Val2_54_mux_i = select i1 %brmerge_i_i_i2, i28 134217727, i28 %p_Val2_45
  %p_Val2_i2 = select i1 %underflow_5, i28 -134217728, i28 %p_Val2_45
  %tmp_25_i = select i1 %brmerge_i2, i28 %p_Val2_54_mux_i, i28 %p_Val2_i2
  %p_Val2_47 = select i1 %control_in_reg_clr_read, i28 %p_5, i28 %p_Val2_42
  store i28 %p_Val2_47, i28* @i_reg_V, align 4
  %tmp_27_i = sext i28 %tmp_25_i to i32
  %tmp_28_i = shl i32 %tmp_27_i, %sh_assign_5_i_cast
  %tmp_30_i = ashr i28 %tmp_25_i, %sh_assign_5_i_cast1
  %tmp_30_i_cast = zext i28 %tmp_30_i to i32
  %p_Val2_0_i_i129_in_i = select i1 %isNeg_2, i32 %tmp_28_i, i32 %tmp_30_i_cast
  %p_Val2_51 = trunc i32 %p_Val2_0_i_i129_in_i to i28
  %p_Val2_50 = load i16* @phase_angle_V, align 2
  %tmp_31_i = call i27 @_ssdm_op_BitConcatenate.i27.i16.i11(i16 %p_Val2_50, i11 0)
  %tmp_31_i_cast = sext i27 %tmp_31_i to i29
  %tmp_32_i = zext i28 %p_Val2_51 to i29
  %p_Val2_52 = sub i29 %tmp_31_i_cast, %tmp_32_i
  %p_Val2_53 = call i16 @_ssdm_op_PartSelect.i16.i29.i32.i32(i29 %p_Val2_52, i32 11, i32 26)
  store i16 %p_Val2_53, i16* @phase_angle_V, align 2
  %msb_V = call i2 @_ssdm_op_PartSelect.i2.i29.i32.i32(i29 %p_Val2_52, i32 25, i32 26)
  %tmp_144 = call i1 @_ssdm_op_BitSelect.i1.i29.i32(i29 %p_Val2_52, i32 25)
  %sin_adr_V = call i10 @_ssdm_op_PartSelect.i10.i29.i32.i32(i29 %p_Val2_52, i32 15, i32 24)
  %cos_adr_V_3 = xor i10 %sin_adr_V, -1
  %cos_adr_V = select i1 %tmp_144, i10 %cos_adr_V_3, i10 %sin_adr_V
  %sin_adr_V_1 = select i1 %tmp_144, i10 %sin_adr_V, i10 %cos_adr_V_3
  %tmp_34_i = zext i10 %cos_adr_V to i64
  %cos_lut_addr = getelementptr [1024 x i15]* @cos_lut, i64 0, i64 %tmp_34_i
  %cos_out_V_5 = load i15* %cos_lut_addr, align 2
  %cos_out_V_4_i_cast = zext i15 %cos_out_V_5 to i16
  %tmp_35_i = zext i10 %sin_adr_V_1 to i64
  %cos_lut_addr_1 = getelementptr [1024 x i15]* @cos_lut, i64 0, i64 %tmp_35_i
  %sin_out_V_4 = load i15* %cos_lut_addr_1, align 2
  %sin_out_V_4_i_cast = zext i15 %sin_out_V_4 to i16
  %tmp_36_i = icmp eq i2 %msb_V, 1
  %tmp_37_i = icmp eq i2 %msb_V, 0
  %tmp_38_i = icmp eq i2 %msb_V, -1
  %sin_out_V = sub i16 0, %sin_out_V_4_i_cast
  %cos_out_V = sub i16 0, %cos_out_V_4_i_cast
  %sel_tmp3_demorgan_i = or i1 %tmp_36_i, %tmp_37_i
  %sel_tmp3_i = xor i1 %sel_tmp3_demorgan_i, true
  %sel_tmp4_i = and i1 %tmp_38_i, %sel_tmp3_i
  %cos_out_V_1 = select i1 %sel_tmp4_i, i16 %cos_out_V_4_i_cast, i16 %cos_out_V
  %sel_tmp6_i = xor i1 %tmp_36_i, true
  %sel_tmp7_i = and i1 %tmp_37_i, %sel_tmp6_i
  %cos_out_V_6 = select i1 %sel_tmp7_i, i16 %cos_out_V_4_i_cast, i16 %cos_out_V_1
  %newSel8 = select i1 %sel_tmp7_i, i16 %sin_out_V_4_i_cast, i16 %sin_out_V
  %or_cond6 = or i1 %sel_tmp7_i, %sel_tmp4_i
  %newSel9 = select i1 %tmp_36_i, i16 %sin_out_V_4_i_cast, i16 %sin_out_V
  %sin_out_V_5 = select i1 %or_cond6, i16 %newSel8, i16 %newSel9
  %p_Val2_65 = call i12 @_ssdm_op_PartSelect.i12.i16.i32.i32(i16 %cos_out_V_6, i32 4, i32 15)
  %p_Val2_67 = call i12 @_ssdm_op_PartSelect.i12.i16.i32.i32(i16 %sin_out_V_5, i32 4, i32 15)
  %tmp_70 = icmp eq i16 %p_Val2_61, 0
  %tmp_V = sext i16 %p_Val2_61 to i17
  %tmp_V_1 = sub i17 0, %tmp_V
  %tmp_V_15 = select i1 %isneg_13, i17 %tmp_V_1, i17 %tmp_V
  %p_Result_33 = call i17 @llvm.part.select.i17(i17 %tmp_V_15, i32 16, i32 0) nounwind
  %p_Result_34 = call i32 @_ssdm_op_BitConcatenate.i32.i15.i17(i15 -1, i17 %p_Result_33)
  %tmp_71 = call i32 @llvm.cttz.i32(i32 %p_Result_34, i1 true) nounwind
  %j = sub nsw i32 16, %tmp_71
  %tmp_145 = trunc i32 %tmp_71 to i8
  %p_Repl2_2_trunc = sub i8 -126, %tmp_145
  %tmp_72 = icmp eq i32 %tmp_71, 16
  %p_Result_35 = call i32 @_ssdm_op_BitConcatenate.i32.i1.i8.i23(i1 %isneg_13, i8 %p_Repl2_2_trunc, i23 0)
  %tmp_73 = icmp sgt i32 %j, 23
  %tmp_74 = add nsw i32 %j, -23
  %tmp_75 = select i1 %tmp_73, i32 %tmp_74, i32 0
  %tmp_76 = add nsw i32 %j, -1
  %p_Result_s = call i17 @llvm.part.select.i17(i17 %tmp_V_15, i32 %tmp_75, i32 %tmp_76) nounwind
  %man_V = sext i17 %p_Result_s to i23
  %tmp_77 = icmp slt i32 %j, 23
  %tmp_146 = trunc i32 %j to i23
  %tmp_79 = sub i23 23, %tmp_146
  %tmp_88_cast = select i1 %tmp_77, i23 %tmp_79, i23 0
  %man_V_18 = shl i23 %man_V, %tmp_88_cast
  %p_Result_36 = call i32 @_ssdm_op_BitConcatenate.i32.i1.i8.i23(i1 %isneg_13, i8 %p_Repl2_2_trunc, i23 %man_V_18)
  %res_V = select i1 %tmp_72, i32 %p_Result_35, i32 %p_Result_36
  %tmp_81 = icmp eq i16 %p_Val2_63, 0
  %tmp_V_2 = sext i16 %p_Val2_63 to i17
  %tmp_V_3 = sub i17 0, %tmp_V_2
  %tmp_V_16 = select i1 %isneg_14, i17 %tmp_V_3, i17 %tmp_V_2
  %p_Result_37 = call i17 @llvm.part.select.i17(i17 %tmp_V_16, i32 16, i32 0) nounwind
  %p_Result_38 = call i32 @_ssdm_op_BitConcatenate.i32.i15.i17(i15 -1, i17 %p_Result_37)
  %tmp_82 = call i32 @llvm.cttz.i32(i32 %p_Result_38, i1 true) nounwind
  %j_1 = sub nsw i32 16, %tmp_82
  %tmp_147 = trunc i32 %tmp_82 to i8
  %p_Repl2_6_trunc = sub i8 -126, %tmp_147
  %tmp_83 = icmp eq i32 %tmp_82, 16
  %p_Result_39 = call i32 @_ssdm_op_BitConcatenate.i32.i1.i8.i23(i1 %isneg_14, i8 %p_Repl2_6_trunc, i23 0)
  %tmp_84 = icmp sgt i32 %j_1, 23
  %tmp_85 = add nsw i32 %j_1, -23
  %tmp_86 = select i1 %tmp_84, i32 %tmp_85, i32 0
  %tmp_87 = add nsw i32 %j_1, -1
  %p_Result_8 = call i17 @llvm.part.select.i17(i17 %tmp_V_16, i32 %tmp_86, i32 %tmp_87) nounwind
  %man_V_11 = sext i17 %p_Result_8 to i23
  %tmp_88 = icmp slt i32 %j_1, 23
  %tmp_148 = trunc i32 %j_1 to i23
  %tmp_89 = sub i23 23, %tmp_148
  %tmp_101_cast = select i1 %tmp_88, i23 %tmp_89, i23 0
  %man_V_19 = shl i23 %man_V_11, %tmp_101_cast
  %p_Result_40 = call i32 @_ssdm_op_BitConcatenate.i32.i1.i8.i23(i1 %isneg_14, i8 %p_Repl2_6_trunc, i23 %man_V_19)
  %res_V_5 = select i1 %tmp_83, i32 %p_Result_39, i32 %p_Result_40
  %tmp_91 = icmp eq i12 %p_Val2_65, 0
  %isneg_18 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %cos_out_V_6, i32 15)
  %tmp_V_4 = sext i12 %p_Val2_65 to i13
  %tmp_V_5 = sub i13 0, %tmp_V_4
  %tmp_V_17 = select i1 %isneg_18, i13 %tmp_V_5, i13 %tmp_V_4
  %p_Result_41 = call i13 @llvm.part.select.i13(i13 %tmp_V_17, i32 12, i32 0) nounwind
  %p_Result_42 = call i32 @_ssdm_op_BitConcatenate.i32.i19.i13(i19 -1, i13 %p_Result_41)
  %tmp_92 = call i32 @llvm.cttz.i32(i32 %p_Result_42, i1 true) nounwind
  %j_2 = sub nsw i32 12, %tmp_92
  %tmp_150 = trunc i32 %tmp_92 to i8
  %p_Repl2_10_trunc = sub i8 -128, %tmp_150
  %tmp_93 = icmp eq i32 %tmp_92, 12
  %p_Result_43 = call i32 @_ssdm_op_BitConcatenate.i32.i1.i8.i23(i1 %isneg_18, i8 %p_Repl2_10_trunc, i23 0)
  %tmp_94 = icmp sgt i32 %j_2, 23
  %tmp_95 = add nsw i32 %j_2, -23
  %tmp_96 = select i1 %tmp_94, i32 %tmp_95, i32 0
  %tmp_97 = add nsw i32 %j_2, -1
  %p_Result_20 = call i13 @llvm.part.select.i13(i13 %tmp_V_17, i32 %tmp_96, i32 %tmp_97) nounwind
  %man_V_13 = sext i13 %p_Result_20 to i23
  %tmp_98 = icmp slt i32 %j_2, 23
  %tmp_151 = trunc i32 %j_2 to i23
  %tmp_99 = sub i23 23, %tmp_151
  %tmp_114_cast = select i1 %tmp_98, i23 %tmp_99, i23 0
  %man_V_20 = shl i23 %man_V_13, %tmp_114_cast
  %p_Result_44 = call i32 @_ssdm_op_BitConcatenate.i32.i1.i8.i23(i1 %isneg_18, i8 %p_Repl2_10_trunc, i23 %man_V_20)
  %res_V_8 = select i1 %tmp_93, i32 %p_Result_43, i32 %p_Result_44
  %tmp_101 = icmp eq i12 %p_Val2_67, 0
  %isneg_19 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %sin_out_V_5, i32 15)
  %tmp_V_6 = sext i12 %p_Val2_67 to i13
  %tmp_V_7 = sub i13 0, %tmp_V_6
  %tmp_V_18 = select i1 %isneg_19, i13 %tmp_V_7, i13 %tmp_V_6
  %p_Result_45 = call i13 @llvm.part.select.i13(i13 %tmp_V_18, i32 12, i32 0) nounwind
  %p_Result_46 = call i32 @_ssdm_op_BitConcatenate.i32.i19.i13(i19 -1, i13 %p_Result_45)
  %tmp_102 = call i32 @llvm.cttz.i32(i32 %p_Result_46, i1 true) nounwind
  %j_3 = sub nsw i32 12, %tmp_102
  %tmp_153 = trunc i32 %tmp_102 to i8
  %p_Repl2_14_trunc = sub i8 -128, %tmp_153
  %tmp_103 = icmp eq i32 %tmp_102, 12
  %p_Result_47 = call i32 @_ssdm_op_BitConcatenate.i32.i1.i8.i23(i1 %isneg_19, i8 %p_Repl2_14_trunc, i23 0)
  %tmp_104 = icmp sgt i32 %j_3, 23
  %tmp_105 = add nsw i32 %j_3, -23
  %tmp_106 = select i1 %tmp_104, i32 %tmp_105, i32 0
  %tmp_107 = add nsw i32 %j_3, -1
  %p_Result_25 = call i13 @llvm.part.select.i13(i13 %tmp_V_18, i32 %tmp_106, i32 %tmp_107) nounwind
  %man_V_15 = sext i13 %p_Result_25 to i23
  %tmp_108 = icmp slt i32 %j_3, 23
  %tmp_154 = trunc i32 %j_3 to i23
  %tmp_109 = sub i23 23, %tmp_154
  %tmp_127_cast = select i1 %tmp_108, i23 %tmp_109, i23 0
  %man_V_21 = shl i23 %man_V_15, %tmp_127_cast
  %p_Result_48 = call i32 @_ssdm_op_BitConcatenate.i32.i1.i8.i23(i1 %isneg_19, i8 %p_Repl2_14_trunc, i23 %man_V_21)
  %res_V_11 = select i1 %tmp_103, i32 %p_Result_47, i32 %p_Result_48
  %p_Repl2_11 = select i1 %tmp_70, i32 0, i32 %res_V
  %p_Repl2_10 = select i1 %tmp_81, i32 0, i32 %res_V_5
  %p_Repl2_9 = select i1 %tmp_91, i32 0, i32 %res_V_8
  %p_Repl2_8 = select i1 %tmp_101, i32 0, i32 %res_V_11
  %p_Result_49 = call i128 @_ssdm_op_BitConcatenate.i128.i32.i32.i32.i32(i32 %p_Repl2_11, i32 %p_Repl2_10, i32 %p_Repl2_9, i32 %p_Repl2_8)
  call void @_ssdm_op_Write.axis.volatile.i128P(i128* %s_out_V_V, i128 %p_Result_49)
  store i12 %p_Val2_67, i12* %p_Val2_1, align 2
  store i12 %p_Val2_65, i12* %p_Val2_s, align 2
  br label %1

; <label>:2                                       ; preds = %1
  ret i1 true
}

define weak i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1, i1) nounwind readnone {
entry:
  %empty = zext i1 %0 to i2
  %empty_85 = zext i1 %1 to i2
  %empty_86 = trunc i2 %empty to i1
  %empty_87 = call i1 @_ssdm_op_BitSelect.i1.i2.i32(i2 %empty_85, i32 1)
  %empty_88 = or i1 %empty_86, %empty_87
  %empty_89 = call i2 @_ssdm_op_PartSet.i2.i2.i1.i32.i32(i2 %empty_85, i1 %empty_88, i32 1, i32 1)
  ret i2 %empty_89
}

define weak i5 @_ssdm_op_PartSet.i5.i5.i2.i32.i32(i5, i2, i32, i32) nounwind readnone {
entry:
  %empty = call i5 @llvm.part.set.i5.i2(i5 %0, i2 %1, i32 %2, i32 %3)
  ret i5 %empty
}

define weak i2 @_ssdm_op_PartSelect.i2.i21.i32.i32(i21, i32, i32) nounwind readnone {
entry:
  %empty = call i21 @llvm.part.select.i21(i21 %0, i32 %1, i32 %2)
  %empty_90 = trunc i21 %empty to i2
  ret i2 %empty_90
}

define weak i2 @_ssdm_op_PartSelect.i2.i29.i32.i32(i29, i32, i32) nounwind readnone {
entry:
  %empty = call i29 @llvm.part.select.i29(i29 %0, i32 %1, i32 %2)
  %empty_91 = trunc i29 %empty to i2
  ret i2 %empty_91
}

define weak i10 @_ssdm_op_PartSelect.i10.i29.i32.i32(i29, i32, i32) nounwind readnone {
entry:
  %empty = call i29 @llvm.part.select.i29(i29 %0, i32 %1, i32 %2)
  %empty_92 = trunc i29 %empty to i10
  ret i10 %empty_92
}

define weak i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_93 = trunc i64 %empty to i11
  ret i11 %empty_93
}

define weak i32 @_ssdm_op_PartSelect.i32.i128.i32.i32(i128, i32, i32) nounwind readnone {
entry:
  %empty = call i128 @llvm.part.select.i128(i128 %0, i32 %1, i32 %2)
  %empty_94 = trunc i128 %empty to i32
  ret i32 %empty_94
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i1.i8.i23(i1, i8, i23) nounwind readnone {
entry:
  %empty = zext i8 %1 to i31
  %empty_95 = zext i23 %2 to i31
  %empty_96 = trunc i31 %empty to i8
  %empty_97 = call i8 @_ssdm_op_PartSelect.i8.i31.i32.i32(i31 %empty_95, i32 23, i32 30)
  %empty_98 = or i8 %empty_96, %empty_97
  %empty_99 = call i31 @_ssdm_op_PartSet.i31.i31.i8.i32.i32(i31 %empty_95, i8 %empty_98, i32 23, i32 30)
  %empty_100 = zext i1 %0 to i32
  %empty_101 = zext i31 %empty_99 to i32
  %empty_102 = trunc i32 %empty_100 to i1
  %empty_103 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %empty_101, i32 31)
  %empty_104 = or i1 %empty_102, %empty_103
  %empty_105 = call i32 @_ssdm_op_PartSet.i32.i32.i1.i32.i32(i32 %empty_101, i1 %empty_104, i32 31, i32 31)
  ret i32 %empty_105
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i15.i17(i15, i17) nounwind readnone {
entry:
  %empty = zext i15 %0 to i32
  %empty_106 = zext i17 %1 to i32
  %empty_107 = trunc i32 %empty to i15
  %empty_108 = call i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32 %empty_106, i32 17, i32 31)
  %empty_109 = or i15 %empty_107, %empty_108
  %empty_110 = call i32 @_ssdm_op_PartSet.i32.i32.i15.i32.i32(i32 %empty_106, i15 %empty_109, i32 17, i32 31)
  ret i32 %empty_110
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i19.i13(i19, i13) nounwind readnone {
entry:
  %empty = zext i19 %0 to i32
  %empty_111 = zext i13 %1 to i32
  %empty_112 = trunc i32 %empty to i19
  %empty_113 = call i19 @_ssdm_op_PartSelect.i19.i32.i32.i32(i32 %empty_111, i32 13, i32 31)
  %empty_114 = or i19 %empty_112, %empty_113
  %empty_115 = call i32 @_ssdm_op_PartSet.i32.i32.i19.i32.i32(i32 %empty_111, i19 %empty_114, i32 13, i32 31)
  ret i32 %empty_115
}

define weak i128 @_ssdm_op_BitConcatenate.i128.i32.i32.i32.i32(i32, i32, i32, i32) nounwind readnone {
entry:
  %empty = zext i32 %2 to i64
  %empty_116 = zext i32 %3 to i64
  %empty_117 = trunc i64 %empty to i32
  %empty_118 = call i32 @_ssdm_op_PartSelect.i32.i64.i32.i32(i64 %empty_116, i32 32, i32 63)
  %empty_119 = or i32 %empty_117, %empty_118
  %empty_120 = call i64 @_ssdm_op_PartSet.i64.i64.i32.i32.i32(i64 %empty_116, i32 %empty_119, i32 32, i32 63)
  %empty_121 = zext i32 %1 to i96
  %empty_122 = zext i64 %empty_120 to i96
  %empty_123 = trunc i96 %empty_121 to i32
  %empty_124 = call i32 @_ssdm_op_PartSelect.i32.i96.i32.i32(i96 %empty_122, i32 64, i32 95)
  %empty_125 = or i32 %empty_123, %empty_124
  %empty_126 = call i96 @_ssdm_op_PartSet.i96.i96.i32.i32.i32(i96 %empty_122, i32 %empty_125, i32 64, i32 95)
  %empty_127 = zext i32 %0 to i128
  %empty_128 = zext i96 %empty_126 to i128
  %empty_129 = trunc i128 %empty_127 to i32
  %empty_130 = call i32 @_ssdm_op_PartSelect.i32.i128.i32.i32(i128 %empty_128, i32 96, i32 127)
  %empty_131 = or i32 %empty_129, %empty_130
  %empty_132 = call i128 @_ssdm_op_PartSet.i128.i128.i32.i32.i32(i128 %empty_128, i32 %empty_131, i32 96, i32 127)
  ret i128 %empty_132
}

define weak i53 @_ssdm_op_BitConcatenate.i53.i1.i52(i1, i52) nounwind readnone {
entry:
  %empty = zext i1 %0 to i53
  %empty_133 = zext i52 %1 to i53
  %empty_134 = trunc i53 %empty to i1
  %empty_135 = call i1 @_ssdm_op_BitSelect.i1.i53.i32(i53 %empty_133, i32 52)
  %empty_136 = or i1 %empty_134, %empty_135
  %empty_137 = call i53 @_ssdm_op_PartSet.i53.i53.i1.i32.i32(i53 %empty_133, i1 %empty_136, i32 52, i32 52)
  ret i53 %empty_137
}

define weak i19 @_ssdm_op_PartSelect.i19.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_138 = trunc i32 %empty to i19
  ret i19 %empty_138
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i19.i1.i12(i19, i1, i12) nounwind readnone {
entry:
  %empty = zext i1 %1 to i13
  %empty_139 = zext i12 %2 to i13
  %empty_140 = trunc i13 %empty to i1
  %empty_141 = call i1 @_ssdm_op_BitSelect.i1.i13.i32(i13 %empty_139, i32 12)
  %empty_142 = or i1 %empty_140, %empty_141
  %empty_143 = call i13 @_ssdm_op_PartSet.i13.i13.i1.i32.i32(i13 %empty_139, i1 %empty_142, i32 12, i32 12)
  %empty_144 = zext i19 %0 to i32
  %empty_145 = zext i13 %empty_143 to i32
  %empty_146 = trunc i32 %empty_144 to i19
  %empty_147 = call i19 @_ssdm_op_PartSelect.i19.i32.i32.i32(i32 %empty_145, i32 13, i32 31)
  %empty_148 = or i19 %empty_146, %empty_147
  %empty_149 = call i32 @_ssdm_op_PartSet.i32.i32.i19.i32.i32(i32 %empty_145, i19 %empty_148, i32 13, i32 31)
  ret i32 %empty_149
}

define weak i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_150 = trunc i32 %empty to i31
  ret i31 %empty_150
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31, i1) nounwind readnone {
entry:
  %empty = zext i31 %0 to i32
  %empty_151 = zext i1 %1 to i32
  %empty_152 = trunc i32 %empty to i31
  %empty_153 = call i31 @_ssdm_op_PartSelect.i31.i32.i32.i32(i32 %empty_151, i32 1, i32 31)
  %empty_154 = or i31 %empty_152, %empty_153
  %empty_155 = call i32 @_ssdm_op_PartSet.i32.i32.i31.i32.i32(i32 %empty_151, i31 %empty_154, i32 1, i32 31)
  ret i32 %empty_155
}

define weak i29 @_ssdm_op_PartSelect.i29.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_156 = trunc i32 %empty to i29
  ret i29 %empty_156
}

define weak i32 @_ssdm_op_BitConcatenate.i32.i29.i1.i2(i29, i1, i2) nounwind readnone {
entry:
  %empty = zext i1 %1 to i3
  %empty_157 = zext i2 %2 to i3
  %empty_158 = trunc i3 %empty to i1
  %empty_159 = call i1 @_ssdm_op_BitSelect.i1.i3.i32(i3 %empty_157, i32 2)
  %empty_160 = or i1 %empty_158, %empty_159
  %empty_161 = call i3 @_ssdm_op_PartSet.i3.i3.i1.i32.i32(i3 %empty_157, i1 %empty_160, i32 2, i32 2)
  %empty_162 = zext i29 %0 to i32
  %empty_163 = zext i3 %empty_161 to i32
  %empty_164 = trunc i32 %empty_162 to i29
  %empty_165 = call i29 @_ssdm_op_PartSelect.i29.i32.i32.i32(i32 %empty_163, i32 3, i32 31)
  %empty_166 = or i29 %empty_164, %empty_165
  %empty_167 = call i32 @_ssdm_op_PartSet.i32.i32.i29.i32.i32(i32 %empty_163, i29 %empty_166, i32 3, i32 31)
  ret i32 %empty_167
}

define weak i12 @_ssdm_op_PartSelect.i12.i16.i32.i32(i16, i32, i32) nounwind readnone {
entry:
  %empty = call i16 @llvm.part.select.i16(i16 %0, i32 %1, i32 %2)
  %empty_168 = trunc i16 %empty to i12
  ret i12 %empty_168
}

define weak i27 @_ssdm_op_BitConcatenate.i27.i16.i11(i16, i11) nounwind readnone {
entry:
  %empty = zext i16 %0 to i27
  %empty_169 = zext i11 %1 to i27
  %empty_170 = trunc i27 %empty to i16
  %empty_171 = call i16 @_ssdm_op_PartSelect.i16.i27.i32.i32(i27 %empty_169, i32 11, i32 26)
  %empty_172 = or i16 %empty_170, %empty_171
  %empty_173 = call i27 @_ssdm_op_PartSet.i27.i27.i16.i32.i32(i27 %empty_169, i16 %empty_172, i32 11, i32 26)
  ret i27 %empty_173
}

define weak i28 @_ssdm_op_BitConcatenate.i28.i14.i14(i14, i14) nounwind readnone {
entry:
  %empty = zext i14 %0 to i28
  %empty_174 = zext i14 %1 to i28
  %empty_175 = trunc i28 %empty to i14
  %empty_176 = call i14 @_ssdm_op_PartSelect.i14.i28.i32.i32(i28 %empty_174, i32 14, i32 27)
  %empty_177 = or i14 %empty_175, %empty_176
  %empty_178 = call i28 @_ssdm_op_PartSet.i28.i28.i14.i32.i32(i28 %empty_174, i14 %empty_177, i32 14, i32 27)
  ret i28 %empty_178
}

define weak i14 @_ssdm_op_PartSelect.i14.i21.i32.i32(i21, i32, i32) nounwind readnone {
entry:
  %empty = call i21 @llvm.part.select.i21(i21 %0, i32 %1, i32 %2)
  %empty_179 = trunc i21 %empty to i14
  ret i14 %empty_179
}

define weak i19 @_ssdm_op_BitConcatenate.i19.i14.i5(i14, i5) nounwind readnone {
entry:
  %empty = zext i14 %0 to i19
  %empty_180 = zext i5 %1 to i19
  %empty_181 = trunc i19 %empty to i14
  %empty_182 = call i14 @_ssdm_op_PartSelect.i14.i19.i32.i32(i19 %empty_180, i32 5, i32 18)
  %empty_183 = or i14 %empty_181, %empty_182
  %empty_184 = call i19 @_ssdm_op_PartSet.i19.i19.i14.i32.i32(i19 %empty_180, i14 %empty_183, i32 5, i32 18)
  ret i19 %empty_184
}

define weak i5 @_ssdm_op_PartSelect.i5.i29.i32.i32(i29, i32, i32) nounwind readnone {
entry:
  %empty = call i29 @llvm.part.select.i29(i29 %0, i32 %1, i32 %2)
  %empty_185 = trunc i29 %empty to i5
  ret i5 %empty_185
}

define weak i16 @_ssdm_op_PartSelect.i16.i28.i32.i32(i28, i32, i32) nounwind readnone {
entry:
  %empty = call i28 @llvm.part.select.i28(i28 %0, i32 %1, i32 %2)
  %empty_186 = trunc i28 %empty to i16
  ret i16 %empty_186
}

define weak i16 @_ssdm_op_PartSelect.i16.i29.i32.i32(i29, i32, i32) nounwind readnone {
entry:
  %empty = call i29 @llvm.part.select.i29(i29 %0, i32 %1, i32 %2)
  %empty_187 = trunc i29 %empty to i16
  ret i16 %empty_187
}

define weak i32 @_ssdm_op_Read.ap_vld.i32(i32) {
entry:
  ret i32 %0
}

define weak i8 @_ssdm_op_Read.ap_vld.i8(i8) {
entry:
  ret i8 %0
}

define weak i1 @_ssdm_op_Read.ap_vld.i1(i1) {
entry:
  ret i1 %0
}

define weak float @_ssdm_op_Read.ap_vld.float(float) {
entry:
  ret float %0
}

define weak void @_ssdm_op_Write.m_axi.volatile.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

define weak i1 @_ssdm_op_WriteReq.m_axi.i32P(i32*, i32) {
entry:
  ret i1 true
}

define weak i1 @_ssdm_op_WriteResp.m_axi.i32P(i32*) {
entry:
  ret i1 true
}

define weak i32 @_ssdm_op_Read.m_axi.volatile.i32P(i32*) {
entry:
  %empty = load i32* %0
  ret i32 %empty
}

define weak i1 @_ssdm_op_ReadReq.m_axi.i32P(i32*, i32) {
entry:
  ret i1 true
}

define weak i128 @_ssdm_op_Read.axis.volatile.i128P(i128*) {
entry:
  %empty = load i128* %0
  ret i128 %empty
}

define weak void @_ssdm_op_Write.axis.volatile.i128P(i128*, i128) {
entry:
  store i128 %1, i128* %0
  ret void
}

define weak i1 @_ssdm_op_BitSelect.i1.i8.i32(i8, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i8
  %empty_188 = shl i8 1, %empty
  %empty_189 = and i8 %0, %empty_188
  %empty_190 = icmp ne i8 %empty_189, 0
  ret i1 %empty_190
}

define weak i1 @_ssdm_op_BitSelect.i1.i9.i32(i9, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i9
  %empty_191 = shl i9 1, %empty
  %empty_192 = and i9 %0, %empty_191
  %empty_193 = icmp ne i9 %empty_192, 0
  ret i1 %empty_193
}

define weak i1 @_ssdm_op_BitSelect.i1.i64.i32(i64, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i64
  %empty_194 = shl i64 1, %empty
  %empty_195 = and i64 %0, %empty_194
  %empty_196 = icmp ne i64 %empty_195, 0
  ret i1 %empty_196
}

define weak i8 @_ssdm_op_PartSelect.i8.i12.i32.i32(i12, i32, i32) nounwind readnone {
entry:
  %empty = call i12 @llvm.part.select.i12(i12 %0, i32 %1, i32 %2)
  %empty_197 = trunc i12 %empty to i8
  ret i8 %empty_197
}

define weak i1 @_ssdm_op_BitSelect.i1.i28.i32(i28, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i28
  %empty_198 = shl i28 1, %empty
  %empty_199 = and i28 %0, %empty_198
  %empty_200 = icmp ne i28 %empty_199, 0
  ret i1 %empty_200
}

define weak i1 @_ssdm_op_BitSelect.i1.i12.i32(i12, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i12
  %empty_201 = shl i12 1, %empty
  %empty_202 = and i12 %0, %empty_201
  %empty_203 = icmp ne i12 %empty_202, 0
  ret i1 %empty_203
}

define weak i1 @_ssdm_op_BitSelect.i1.i29.i32(i29, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i29
  %empty_204 = shl i29 1, %empty
  %empty_205 = and i29 %0, %empty_204
  %empty_206 = icmp ne i29 %empty_205, 0
  ret i1 %empty_206
}

define weak i1 @_ssdm_op_BitSelect.i1.i5.i32(i5, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i5
  %empty_207 = shl i5 1, %empty
  %empty_208 = and i5 %0, %empty_207
  %empty_209 = icmp ne i5 %empty_208, 0
  ret i1 %empty_209
}

define weak i1 @_ssdm_op_BitSelect.i1.i21.i32(i21, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i21
  %empty_210 = shl i21 1, %empty
  %empty_211 = and i21 %0, %empty_210
  %empty_212 = icmp ne i21 %empty_211, 0
  ret i1 %empty_212
}

define weak i1 @_ssdm_op_BitSelect.i1.i16.i32(i16, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i16
  %empty_213 = shl i16 1, %empty
  %empty_214 = and i16 %0, %empty_213
  %empty_215 = icmp ne i16 %empty_214, 0
  ret i1 %empty_215
}

declare i5 @llvm.part.set.i5.i2(i5, i2, i32, i32) nounwind readnone

declare i21 @llvm.part.select.i21(i21, i32, i32) nounwind readnone

declare i29 @llvm.part.select.i29(i29, i32, i32) nounwind readnone

declare i64 @llvm.part.select.i64(i64, i32, i32) nounwind readnone

declare i128 @llvm.part.select.i128(i128, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare i16 @llvm.part.select.i16(i16, i32, i32) nounwind readnone

declare i28 @llvm.part.select.i28(i28, i32, i32) nounwind readnone

declare i12 @llvm.part.select.i12(i12, i32, i32) nounwind readnone

declare i63 @_ssdm_op_PartSelect.i63.i64.i32.i32(i64, i32, i32) nounwind readnone

declare i12 @_ssdm_op_PartSelect.i12.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i32 @_ssdm_op_BitConcatenate.i32.i28.i4(i28, i4) nounwind readnone

declare i2 @_ssdm_op_PartSelect.i2.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i23 @_ssdm_op_PartSelect.i23.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i28 @_ssdm_op_PartSelect.i28.i29.i32.i32(i29, i32, i32) nounwind readnone

declare i1 @_ssdm_op_PartSelect.i1.i54.i32.i32(i54, i32, i32) nounwind readnone

declare i28 @_ssdm_op_PartSelect.i28.i54.i32.i32(i54, i32, i32) nounwind readnone

declare i52 @_ssdm_op_PartSelect.i52.i64.i32.i32(i64, i32, i32) nounwind readnone

declare i16 @_ssdm_op_PartSelect.i16.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i16 @_ssdm_op_PartSelect.i16.i54.i32.i32(i54, i32, i32) nounwind readnone

declare i1 @_ssdm_op_PartSelect.i1.i2.i32.i32(i2, i32, i32) nounwind readnone

define weak i2 @_ssdm_op_PartSet.i2.i2.i1.i32.i32(i2, i1, i32, i32) nounwind readnone {
entry:
  %empty = call i2 @llvm.part.set.i2.i1(i2 %0, i1 %1, i32 %2, i32 %3)
  ret i2 %empty
}

define weak i1 @_ssdm_op_BitSelect.i1.i2.i32(i2, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i2
  %empty_216 = shl i2 1, %empty
  %empty_217 = and i2 %0, %empty_216
  %empty_218 = icmp ne i2 %empty_217, 0
  ret i1 %empty_218
}

define weak i8 @_ssdm_op_PartSelect.i8.i31.i32.i32(i31, i32, i32) nounwind readnone {
entry:
  %empty = call i31 @llvm.part.select.i31(i31 %0, i32 %1, i32 %2)
  %empty_219 = trunc i31 %empty to i8
  ret i8 %empty_219
}

define weak i31 @_ssdm_op_PartSet.i31.i31.i8.i32.i32(i31, i8, i32, i32) nounwind readnone {
entry:
  %empty = call i31 @llvm.part.set.i31.i8(i31 %0, i8 %1, i32 %2, i32 %3)
  ret i31 %empty
}

declare i1 @_ssdm_op_PartSelect.i1.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i32 @_ssdm_op_PartSet.i32.i32.i1.i32.i32(i32, i1, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.set.i32.i1(i32 %0, i1 %1, i32 %2, i32 %3)
  ret i32 %empty
}

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_220 = and i32 %0, %empty
  %empty_221 = icmp ne i32 %empty_220, 0
  ret i1 %empty_221
}

define weak i15 @_ssdm_op_PartSelect.i15.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_222 = trunc i32 %empty to i15
  ret i15 %empty_222
}

define weak i32 @_ssdm_op_PartSet.i32.i32.i15.i32.i32(i32, i15, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.set.i32.i15(i32 %0, i15 %1, i32 %2, i32 %3)
  ret i32 %empty
}

define weak i32 @_ssdm_op_PartSet.i32.i32.i19.i32.i32(i32, i19, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.set.i32.i19(i32 %0, i19 %1, i32 %2, i32 %3)
  ret i32 %empty
}

define weak i32 @_ssdm_op_PartSelect.i32.i64.i32.i32(i64, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.select.i64(i64 %0, i32 %1, i32 %2)
  %empty_223 = trunc i64 %empty to i32
  ret i32 %empty_223
}

define weak i64 @_ssdm_op_PartSet.i64.i64.i32.i32.i32(i64, i32, i32, i32) nounwind readnone {
entry:
  %empty = call i64 @llvm.part.set.i64.i32(i64 %0, i32 %1, i32 %2, i32 %3)
  ret i64 %empty
}

define weak i32 @_ssdm_op_PartSelect.i32.i96.i32.i32(i96, i32, i32) nounwind readnone {
entry:
  %empty = call i96 @llvm.part.select.i96(i96 %0, i32 %1, i32 %2)
  %empty_224 = trunc i96 %empty to i32
  ret i32 %empty_224
}

define weak i96 @_ssdm_op_PartSet.i96.i96.i32.i32.i32(i96, i32, i32, i32) nounwind readnone {
entry:
  %empty = call i96 @llvm.part.set.i96.i32(i96 %0, i32 %1, i32 %2, i32 %3)
  ret i96 %empty
}

define weak i128 @_ssdm_op_PartSet.i128.i128.i32.i32.i32(i128, i32, i32, i32) nounwind readnone {
entry:
  %empty = call i128 @llvm.part.set.i128.i32(i128 %0, i32 %1, i32 %2, i32 %3)
  ret i128 %empty
}

declare i1 @_ssdm_op_PartSelect.i1.i53.i32.i32(i53, i32, i32) nounwind readnone

define weak i53 @_ssdm_op_PartSet.i53.i53.i1.i32.i32(i53, i1, i32, i32) nounwind readnone {
entry:
  %empty = call i53 @llvm.part.set.i53.i1(i53 %0, i1 %1, i32 %2, i32 %3)
  ret i53 %empty
}

define weak i1 @_ssdm_op_BitSelect.i1.i53.i32(i53, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i53
  %empty_225 = shl i53 1, %empty
  %empty_226 = and i53 %0, %empty_225
  %empty_227 = icmp ne i53 %empty_226, 0
  ret i1 %empty_227
}

declare i1 @_ssdm_op_PartSelect.i1.i13.i32.i32(i13, i32, i32) nounwind readnone

define weak i13 @_ssdm_op_PartSet.i13.i13.i1.i32.i32(i13, i1, i32, i32) nounwind readnone {
entry:
  %empty = call i13 @llvm.part.set.i13.i1(i13 %0, i1 %1, i32 %2, i32 %3)
  ret i13 %empty
}

define weak i1 @_ssdm_op_BitSelect.i1.i13.i32(i13, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i13
  %empty_228 = shl i13 1, %empty
  %empty_229 = and i13 %0, %empty_228
  %empty_230 = icmp ne i13 %empty_229, 0
  ret i1 %empty_230
}

define weak i32 @_ssdm_op_PartSet.i32.i32.i31.i32.i32(i32, i31, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.set.i32.i31(i32 %0, i31 %1, i32 %2, i32 %3)
  ret i32 %empty
}

declare i1 @_ssdm_op_PartSelect.i1.i3.i32.i32(i3, i32, i32) nounwind readnone

define weak i3 @_ssdm_op_PartSet.i3.i3.i1.i32.i32(i3, i1, i32, i32) nounwind readnone {
entry:
  %empty = call i3 @llvm.part.set.i3.i1(i3 %0, i1 %1, i32 %2, i32 %3)
  ret i3 %empty
}

define weak i1 @_ssdm_op_BitSelect.i1.i3.i32(i3, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i3
  %empty_231 = shl i3 1, %empty
  %empty_232 = and i3 %0, %empty_231
  %empty_233 = icmp ne i3 %empty_232, 0
  ret i1 %empty_233
}

define weak i32 @_ssdm_op_PartSet.i32.i32.i29.i32.i32(i32, i29, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.set.i32.i29(i32 %0, i29 %1, i32 %2, i32 %3)
  ret i32 %empty
}

define weak i16 @_ssdm_op_PartSelect.i16.i27.i32.i32(i27, i32, i32) nounwind readnone {
entry:
  %empty = call i27 @llvm.part.select.i27(i27 %0, i32 %1, i32 %2)
  %empty_234 = trunc i27 %empty to i16
  ret i16 %empty_234
}

define weak i27 @_ssdm_op_PartSet.i27.i27.i16.i32.i32(i27, i16, i32, i32) nounwind readnone {
entry:
  %empty = call i27 @llvm.part.set.i27.i16(i27 %0, i16 %1, i32 %2, i32 %3)
  ret i27 %empty
}

define weak i14 @_ssdm_op_PartSelect.i14.i28.i32.i32(i28, i32, i32) nounwind readnone {
entry:
  %empty = call i28 @llvm.part.select.i28(i28 %0, i32 %1, i32 %2)
  %empty_235 = trunc i28 %empty to i14
  ret i14 %empty_235
}

define weak i28 @_ssdm_op_PartSet.i28.i28.i14.i32.i32(i28, i14, i32, i32) nounwind readnone {
entry:
  %empty = call i28 @llvm.part.set.i28.i14(i28 %0, i14 %1, i32 %2, i32 %3)
  ret i28 %empty
}

define weak i14 @_ssdm_op_PartSelect.i14.i19.i32.i32(i19, i32, i32) nounwind readnone {
entry:
  %empty = call i19 @llvm.part.select.i19(i19 %0, i32 %1, i32 %2)
  %empty_236 = trunc i19 %empty to i14
  ret i14 %empty_236
}

define weak i19 @_ssdm_op_PartSet.i19.i19.i14.i32.i32(i19, i14, i32, i32) nounwind readnone {
entry:
  %empty = call i19 @llvm.part.set.i19.i14(i19 %0, i14 %1, i32 %2, i32 %3)
  ret i19 %empty
}

declare i2 @llvm.part.set.i2.i1(i2, i1, i32, i32) nounwind readnone

declare i31 @llvm.part.select.i31(i31, i32, i32) nounwind readnone

declare i31 @llvm.part.set.i31.i8(i31, i8, i32, i32) nounwind readnone

declare i32 @llvm.part.set.i32.i1(i32, i1, i32, i32) nounwind readnone

declare i32 @llvm.part.set.i32.i15(i32, i15, i32, i32) nounwind readnone

declare i32 @llvm.part.set.i32.i19(i32, i19, i32, i32) nounwind readnone

declare i64 @llvm.part.set.i64.i32(i64, i32, i32, i32) nounwind readnone

declare i96 @llvm.part.select.i96(i96, i32, i32) nounwind readnone

declare i96 @llvm.part.set.i96.i32(i96, i32, i32, i32) nounwind readnone

declare i128 @llvm.part.set.i128.i32(i128, i32, i32, i32) nounwind readnone

declare i53 @llvm.part.set.i53.i1(i53, i1, i32, i32) nounwind readnone

declare i13 @llvm.part.set.i13.i1(i13, i1, i32, i32) nounwind readnone

declare i32 @llvm.part.set.i32.i31(i32, i31, i32, i32) nounwind readnone

declare i3 @llvm.part.set.i3.i1(i3, i1, i32, i32) nounwind readnone

declare i32 @llvm.part.set.i32.i29(i32, i29, i32, i32) nounwind readnone

declare i27 @llvm.part.select.i27(i27, i32, i32) nounwind readnone

declare i27 @llvm.part.set.i27.i16(i27, i16, i32, i32) nounwind readnone

declare i28 @llvm.part.set.i28.i14(i28, i14, i32, i32) nounwind readnone

declare i19 @llvm.part.select.i19(i19, i32, i32) nounwind readnone

declare i19 @llvm.part.set.i19.i14(i19, i14, i32, i32) nounwind readnone

!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [2 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !""}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 1, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"sourceAddress", metadata !11, metadata !"unsigned int"}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"destinationAddress", metadata !11, metadata !"unsigned int"}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 31, metadata !19}
!19 = metadata !{metadata !20}
!20 = metadata !{metadata !"iterations", metadata !11, metadata !"int"}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 0, i32 31, metadata !23}
!23 = metadata !{metadata !24}
!24 = metadata !{metadata !"control_in.qam", metadata !11, metadata !"float"}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 7, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"control_in.lf_p", metadata !11, metadata !"char"}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 7, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"control_in.lf_i", metadata !11, metadata !"char"}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 7, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"control_in.lf_out_gain", metadata !11, metadata !"char"}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 0, metadata !39}
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !"control_in.reg_clr", metadata !11, metadata !"bool"}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 0, i32 31, metadata !43}
!43 = metadata !{metadata !44}
!44 = metadata !{metadata !"control_in.reg_init", metadata !11, metadata !"float"}
!45 = metadata !{metadata !46}
!46 = metadata !{i32 0, i32 31, metadata !47}
!47 = metadata !{metadata !48}
!48 = metadata !{metadata !"m_mm2s_ctl", metadata !49, metadata !"unsigned int"}
!49 = metadata !{metadata !50}
!50 = metadata !{i32 0, i32 499, i32 1}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 0, i32 31, metadata !53}
!53 = metadata !{metadata !54}
!54 = metadata !{metadata !"m_s2mm_ctl", metadata !49, metadata !"unsigned int"}
!55 = metadata !{metadata !56}
!56 = metadata !{i32 0, i32 127, metadata !57}
!57 = metadata !{metadata !58}
!58 = metadata !{metadata !"s_in.V.V", metadata !59, metadata !"uint128"}
!59 = metadata !{metadata !60}
!60 = metadata !{i32 0, i32 0, i32 1}
!61 = metadata !{metadata !62}
!62 = metadata !{i32 0, i32 127, metadata !63}
!63 = metadata !{metadata !64}
!64 = metadata !{metadata !"s_out.V.V", metadata !59, metadata !"uint128"}
!65 = metadata !{metadata !66}
!66 = metadata !{i32 0, i32 0, metadata !67}
!67 = metadata !{metadata !68}
!68 = metadata !{metadata !"return", metadata !69, metadata !"bool"}
!69 = metadata !{metadata !70}
!70 = metadata !{i32 0, i32 1, i32 0}
