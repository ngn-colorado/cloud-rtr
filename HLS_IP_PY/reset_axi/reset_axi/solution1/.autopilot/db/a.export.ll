; ModuleID = 'C:/Users/Ali/Documents/Research/HLS_IP_PY/reset_axi/reset_axi/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@p_str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str1 = private unnamed_addr constant [10 x i8] c"AXI4LiteS\00", align 1
@p_str2 = private unnamed_addr constant [8 x i8] c"ap_none\00", align 1
@str = internal constant [10 x i8] c"reset_axi\00"

define void @reset_axi(i32* %in_reset, i1* %reset_out) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %in_reset) nounwind, !map !0
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %reset_out) nounwind, !map !6
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @str) nounwind
  call void (...)* @_ssdm_op_SpecIFCore(i32* %in_reset, [1 x i8]* @p_str, [10 x i8]* @p_str1, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  call void (...)* @_ssdm_op_SpecWire(i32* %in_reset, [8 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str, [1 x i8]* @p_str, [1 x i8]* @p_str) nounwind
  %in_reset_read = call i32 @_ssdm_op_Read.ap_none.i32P(i32* %in_reset) nounwind
  %not_s = icmp slt i32 %in_reset_read, 1
  call void @_ssdm_op_Write.ap_auto.i1P(i1* %reset_out, i1 %not_s) nounwind
  ret void
}

define weak void @_ssdm_op_SpecWire(...) nounwind {
entry:
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
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

define weak i32 @_ssdm_op_Read.ap_none.i32P(i32*) {
entry:
  %empty = load i32* %0
  ret i32 %empty
}

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
