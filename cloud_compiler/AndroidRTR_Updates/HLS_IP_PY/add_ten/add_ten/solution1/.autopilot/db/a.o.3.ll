; ModuleID = 'C:/Users/Ali/Documents/Research/HLS_IP/add_ten/add_ten/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=16 type=[1 x i8]*]
@p_str1 = private unnamed_addr constant [10 x i8] c"AXI4LiteS\00", align 1 ; [#uses=2 type=[10 x i8]*]
@p_str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1 ; [#uses=2 type=[8 x i8]*]
@str = internal constant [8 x i8] c"add_ten\00"   ; [#uses=1 type=[8 x i8]*]

; [#uses=0]
define i32 @add_ten(i32* %input, i32* %output) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %input) nounwind, !map !0
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %output) nounwind, !map !6
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !10
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %input}, i64 0, metadata !16), !dbg !25 ; [debug line = 1:18] [debug variable = input]
  call void @llvm.dbg.value(metadata !{i32* %output}, i64 0, metadata !26), !dbg !27 ; [debug line = 1:30] [debug variable = output]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %input, [1 x i8]* @p_str, [10 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !28 ; [debug line = 5:1]
  call void (...)* @_ssdm_op_SpecWire(i32* %output, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !30 ; [debug line = 7:1]
  call void (...)* @_ssdm_op_SpecWire(i32* %input, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !31 ; [debug line = 9:1]
  %input_read = call i32 @_ssdm_op_Read.ap_none.i32P(i32* %input) nounwind, !dbg !32 ; [#uses=1 type=i32] [debug line = 11:2]
  %output_assign = add nsw i32 %input_read, 10, !dbg !32 ; [#uses=1 type=i32] [debug line = 11:2]
  call void @_ssdm_op_Write.ap_none.i32P(i32* %output, i32 %output_assign) nounwind, !dbg !32 ; [debug line = 11:2]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %output, [1 x i8]* @p_str, [10 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind, !dbg !33 ; [debug line = 12:1]
  ret i32 0, !dbg !34                             ; [debug line = 12:2]
}

; [#uses=2]
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

; [#uses=3]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=2]
define weak void @_ssdm_op_SpecIFCore(...) {
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
define weak void @_ssdm_op_Write.ap_none.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

!llvm.map.gv = !{}

!0 = metadata !{metadata !1}
!1 = metadata !{i32 0, i32 31, metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{metadata !"input", metadata !4, metadata !"int"}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 0, i32 0, i32 1}
!6 = metadata !{metadata !7}
!7 = metadata !{i32 0, i32 31, metadata !8}
!8 = metadata !{metadata !9}
!9 = metadata !{metadata !"output", metadata !4, metadata !"int"}
!10 = metadata !{metadata !11}
!11 = metadata !{i32 0, i32 31, metadata !12}
!12 = metadata !{metadata !13}
!13 = metadata !{metadata !"return", metadata !14, metadata !"int"}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 0, i32 1, i32 0}
!16 = metadata !{i32 786689, metadata !17, metadata !"input", metadata !18, i32 16777217, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!17 = metadata !{i32 786478, i32 0, metadata !18, metadata !"add_ten", metadata !"add_ten", metadata !"_Z7add_tenPiS_", metadata !18, i32 1, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*, i32*)* @add_ten, null, null, metadata !23, i32 2} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 786473, metadata !"add_ten.cpp", metadata !"c:/Users/Ali/Documents/Research/HLS_IP/add_ten", null} ; [ DW_TAG_file_type ]
!19 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{metadata !21, metadata !22, metadata !22}
!21 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!22 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ]
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!25 = metadata !{i32 1, i32 18, metadata !17, null}
!26 = metadata !{i32 786689, metadata !17, metadata !"output", metadata !18, i32 33554433, metadata !22, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!27 = metadata !{i32 1, i32 30, metadata !17, null}
!28 = metadata !{i32 5, i32 1, metadata !29, null}
!29 = metadata !{i32 786443, metadata !17, i32 2, i32 1, metadata !18, i32 0} ; [ DW_TAG_lexical_block ]
!30 = metadata !{i32 7, i32 1, metadata !29, null}
!31 = metadata !{i32 9, i32 1, metadata !29, null}
!32 = metadata !{i32 11, i32 2, metadata !29, null}
!33 = metadata !{i32 12, i32 1, metadata !29, null}
!34 = metadata !{i32 12, i32 2, metadata !29, null}
