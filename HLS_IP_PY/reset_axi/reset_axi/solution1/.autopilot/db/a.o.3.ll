; ModuleID = 'C:/Users/Ali/Documents/Research/HLS_IP_PY/reset_axi/reset_axi/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=8 type=[1 x i8]*]
@p_str1 = private unnamed_addr constant [10 x i8] c"AXI4LiteS\00", align 1 ; [#uses=1 type=[10 x i8]*]
@p_str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1 ; [#uses=1 type=[8 x i8]*]
@str = internal constant [10 x i8] c"reset_axi\00" ; [#uses=1 type=[10 x i8]*]

; [#uses=0]
define void @reset_axi(i32* %in_reset, i1* %reset_out) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %in_reset) nounwind, !map !0
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %reset_out) nounwind, !map !6
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %in_reset}, i64 0, metadata !10), !dbg !21 ; [debug line = 1:21] [debug variable = in_reset]
  call void @llvm.dbg.value(metadata !{i1* %reset_out}, i64 0, metadata !22), !dbg !23 ; [debug line = 1:37] [debug variable = reset_out]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %in_reset, [1 x i8]* @p_str, [10 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !24 ; [debug line = 3:1]
  call void (...)* @_ssdm_op_SpecWire(i32* %in_reset, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !26 ; [debug line = 5:1]
  %in_reset_read = call i32 @_ssdm_op_Read.ap_none.i32P(i32* %in_reset) nounwind, !dbg !27 ; [#uses=1 type=i32] [debug line = 7:2]
  %not_s = icmp slt i32 %in_reset_read, 1, !dbg !27 ; [#uses=1 type=i1] [debug line = 7:2]
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %reset_out, i1 %not_s) nounwind, !dbg !28 ; [debug line = 8:3]
  ret void, !dbg !29                              ; [debug line = 11:1]
}

; [#uses=1]
define weak void @_ssdm_op_SpecWire(...) nounwind {
entry:
  ret void
}

; [#uses=2]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecIFCore(...) {
entry:
  ret void
}

; [#uses=2]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=1]
define weak i32 @_ssdm_op_Read.ap_none.i32P(i32*) {
entry:
  %empty = load i32* %0                           ; [#uses=1 type=i32]
  ret i32 %empty
}

; [#uses=1]
define weak void @_ssdm_op_Write.ap_auto.i1P(i1*, i1) {
entry:
  store i1 %1, i1* %0
  ret void
}

!llvm.map.gv = !{}

!0 = metadata !{metadata !1}
!1 = metadata !{i32 0, i32 31, metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{metadata !"in_reset", metadata !4, metadata !"int"}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 0, i32 0, i32 1}
!6 = metadata !{metadata !7}
!7 = metadata !{i32 0, i32 0, metadata !8}
!8 = metadata !{metadata !9}
!9 = metadata !{metadata !"reset_out", metadata !4, metadata !"bool"}
!10 = metadata !{i32 786689, metadata !11, metadata !"in_reset", metadata !12, i32 16777217, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!11 = metadata !{i32 786478, i32 0, metadata !12, metadata !"reset_axi", metadata !"reset_axi", metadata !"_Z9reset_axiPiPb", metadata !12, i32 1, metadata !13, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i1*)* @reset_axi, null, null, metadata !19, i32 2} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 786473, metadata !"reset_axi.cpp", metadata !"c:/Users/Ali/Documents/Research/HLS_IP_PY/reset_axi", null} ; [ DW_TAG_file_type ]
!13 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !14, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!14 = metadata !{null, metadata !15, metadata !17}
!15 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ]
!16 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!17 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !18} ; [ DW_TAG_pointer_type ]
!18 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!19 = metadata !{metadata !20}
!20 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!21 = metadata !{i32 1, i32 21, metadata !11, null}
!22 = metadata !{i32 786689, metadata !11, metadata !"reset_out", metadata !12, i32 33554433, metadata !17, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!23 = metadata !{i32 1, i32 37, metadata !11, null}
!24 = metadata !{i32 3, i32 1, metadata !25, null}
!25 = metadata !{i32 786443, metadata !11, i32 2, i32 1, metadata !12, i32 0} ; [ DW_TAG_lexical_block ]
!26 = metadata !{i32 5, i32 1, metadata !25, null}
!27 = metadata !{i32 7, i32 2, metadata !25, null}
!28 = metadata !{i32 8, i32 3, metadata !25, null}
!29 = metadata !{i32 11, i32 1, metadata !25, null}
