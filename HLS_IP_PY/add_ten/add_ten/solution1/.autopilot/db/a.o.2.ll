; ModuleID = 'C:/Users/Ali/Documents/Research/HLS_IP/add_ten/add_ten/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=16 type=[1 x i8]*]
@.str1 = private unnamed_addr constant [10 x i8] c"AXI4LiteS\00", align 1 ; [#uses=2 type=[10 x i8]*]
@.str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1 ; [#uses=2 type=[8 x i8]*]
@str = internal constant [8 x i8] c"add_ten\00"   ; [#uses=1 type=[8 x i8]*]

; [#uses=0]
define i32 @add_ten(i32* %input, i32* %output) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %input) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %output) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !23
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %input}, i64 0, metadata !29), !dbg !30 ; [debug line = 1:18] [debug variable = input]
  call void @llvm.dbg.value(metadata !{i32* %output}, i64 0, metadata !31), !dbg !32 ; [debug line = 1:30] [debug variable = output]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %input, [1 x i8]* @.str, [10 x i8]* @.str1, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str) nounwind, !dbg !33 ; [debug line = 5:1]
  call void (...)* @_ssdm_op_SpecWire(i32* %output, [8 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str) nounwind, !dbg !35 ; [debug line = 7:1]
  call void (...)* @_ssdm_op_SpecWire(i32* %input, [8 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str) nounwind, !dbg !36 ; [debug line = 9:1]
  %input.load = load i32* %input, align 4, !dbg !37 ; [#uses=1 type=i32] [debug line = 11:2]
  %output.assign = add nsw i32 %input.load, 10, !dbg !37 ; [#uses=1 type=i32] [debug line = 11:2]
  store i32 %output.assign, i32* %output, align 4, !dbg !37 ; [debug line = 11:2]
  call void (...)* @_ssdm_op_SpecIFCore(i32* %output, [1 x i8]* @.str, [10 x i8]* @.str1, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str, [1 x i8]* @.str) nounwind, !dbg !38 ; [debug line = 12:1]
  ret i32 0, !dbg !39                             ; [debug line = 12:2]
}

; [#uses=2]
declare void @_ssdm_op_SpecWire(...) nounwind

; [#uses=2]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=3]
declare void @_ssdm_op_SpecBitsMap(...)

; [#uses=2]
declare void @_ssdm_op_SpecIFCore(...)

!llvm.dbg.cu = !{!0}
!llvm.map.gv = !{}

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
!16 = metadata !{metadata !"input", metadata !17, metadata !"int"}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 0, i32 1}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"output", metadata !17, metadata !"int"}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 31, metadata !25}
!25 = metadata !{metadata !26}
!26 = metadata !{metadata !"return", metadata !27, metadata !"int"}
!27 = metadata !{metadata !28}
!28 = metadata !{i32 0, i32 1, i32 0}
!29 = metadata !{i32 786689, metadata !5, metadata !"input", metadata !6, i32 16777217, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!30 = metadata !{i32 1, i32 18, metadata !5, null}
!31 = metadata !{i32 786689, metadata !5, metadata !"output", metadata !6, i32 33554433, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!32 = metadata !{i32 1, i32 30, metadata !5, null}
!33 = metadata !{i32 5, i32 1, metadata !34, null}
!34 = metadata !{i32 786443, metadata !5, i32 2, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!35 = metadata !{i32 7, i32 1, metadata !34, null}
!36 = metadata !{i32 9, i32 1, metadata !34, null}
!37 = metadata !{i32 11, i32 2, metadata !34, null}
!38 = metadata !{i32 12, i32 1, metadata !34, null}
!39 = metadata !{i32 12, i32 2, metadata !34, null}
