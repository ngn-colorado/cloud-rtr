; ModuleID = 'C:/Users/Ali/Documents/Research/HLS_IP/add_ten/add_ten/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str1 = private unnamed_addr constant [10 x i8] c"AXI4LiteS\00", align 1 ; [#uses=1 type=[10 x i8]*]
@.str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1 ; [#uses=1 type=[8 x i8]*]
@str = internal constant [8 x i8] c"add_ten\00"   ; [#uses=1 type=[8 x i8]*]

; [#uses=0]
define i32 @add_ten(i32* %input, i32* %output) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %input}, i64 0, metadata !19), !dbg !20 ; [debug line = 1:18] [debug variable = input]
  call void @llvm.dbg.value(metadata !{i32* %output}, i64 0, metadata !21), !dbg !22 ; [debug line = 1:30] [debug variable = output]
  call void (...)* @_ssdm_op_SpecResource(i32* %input, i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !23 ; [debug line = 5:1]
  call void (...)* @_ssdm_op_SpecWire(i32* %output, i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !25 ; [debug line = 7:1]
  call void (...)* @_ssdm_op_SpecWire(i32* %input, i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !26 ; [debug line = 9:1]
  %input.load = load i32* %input, align 4, !dbg !27 ; [#uses=1 type=i32] [debug line = 11:2]
  %output.assign = add nsw i32 %input.load, 10, !dbg !27 ; [#uses=1 type=i32] [debug line = 11:2]
  store i32 %output.assign, i32* %output, align 4, !dbg !27 ; [debug line = 11:2]
  call void (...)* @_ssdm_op_SpecResource(i32* %output, i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !28 ; [debug line = 12:1]
  ret i32 0, !dbg !29                             ; [debug line = 12:2]
}

; [#uses=2]
declare void @_ssdm_op_SpecResource(...) nounwind

; [#uses=2]
declare void @_ssdm_op_SpecWire(...) nounwind

; [#uses=2]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=1]
declare void @_ssdm_op_SpecBitsMap(...)

; [#uses=0]
declare i32 @_ssdm_op_SpecLoopBegin(...)

; [#uses=0]
declare i32 @_ssdm_op_SpecRegionBegin(...)

; [#uses=0]
declare i32 @_ssdm_op_SpecRegionEnd(...)

; [#uses=0]
declare i32 @_ssdm_op_SpecRegionEnd.restore(...)

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"C:/Users/Ali/Documents/Research/HLS_IP/add_ten/add_ten/solution1/.autopilot/db/add_ten.pragma.2.cpp", metadata !"c:/Users/Ali/Documents/Research/HLS_IP/add_ten", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"add_ten", metadata !"add_ten", metadata !"_Z7add_tenPiS_", metadata !6, i32 1, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32*, i32*)* @add_ten, null, null, metadata !11, i32 2} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"add_ten.cpp", metadata !"c:/Users/Ali/Documents/Research/HLS_IP/add_ten", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !10, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"return", metadata !17, metadata !"int"}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 1, i32 0}
!19 = metadata !{i32 786689, metadata !5, metadata !"input", metadata !6, i32 16777217, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!20 = metadata !{i32 1, i32 18, metadata !5, null}
!21 = metadata !{i32 786689, metadata !5, metadata !"output", metadata !6, i32 33554433, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!22 = metadata !{i32 1, i32 30, metadata !5, null}
!23 = metadata !{i32 5, i32 1, metadata !24, null}
!24 = metadata !{i32 786443, metadata !5, i32 2, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!25 = metadata !{i32 7, i32 1, metadata !24, null}
!26 = metadata !{i32 9, i32 1, metadata !24, null}
!27 = metadata !{i32 11, i32 2, metadata !24, null}
!28 = metadata !{i32 12, i32 1, metadata !24, null}
!29 = metadata !{i32 12, i32 2, metadata !24, null}
