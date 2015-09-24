; ModuleID = 'C:/Users/Ali/Documents/Research/HLS_IP_PY/simple_fft/simple_fft/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str1 = private unnamed_addr constant [11 x i8] c"AXI4Stream\00", align 1
@p_str2 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1
@p_str4 = private unnamed_addr constant [11 x i8] c"Vivado_FFT\00", align 1
@p_str5 = private unnamed_addr constant [16 x i8] c"parameterizable\00", align 1
@p_str6 = private unnamed_addr constant [9 x i8] c"channels\00", align 1
@p_str7 = private unnamed_addr constant [17 x i8] c"transform_length\00", align 1
@p_str8 = private unnamed_addr constant [23 x i8] c"implementation_options\00", align 1
@p_str9 = private unnamed_addr constant [39 x i8] c"run_time_configurable_transform_length\00", align 1
@p_str10 = private unnamed_addr constant [12 x i8] c"data_format\00", align 1
@p_str11 = private unnamed_addr constant [12 x i8] c"input_width\00", align 1
@p_str12 = private unnamed_addr constant [13 x i8] c"output_width\00", align 1
@p_str13 = private unnamed_addr constant [19 x i8] c"phase_factor_width\00", align 1
@p_str14 = private unnamed_addr constant [16 x i8] c"scaling_options\00", align 1
@p_str15 = private unnamed_addr constant [15 x i8] c"rounding_modes\00", align 1
@p_str16 = private unnamed_addr constant [7 x i8] c"aclken\00", align 1
@p_str17 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@p_str18 = private unnamed_addr constant [8 x i8] c"aresetn\00", align 1
@p_str19 = private unnamed_addr constant [6 x i8] c"ovflo\00", align 1
@p_str20 = private unnamed_addr constant [9 x i8] c"xk_index\00", align 1
@p_str21 = private unnamed_addr constant [16 x i8] c"throttle_scheme\00", align 1
@p_str22 = private unnamed_addr constant [12 x i8] c"nonrealtime\00", align 1
@p_str23 = private unnamed_addr constant [16 x i8] c"output_ordering\00", align 1
@p_str24 = private unnamed_addr constant [24 x i8] c"cyclic_prefix_insertion\00", align 1
@p_str25 = private unnamed_addr constant [20 x i8] c"memory_options_data\00", align 1
@p_str26 = private unnamed_addr constant [29 x i8] c"memory_options_phase_factors\00", align 1
@p_str27 = private unnamed_addr constant [23 x i8] c"memory_options_reorder\00", align 1
@p_str28 = private unnamed_addr constant [60 x i8] c"number_of_stages_using_block_ram_for_data_and_phase_factors\00", align 1
@p_str29 = private unnamed_addr constant [22 x i8] c"memory_options_hybrid\00", align 1
@p_str30 = private unnamed_addr constant [18 x i8] c"complex_mult_type\00", align 1
@p_str31 = private unnamed_addr constant [15 x i8] c"butterfly_type\00", align 1
@p_str32 = private unnamed_addr constant [12 x i8] c"fixed_point\00", align 1
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@str = internal constant [11 x i8] c"simple_fft\00"

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak void @_ssdm_op_SpecFifo(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecDataflowPipeline(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecKeepValue(...) nounwind {
entry:
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

declare void @_GLOBAL__I_a() nounwind

define weak void @_ssdm_op_SpecIPCore(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecIFCore(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i1 @_ssdm_op_PartSelect.i1.i16.i32.i32(i16, i32, i32) nounwind readnone {
entry:
  %empty = call i16 @llvm.part.select.i16(i16 %0, i32 %1, i32 %2)
  %empty_12 = trunc i16 %empty to i1
  ret i1 %empty_12
}

define weak i10 @_ssdm_op_BitConcatenate.i10.i9.i1(i9, i1) nounwind readnone {
entry:
  %empty = zext i9 %0 to i10
  %empty_13 = zext i1 %1 to i10
  %empty_14 = trunc i10 %empty to i9
  %empty_15 = call i9 @_ssdm_op_PartSelect.i9.i10.i32.i32(i10 %empty_13, i32 1, i32 9)
  %empty_16 = or i9 %empty_14, %empty_15
  %empty_17 = call i10 @_ssdm_op_PartSet.i10.i10.i9.i32.i32(i10 %empty_13, i9 %empty_16, i32 1, i32 9)
  ret i10 %empty_17
}

define weak i9 @_ssdm_op_PartSelect.i9.i16.i32.i32(i16, i32, i32) nounwind readnone {
entry:
  %empty = call i16 @llvm.part.select.i16(i16 %0, i32 %1, i32 %2)
  %empty_18 = trunc i16 %empty to i9
  ret i9 %empty_18
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define void @simple_fft(i32* %in_r, i32* %out_r) {
  call void (...)* @_ssdm_op_SpecDataflowPipeline(i32 -1, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %out_r), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %in_r), !map !16
  call void (...)* @_ssdm_op_SpecTopModule([11 x i8]* @str) nounwind
  %fft_config_data_V = alloca i16, align 2
  %fft_status_data_V = alloca i8, align 1
  call void (...)* @_ssdm_op_SpecIFCore(i32* %out_r, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecFifo(i32* %out_r, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i32* %in_r, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecFifo(i32* %in_r, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void @"fft<config1>"(i32* %in_r, i32* %out_r, i8* %fft_status_data_V, i16* %fft_config_data_V)
  ret void
}

define void @"fft<config1>"(i32* %xn, i32* %xk, i8* %status_data_V, i16* %config_ch_data_V) {
_ZN3hls6ip_fft8config_tI7config1E6getSchEj.exit.i:
  call void (...)* @_ssdm_op_SpecIFCore(i32* %xk, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIFCore(i32* %xn, [1 x i8]* @p_str, [11 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecIPCore(i32 0, [1 x i8]* @p_str, [11 x i8]* @p_str4, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [16 x i8]* @p_str5)
  call void (...)* @_ssdm_op_SpecFifo(i16* %config_ch_data_V, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecFifo(i8* %status_data_V, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecFifo(i32* %xn, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecFifo(i32* %xk, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecKeepValue([9 x i8]* @p_str6, i32 1, [17 x i8]* @p_str7, i32 1024, [23 x i8]* @p_str8, i32 2, [39 x i8]* @p_str9, i32 0, [12 x i8]* @p_str10, [12 x i8]* @p_str32, [12 x i8]* @p_str11, i32 16, [13 x i8]* @p_str12, i32 16, [19 x i8]* @p_str13, i32 16, [16 x i8]* @p_str14, i32 0, [15 x i8]* @p_str15, i32 0, [7 x i8]* @p_str16, [5 x i8]* @p_str17, [8 x i8]* @p_str18, [5 x i8]* @p_str17, [6 x i8]* @p_str19, i32 1, [9 x i8]* @p_str20, i32 0, [16 x i8]* @p_str21, [12 x i8]* @p_str22, [16 x i8]* @p_str23, i32 1, [24 x i8]* @p_str24, i32 0, [20 x i8]* @p_str25, i32 0, [29 x i8]* @p_str26, i32 0, [23 x i8]* @p_str27, i32 0, [60 x i8]* @p_str28, i32 1, [22 x i8]* @p_str29, i32 0, [18 x i8]* @p_str30, i32 1, [15 x i8]* @p_str31, i32 0) nounwind
  %p_Val2_s = call i16 @_ssdm_op_Read.ap_fifo.i16P(i16* %config_ch_data_V)
  %p_Result_1 = call i1 @_ssdm_op_PartSelect.i1.i16.i32.i32(i16 %p_Val2_s, i32 0, i32 0)
  %tmp = call i1 @_ssdm_op_PartSelect.i1.i16.i32.i32(i16 %p_Val2_s, i32 1, i32 1)
  %tmp_3 = or i1 %tmp, %p_Result_1
  %tmp_4 = call i9 @_ssdm_op_PartSelect.i9.i16.i32.i32(i16 %p_Val2_s, i32 2, i32 10)
  %tmp_5 = call i10 @_ssdm_op_BitConcatenate.i10.i9.i1(i9 %tmp_4, i1 %tmp_3)
  %tmp_1 = icmp eq i10 %tmp_5, 0
  br i1 %tmp_1, label %_ZN3hls8fft_coreI7config1Lc16ELc16E8ap_fixedILi16ELi1EL9ap_q_mode5EL9ap_o_mode3ELi0EES5_Li1024ELc1ELNS_6ip_fft4typeE0EEEvPSt7complexIT2_EPS8_IT3_EPNS6_8status_tIT_EEPNS6_8config_tISG_EE.exit, label %.preheader

.preheader:                                       ; preds = %_ZN3hls6ip_fft8config_tI7config1E6getSchEj.exit.i, %0
  %i_i = phi i32 [ %i, %0 ], [ 0, %_ZN3hls6ip_fft8config_tI7config1E6getSchEj.exit.i ]
  %exitcond = icmp eq i32 %i_i, 1024
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1024, i64 1024, i64 1024)
  %i = add nsw i32 %i_i, 1
  br i1 %exitcond, label %_ZN3hls8fft_coreI7config1Lc16ELc16E8ap_fixedILi16ELi1EL9ap_q_mode5EL9ap_o_mode3ELi0EES5_Li1024ELc1ELNS_6ip_fft4typeE0EEEvPSt7complexIT2_EPS8_IT3_EPNS6_8status_tIT_EEPNS6_8config_tISG_EE.exit, label %0

; <label>:0                                       ; preds = %.preheader
  %xn_read = call i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32* %xn)
  call void @_ssdm_op_Write.ap_fifo.volatile.i32P(i32* %xk, i32 %xn_read)
  br label %.preheader

_ZN3hls8fft_coreI7config1Lc16ELc16E8ap_fixedILi16ELi1EL9ap_q_mode5EL9ap_o_mode3ELi0EES5_Li1024ELc1ELNS_6ip_fft4typeE0EEEvPSt7complexIT2_EPS8_IT3_EPNS6_8status_tIT_EEPNS6_8config_tISG_EE.exit: ; preds = %.preheader, %_ZN3hls6ip_fft8config_tI7config1E6getSchEj.exit.i
  %p_s = zext i1 %p_Result_1 to i8
  call void @_ssdm_op_Write.ap_fifo.i8P(i8* %status_data_V, i8 %p_s)
  ret void
}

define weak i32 @_ssdm_op_Read.ap_fifo.volatile.i32P(i32*) {
entry:
  %empty = call i32 @_autotb_FifoRead_i32(i32* %0)
  ret i32 %empty
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.i32P(i32*, i32) {
entry:
  %empty = call i32 @_autotb_FifoWrite_i32(i32* %0, i32 %1)
  ret void
}

define weak void @_ssdm_op_Write.ap_fifo.i8P(i8*, i8) {
entry:
  %empty = call i8 @_autotb_FifoWrite_i8(i8* %0, i8 %1)
  ret void
}

define weak i16 @_ssdm_op_Read.ap_fifo.i16P(i16*) {
entry:
  %empty = call i16 @_autotb_FifoRead_i16(i16* %0)
  ret i16 %empty
}

declare i32 @_autotb_FifoRead_i32(i32*)

declare i32 @_autotb_FifoWrite_i32(i32*, i32)

declare i8 @_autotb_FifoWrite_i8(i8*, i8)

declare i16 @_autotb_FifoRead_i16(i16*)

declare i16 @llvm.part.select.i16(i16, i32, i32) nounwind readnone

define weak i9 @_ssdm_op_PartSelect.i9.i10.i32.i32(i10, i32, i32) nounwind readnone {
entry:
  %empty = call i10 @llvm.part.select.i10(i10 %0, i32 %1, i32 %2)
  %empty_19 = trunc i10 %empty to i9
  ret i9 %empty_19
}

define weak i10 @_ssdm_op_PartSet.i10.i10.i9.i32.i32(i10, i9, i32, i32) nounwind readnone {
entry:
  %empty = call i10 @llvm.part.set.i10.i9(i10 %0, i9 %1, i32 %2, i32 %3)
  ret i10 %empty
}

declare i10 @llvm.part.select.i10(i10, i32, i32) nounwind readnone

declare i10 @llvm.part.set.i10.i9(i10, i9, i32, i32) nounwind readnone

!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !""}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8, metadata !13}
!8 = metadata !{i32 0, i32 15, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"out._M_real.V", metadata !11, metadata !"int16"}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 1023, i32 1}
!13 = metadata !{i32 16, i32 31, metadata !14}
!14 = metadata !{metadata !15}
!15 = metadata !{metadata !"out._M_imag.V", metadata !11, metadata !"int16"}
!16 = metadata !{metadata !17, metadata !20}
!17 = metadata !{i32 0, i32 15, metadata !18}
!18 = metadata !{metadata !19}
!19 = metadata !{metadata !"in._M_real.V", metadata !11, metadata !"int16"}
!20 = metadata !{i32 16, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"in._M_imag.V", metadata !11, metadata !"int16"}
