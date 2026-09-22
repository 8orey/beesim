; ModuleID = 'sim.c'
source_filename = "sim.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Bee = type { float, float, float, [2 x %struct.Belief], i8, i8 }
%struct.Belief = type { float, float, float, float, i8, i8 }
%struct.Resource = type { float, float, i32, i8 }
%struct.Shout = type { float, float, float, float, i8 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local float @resource_radius(ptr noundef readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %3 = load i32, ptr %2, align 4, !tbaa !5
  %4 = sitofp i32 %3 to float
  %5 = fmul float %4, 0x3F8D41D420000000
  %6 = fcmp olt float %5, 0.000000e+00
  %7 = select i1 %6, float 0.000000e+00, float %5
  %8 = tail call float @llvm.sqrt.f32(float %7)
  %9 = tail call float @llvm.fmuladd.f32(float %8, float 1.800000e+01, float 8.000000e+00)
  ret float %9
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @sqrtf(float noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite, errnomem: write) uwtable
define dso_local void @sim_init(ptr noundef captures(none) initializes((0, 24732)) %0, i32 noundef %1) local_unnamed_addr #3 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(24732) %0, i8 0, i64 24732, i1 false)
  %3 = icmp eq i32 %1, 0
  %4 = select i1 %3, i32 -1640531527, i32 %1
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 14488
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 14468
  store <2 x float> <float 6.400000e+02, float 3.600000e+02>, ptr %6, align 4, !tbaa !11
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 14336
  store i32 120, ptr %7, align 4, !tbaa !12
  br label %9

8:                                                ; preds = %9
  tail call fastcc void @resource_spawn(ptr noundef nonnull %0)
  tail call fastcc void @resource_spawn(ptr noundef nonnull %0)
  ret void

9:                                                ; preds = %2, %9
  %10 = phi i32 [ %4, %2 ], [ %46, %9 ]
  %11 = phi i64 [ 0, %2 ], [ %63, %9 ]
  %12 = getelementptr inbounds nuw [256 x %struct.Bee], ptr %0, i64 0, i64 %11
  %13 = shl i32 %10, 13
  %14 = xor i32 %13, %10
  %15 = lshr i32 %14, 17
  %16 = xor i32 %15, %14
  %17 = shl i32 %16, 5
  %18 = xor i32 %17, %16
  %19 = lshr i32 %18, 8
  %20 = uitofp nneg i32 %19 to float
  %21 = fmul float %20, 0x401921FB60000000
  %22 = tail call float @llvm.fmuladd.f32(float %21, float 0x3E70000000000000, float 0.000000e+00)
  %23 = shl i32 %18, 13
  %24 = xor i32 %23, %18
  %25 = lshr i32 %24, 17
  %26 = xor i32 %25, %24
  %27 = shl i32 %26, 5
  %28 = xor i32 %27, %26
  store i32 %28, ptr %5, align 4, !tbaa !14
  %29 = lshr i32 %28, 8
  %30 = mul nuw nsw i32 %29, 48
  %31 = uitofp nneg i32 %30 to float
  %32 = tail call float @llvm.fmuladd.f32(float %31, float 0x3E70000000000000, float 0.000000e+00)
  %33 = tail call float @cosf(float noundef %22) #8, !tbaa !15
  %34 = tail call float @sinf(float noundef %22) #8, !tbaa !15
  %35 = insertelement <2 x float> poison, float %33, i64 0
  %36 = insertelement <2 x float> %35, float %34, i64 1
  %37 = insertelement <2 x float> poison, float %32, i64 0
  %38 = shufflevector <2 x float> %37, <2 x float> poison, <2 x i32> zeroinitializer
  %39 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %36, <2 x float> %38, <2 x float> <float 6.400000e+02, float 3.600000e+02>)
  store <2 x float> %39, ptr %12, align 4, !tbaa !11
  %40 = load i32, ptr %5, align 4, !tbaa !14
  %41 = shl i32 %40, 13
  %42 = xor i32 %41, %40
  %43 = lshr i32 %42, 17
  %44 = xor i32 %43, %42
  %45 = shl i32 %44, 5
  %46 = xor i32 %45, %44
  store i32 %46, ptr %5, align 4, !tbaa !14
  %47 = lshr i32 %46, 8
  %48 = uitofp nneg i32 %47 to float
  %49 = fmul float %48, 0x401921FB60000000
  %50 = tail call float @llvm.fmuladd.f32(float %49, float 0x3E70000000000000, float 0.000000e+00)
  %51 = getelementptr inbounds nuw i8, ptr %12, i64 8
  store float %50, ptr %51, align 4, !tbaa !16
  %52 = trunc nuw nsw i64 %11 to i32
  %53 = urem i32 %52, 20
  %54 = icmp eq i32 %53, 0
  %55 = zext i1 %54 to i8
  %56 = getelementptr inbounds nuw i8, ptr %12, i64 53
  store i8 %55, ptr %56, align 1, !tbaa !18
  %57 = getelementptr inbounds nuw i8, ptr %12, i64 28
  store i8 0, ptr %57, align 4, !tbaa !19
  %58 = getelementptr inbounds nuw i8, ptr %12, i64 29
  store i8 0, ptr %58, align 1, !tbaa !21
  %59 = getelementptr inbounds nuw i8, ptr %12, i64 20
  store <2 x float> <float 0x46293E5940000000, float 0.000000e+00>, ptr %59, align 4, !tbaa !11
  %60 = getelementptr inbounds nuw i8, ptr %12, i64 48
  store i8 0, ptr %60, align 4, !tbaa !19
  %61 = getelementptr inbounds nuw i8, ptr %12, i64 49
  store i8 0, ptr %61, align 1, !tbaa !21
  %62 = getelementptr inbounds nuw i8, ptr %12, i64 40
  store <2 x float> <float 0x46293E5940000000, float 0.000000e+00>, ptr %62, align 4, !tbaa !11
  %63 = add nuw nsw i64 %11, 1
  %64 = load i32, ptr %7, align 4, !tbaa !12
  %65 = sext i32 %64 to i64
  %66 = icmp slt i64 %63, %65
  br i1 %66, label %9, label %8, !llvm.loop !22
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #4

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @cosf(float noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @sinf(float noundef) local_unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define internal fastcc void @resource_spawn(ptr noundef captures(none) %0) unnamed_addr #5 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 14340
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 14352
  %4 = load i8, ptr %3, align 4, !tbaa !24
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %41, label %6

6:                                                ; preds = %1
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 14356
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 14368
  %9 = load i8, ptr %8, align 4, !tbaa !24
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %41, label %11

11:                                               ; preds = %6
  %12 = getelementptr inbounds nuw i8, ptr %0, i64 14372
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 14384
  %14 = load i8, ptr %13, align 4, !tbaa !24
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %41, label %16

16:                                               ; preds = %11
  %17 = getelementptr inbounds nuw i8, ptr %0, i64 14388
  %18 = getelementptr inbounds nuw i8, ptr %0, i64 14400
  %19 = load i8, ptr %18, align 4, !tbaa !24
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %41, label %21

21:                                               ; preds = %16
  %22 = getelementptr inbounds nuw i8, ptr %0, i64 14404
  %23 = getelementptr inbounds nuw i8, ptr %0, i64 14416
  %24 = load i8, ptr %23, align 4, !tbaa !24
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %41, label %26

26:                                               ; preds = %21
  %27 = getelementptr inbounds nuw i8, ptr %0, i64 14420
  %28 = getelementptr inbounds nuw i8, ptr %0, i64 14432
  %29 = load i8, ptr %28, align 4, !tbaa !24
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %41, label %31

31:                                               ; preds = %26
  %32 = getelementptr inbounds nuw i8, ptr %0, i64 14436
  %33 = getelementptr inbounds nuw i8, ptr %0, i64 14448
  %34 = load i8, ptr %33, align 4, !tbaa !24
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %41, label %36

36:                                               ; preds = %31
  %37 = getelementptr inbounds nuw i8, ptr %0, i64 14452
  %38 = getelementptr inbounds nuw i8, ptr %0, i64 14464
  %39 = load i8, ptr %38, align 4, !tbaa !24
  %40 = icmp eq i8 %39, 0
  br i1 %40, label %41, label %85

41:                                               ; preds = %36, %31, %26, %21, %16, %11, %6, %1
  %42 = phi ptr [ %2, %1 ], [ %7, %6 ], [ %12, %11 ], [ %17, %16 ], [ %22, %21 ], [ %27, %26 ], [ %32, %31 ], [ %37, %36 ]
  %43 = getelementptr inbounds nuw i8, ptr %42, i64 12
  %44 = getelementptr inbounds nuw i8, ptr %0, i64 14488
  %45 = getelementptr inbounds nuw i8, ptr %0, i64 14468
  %46 = load float, ptr %45, align 4, !tbaa !25
  %47 = getelementptr inbounds nuw i8, ptr %0, i64 14472
  %48 = load float, ptr %47, align 4, !tbaa !26
  %49 = load i32, ptr %44, align 4, !tbaa !14
  br label %53

50:                                               ; preds = %53
  %51 = add nuw nsw i32 %54, 1
  %52 = icmp eq i32 %51, 16
  br i1 %52, label %84, label %53, !llvm.loop !27

53:                                               ; preds = %41, %50
  %54 = phi i32 [ 0, %41 ], [ %51, %50 ]
  %55 = phi i32 [ %49, %41 ], [ %67, %50 ]
  %56 = shl i32 %55, 13
  %57 = xor i32 %56, %55
  %58 = lshr i32 %57, 17
  %59 = xor i32 %58, %57
  %60 = shl i32 %59, 5
  %61 = xor i32 %60, %59
  %62 = shl i32 %61, 13
  %63 = xor i32 %62, %61
  %64 = lshr i32 %63, 17
  %65 = xor i32 %64, %63
  %66 = shl i32 %65, 5
  %67 = xor i32 %66, %65
  %68 = insertelement <2 x i32> poison, i32 %61, i64 0
  %69 = insertelement <2 x i32> %68, i32 %67, i64 1
  %70 = lshr <2 x i32> %69, splat (i32 8)
  %71 = uitofp nneg <2 x i32> %70 to <2 x float>
  %72 = fmul <2 x float> %71, <float 1.228000e+03, float 6.680000e+02>
  %73 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %72, <2 x float> splat (float 0x3E70000000000000), <2 x float> splat (float 2.600000e+01))
  %74 = extractelement <2 x float> %73, i64 0
  %75 = fsub float %74, %46
  %76 = extractelement <2 x float> %73, i64 1
  %77 = fsub float %76, %48
  %78 = fmul float %77, %77
  %79 = tail call noundef float @llvm.fmuladd.f32(float %75, float %75, float %78)
  %80 = fcmp olt float %79, 4.000000e+04
  br i1 %80, label %50, label %81

81:                                               ; preds = %53
  store i32 %67, ptr %44, align 4, !tbaa !14
  store <2 x float> %73, ptr %42, align 4, !tbaa !11
  %82 = getelementptr inbounds nuw i8, ptr %42, i64 8
  store i32 70, ptr %82, align 4, !tbaa !15
  store i8 1, ptr %43, align 4, !tbaa !28
  %83 = getelementptr inbounds nuw i8, ptr %42, i64 13
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(3) %83, i8 0, i64 3, i1 false)
  br label %85

84:                                               ; preds = %50
  store i32 %67, ptr %44, align 4, !tbaa !14
  br label %85

85:                                               ; preds = %36, %84, %81
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(read, argmem: readwrite, inaccessiblemem: none, errnomem: readwrite) uwtable
define dso_local void @sim_step(ptr noundef %0, float noundef %1) local_unnamed_addr #6 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 14476
  %4 = load <2 x float>, ptr %3, align 4, !tbaa !11
  %5 = insertelement <2 x float> poison, float %1, i64 0
  %6 = shufflevector <2 x float> %5, <2 x float> poison, <2 x i32> zeroinitializer
  %7 = fadd <2 x float> %6, %4
  store <2 x float> %7, ptr %3, align 4, !tbaa !11
  %8 = extractelement <2 x float> %7, i64 0
  %9 = fcmp ult float %8, 1.000000e+01
  br i1 %9, label %15, label %10

10:                                               ; preds = %2, %10
  %11 = phi float [ %13, %10 ], [ %8, %2 ]
  %12 = fadd float %11, -1.000000e+01
  store float %12, ptr %3, align 4, !tbaa !29
  tail call fastcc void @resource_spawn(ptr noundef nonnull %0)
  %13 = load float, ptr %3, align 4, !tbaa !29
  %14 = fcmp ult float %13, 1.000000e+01
  br i1 %14, label %15, label %10, !llvm.loop !30

15:                                               ; preds = %10, %2
  %16 = getelementptr inbounds nuw i8, ptr %0, i64 14336
  %17 = load i32, ptr %16, align 4, !tbaa !12
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %359

19:                                               ; preds = %15
  %20 = getelementptr inbounds nuw i8, ptr %0, i64 14468
  %21 = getelementptr inbounds nuw i8, ptr %0, i64 14340
  %22 = zext nneg i32 %17 to i64
  br label %23

23:                                               ; preds = %145, %19
  %24 = phi i64 [ 0, %19 ], [ %146, %145 ]
  %25 = getelementptr inbounds nuw [256 x %struct.Bee], ptr %0, i64 0, i64 %24
  %26 = getelementptr inbounds nuw i8, ptr %25, i64 12
  %27 = getelementptr inbounds nuw i8, ptr %25, i64 4
  %28 = getelementptr inbounds nuw i8, ptr %25, i64 28
  %29 = load i8, ptr %28, align 4, !tbaa !19
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %55, label %31

31:                                               ; preds = %23
  %32 = getelementptr inbounds nuw i8, ptr %25, i64 24
  %33 = load float, ptr %32, align 4, !tbaa !31
  %34 = fadd float %33, 0x3F91111120000000
  store float %34, ptr %32, align 4, !tbaa !31
  %35 = fcmp ult float %34, 3.000000e+00
  br i1 %35, label %36, label %51

36:                                               ; preds = %31
  %37 = getelementptr inbounds nuw i8, ptr %25, i64 29
  %38 = load i8, ptr %37, align 1, !tbaa !21
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %40, label %54

40:                                               ; preds = %36
  %41 = load float, ptr %25, align 4, !tbaa !32
  %42 = load float, ptr %27, align 4, !tbaa !33
  %43 = load float, ptr %26, align 4, !tbaa !34
  %44 = getelementptr inbounds nuw i8, ptr %25, i64 16
  %45 = load float, ptr %44, align 4, !tbaa !35
  %46 = fsub float %41, %43
  %47 = fsub float %42, %45
  %48 = fmul float %47, %47
  %49 = tail call noundef float @llvm.fmuladd.f32(float %46, float %46, float %48)
  %50 = fcmp olt float %49, 3.600000e+01
  br i1 %50, label %51, label %54

51:                                               ; preds = %40, %31
  store i8 0, ptr %28, align 4, !tbaa !19
  %52 = getelementptr inbounds nuw i8, ptr %25, i64 29
  store i8 0, ptr %52, align 1, !tbaa !21
  %53 = getelementptr inbounds nuw i8, ptr %25, i64 20
  store <2 x float> <float 0x46293E5940000000, float 0.000000e+00>, ptr %53, align 4, !tbaa !11
  br label %55

54:                                               ; preds = %40, %36
  store i8 0, ptr %37, align 1, !tbaa !21
  br label %55

55:                                               ; preds = %54, %51, %23
  %56 = getelementptr inbounds nuw i8, ptr %25, i64 32
  %57 = getelementptr inbounds nuw i8, ptr %25, i64 48
  %58 = load i8, ptr %57, align 4, !tbaa !19
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %84, label %60

60:                                               ; preds = %55
  %61 = getelementptr inbounds nuw i8, ptr %25, i64 44
  %62 = load float, ptr %61, align 4, !tbaa !31
  %63 = fadd float %62, 0x3F91111120000000
  store float %63, ptr %61, align 4, !tbaa !31
  %64 = fcmp ult float %63, 3.000000e+00
  br i1 %64, label %65, label %81

65:                                               ; preds = %60
  %66 = getelementptr inbounds nuw i8, ptr %25, i64 49
  %67 = load i8, ptr %66, align 1, !tbaa !21
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %69, label %80

69:                                               ; preds = %65
  %70 = load float, ptr %25, align 4, !tbaa !32
  %71 = load float, ptr %27, align 4, !tbaa !33
  %72 = load float, ptr %56, align 4, !tbaa !34
  %73 = getelementptr inbounds nuw i8, ptr %25, i64 36
  %74 = load float, ptr %73, align 4, !tbaa !35
  %75 = fsub float %70, %72
  %76 = fsub float %71, %74
  %77 = fmul float %76, %76
  %78 = tail call noundef float @llvm.fmuladd.f32(float %75, float %75, float %77)
  %79 = fcmp olt float %78, 3.600000e+01
  br i1 %79, label %81, label %80

80:                                               ; preds = %69, %65
  store i8 0, ptr %66, align 1, !tbaa !21
  br label %84

81:                                               ; preds = %69, %60
  store i8 0, ptr %57, align 4, !tbaa !19
  %82 = getelementptr inbounds nuw i8, ptr %25, i64 49
  store i8 0, ptr %82, align 1, !tbaa !21
  %83 = getelementptr inbounds nuw i8, ptr %25, i64 40
  store <2 x float> <float 0x46293E5940000000, float 0.000000e+00>, ptr %83, align 4, !tbaa !11
  br label %84

84:                                               ; preds = %81, %80, %55
  %85 = load float, ptr %25, align 4, !tbaa !32
  %86 = load float, ptr %27, align 4, !tbaa !33
  %87 = load <2 x float>, ptr %20, align 4, !tbaa !11
  %88 = extractelement <2 x float> %87, i64 0
  %89 = fsub float %85, %88
  %90 = extractelement <2 x float> %87, i64 1
  %91 = fsub float %86, %90
  %92 = fmul float %91, %91
  %93 = tail call noundef float @llvm.fmuladd.f32(float %89, float %89, float %92)
  %94 = tail call float @llvm.sqrt.f32(float %93)
  %95 = fcmp ugt float %94, 4.000000e+01
  br i1 %95, label %100, label %96

96:                                               ; preds = %84
  store <2 x float> %87, ptr %56, align 4, !tbaa !11
  %97 = getelementptr inbounds nuw i8, ptr %25, i64 40
  store <2 x float> zeroinitializer, ptr %97, align 4, !tbaa !11
  store i8 1, ptr %57, align 4, !tbaa !28
  %98 = getelementptr inbounds nuw i8, ptr %25, i64 49
  store i8 1, ptr %98, align 1, !tbaa !28
  %99 = getelementptr inbounds nuw i8, ptr %25, i64 50
  store i16 0, ptr %99, align 2
  br label %100

100:                                              ; preds = %96, %84
  br label %101

101:                                              ; preds = %100, %131
  %102 = phi i64 [ %134, %131 ], [ 0, %100 ]
  %103 = phi float [ %133, %131 ], [ 4.000000e+01, %100 ]
  %104 = phi i32 [ %132, %131 ], [ -1, %100 ]
  %105 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %21, i64 0, i64 %102
  %106 = getelementptr inbounds nuw i8, ptr %105, i64 12
  %107 = load i8, ptr %106, align 4, !tbaa !24
  %108 = icmp eq i8 %107, 0
  br i1 %108, label %131, label %109

109:                                              ; preds = %101
  %110 = load float, ptr %105, align 4, !tbaa !36
  %111 = getelementptr inbounds nuw i8, ptr %105, i64 4
  %112 = load float, ptr %111, align 4, !tbaa !37
  %113 = fsub float %85, %110
  %114 = fsub float %86, %112
  %115 = fmul float %114, %114
  %116 = tail call noundef float @llvm.fmuladd.f32(float %113, float %113, float %115)
  %117 = tail call float @llvm.sqrt.f32(float %116)
  %118 = getelementptr inbounds nuw i8, ptr %105, i64 8
  %119 = load i32, ptr %118, align 4, !tbaa !5
  %120 = sitofp i32 %119 to float
  %121 = fmul float %120, 0x3F8D41D420000000
  %122 = fcmp olt float %121, 0.000000e+00
  %123 = select i1 %122, float 0.000000e+00, float %121
  %124 = tail call float @llvm.sqrt.f32(float %123)
  %125 = tail call float @llvm.fmuladd.f32(float %124, float 1.800000e+01, float 8.000000e+00)
  %126 = fsub float %117, %125
  %127 = fcmp olt float %126, %103
  %128 = trunc nuw nsw i64 %102 to i32
  %129 = select i1 %127, i32 %128, i32 %104
  %130 = select i1 %127, float %126, float %103
  br label %131

131:                                              ; preds = %109, %101
  %132 = phi i32 [ %129, %109 ], [ %104, %101 ]
  %133 = phi float [ %130, %109 ], [ %103, %101 ]
  %134 = add nuw nsw i64 %102, 1
  %135 = icmp eq i64 %134, 8
  br i1 %135, label %136, label %101, !llvm.loop !38

136:                                              ; preds = %131
  %137 = icmp sgt i32 %132, -1
  br i1 %137, label %138, label %145

138:                                              ; preds = %136
  %139 = zext nneg i32 %132 to i64
  %140 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %21, i64 0, i64 %139
  %141 = load <2 x float>, ptr %140, align 4, !tbaa !11
  store <2 x float> %141, ptr %26, align 4, !tbaa !11
  %142 = getelementptr inbounds nuw i8, ptr %25, i64 20
  store <2 x float> zeroinitializer, ptr %142, align 4, !tbaa !11
  store i8 1, ptr %28, align 4, !tbaa !28
  %143 = getelementptr inbounds nuw i8, ptr %25, i64 29
  store i8 1, ptr %143, align 1, !tbaa !28
  %144 = getelementptr inbounds nuw i8, ptr %25, i64 30
  store i16 0, ptr %144, align 2
  br label %145

145:                                              ; preds = %138, %136
  %146 = add nuw nsw i64 %24, 1
  %147 = icmp eq i64 %146, %22
  br i1 %147, label %148, label %23, !llvm.loop !39

148:                                              ; preds = %145
  %149 = getelementptr inbounds nuw i8, ptr %0, i64 14492
  br label %150

150:                                              ; preds = %150, %148
  %151 = phi i64 [ 0, %148 ], [ %203, %150 ]
  %152 = getelementptr inbounds nuw [256 x %struct.Bee], ptr %0, i64 0, i64 %151
  %153 = getelementptr inbounds nuw i8, ptr %152, i64 12
  %154 = getelementptr inbounds nuw [256 x [2 x %struct.Shout]], ptr %149, i64 0, i64 %151, i64 0
  %155 = load float, ptr %153, align 4, !tbaa !34
  %156 = getelementptr inbounds nuw i8, ptr %152, i64 16
  %157 = load float, ptr %156, align 4, !tbaa !35
  %158 = getelementptr inbounds nuw i8, ptr %152, i64 20
  %159 = load float, ptr %158, align 4, !tbaa !40
  %160 = getelementptr inbounds nuw i8, ptr %152, i64 24
  %161 = load float, ptr %160, align 4, !tbaa !31
  %162 = getelementptr inbounds nuw i8, ptr %152, i64 28
  %163 = load i8, ptr %162, align 4, !tbaa !19
  %164 = load <2 x float>, ptr %152, align 4, !tbaa !11
  %165 = extractelement <2 x float> %164, i64 0
  %166 = fsub float %165, %155
  %167 = extractelement <2 x float> %164, i64 1
  %168 = fsub float %167, %157
  %169 = fmul float %168, %168
  %170 = tail call noundef float @llvm.fmuladd.f32(float %166, float %166, float %169)
  %171 = tail call float @llvm.sqrt.f32(float %170)
  %172 = fadd float %159, %171
  store <2 x float> %164, ptr %154, align 4, !tbaa !11
  %173 = getelementptr inbounds nuw i8, ptr %154, i64 8
  store float %172, ptr %173, align 4, !tbaa !11
  %174 = getelementptr inbounds nuw i8, ptr %154, i64 12
  store float %161, ptr %174, align 4, !tbaa !11
  %175 = getelementptr inbounds nuw i8, ptr %154, i64 16
  store i8 %163, ptr %175, align 4, !tbaa !28
  %176 = getelementptr inbounds nuw i8, ptr %154, i64 17
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(3) %176, i8 0, i64 3, i1 false)
  %177 = getelementptr inbounds nuw i8, ptr %152, i64 32
  %178 = mul nuw nsw i64 %151, 40
  %179 = getelementptr inbounds nuw i8, ptr %149, i64 %178
  %180 = getelementptr inbounds nuw i8, ptr %179, i64 20
  %181 = load float, ptr %177, align 4, !tbaa !34
  %182 = getelementptr inbounds nuw i8, ptr %152, i64 36
  %183 = load float, ptr %182, align 4, !tbaa !35
  %184 = getelementptr inbounds nuw i8, ptr %152, i64 40
  %185 = load float, ptr %184, align 4, !tbaa !40
  %186 = getelementptr inbounds nuw i8, ptr %152, i64 44
  %187 = load float, ptr %186, align 4, !tbaa !31
  %188 = getelementptr inbounds nuw i8, ptr %152, i64 48
  %189 = load i8, ptr %188, align 4, !tbaa !19
  %190 = load <2 x float>, ptr %152, align 4, !tbaa !11
  %191 = extractelement <2 x float> %190, i64 0
  %192 = fsub float %191, %181
  %193 = extractelement <2 x float> %190, i64 1
  %194 = fsub float %193, %183
  %195 = fmul float %194, %194
  %196 = tail call noundef float @llvm.fmuladd.f32(float %192, float %192, float %195)
  %197 = tail call float @llvm.sqrt.f32(float %196)
  %198 = fadd float %185, %197
  store <2 x float> %190, ptr %180, align 4, !tbaa !11
  %199 = getelementptr inbounds nuw i8, ptr %179, i64 28
  store float %198, ptr %199, align 4, !tbaa !11
  %200 = getelementptr inbounds nuw i8, ptr %179, i64 32
  store float %187, ptr %200, align 4, !tbaa !11
  %201 = getelementptr inbounds nuw i8, ptr %179, i64 36
  store i8 %189, ptr %201, align 4, !tbaa !28
  %202 = getelementptr inbounds nuw i8, ptr %179, i64 37
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(3) %202, i8 0, i64 3, i1 false)
  %203 = add nuw nsw i64 %151, 1
  %204 = icmp eq i64 %203, %22
  br i1 %204, label %205, label %150, !llvm.loop !41

205:                                              ; preds = %150
  %206 = zext nneg i32 %17 to i64
  br label %207

207:                                              ; preds = %205, %356
  %208 = phi i64 [ %357, %356 ], [ 0, %205 ]
  %209 = getelementptr inbounds nuw [256 x %struct.Bee], ptr %0, i64 0, i64 %208
  %210 = getelementptr inbounds nuw i8, ptr %209, i64 12
  %211 = getelementptr inbounds nuw i8, ptr %209, i64 4
  %212 = getelementptr inbounds nuw i8, ptr %209, i64 29
  %213 = load i8, ptr %212, align 1, !tbaa !21
  %214 = icmp eq i8 %213, 0
  br i1 %214, label %215, label %282

215:                                              ; preds = %207
  %216 = getelementptr inbounds nuw i8, ptr %209, i64 28
  %217 = load i8, ptr %216, align 4, !tbaa !19
  %218 = icmp eq i8 %217, 0
  br i1 %218, label %233, label %219

219:                                              ; preds = %215
  %220 = load float, ptr %209, align 4, !tbaa !32
  %221 = load float, ptr %211, align 4, !tbaa !33
  %222 = load float, ptr %210, align 4, !tbaa !34
  %223 = getelementptr inbounds nuw i8, ptr %209, i64 16
  %224 = load float, ptr %223, align 4, !tbaa !35
  %225 = fsub float %220, %222
  %226 = fsub float %221, %224
  %227 = fmul float %226, %226
  %228 = tail call noundef float @llvm.fmuladd.f32(float %225, float %225, float %227)
  %229 = tail call float @llvm.sqrt.f32(float %228)
  %230 = getelementptr inbounds nuw i8, ptr %209, i64 20
  %231 = load float, ptr %230, align 4, !tbaa !40
  %232 = fadd float %231, %229
  br label %233

233:                                              ; preds = %215, %219
  %234 = phi float [ %232, %219 ], [ 0x46293E5940000000, %215 ]
  %235 = getelementptr inbounds nuw i8, ptr %209, i64 24
  br label %238

236:                                              ; preds = %274
  %237 = icmp eq ptr %275, null
  br i1 %237, label %282, label %279

238:                                              ; preds = %274, %233
  %239 = phi i64 [ 0, %233 ], [ %277, %274 ]
  %240 = phi float [ %234, %233 ], [ %276, %274 ]
  %241 = phi ptr [ null, %233 ], [ %275, %274 ]
  %242 = getelementptr inbounds nuw [256 x [2 x %struct.Shout]], ptr %149, i64 0, i64 %239, i64 0
  %243 = icmp eq i64 %239, %208
  br i1 %243, label %274, label %244

244:                                              ; preds = %238
  %245 = getelementptr inbounds nuw i8, ptr %242, i64 16
  %246 = load i8, ptr %245, align 4, !tbaa !42
  %247 = icmp eq i8 %246, 0
  br i1 %247, label %274, label %248

248:                                              ; preds = %244
  br i1 %218, label %254, label %249

249:                                              ; preds = %248
  %250 = getelementptr inbounds nuw i8, ptr %242, i64 12
  %251 = load float, ptr %250, align 4, !tbaa !44
  %252 = load float, ptr %235, align 4, !tbaa !31
  %253 = fcmp ogt float %251, %252
  br i1 %253, label %274, label %254

254:                                              ; preds = %249, %248
  %255 = load float, ptr %209, align 4, !tbaa !32
  %256 = load float, ptr %211, align 4, !tbaa !33
  %257 = load float, ptr %242, align 4, !tbaa !45
  %258 = getelementptr inbounds nuw i8, ptr %242, i64 4
  %259 = load float, ptr %258, align 4, !tbaa !46
  %260 = fsub float %255, %257
  %261 = fsub float %256, %259
  %262 = fmul float %261, %261
  %263 = tail call noundef float @llvm.fmuladd.f32(float %260, float %260, float %262)
  %264 = fcmp ogt float %263, 1.690000e+04
  br i1 %264, label %274, label %265

265:                                              ; preds = %254
  %266 = getelementptr inbounds nuw i8, ptr %242, i64 8
  %267 = load float, ptr %266, align 4, !tbaa !47
  %268 = tail call float @llvm.sqrt.f32(float %263)
  %269 = fadd float %268, %267
  %270 = fadd float %240, 0x3F50624DE0000000
  %271 = fcmp ugt float %269, %270
  %272 = select i1 %271, ptr %241, ptr %242
  %273 = select i1 %271, float %240, float %269
  br label %274

274:                                              ; preds = %265, %254, %249, %244, %238
  %275 = phi ptr [ %241, %244 ], [ %241, %238 ], [ %241, %249 ], [ %272, %265 ], [ %241, %254 ]
  %276 = phi float [ %240, %244 ], [ %240, %238 ], [ %240, %249 ], [ %273, %265 ], [ %240, %254 ]
  %277 = add nuw nsw i64 %239, 1
  %278 = icmp eq i64 %277, %22
  br i1 %278, label %236, label %238, !llvm.loop !48

279:                                              ; preds = %236
  %280 = load <4 x float>, ptr %275, align 4, !tbaa !11
  store <4 x float> %280, ptr %210, align 4, !tbaa !11
  store i8 1, ptr %216, align 4, !tbaa !28
  store i8 0, ptr %212, align 1, !tbaa !28
  %281 = getelementptr inbounds nuw i8, ptr %209, i64 30
  store i16 0, ptr %281, align 2
  br label %282

282:                                              ; preds = %279, %236, %207
  %283 = getelementptr inbounds nuw i8, ptr %209, i64 32
  %284 = getelementptr inbounds nuw i8, ptr %209, i64 49
  %285 = load i8, ptr %284, align 1, !tbaa !21
  %286 = icmp eq i8 %285, 0
  br i1 %286, label %287, label %356

287:                                              ; preds = %282
  %288 = getelementptr inbounds nuw i8, ptr %209, i64 48
  %289 = load i8, ptr %288, align 4, !tbaa !19
  %290 = icmp eq i8 %289, 0
  br i1 %290, label %305, label %291

291:                                              ; preds = %287
  %292 = load float, ptr %209, align 4, !tbaa !32
  %293 = load float, ptr %211, align 4, !tbaa !33
  %294 = load float, ptr %283, align 4, !tbaa !34
  %295 = getelementptr inbounds nuw i8, ptr %209, i64 36
  %296 = load float, ptr %295, align 4, !tbaa !35
  %297 = fsub float %292, %294
  %298 = fsub float %293, %296
  %299 = fmul float %298, %298
  %300 = tail call noundef float @llvm.fmuladd.f32(float %297, float %297, float %299)
  %301 = tail call float @llvm.sqrt.f32(float %300)
  %302 = getelementptr inbounds nuw i8, ptr %209, i64 40
  %303 = load float, ptr %302, align 4, !tbaa !40
  %304 = fadd float %303, %301
  br label %305

305:                                              ; preds = %287, %291
  %306 = phi float [ %304, %291 ], [ 0x46293E5940000000, %287 ]
  %307 = getelementptr inbounds nuw i8, ptr %209, i64 44
  br label %308

308:                                              ; preds = %346, %305
  %309 = phi i64 [ 0, %305 ], [ %349, %346 ]
  %310 = phi float [ %306, %305 ], [ %348, %346 ]
  %311 = phi ptr [ null, %305 ], [ %347, %346 ]
  %312 = mul nuw nsw i64 %309, 40
  %313 = getelementptr inbounds nuw i8, ptr %149, i64 %312
  %314 = getelementptr inbounds nuw i8, ptr %313, i64 20
  %315 = icmp eq i64 %309, %208
  br i1 %315, label %346, label %316

316:                                              ; preds = %308
  %317 = getelementptr inbounds nuw i8, ptr %313, i64 36
  %318 = load i8, ptr %317, align 4, !tbaa !42
  %319 = icmp eq i8 %318, 0
  br i1 %319, label %346, label %320

320:                                              ; preds = %316
  br i1 %290, label %326, label %321

321:                                              ; preds = %320
  %322 = getelementptr inbounds nuw i8, ptr %313, i64 32
  %323 = load float, ptr %322, align 4, !tbaa !44
  %324 = load float, ptr %307, align 4, !tbaa !31
  %325 = fcmp ogt float %323, %324
  br i1 %325, label %346, label %326

326:                                              ; preds = %321, %320
  %327 = load float, ptr %209, align 4, !tbaa !32
  %328 = load float, ptr %211, align 4, !tbaa !33
  %329 = load float, ptr %314, align 4, !tbaa !45
  %330 = getelementptr inbounds nuw i8, ptr %313, i64 24
  %331 = load float, ptr %330, align 4, !tbaa !46
  %332 = fsub float %327, %329
  %333 = fsub float %328, %331
  %334 = fmul float %333, %333
  %335 = tail call noundef float @llvm.fmuladd.f32(float %332, float %332, float %334)
  %336 = fcmp ogt float %335, 1.690000e+04
  br i1 %336, label %346, label %337

337:                                              ; preds = %326
  %338 = getelementptr inbounds nuw i8, ptr %313, i64 28
  %339 = load float, ptr %338, align 4, !tbaa !47
  %340 = tail call float @llvm.sqrt.f32(float %335)
  %341 = fadd float %340, %339
  %342 = fadd float %310, 0x3F50624DE0000000
  %343 = fcmp ugt float %341, %342
  %344 = select i1 %343, ptr %311, ptr %314
  %345 = select i1 %343, float %310, float %341
  br label %346

346:                                              ; preds = %337, %326, %321, %316, %308
  %347 = phi ptr [ %311, %316 ], [ %311, %308 ], [ %311, %321 ], [ %344, %337 ], [ %311, %326 ]
  %348 = phi float [ %310, %316 ], [ %310, %308 ], [ %310, %321 ], [ %345, %337 ], [ %310, %326 ]
  %349 = add nuw nsw i64 %309, 1
  %350 = icmp eq i64 %349, %22
  br i1 %350, label %351, label %308, !llvm.loop !48

351:                                              ; preds = %346
  %352 = icmp eq ptr %347, null
  br i1 %352, label %356, label %353

353:                                              ; preds = %351
  %354 = load <4 x float>, ptr %347, align 4, !tbaa !11
  store <4 x float> %354, ptr %283, align 4, !tbaa !11
  store i8 1, ptr %288, align 4, !tbaa !28
  store i8 0, ptr %284, align 1, !tbaa !28
  %355 = getelementptr inbounds nuw i8, ptr %209, i64 50
  store i16 0, ptr %355, align 2
  br label %356

356:                                              ; preds = %353, %351, %282
  %357 = add nuw nsw i64 %208, 1
  %358 = icmp samesign ult i64 %357, %206
  br i1 %358, label %207, label %359, !llvm.loop !49

359:                                              ; preds = %356, %15
  %360 = fmul float %1, 6.000000e+00
  %361 = fmul float %1, 0x3FFA666680000000
  %362 = tail call float @sqrtf(float noundef %361) #8, !tbaa !15
  %363 = load i32, ptr %16, align 4, !tbaa !12
  %364 = icmp sgt i32 %363, 0
  br i1 %364, label %365, label %539

365:                                              ; preds = %359
  %366 = fneg float %360
  %367 = fneg float %362
  %368 = fadd float %362, %362
  %369 = getelementptr inbounds nuw i8, ptr %0, i64 14488
  %370 = getelementptr inbounds nuw i8, ptr %0, i64 14468
  %371 = getelementptr inbounds nuw i8, ptr %0, i64 14472
  %372 = getelementptr inbounds nuw i8, ptr %0, i64 14484
  %373 = getelementptr inbounds nuw i8, ptr %0, i64 14340
  br label %374

374:                                              ; preds = %534, %365
  %375 = phi i64 [ 0, %365 ], [ %535, %534 ]
  %376 = getelementptr inbounds nuw [256 x %struct.Bee], ptr %0, i64 0, i64 %375
  %377 = getelementptr inbounds nuw i8, ptr %376, i64 53
  %378 = load i8, ptr %377, align 1, !tbaa !18
  %379 = icmp eq i8 %378, 0
  br i1 %379, label %380, label %422

380:                                              ; preds = %374
  %381 = getelementptr inbounds nuw i8, ptr %376, i64 12
  %382 = getelementptr inbounds nuw i8, ptr %376, i64 52
  %383 = load i8, ptr %382, align 4, !tbaa !50
  %384 = icmp ne i8 %383, 0
  %385 = zext i1 %384 to i64
  %386 = getelementptr inbounds nuw [2 x %struct.Belief], ptr %381, i64 0, i64 %385
  %387 = getelementptr inbounds nuw i8, ptr %386, i64 16
  %388 = load i8, ptr %387, align 4, !tbaa !19
  %389 = icmp eq i8 %388, 0
  br i1 %389, label %422, label %390

390:                                              ; preds = %380
  %391 = getelementptr inbounds nuw i8, ptr %386, i64 4
  %392 = load float, ptr %391, align 4, !tbaa !35
  %393 = load float, ptr %386, align 4, !tbaa !34
  %394 = load <2 x float>, ptr %376, align 4, !tbaa !11
  %395 = extractelement <2 x float> %394, i64 1
  %396 = fsub float %392, %395
  %397 = extractelement <2 x float> %394, i64 0
  %398 = fsub float %393, %397
  %399 = tail call float @atan2f(float noundef %396, float noundef %398) #8, !tbaa !15
  %400 = getelementptr inbounds nuw i8, ptr %376, i64 8
  %401 = load float, ptr %400, align 4, !tbaa !16
  %402 = fsub float %399, %401
  %403 = fcmp ogt float %402, 0x400921FB60000000
  br i1 %403, label %407, label %404

404:                                              ; preds = %407, %390
  %405 = phi float [ %402, %390 ], [ %409, %407 ]
  %406 = fcmp olt float %405, 0xC00921FB60000000
  br i1 %406, label %411, label %415

407:                                              ; preds = %390, %407
  %408 = phi float [ %409, %407 ], [ %402, %390 ]
  %409 = fadd float %408, 0xC01921FB60000000
  %410 = fcmp ogt float %409, 0x400921FB60000000
  br i1 %410, label %407, label %404, !llvm.loop !51

411:                                              ; preds = %404, %411
  %412 = phi float [ %413, %411 ], [ %405, %404 ]
  %413 = fadd float %412, 0x401921FB60000000
  %414 = fcmp olt float %413, 0xC00921FB60000000
  br i1 %414, label %411, label %415, !llvm.loop !52

415:                                              ; preds = %411, %404
  %416 = phi float [ %405, %404 ], [ %413, %411 ]
  %417 = fcmp ogt float %416, %360
  %418 = select i1 %417, float %360, float %416
  %419 = fcmp olt float %418, %366
  %420 = select i1 %419, float %366, float %418
  %421 = fadd float %401, %420
  store float %421, ptr %400, align 4, !tbaa !16
  br label %438

422:                                              ; preds = %380, %374
  %423 = load i32, ptr %369, align 4, !tbaa !14
  %424 = shl i32 %423, 13
  %425 = xor i32 %424, %423
  %426 = lshr i32 %425, 17
  %427 = xor i32 %426, %425
  %428 = shl i32 %427, 5
  %429 = xor i32 %428, %427
  store i32 %429, ptr %369, align 4, !tbaa !14
  %430 = lshr i32 %429, 8
  %431 = uitofp nneg i32 %430 to float
  %432 = fmul float %368, %431
  %433 = tail call float @llvm.fmuladd.f32(float %432, float 0x3E70000000000000, float %367)
  %434 = getelementptr inbounds nuw i8, ptr %376, i64 8
  %435 = load float, ptr %434, align 4, !tbaa !16
  %436 = fadd float %435, %433
  store float %436, ptr %434, align 4, !tbaa !16
  %437 = load <2 x float>, ptr %376, align 4, !tbaa !11
  br label %438

438:                                              ; preds = %422, %415
  %439 = phi float [ %436, %422 ], [ %421, %415 ]
  %440 = phi <2 x float> [ %437, %422 ], [ %394, %415 ]
  %441 = getelementptr inbounds nuw i8, ptr %376, i64 8
  %442 = tail call float @cosf(float noundef %439) #8, !tbaa !15
  %443 = tail call float @sinf(float noundef %439) #8, !tbaa !15
  %444 = getelementptr inbounds nuw i8, ptr %376, i64 4
  %445 = insertelement <2 x float> poison, float %442, i64 0
  %446 = insertelement <2 x float> %445, float %443, i64 1
  %447 = fmul <2 x float> %446, splat (float 1.100000e+02)
  %448 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %447, <2 x float> %6, <2 x float> %440)
  store <2 x float> %448, ptr %376, align 4, !tbaa !11
  %449 = extractelement <2 x float> %448, i64 0
  %450 = fcmp olt float %449, 1.000000e+00
  br i1 %450, label %453, label %451

451:                                              ; preds = %438
  %452 = fcmp ogt float %449, 1.279000e+03
  br i1 %452, label %453, label %456

453:                                              ; preds = %451, %438
  %454 = phi float [ 1.000000e+00, %438 ], [ 1.279000e+03, %451 ]
  store float %454, ptr %376, align 4, !tbaa !32
  %455 = fsub float 0x400921FB60000000, %439
  store float %455, ptr %441, align 4, !tbaa !16
  br label %456

456:                                              ; preds = %453, %451
  %457 = phi float [ %449, %451 ], [ %454, %453 ]
  %458 = phi float [ %439, %451 ], [ %455, %453 ]
  %459 = extractelement <2 x float> %448, i64 1
  %460 = fcmp olt float %459, 1.000000e+00
  br i1 %460, label %463, label %461

461:                                              ; preds = %456
  %462 = fcmp ogt float %459, 7.190000e+02
  br i1 %462, label %463, label %466

463:                                              ; preds = %461, %456
  %464 = phi float [ 1.000000e+00, %456 ], [ 7.190000e+02, %461 ]
  store float %464, ptr %444, align 4, !tbaa !33
  %465 = fneg float %458
  store float %465, ptr %441, align 4, !tbaa !16
  br label %466

466:                                              ; preds = %463, %461
  %467 = phi float [ %459, %461 ], [ %464, %463 ]
  br i1 %379, label %468, label %534

468:                                              ; preds = %466
  %469 = getelementptr inbounds nuw i8, ptr %376, i64 52
  %470 = load i8, ptr %469, align 4, !tbaa !50
  %471 = icmp eq i8 %470, 0
  br i1 %471, label %485, label %472

472:                                              ; preds = %468
  %473 = load float, ptr %370, align 4, !tbaa !25
  %474 = fsub float %457, %473
  %475 = tail call float @llvm.fabs.f32(float %474)
  %476 = fcmp ugt float %475, 2.400000e+01
  br i1 %476, label %534, label %477

477:                                              ; preds = %472
  %478 = load float, ptr %371, align 4, !tbaa !26
  %479 = fsub float %467, %478
  %480 = tail call float @llvm.fabs.f32(float %479)
  %481 = fcmp ugt float %480, 2.400000e+01
  br i1 %481, label %534, label %482

482:                                              ; preds = %477
  store i8 0, ptr %469, align 4, !tbaa !50
  %483 = load i32, ptr %372, align 4, !tbaa !53
  %484 = add nsw i32 %483, 1
  store i32 %484, ptr %372, align 4, !tbaa !53
  br label %534

485:                                              ; preds = %468, %515
  %486 = phi i64 [ %518, %515 ], [ 0, %468 ]
  %487 = phi float [ %517, %515 ], [ 7.000000e+00, %468 ]
  %488 = phi i32 [ %516, %515 ], [ -1, %468 ]
  %489 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %373, i64 0, i64 %486
  %490 = getelementptr inbounds nuw i8, ptr %489, i64 12
  %491 = load i8, ptr %490, align 4, !tbaa !24
  %492 = icmp eq i8 %491, 0
  br i1 %492, label %515, label %493

493:                                              ; preds = %485
  %494 = load float, ptr %489, align 4, !tbaa !36
  %495 = getelementptr inbounds nuw i8, ptr %489, i64 4
  %496 = load float, ptr %495, align 4, !tbaa !37
  %497 = fsub float %457, %494
  %498 = fsub float %467, %496
  %499 = fmul float %498, %498
  %500 = tail call noundef float @llvm.fmuladd.f32(float %497, float %497, float %499)
  %501 = tail call float @llvm.sqrt.f32(float %500)
  %502 = getelementptr inbounds nuw i8, ptr %489, i64 8
  %503 = load i32, ptr %502, align 4, !tbaa !5
  %504 = sitofp i32 %503 to float
  %505 = fmul float %504, 0x3F8D41D420000000
  %506 = fcmp olt float %505, 0.000000e+00
  %507 = select i1 %506, float 0.000000e+00, float %505
  %508 = tail call float @llvm.sqrt.f32(float %507)
  %509 = tail call float @llvm.fmuladd.f32(float %508, float 1.800000e+01, float 8.000000e+00)
  %510 = fsub float %501, %509
  %511 = fcmp olt float %510, %487
  %512 = trunc nuw nsw i64 %486 to i32
  %513 = select i1 %511, i32 %512, i32 %488
  %514 = select i1 %511, float %510, float %487
  br label %515

515:                                              ; preds = %493, %485
  %516 = phi i32 [ %513, %493 ], [ %488, %485 ]
  %517 = phi float [ %514, %493 ], [ %487, %485 ]
  %518 = add nuw nsw i64 %486, 1
  %519 = icmp eq i64 %518, 8
  br i1 %519, label %520, label %485, !llvm.loop !38

520:                                              ; preds = %515
  %521 = icmp sgt i32 %516, -1
  br i1 %521, label %522, label %534

522:                                              ; preds = %520
  store i8 1, ptr %469, align 4, !tbaa !50
  %523 = zext nneg i32 %516 to i64
  %524 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %373, i64 0, i64 %523
  %525 = getelementptr inbounds nuw i8, ptr %524, i64 8
  %526 = load i32, ptr %525, align 4, !tbaa !5
  %527 = add nsw i32 %526, -1
  store i32 %527, ptr %525, align 4, !tbaa !5
  %528 = icmp slt i32 %526, 2
  br i1 %528, label %529, label %534

529:                                              ; preds = %522
  %530 = getelementptr inbounds nuw i8, ptr %524, i64 12
  store i8 0, ptr %530, align 4, !tbaa !24
  %531 = getelementptr inbounds nuw i8, ptr %376, i64 28
  store i8 0, ptr %531, align 4, !tbaa !19
  %532 = getelementptr inbounds nuw i8, ptr %376, i64 29
  store i8 0, ptr %532, align 1, !tbaa !21
  %533 = getelementptr inbounds nuw i8, ptr %376, i64 20
  store <2 x float> <float 0x46293E5940000000, float 0.000000e+00>, ptr %533, align 4, !tbaa !11
  br label %534

534:                                              ; preds = %529, %522, %520, %482, %477, %472, %466
  %535 = add nuw nsw i64 %375, 1
  %536 = load i32, ptr %16, align 4, !tbaa !12
  %537 = sext i32 %536 to i64
  %538 = icmp slt i64 %535, %537
  br i1 %538, label %374, label %539, !llvm.loop !54

539:                                              ; preds = %534, %359
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @atan2f(float noundef, float noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #7

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nounwind willreturn memory(errnomem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nofree norecurse nounwind memory(argmem: readwrite, errnomem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree norecurse nounwind memory(read, argmem: readwrite, inaccessiblemem: none, errnomem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 21.1.8 (++20251221032922+2078da43e25a-1~exp1~20251221153059.70)"}
!5 = !{!6, !10, i64 8}
!6 = !{!"", !7, i64 0, !7, i64 4, !10, i64 8, !8, i64 12}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!7, !7, i64 0}
!12 = !{!13, !10, i64 14336}
!13 = !{!"", !8, i64 0, !10, i64 14336, !8, i64 14340, !7, i64 14468, !7, i64 14472, !7, i64 14476, !7, i64 14480, !10, i64 14484, !10, i64 14488, !8, i64 14492}
!14 = !{!13, !10, i64 14488}
!15 = !{!10, !10, i64 0}
!16 = !{!17, !7, i64 8}
!17 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !8, i64 12, !8, i64 52, !8, i64 53}
!18 = !{!17, !8, i64 53}
!19 = !{!20, !8, i64 16}
!20 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !8, i64 16, !8, i64 17}
!21 = !{!20, !8, i64 17}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = !{!6, !8, i64 12}
!25 = !{!13, !7, i64 14468}
!26 = !{!13, !7, i64 14472}
!27 = distinct !{!27, !23}
!28 = !{!8, !8, i64 0}
!29 = !{!13, !7, i64 14476}
!30 = distinct !{!30, !23}
!31 = !{!20, !7, i64 12}
!32 = !{!17, !7, i64 0}
!33 = !{!17, !7, i64 4}
!34 = !{!20, !7, i64 0}
!35 = !{!20, !7, i64 4}
!36 = !{!6, !7, i64 0}
!37 = !{!6, !7, i64 4}
!38 = distinct !{!38, !23}
!39 = distinct !{!39, !23}
!40 = !{!20, !7, i64 8}
!41 = distinct !{!41, !23}
!42 = !{!43, !8, i64 16}
!43 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !8, i64 16}
!44 = !{!43, !7, i64 12}
!45 = !{!43, !7, i64 0}
!46 = !{!43, !7, i64 4}
!47 = !{!43, !7, i64 8}
!48 = distinct !{!48, !23}
!49 = distinct !{!49, !23}
!50 = !{!17, !8, i64 52}
!51 = distinct !{!51, !23}
!52 = distinct !{!52, !23}
!53 = !{!13, !10, i64 14484}
!54 = distinct !{!54, !23}
