; ModuleID = 'C:/Users/Ali/Documents/Research/HLS_IP_PY/reset_axi/reset_axi/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=8 type=[1 x i8]*]
@.str1 = private unnamed_addr constant [10 x i8] c"AXI4LiteS\00", align 1 ; [#uses=1 type=[10 x i8]*]
@.str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1 ; [#uses=1 type=[8 x i8]*]
@str = internal constant [10 x i8] c"reset_axi\00" ; [#uses=1 type=[10 x i8]*]

; [#uses=0]
define void @reset_axi(i32* %in_reset, i1* %reset_out) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %in_reset) nounwind, !map !15
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %reset_out) nounwind, !map !21
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %in_reset}, i64 0, metadata !25), !dbg !26 ; [debug line = 1:21] [debug variable = in_reset]
  call void @llvm.dbg.value(metadata !{i1* %reset_out}, i64 0, metadata !27), !dbg !28 ; [debug line = 1:37] [debug variable = reset_out]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %in_reset, [1 x i8]* @.str, [10 x i8]* @.str1, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str) nounwind, !dbg !29 ; [debug line = 3:1]
  call void (...)* @_ssdm_op_SpecWire(i32* %in_reset, [8 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str) nounwind, !dbg !31 ; [debug line = 5:1]
  %in_reset.load = load i32* %in_reset, align 4, !dbg !32 ; [#uses=1 type=i32] [debug line = 7:2]
  %not. = icmp slt i32 %in_reset.load, 1, !dbg !32 ; [#uses=1 type=i1] [debug line = 7:2]
  store i1 %not., i1* %reset_out, align 1, !dbg !33 ; [debug line = 8:3]
  ret void, !dbg !34                              ; [debug line = 11:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecWire(...) nounwind

; [#uses=2]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=1]
declare void @_ssdm_op_SpecIFCore(...)

; [#uses=2]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.dbg.cu = !{!0}
!llvm.map.gv = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"C:/Users/Ali/Documents/Research/HLS_IP_PY/reset_axi/reset_axi/solution1/.autopilot/db/reset_axi.pragma.2.cpp", metadata !"c:/Users/Ali/Documents/Research/HLS_IP_PY/reset_axi", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"reset_axi", metadata !"reset_axi", metadata !"_Z9reset_axiPiPb", metadata !6, i32 1, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i1*)* @reset_axi, null, null, metadata !13, i32 2} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"reset_axi.cpp", metadata !"c:/Users/Ali/Documents/Research/HLS_IP_PY/reset_axi", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !11}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !12} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 0, i32 31, metadata !17}
!17 = metadata !{metadata !18}
!18 = metadata !{metadata !"in_reset", metadata !19, metadata !"int"}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 0, i32 1}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 0, i32 0, metadata !23}
!23 = metadata !{metadata !24}
!24 = metadata !{metadata !"reset_out", metadata !19, metadata !"bool"}
!25 = metadata !{i32 786689, metadata !5, metadata !"in_reset", metadata !6, i32 16777217, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!26 = metadata !{i32 1, i32 21, metadata !5, null}
!27 = metadata !{i32 786689, metadata !5, metadata !"reset_out", metadata !6, i32 33554433, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!28 = metadata !{i32 1, i32 37, metadata !5, null}
!29 = metadata !{i32 3, i32 1, metadata !30, null}
!30 = metadata !{i32 786443, metadata !5, i32 2, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!31 = metadata !{i32 5, i32 1, metadata !30, null}
!32 = metadata !{i32 7, i32 2, metadata !30, null}
!33 = metadata !{i32 8, i32 3, metadata !30, null}
!34 = metadata !{i32 11, i32 1, metadata !30, null}
