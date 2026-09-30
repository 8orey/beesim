; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.World = type { [120 x %struct.Bee], [8 x %struct.Resource], [120 x [2 x %struct.Shout]], float }
%struct.Bee = type { float, float, float, [2 x %struct.Belief], i32, i32 }
%struct.Belief = type { float, float, float, float, i32, i32 }
%struct.Resource = type { float, float, i32, i32 }
%struct.Shout = type { float, float, float, float, i32 }

; Function Attrs: nounwind uwtable
define dso_local void @app(ptr noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.World, align 4
  call void @llvm.lifetime.start.p0(i64 13092, ptr nonnull %2) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(13092) %2, i8 0, i64 13092, i1 false)
  br label %3

3:                                                ; preds = %3, %1
  %4 = phi i64 [ 0, %1 ], [ %42, %3 ]
  %5 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %2, i64 0, i64 %4
  %6 = tail call i32 @simRand(ptr noundef %0) #7
  %7 = and i32 %6, 65535
  %8 = uitofp nneg i32 %7 to float
  %9 = fmul float %8, 0x401921FB60000000
  %10 = fmul float %9, 0x3EF0000000000000
  %11 = fadd float %10, 0.000000e+00
  %12 = tail call i32 @simRand(ptr noundef %0) #7
  %13 = and i32 %12, 65535
  %14 = mul nuw nsw i32 %13, 48
  %15 = uitofp nneg i32 %14 to float
  %16 = fmul float %15, 0x3EF0000000000000
  %17 = fadd float %16, 0.000000e+00
  %18 = tail call float @cosf(float noundef %11) #7, !tbaa !5
  %19 = tail call float @sinf(float noundef %11) #7, !tbaa !5
  %20 = insertelement <2 x float> poison, float %18, i64 0
  %21 = insertelement <2 x float> %20, float %19, i64 1
  %22 = insertelement <2 x float> poison, float %17, i64 0
  %23 = shufflevector <2 x float> %22, <2 x float> poison, <2 x i32> zeroinitializer
  %24 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %21, <2 x float> %23, <2 x float> <float 6.400000e+02, float 3.600000e+02>)
  store <2 x float> %24, ptr %5, align 4, !tbaa !9
  %25 = tail call i32 @simRand(ptr noundef %0) #7
  %26 = and i32 %25, 65535
  %27 = uitofp nneg i32 %26 to float
  %28 = fmul float %27, 0x401921FB60000000
  %29 = fmul float %28, 0x3EF0000000000000
  %30 = fadd float %29, 0.000000e+00
  %31 = getelementptr inbounds nuw i8, ptr %5, i64 8
  store float %30, ptr %31, align 4, !tbaa !11
  %32 = trunc i64 %4 to i8
  %33 = urem i8 %32, 20
  %34 = icmp eq i8 %33, 0
  %35 = zext i1 %34 to i32
  %36 = getelementptr inbounds nuw i8, ptr %5, i64 64
  store i32 %35, ptr %36, align 4, !tbaa !13
  %37 = getelementptr inbounds nuw i8, ptr %5, i64 12
  store i64 0, ptr %37, align 4
  %38 = getelementptr inbounds nuw i8, ptr %5, i64 20
  store float 0x46293E5940000000, ptr %38, align 4, !tbaa !9
  %39 = getelementptr inbounds nuw i8, ptr %5, i64 24
  %40 = getelementptr inbounds nuw i8, ptr %5, i64 44
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(20) %39, i8 0, i64 20, i1 false)
  store float 0x46293E5940000000, ptr %40, align 4, !tbaa !9
  %41 = getelementptr inbounds nuw i8, ptr %5, i64 48
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %41, i8 0, i64 12, i1 false)
  %42 = add nuw nsw i64 %4, 1
  %43 = icmp eq i64 %42, 120
  br i1 %43, label %44, label %3, !llvm.loop !14

44:                                               ; preds = %3
  call fastcc void @resource_spawn(ptr noundef nonnull %2, ptr noundef %0)
  call fastcc void @resource_spawn(ptr noundef nonnull %2, ptr noundef %0)
  %45 = getelementptr inbounds nuw i8, ptr %2, i64 13088
  %46 = getelementptr inbounds nuw i8, ptr %2, i64 8160
  %47 = getelementptr inbounds nuw i8, ptr %2, i64 8288
  br label %48

48:                                               ; preds = %712, %44
  %49 = phi i32 [ 0, %44 ], [ %52, %712 ]
  %50 = call i32 @simClicks(ptr noundef %0) #7
  %51 = and i32 %50, 1
  %52 = xor i32 %51, %49
  %53 = load float, ptr %45, align 4, !tbaa !16
  %54 = fadd float %53, 0x3F91111120000000
  store float %54, ptr %45, align 4, !tbaa !16
  %55 = fcmp ult float %54, 1.000000e+01
  br i1 %55, label %58, label %56

56:                                               ; preds = %48
  %57 = fadd float %54, -1.000000e+01
  store float %57, ptr %45, align 4, !tbaa !16
  call fastcc void @resource_spawn(ptr noundef nonnull %2, ptr noundef %0)
  br label %58

58:                                               ; preds = %56, %48
  br label %59

59:                                               ; preds = %58, %172
  %60 = phi i64 [ %173, %172 ], [ 0, %58 ]
  %61 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %2, i64 0, i64 %60
  %62 = getelementptr inbounds nuw i8, ptr %61, i64 12
  %63 = getelementptr inbounds nuw i8, ptr %61, i64 4
  %64 = getelementptr inbounds nuw i8, ptr %61, i64 28
  %65 = load i32, ptr %64, align 4, !tbaa !18
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %90, label %67

67:                                               ; preds = %59
  %68 = getelementptr inbounds nuw i8, ptr %61, i64 24
  %69 = load float, ptr %68, align 4, !tbaa !20
  %70 = fadd float %69, 0x3F91111120000000
  store float %70, ptr %68, align 4, !tbaa !20
  %71 = fcmp ult float %70, 3.000000e+00
  br i1 %71, label %72, label %87

72:                                               ; preds = %67
  %73 = getelementptr inbounds nuw i8, ptr %61, i64 32
  %74 = load i32, ptr %73, align 4, !tbaa !21
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %89

76:                                               ; preds = %72
  %77 = load float, ptr %61, align 4, !tbaa !22
  %78 = load float, ptr %63, align 4, !tbaa !23
  %79 = load float, ptr %62, align 4, !tbaa !24
  %80 = getelementptr inbounds nuw i8, ptr %61, i64 16
  %81 = load float, ptr %80, align 4, !tbaa !25
  %82 = fsub float %77, %79
  %83 = fsub float %78, %81
  %84 = fmul float %83, %83
  %85 = call noundef float @llvm.fmuladd.f32(float %82, float %82, float %84)
  %86 = fcmp olt float %85, 3.600000e+01
  br i1 %86, label %87, label %89

87:                                               ; preds = %76, %67
  store i64 0, ptr %62, align 4
  %88 = getelementptr inbounds nuw i8, ptr %61, i64 20
  store float 0x46293E5940000000, ptr %88, align 4, !tbaa !9
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %68, i8 0, i64 12, i1 false)
  br label %90

89:                                               ; preds = %76, %72
  store i32 0, ptr %73, align 4, !tbaa !21
  br label %90

90:                                               ; preds = %89, %87, %59
  %91 = getelementptr inbounds nuw i8, ptr %61, i64 36
  %92 = getelementptr inbounds nuw i8, ptr %61, i64 52
  %93 = load i32, ptr %92, align 4, !tbaa !18
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %118, label %95

95:                                               ; preds = %90
  %96 = getelementptr inbounds nuw i8, ptr %61, i64 48
  %97 = load float, ptr %96, align 4, !tbaa !20
  %98 = fadd float %97, 0x3F91111120000000
  store float %98, ptr %96, align 4, !tbaa !20
  %99 = fcmp ult float %98, 3.000000e+00
  br i1 %99, label %100, label %116

100:                                              ; preds = %95
  %101 = getelementptr inbounds nuw i8, ptr %61, i64 56
  %102 = load i32, ptr %101, align 4, !tbaa !21
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %115

104:                                              ; preds = %100
  %105 = load float, ptr %61, align 4, !tbaa !22
  %106 = load float, ptr %63, align 4, !tbaa !23
  %107 = load float, ptr %91, align 4, !tbaa !24
  %108 = getelementptr inbounds nuw i8, ptr %61, i64 40
  %109 = load float, ptr %108, align 4, !tbaa !25
  %110 = fsub float %105, %107
  %111 = fsub float %106, %109
  %112 = fmul float %111, %111
  %113 = call noundef float @llvm.fmuladd.f32(float %110, float %110, float %112)
  %114 = fcmp olt float %113, 3.600000e+01
  br i1 %114, label %116, label %115

115:                                              ; preds = %104, %100
  store i32 0, ptr %101, align 4, !tbaa !21
  br label %118

116:                                              ; preds = %104, %95
  store i64 0, ptr %91, align 4
  %117 = getelementptr inbounds nuw i8, ptr %61, i64 44
  store float 0x46293E5940000000, ptr %117, align 4, !tbaa !9
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %96, i8 0, i64 12, i1 false)
  br label %118

118:                                              ; preds = %116, %115, %90
  %119 = load float, ptr %61, align 4, !tbaa !22
  %120 = load float, ptr %63, align 4, !tbaa !23
  %121 = fadd float %119, -6.400000e+02
  %122 = fadd float %120, -3.600000e+02
  %123 = fmul float %122, %122
  %124 = call noundef float @llvm.fmuladd.f32(float %121, float %121, float %123)
  %125 = fcmp ugt float %124, 1.600000e+03
  br i1 %125, label %128, label %126

126:                                              ; preds = %118
  store <4 x float> <float 6.400000e+02, float 3.600000e+02, float 0.000000e+00, float 0.000000e+00>, ptr %91, align 4, !tbaa !9
  store i32 1, ptr %92, align 4, !tbaa !5
  %127 = getelementptr inbounds nuw i8, ptr %61, i64 56
  store i32 1, ptr %127, align 4, !tbaa !5
  br label %128

128:                                              ; preds = %126, %118
  br label %129

129:                                              ; preds = %128, %159
  %130 = phi i64 [ %162, %159 ], [ 0, %128 ]
  %131 = phi float [ %161, %159 ], [ 4.000000e+01, %128 ]
  %132 = phi i32 [ %160, %159 ], [ -1, %128 ]
  %133 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %46, i64 0, i64 %130
  %134 = getelementptr inbounds nuw i8, ptr %133, i64 12
  %135 = load i32, ptr %134, align 4, !tbaa !26
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %159, label %137

137:                                              ; preds = %129
  %138 = load float, ptr %133, align 4, !tbaa !28
  %139 = getelementptr inbounds nuw i8, ptr %133, i64 4
  %140 = load float, ptr %139, align 4, !tbaa !29
  %141 = fsub float %119, %138
  %142 = fsub float %120, %140
  %143 = fmul float %142, %142
  %144 = call noundef float @llvm.fmuladd.f32(float %141, float %141, float %143)
  %145 = call float @llvm.sqrt.f32(float %144)
  %146 = getelementptr inbounds nuw i8, ptr %133, i64 8
  %147 = load i32, ptr %146, align 4, !tbaa !30
  %148 = sitofp i32 %147 to float
  %149 = fdiv float %148, 7.000000e+01
  %150 = fcmp olt float %149, 0.000000e+00
  %151 = select i1 %150, float 0.000000e+00, float %149
  %152 = call float @llvm.sqrt.f32(float %151)
  %153 = call float @llvm.fmuladd.f32(float %152, float 1.800000e+01, float 8.000000e+00)
  %154 = fsub float %145, %153
  %155 = fcmp olt float %154, %131
  %156 = trunc nuw nsw i64 %130 to i32
  %157 = select i1 %155, i32 %156, i32 %132
  %158 = select i1 %155, float %154, float %131
  br label %159

159:                                              ; preds = %137, %129
  %160 = phi i32 [ %157, %137 ], [ %132, %129 ]
  %161 = phi float [ %158, %137 ], [ %131, %129 ]
  %162 = add nuw nsw i64 %130, 1
  %163 = icmp eq i64 %162, 8
  br i1 %163, label %164, label %129, !llvm.loop !31

164:                                              ; preds = %159
  %165 = icmp sgt i32 %160, -1
  br i1 %165, label %166, label %172

166:                                              ; preds = %164
  %167 = zext nneg i32 %160 to i64
  %168 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %46, i64 0, i64 %167
  %169 = load <2 x float>, ptr %168, align 4, !tbaa !9
  store <2 x float> %169, ptr %62, align 4, !tbaa !9
  %170 = getelementptr inbounds nuw i8, ptr %61, i64 20
  store <2 x float> zeroinitializer, ptr %170, align 4, !tbaa !9
  store i32 1, ptr %64, align 4, !tbaa !5
  %171 = getelementptr inbounds nuw i8, ptr %61, i64 32
  store i32 1, ptr %171, align 4, !tbaa !5
  br label %172

172:                                              ; preds = %166, %164
  %173 = add nuw nsw i64 %60, 1
  %174 = icmp eq i64 %173, 120
  br i1 %174, label %175, label %59, !llvm.loop !32

175:                                              ; preds = %172, %175
  %176 = phi i64 [ %226, %175 ], [ 0, %172 ]
  %177 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %2, i64 0, i64 %176
  %178 = getelementptr inbounds nuw i8, ptr %177, i64 12
  %179 = getelementptr inbounds nuw [120 x [2 x %struct.Shout]], ptr %47, i64 0, i64 %176, i64 0
  %180 = load float, ptr %178, align 4, !tbaa !24
  %181 = getelementptr inbounds nuw i8, ptr %177, i64 16
  %182 = load float, ptr %181, align 4, !tbaa !25
  %183 = getelementptr inbounds nuw i8, ptr %177, i64 20
  %184 = load float, ptr %183, align 4, !tbaa !33
  %185 = getelementptr inbounds nuw i8, ptr %177, i64 24
  %186 = load float, ptr %185, align 4, !tbaa !20
  %187 = getelementptr inbounds nuw i8, ptr %177, i64 28
  %188 = load i32, ptr %187, align 4, !tbaa !18
  %189 = load <2 x float>, ptr %177, align 4, !tbaa !9
  %190 = extractelement <2 x float> %189, i64 0
  %191 = fsub float %190, %180
  %192 = extractelement <2 x float> %189, i64 1
  %193 = fsub float %192, %182
  %194 = fmul float %193, %193
  %195 = call noundef float @llvm.fmuladd.f32(float %191, float %191, float %194)
  %196 = call float @llvm.sqrt.f32(float %195)
  %197 = fadd float %184, %196
  store <2 x float> %189, ptr %179, align 4, !tbaa !9
  %198 = getelementptr inbounds nuw i8, ptr %179, i64 8
  store float %197, ptr %198, align 4, !tbaa !9
  %199 = getelementptr inbounds nuw i8, ptr %179, i64 12
  store float %186, ptr %199, align 4, !tbaa !9
  %200 = getelementptr inbounds nuw i8, ptr %179, i64 16
  store i32 %188, ptr %200, align 4, !tbaa !5
  %201 = getelementptr inbounds nuw i8, ptr %177, i64 36
  %202 = mul nuw nsw i64 %176, 40
  %203 = getelementptr inbounds nuw i8, ptr %47, i64 %202
  %204 = getelementptr inbounds nuw i8, ptr %203, i64 20
  %205 = load float, ptr %201, align 4, !tbaa !24
  %206 = getelementptr inbounds nuw i8, ptr %177, i64 40
  %207 = load float, ptr %206, align 4, !tbaa !25
  %208 = getelementptr inbounds nuw i8, ptr %177, i64 44
  %209 = load float, ptr %208, align 4, !tbaa !33
  %210 = getelementptr inbounds nuw i8, ptr %177, i64 48
  %211 = load float, ptr %210, align 4, !tbaa !20
  %212 = getelementptr inbounds nuw i8, ptr %177, i64 52
  %213 = load i32, ptr %212, align 4, !tbaa !18
  %214 = load <2 x float>, ptr %177, align 4, !tbaa !9
  %215 = extractelement <2 x float> %214, i64 0
  %216 = fsub float %215, %205
  %217 = extractelement <2 x float> %214, i64 1
  %218 = fsub float %217, %207
  %219 = fmul float %218, %218
  %220 = call noundef float @llvm.fmuladd.f32(float %216, float %216, float %219)
  %221 = call float @llvm.sqrt.f32(float %220)
  %222 = fadd float %209, %221
  store <2 x float> %214, ptr %204, align 4, !tbaa !9
  %223 = getelementptr inbounds nuw i8, ptr %203, i64 28
  store float %222, ptr %223, align 4, !tbaa !9
  %224 = getelementptr inbounds nuw i8, ptr %203, i64 32
  store float %211, ptr %224, align 4, !tbaa !9
  %225 = getelementptr inbounds nuw i8, ptr %203, i64 36
  store i32 %213, ptr %225, align 4, !tbaa !5
  %226 = add nuw nsw i64 %176, 1
  %227 = icmp eq i64 %226, 120
  br i1 %227, label %228, label %175, !llvm.loop !34

228:                                              ; preds = %175, %375
  %229 = phi i64 [ %376, %375 ], [ 0, %175 ]
  %230 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %2, i64 0, i64 %229
  %231 = getelementptr inbounds nuw i8, ptr %230, i64 12
  %232 = getelementptr inbounds nuw i8, ptr %230, i64 4
  %233 = getelementptr inbounds nuw i8, ptr %230, i64 32
  %234 = load i32, ptr %233, align 4, !tbaa !21
  %235 = icmp eq i32 %234, 0
  br i1 %235, label %236, label %302

236:                                              ; preds = %228
  %237 = getelementptr inbounds nuw i8, ptr %230, i64 28
  %238 = load i32, ptr %237, align 4, !tbaa !18
  %239 = icmp eq i32 %238, 0
  br i1 %239, label %254, label %240

240:                                              ; preds = %236
  %241 = load float, ptr %230, align 4, !tbaa !22
  %242 = load float, ptr %232, align 4, !tbaa !23
  %243 = load float, ptr %231, align 4, !tbaa !24
  %244 = getelementptr inbounds nuw i8, ptr %230, i64 16
  %245 = load float, ptr %244, align 4, !tbaa !25
  %246 = fsub float %241, %243
  %247 = fsub float %242, %245
  %248 = fmul float %247, %247
  %249 = call noundef float @llvm.fmuladd.f32(float %246, float %246, float %248)
  %250 = call float @llvm.sqrt.f32(float %249)
  %251 = getelementptr inbounds nuw i8, ptr %230, i64 20
  %252 = load float, ptr %251, align 4, !tbaa !33
  %253 = fadd float %252, %250
  br label %254

254:                                              ; preds = %240, %236
  %255 = phi float [ %253, %240 ], [ 0x46293E5940000000, %236 ]
  %256 = getelementptr inbounds nuw i8, ptr %230, i64 24
  br label %259

257:                                              ; preds = %295
  %258 = icmp eq ptr %296, null
  br i1 %258, label %302, label %300

259:                                              ; preds = %295, %254
  %260 = phi i64 [ 0, %254 ], [ %298, %295 ]
  %261 = phi float [ %255, %254 ], [ %297, %295 ]
  %262 = phi ptr [ null, %254 ], [ %296, %295 ]
  %263 = getelementptr inbounds nuw [120 x [2 x %struct.Shout]], ptr %47, i64 0, i64 %260, i64 0
  %264 = icmp eq i64 %260, %229
  br i1 %264, label %295, label %265

265:                                              ; preds = %259
  %266 = getelementptr inbounds nuw i8, ptr %263, i64 16
  %267 = load i32, ptr %266, align 4, !tbaa !35
  %268 = icmp eq i32 %267, 0
  br i1 %268, label %295, label %269

269:                                              ; preds = %265
  br i1 %239, label %275, label %270

270:                                              ; preds = %269
  %271 = getelementptr inbounds nuw i8, ptr %263, i64 12
  %272 = load float, ptr %271, align 4, !tbaa !37
  %273 = load float, ptr %256, align 4, !tbaa !20
  %274 = fcmp ogt float %272, %273
  br i1 %274, label %295, label %275

275:                                              ; preds = %270, %269
  %276 = load float, ptr %230, align 4, !tbaa !22
  %277 = load float, ptr %232, align 4, !tbaa !23
  %278 = load float, ptr %263, align 4, !tbaa !38
  %279 = getelementptr inbounds nuw i8, ptr %263, i64 4
  %280 = load float, ptr %279, align 4, !tbaa !39
  %281 = fsub float %276, %278
  %282 = fsub float %277, %280
  %283 = fmul float %282, %282
  %284 = call noundef float @llvm.fmuladd.f32(float %281, float %281, float %283)
  %285 = fcmp ogt float %284, 1.690000e+04
  br i1 %285, label %295, label %286

286:                                              ; preds = %275
  %287 = getelementptr inbounds nuw i8, ptr %263, i64 8
  %288 = load float, ptr %287, align 4, !tbaa !40
  %289 = call float @llvm.sqrt.f32(float %284)
  %290 = fadd float %289, %288
  %291 = fadd float %261, 0x3F50624DE0000000
  %292 = fcmp ugt float %290, %291
  %293 = select i1 %292, ptr %262, ptr %263
  %294 = select i1 %292, float %261, float %290
  br label %295

295:                                              ; preds = %286, %275, %270, %265, %259
  %296 = phi ptr [ %262, %265 ], [ %262, %259 ], [ %262, %270 ], [ %293, %286 ], [ %262, %275 ]
  %297 = phi float [ %261, %265 ], [ %261, %259 ], [ %261, %270 ], [ %294, %286 ], [ %261, %275 ]
  %298 = add nuw nsw i64 %260, 1
  %299 = icmp eq i64 %298, 120
  br i1 %299, label %257, label %259, !llvm.loop !41

300:                                              ; preds = %257
  %301 = load <4 x float>, ptr %296, align 4, !tbaa !9
  store <4 x float> %301, ptr %231, align 4, !tbaa !9
  store i32 1, ptr %237, align 4, !tbaa !5
  store i32 0, ptr %233, align 4, !tbaa !5
  br label %302

302:                                              ; preds = %300, %257, %228
  %303 = getelementptr inbounds nuw i8, ptr %230, i64 36
  %304 = getelementptr inbounds nuw i8, ptr %230, i64 56
  %305 = load i32, ptr %304, align 4, !tbaa !21
  %306 = icmp eq i32 %305, 0
  br i1 %306, label %307, label %375

307:                                              ; preds = %302
  %308 = getelementptr inbounds nuw i8, ptr %230, i64 52
  %309 = load i32, ptr %308, align 4, !tbaa !18
  %310 = icmp eq i32 %309, 0
  br i1 %310, label %325, label %311

311:                                              ; preds = %307
  %312 = load float, ptr %230, align 4, !tbaa !22
  %313 = load float, ptr %232, align 4, !tbaa !23
  %314 = load float, ptr %303, align 4, !tbaa !24
  %315 = getelementptr inbounds nuw i8, ptr %230, i64 40
  %316 = load float, ptr %315, align 4, !tbaa !25
  %317 = fsub float %312, %314
  %318 = fsub float %313, %316
  %319 = fmul float %318, %318
  %320 = call noundef float @llvm.fmuladd.f32(float %317, float %317, float %319)
  %321 = call float @llvm.sqrt.f32(float %320)
  %322 = getelementptr inbounds nuw i8, ptr %230, i64 44
  %323 = load float, ptr %322, align 4, !tbaa !33
  %324 = fadd float %323, %321
  br label %325

325:                                              ; preds = %311, %307
  %326 = phi float [ %324, %311 ], [ 0x46293E5940000000, %307 ]
  %327 = getelementptr inbounds nuw i8, ptr %230, i64 48
  br label %328

328:                                              ; preds = %366, %325
  %329 = phi i64 [ 0, %325 ], [ %369, %366 ]
  %330 = phi float [ %326, %325 ], [ %368, %366 ]
  %331 = phi ptr [ null, %325 ], [ %367, %366 ]
  %332 = mul nuw nsw i64 %329, 40
  %333 = getelementptr inbounds nuw i8, ptr %47, i64 %332
  %334 = getelementptr inbounds nuw i8, ptr %333, i64 20
  %335 = icmp eq i64 %329, %229
  br i1 %335, label %366, label %336

336:                                              ; preds = %328
  %337 = getelementptr inbounds nuw i8, ptr %333, i64 36
  %338 = load i32, ptr %337, align 4, !tbaa !35
  %339 = icmp eq i32 %338, 0
  br i1 %339, label %366, label %340

340:                                              ; preds = %336
  br i1 %310, label %346, label %341

341:                                              ; preds = %340
  %342 = getelementptr inbounds nuw i8, ptr %333, i64 32
  %343 = load float, ptr %342, align 4, !tbaa !37
  %344 = load float, ptr %327, align 4, !tbaa !20
  %345 = fcmp ogt float %343, %344
  br i1 %345, label %366, label %346

346:                                              ; preds = %341, %340
  %347 = load float, ptr %230, align 4, !tbaa !22
  %348 = load float, ptr %232, align 4, !tbaa !23
  %349 = load float, ptr %334, align 4, !tbaa !38
  %350 = getelementptr inbounds nuw i8, ptr %333, i64 24
  %351 = load float, ptr %350, align 4, !tbaa !39
  %352 = fsub float %347, %349
  %353 = fsub float %348, %351
  %354 = fmul float %353, %353
  %355 = call noundef float @llvm.fmuladd.f32(float %352, float %352, float %354)
  %356 = fcmp ogt float %355, 1.690000e+04
  br i1 %356, label %366, label %357

357:                                              ; preds = %346
  %358 = getelementptr inbounds nuw i8, ptr %333, i64 28
  %359 = load float, ptr %358, align 4, !tbaa !40
  %360 = call float @llvm.sqrt.f32(float %355)
  %361 = fadd float %360, %359
  %362 = fadd float %330, 0x3F50624DE0000000
  %363 = fcmp ugt float %361, %362
  %364 = select i1 %363, ptr %331, ptr %334
  %365 = select i1 %363, float %330, float %361
  br label %366

366:                                              ; preds = %357, %346, %341, %336, %328
  %367 = phi ptr [ %331, %336 ], [ %331, %328 ], [ %331, %341 ], [ %364, %357 ], [ %331, %346 ]
  %368 = phi float [ %330, %336 ], [ %330, %328 ], [ %330, %341 ], [ %365, %357 ], [ %330, %346 ]
  %369 = add nuw nsw i64 %329, 1
  %370 = icmp eq i64 %369, 120
  br i1 %370, label %371, label %328, !llvm.loop !41

371:                                              ; preds = %366
  %372 = icmp eq ptr %367, null
  br i1 %372, label %375, label %373

373:                                              ; preds = %371
  %374 = load <4 x float>, ptr %367, align 4, !tbaa !9
  store <4 x float> %374, ptr %303, align 4, !tbaa !9
  store i32 1, ptr %308, align 4, !tbaa !5
  store i32 0, ptr %304, align 4, !tbaa !5
  br label %375

375:                                              ; preds = %373, %371, %302
  %376 = add nuw nsw i64 %229, 1
  %377 = icmp eq i64 %376, 120
  br i1 %377, label %378, label %228, !llvm.loop !42

378:                                              ; preds = %375, %532
  %379 = phi i64 [ %533, %532 ], [ 0, %375 ]
  %380 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %2, i64 0, i64 %379
  %381 = getelementptr inbounds nuw i8, ptr %380, i64 64
  %382 = load i32, ptr %381, align 4, !tbaa !13
  %383 = icmp eq i32 %382, 0
  br i1 %383, label %384, label %427

384:                                              ; preds = %378
  %385 = getelementptr inbounds nuw i8, ptr %380, i64 60
  %386 = load i32, ptr %385, align 4, !tbaa !43
  %387 = icmp eq i32 %386, 0
  %388 = select i1 %387, i64 28, i64 52
  %389 = getelementptr inbounds nuw i8, ptr %380, i64 %388
  %390 = load i32, ptr %389, align 4, !tbaa !18
  %391 = icmp eq i32 %390, 0
  br i1 %391, label %427, label %392

392:                                              ; preds = %384
  %393 = select i1 %387, i64 12, i64 36
  %394 = getelementptr inbounds nuw i8, ptr %380, i64 %393
  %395 = select i1 %387, i64 16, i64 40
  %396 = getelementptr inbounds nuw i8, ptr %380, i64 %395
  %397 = load float, ptr %396, align 4, !tbaa !25
  %398 = load float, ptr %394, align 4, !tbaa !24
  %399 = load <2 x float>, ptr %380, align 4, !tbaa !9
  %400 = extractelement <2 x float> %399, i64 1
  %401 = fsub float %397, %400
  %402 = extractelement <2 x float> %399, i64 0
  %403 = fsub float %398, %402
  %404 = call float @atan2f(float noundef %401, float noundef %403) #7, !tbaa !5
  %405 = getelementptr inbounds nuw i8, ptr %380, i64 8
  %406 = load float, ptr %405, align 4, !tbaa !11
  %407 = fsub float %404, %406
  %408 = fcmp ogt float %407, 0x400921FB60000000
  br i1 %408, label %412, label %409

409:                                              ; preds = %412, %392
  %410 = phi float [ %407, %392 ], [ %414, %412 ]
  %411 = fcmp olt float %410, 0xC00921FB60000000
  br i1 %411, label %416, label %420

412:                                              ; preds = %392, %412
  %413 = phi float [ %414, %412 ], [ %407, %392 ]
  %414 = fadd float %413, 0xC01921FB60000000
  %415 = fcmp ogt float %414, 0x400921FB60000000
  br i1 %415, label %412, label %409, !llvm.loop !44

416:                                              ; preds = %409, %416
  %417 = phi float [ %418, %416 ], [ %410, %409 ]
  %418 = fadd float %417, 0x401921FB60000000
  %419 = fcmp olt float %418, 0xC00921FB60000000
  br i1 %419, label %416, label %420, !llvm.loop !45

420:                                              ; preds = %416, %409
  %421 = phi float [ %410, %409 ], [ %418, %416 ]
  %422 = fcmp ogt float %421, 0x3FB99999C0000000
  %423 = select i1 %422, float 0x3FB99999C0000000, float %421
  %424 = fcmp olt float %423, 0xBFB99999C0000000
  %425 = select i1 %424, float 0xBFB99999C0000000, float %423
  %426 = fadd float %406, %425
  store float %426, ptr %405, align 4, !tbaa !11
  br label %438

427:                                              ; preds = %384, %378
  %428 = call i32 @simRand(ptr noundef %0) #7
  %429 = and i32 %428, 65535
  %430 = uitofp nneg i32 %429 to float
  %431 = fmul float %430, 0x3FD539F560000000
  %432 = fmul float %431, 0x3EF0000000000000
  %433 = fadd float %432, 0xBFC539F560000000
  %434 = getelementptr inbounds nuw i8, ptr %380, i64 8
  %435 = load float, ptr %434, align 4, !tbaa !11
  %436 = fadd float %435, %433
  store float %436, ptr %434, align 4, !tbaa !11
  %437 = load <2 x float>, ptr %380, align 4, !tbaa !9
  br label %438

438:                                              ; preds = %427, %420
  %439 = phi float [ %436, %427 ], [ %426, %420 ]
  %440 = phi <2 x float> [ %437, %427 ], [ %399, %420 ]
  %441 = getelementptr inbounds nuw i8, ptr %380, i64 8
  %442 = call float @cosf(float noundef %439) #7, !tbaa !5
  %443 = call float @sinf(float noundef %439) #7, !tbaa !5
  %444 = getelementptr inbounds nuw i8, ptr %380, i64 4
  %445 = insertelement <2 x float> poison, float %442, i64 0
  %446 = insertelement <2 x float> %445, float %443, i64 1
  %447 = fmul <2 x float> %446, splat (float 1.100000e+02)
  %448 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %447, <2 x float> splat (float 0x3F91111120000000), <2 x float> %440)
  store <2 x float> %448, ptr %380, align 4, !tbaa !9
  %449 = extractelement <2 x float> %448, i64 0
  %450 = fcmp olt float %449, 1.000000e+00
  br i1 %450, label %453, label %451

451:                                              ; preds = %438
  %452 = fcmp ogt float %449, 1.278000e+03
  br i1 %452, label %453, label %456

453:                                              ; preds = %451, %438
  %454 = phi float [ 1.000000e+00, %438 ], [ 1.278000e+03, %451 ]
  store float %454, ptr %380, align 4, !tbaa !22
  %455 = fsub float 0x400921FB60000000, %439
  store float %455, ptr %441, align 4, !tbaa !11
  br label %456

456:                                              ; preds = %453, %451
  %457 = phi float [ %449, %451 ], [ %454, %453 ]
  %458 = phi float [ %439, %451 ], [ %455, %453 ]
  %459 = extractelement <2 x float> %448, i64 1
  %460 = fcmp olt float %459, 1.000000e+00
  br i1 %460, label %463, label %461

461:                                              ; preds = %456
  %462 = fcmp ogt float %459, 7.180000e+02
  br i1 %462, label %463, label %466

463:                                              ; preds = %461, %456
  %464 = phi float [ 1.000000e+00, %456 ], [ 7.180000e+02, %461 ]
  store float %464, ptr %444, align 4, !tbaa !23
  %465 = fneg float %458
  store float %465, ptr %441, align 4, !tbaa !11
  br label %466

466:                                              ; preds = %463, %461
  %467 = phi float [ %459, %461 ], [ %464, %463 ]
  %468 = load i32, ptr %381, align 4, !tbaa !13
  %469 = icmp eq i32 %468, 0
  br i1 %469, label %470, label %532

470:                                              ; preds = %466
  %471 = getelementptr inbounds nuw i8, ptr %380, i64 60
  %472 = load i32, ptr %471, align 4, !tbaa !43
  %473 = icmp eq i32 %472, 0
  br i1 %473, label %483, label %474

474:                                              ; preds = %470
  %475 = fadd float %457, -6.400000e+02
  %476 = call float @llvm.fabs.f32(float %475)
  %477 = fcmp ugt float %476, 2.400000e+01
  br i1 %477, label %532, label %478

478:                                              ; preds = %474
  %479 = fadd float %467, -3.600000e+02
  %480 = call float @llvm.fabs.f32(float %479)
  %481 = fcmp ugt float %480, 2.400000e+01
  br i1 %481, label %532, label %482

482:                                              ; preds = %478
  store i32 0, ptr %471, align 4, !tbaa !43
  br label %532

483:                                              ; preds = %470, %513
  %484 = phi i64 [ %516, %513 ], [ 0, %470 ]
  %485 = phi float [ %515, %513 ], [ 7.000000e+00, %470 ]
  %486 = phi i32 [ %514, %513 ], [ -1, %470 ]
  %487 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %46, i64 0, i64 %484
  %488 = getelementptr inbounds nuw i8, ptr %487, i64 12
  %489 = load i32, ptr %488, align 4, !tbaa !26
  %490 = icmp eq i32 %489, 0
  br i1 %490, label %513, label %491

491:                                              ; preds = %483
  %492 = load float, ptr %487, align 4, !tbaa !28
  %493 = getelementptr inbounds nuw i8, ptr %487, i64 4
  %494 = load float, ptr %493, align 4, !tbaa !29
  %495 = fsub float %457, %492
  %496 = fsub float %467, %494
  %497 = fmul float %496, %496
  %498 = call noundef float @llvm.fmuladd.f32(float %495, float %495, float %497)
  %499 = call float @llvm.sqrt.f32(float %498)
  %500 = getelementptr inbounds nuw i8, ptr %487, i64 8
  %501 = load i32, ptr %500, align 4, !tbaa !30
  %502 = sitofp i32 %501 to float
  %503 = fdiv float %502, 7.000000e+01
  %504 = fcmp olt float %503, 0.000000e+00
  %505 = select i1 %504, float 0.000000e+00, float %503
  %506 = call float @llvm.sqrt.f32(float %505)
  %507 = call float @llvm.fmuladd.f32(float %506, float 1.800000e+01, float 8.000000e+00)
  %508 = fsub float %499, %507
  %509 = fcmp olt float %508, %485
  %510 = trunc nuw nsw i64 %484 to i32
  %511 = select i1 %509, i32 %510, i32 %486
  %512 = select i1 %509, float %508, float %485
  br label %513

513:                                              ; preds = %491, %483
  %514 = phi i32 [ %511, %491 ], [ %486, %483 ]
  %515 = phi float [ %512, %491 ], [ %485, %483 ]
  %516 = add nuw nsw i64 %484, 1
  %517 = icmp eq i64 %516, 8
  br i1 %517, label %518, label %483, !llvm.loop !31

518:                                              ; preds = %513
  %519 = icmp sgt i32 %514, -1
  br i1 %519, label %520, label %532

520:                                              ; preds = %518
  store i32 1, ptr %471, align 4, !tbaa !43
  %521 = zext nneg i32 %514 to i64
  %522 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %46, i64 0, i64 %521
  %523 = getelementptr inbounds nuw i8, ptr %522, i64 8
  %524 = load i32, ptr %523, align 4, !tbaa !30
  %525 = add nsw i32 %524, -1
  store i32 %525, ptr %523, align 4, !tbaa !30
  %526 = icmp slt i32 %524, 2
  br i1 %526, label %527, label %532

527:                                              ; preds = %520
  %528 = getelementptr inbounds nuw i8, ptr %522, i64 12
  store i32 0, ptr %528, align 4, !tbaa !26
  %529 = getelementptr inbounds nuw i8, ptr %380, i64 12
  store i64 0, ptr %529, align 4
  %530 = getelementptr inbounds nuw i8, ptr %380, i64 20
  store float 0x46293E5940000000, ptr %530, align 4, !tbaa !9
  %531 = getelementptr inbounds nuw i8, ptr %380, i64 24
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %531, i8 0, i64 12, i1 false)
  br label %532

532:                                              ; preds = %527, %520, %518, %482, %478, %474, %466
  %533 = add nuw nsw i64 %379, 1
  %534 = icmp eq i64 %533, 120
  br i1 %534, label %535, label %378, !llvm.loop !46

535:                                              ; preds = %532, %537
  %536 = phi i32 [ %538, %537 ], [ 0, %532 ]
  br label %540

537:                                              ; preds = %540
  %538 = add nuw nsw i32 %536, 1
  %539 = icmp eq i32 %538, 720
  br i1 %539, label %544, label %535, !llvm.loop !47

540:                                              ; preds = %540, %535
  %541 = phi i32 [ 0, %535 ], [ %542, %540 ]
  call void @simPutPixel(ptr noundef %0, i32 noundef %541, i32 noundef %536, i32 noundef range(i32 -15592936, -29655) -15592936) #7
  %542 = add nuw nsw i32 %541, 1
  %543 = icmp eq i32 %542, 1280
  br i1 %543, label %537, label %540, !llvm.loop !48

544:                                              ; preds = %537, %546
  %545 = phi i32 [ %547, %546 ], [ 336, %537 ]
  br label %549

546:                                              ; preds = %549
  %547 = add nuw nsw i32 %545, 1
  %548 = icmp eq i32 %547, 384
  br i1 %548, label %555, label %544, !llvm.loop !47

549:                                              ; preds = %549, %544
  %550 = phi i32 [ 616, %544 ], [ %551, %549 ]
  call void @simPutPixel(ptr noundef %0, i32 noundef %550, i32 noundef %545, i32 noundef range(i32 -15592936, -29655) -997336) #7
  %551 = add nuw nsw i32 %550, 1
  %552 = icmp eq i32 %551, 664
  br i1 %552, label %546, label %549, !llvm.loop !48

553:                                              ; preds = %604
  %554 = icmp eq i32 %49, %51
  br i1 %554, label %671, label %607

555:                                              ; preds = %546, %604
  %556 = phi i64 [ %605, %604 ], [ 0, %546 ]
  %557 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %46, i64 0, i64 %556
  %558 = getelementptr inbounds nuw i8, ptr %557, i64 12
  %559 = load i32, ptr %558, align 4, !tbaa !26
  %560 = icmp eq i32 %559, 0
  br i1 %560, label %604, label %561

561:                                              ; preds = %555
  %562 = getelementptr inbounds nuw i8, ptr %557, i64 8
  %563 = load i32, ptr %562, align 4, !tbaa !30
  %564 = sitofp i32 %563 to float
  %565 = fdiv float %564, 7.000000e+01
  %566 = fcmp olt float %565, 0.000000e+00
  %567 = select i1 %566, float 0.000000e+00, float %565
  %568 = call float @llvm.sqrt.f32(float %567)
  %569 = call float @llvm.fmuladd.f32(float %568, float 1.800000e+01, float 8.000000e+00)
  %570 = fptosi float %569 to i32
  %571 = sub nsw i32 0, %570
  %572 = icmp slt i32 %570, 0
  br i1 %572, label %604, label %573

573:                                              ; preds = %561
  %574 = getelementptr inbounds nuw i8, ptr %557, i64 4
  %575 = load float, ptr %574, align 4, !tbaa !29
  %576 = load float, ptr %557, align 4, !tbaa !28
  %577 = mul nuw nsw i32 %570, %570
  %578 = fptosi float %576 to i32
  %579 = fptosi float %575 to i32
  br label %580

580:                                              ; preds = %585, %573
  %581 = phi i32 [ %571, %573 ], [ %586, %585 ]
  %582 = mul nsw i32 %581, %581
  %583 = add nsw i32 %581, %579
  %584 = icmp slt i32 %583, 720
  br label %588

585:                                              ; preds = %601
  %586 = add i32 %581, 1
  %587 = icmp eq i32 %581, %570
  br i1 %587, label %604, label %580, !llvm.loop !49

588:                                              ; preds = %601, %580
  %589 = phi i32 [ %571, %580 ], [ %602, %601 ]
  %590 = mul nsw i32 %589, %589
  %591 = add nuw nsw i32 %590, %582
  %592 = icmp samesign ugt i32 %591, %577
  br i1 %592, label %601, label %593

593:                                              ; preds = %588
  %594 = add nsw i32 %589, %578
  %595 = or i32 %594, %583
  %596 = icmp sgt i32 %595, -1
  %597 = icmp slt i32 %594, 1280
  %598 = and i1 %597, %596
  %599 = and i1 %584, %598
  br i1 %599, label %600, label %601

600:                                              ; preds = %593
  call void @simPutPixel(ptr noundef %0, i32 noundef %594, i32 noundef %583, i32 noundef -12793766) #7
  br label %601

601:                                              ; preds = %600, %593, %588
  %602 = add i32 %589, 1
  %603 = icmp eq i32 %589, %570
  br i1 %603, label %585, label %588, !llvm.loop !50

604:                                              ; preds = %585, %561, %555
  %605 = add nuw nsw i64 %556, 1
  %606 = icmp eq i64 %605, 8
  br i1 %606, label %553, label %555, !llvm.loop !51

607:                                              ; preds = %553, %668
  %608 = phi i64 [ %669, %668 ], [ 0, %553 ]
  %609 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %2, i64 0, i64 %608
  %610 = getelementptr inbounds nuw i8, ptr %609, i64 60
  %611 = load i32, ptr %610, align 4, !tbaa !43
  %612 = icmp eq i32 %611, 0
  %613 = select i1 %612, i64 12, i64 36
  %614 = getelementptr inbounds nuw i8, ptr %609, i64 %613
  %615 = getelementptr inbounds nuw i8, ptr %609, i64 64
  %616 = load i32, ptr %615, align 4, !tbaa !13
  %617 = icmp eq i32 %616, 0
  br i1 %617, label %618, label %668

618:                                              ; preds = %607
  %619 = select i1 %612, i64 28, i64 52
  %620 = getelementptr inbounds nuw i8, ptr %609, i64 %619
  %621 = load i32, ptr %620, align 4, !tbaa !18
  %622 = icmp eq i32 %621, 0
  br i1 %622, label %668, label %623

623:                                              ; preds = %618
  %624 = load float, ptr %614, align 4, !tbaa !24
  %625 = select i1 %612, i64 16, i64 40
  %626 = getelementptr inbounds nuw i8, ptr %609, i64 %625
  %627 = load float, ptr %626, align 4, !tbaa !25
  %628 = select i1 %612, i64 32, i64 56
  %629 = getelementptr inbounds nuw i8, ptr %609, i64 %628
  %630 = load i32, ptr %629, align 4, !tbaa !21
  %631 = icmp eq i32 %630, 0
  %632 = select i1 %631, i32 -12171646, i32 -12161466
  %633 = load <2 x float>, ptr %609, align 4, !tbaa !9
  %634 = insertelement <2 x float> poison, float %624, i64 0
  %635 = insertelement <2 x float> %634, float %627, i64 1
  %636 = fsub <2 x float> %635, %633
  %637 = extractelement <2 x float> %636, i64 0
  %638 = call float @llvm.fabs.f32(float %637)
  %639 = extractelement <2 x float> %636, i64 1
  %640 = call float @llvm.fabs.f32(float %639)
  %641 = call float @llvm.maxnum.f32(float %638, float %640)
  %642 = fptosi float %641 to i32
  %643 = icmp slt i32 %642, 0
  br i1 %643, label %668, label %644

644:                                              ; preds = %623
  %645 = icmp eq i32 %642, 0
  %646 = uitofp nneg i32 %642 to float
  br label %647

647:                                              ; preds = %665, %644
  %648 = phi i32 [ 0, %644 ], [ %666, %665 ]
  %649 = uitofp nneg i32 %648 to float
  %650 = fdiv float %649, %646
  %651 = select i1 %645, float 0.000000e+00, float %650
  %652 = insertelement <2 x float> poison, float %651, i64 0
  %653 = shufflevector <2 x float> %652, <2 x float> poison, <2 x i32> zeroinitializer
  %654 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %636, <2 x float> %653, <2 x float> %633)
  %655 = fptosi <2 x float> %654 to <2 x i32>
  %656 = extractelement <2 x i32> %655, i64 0
  %657 = extractelement <2 x i32> %655, i64 1
  %658 = or i32 %657, %656
  %659 = icmp sgt i32 %658, -1
  %660 = icmp slt i32 %656, 1280
  %661 = and i1 %660, %659
  %662 = icmp slt i32 %657, 720
  %663 = and i1 %662, %661
  br i1 %663, label %664, label %665

664:                                              ; preds = %647
  call void @simPutPixel(ptr noundef %0, i32 noundef %656, i32 noundef %657, i32 noundef range(i32 -12171646, -12161465) %632) #7
  br label %665

665:                                              ; preds = %664, %647
  %666 = add nuw i32 %648, 1
  %667 = icmp eq i32 %648, %642
  br i1 %667, label %668, label %647, !llvm.loop !52

668:                                              ; preds = %665, %623, %618, %607
  %669 = add nuw nsw i64 %608, 1
  %670 = icmp eq i64 %669, 120
  br i1 %670, label %671, label %607, !llvm.loop !53

671:                                              ; preds = %668, %553
  br label %672

672:                                              ; preds = %671, %709
  %673 = phi i64 [ %710, %709 ], [ 0, %671 ]
  %674 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %2, i64 0, i64 %673
  %675 = load float, ptr %674, align 4, !tbaa !22
  %676 = fptosi float %675 to i32
  %677 = add nsw i32 %676, -1
  %678 = getelementptr inbounds nuw i8, ptr %674, i64 4
  %679 = load float, ptr %678, align 4, !tbaa !23
  %680 = fptosi float %679 to i32
  %681 = add nsw i32 %680, -1
  %682 = getelementptr inbounds nuw i8, ptr %674, i64 64
  %683 = load i32, ptr %682, align 4, !tbaa !13
  %684 = icmp eq i32 %683, 0
  br i1 %684, label %685, label %690

685:                                              ; preds = %672
  %686 = getelementptr inbounds nuw i8, ptr %674, i64 60
  %687 = load i32, ptr %686, align 4, !tbaa !43
  %688 = icmp eq i32 %687, 0
  %689 = select i1 %688, i32 -1973781, i32 -29656
  br label %690

690:                                              ; preds = %685, %672
  %691 = phi i32 [ %689, %685 ], [ -11485441, %672 ]
  br label %692

692:                                              ; preds = %695, %690
  %693 = phi i32 [ %681, %690 ], [ %696, %695 ]
  %694 = icmp slt i32 %693, 720
  br label %698

695:                                              ; preds = %706
  %696 = add nsw i32 %693, 1
  %697 = icmp sgt i32 %693, %680
  br i1 %697, label %709, label %692, !llvm.loop !47

698:                                              ; preds = %706, %692
  %699 = phi i32 [ %677, %692 ], [ %707, %706 ]
  %700 = or i32 %699, %693
  %701 = icmp sgt i32 %700, -1
  %702 = icmp slt i32 %699, 1280
  %703 = and i1 %702, %701
  %704 = and i1 %694, %703
  br i1 %704, label %705, label %706

705:                                              ; preds = %698
  call void @simPutPixel(ptr noundef %0, i32 noundef %699, i32 noundef %693, i32 noundef range(i32 -15592936, -29655) %691) #7
  br label %706

706:                                              ; preds = %705, %698
  %707 = add nsw i32 %699, 1
  %708 = icmp sgt i32 %699, %676
  br i1 %708, label %695, label %698, !llvm.loop !48

709:                                              ; preds = %695
  %710 = add nuw nsw i64 %673, 1
  %711 = icmp eq i64 %710, 120
  br i1 %711, label %712, label %672, !llvm.loop !54

712:                                              ; preds = %709
  %713 = call i32 @simFlush(ptr noundef %0) #7
  %714 = icmp eq i32 %713, 0
  br i1 %714, label %715, label %48, !llvm.loop !55

715:                                              ; preds = %712
  call void @llvm.lifetime.end.p0(i64 13092, ptr nonnull %2) #7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #2

declare i32 @simClicks(ptr noundef) local_unnamed_addr #3

declare i32 @simFlush(ptr noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @cosf(float noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @sinf(float noundef) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define internal fastcc void @resource_spawn(ptr noundef nonnull captures(none) %0, ptr noundef %1) unnamed_addr #0 {
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 8160
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 8172
  %5 = load i32, ptr %4, align 4, !tbaa !26
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %42, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 8176
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 8188
  %10 = load i32, ptr %9, align 4, !tbaa !26
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %42, label %12

12:                                               ; preds = %7
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 8192
  %14 = getelementptr inbounds nuw i8, ptr %0, i64 8204
  %15 = load i32, ptr %14, align 4, !tbaa !26
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %42, label %17

17:                                               ; preds = %12
  %18 = getelementptr inbounds nuw i8, ptr %0, i64 8208
  %19 = getelementptr inbounds nuw i8, ptr %0, i64 8220
  %20 = load i32, ptr %19, align 4, !tbaa !26
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %42, label %22

22:                                               ; preds = %17
  %23 = getelementptr inbounds nuw i8, ptr %0, i64 8224
  %24 = getelementptr inbounds nuw i8, ptr %0, i64 8236
  %25 = load i32, ptr %24, align 4, !tbaa !26
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %42, label %27

27:                                               ; preds = %22
  %28 = getelementptr inbounds nuw i8, ptr %0, i64 8240
  %29 = getelementptr inbounds nuw i8, ptr %0, i64 8252
  %30 = load i32, ptr %29, align 4, !tbaa !26
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %42, label %32

32:                                               ; preds = %27
  %33 = getelementptr inbounds nuw i8, ptr %0, i64 8256
  %34 = getelementptr inbounds nuw i8, ptr %0, i64 8268
  %35 = load i32, ptr %34, align 4, !tbaa !26
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %42, label %37

37:                                               ; preds = %32
  %38 = getelementptr inbounds nuw i8, ptr %0, i64 8272
  %39 = getelementptr inbounds nuw i8, ptr %0, i64 8284
  %40 = load i32, ptr %39, align 4, !tbaa !26
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %70

42:                                               ; preds = %37, %32, %27, %22, %17, %12, %7, %2
  %43 = phi ptr [ %3, %2 ], [ %8, %7 ], [ %13, %12 ], [ %18, %17 ], [ %23, %22 ], [ %28, %27 ], [ %33, %32 ], [ %38, %37 ]
  %44 = getelementptr inbounds nuw i8, ptr %43, i64 12
  br label %48

45:                                               ; preds = %48
  %46 = add nuw nsw i32 %49, 1
  %47 = icmp eq i32 %46, 16
  br i1 %47, label %70, label %48, !llvm.loop !56

48:                                               ; preds = %42, %45
  %49 = phi i32 [ 0, %42 ], [ %46, %45 ]
  %50 = tail call i32 @simRand(ptr noundef %1) #7
  %51 = and i32 %50, 65535
  %52 = mul nuw nsw i32 %51, 1228
  %53 = uitofp nneg i32 %52 to float
  %54 = fmul float %53, 0x3EF0000000000000
  %55 = fadd float %54, 2.600000e+01
  %56 = tail call i32 @simRand(ptr noundef %1) #7
  %57 = and i32 %56, 65535
  %58 = mul nuw nsw i32 %57, 668
  %59 = uitofp nneg i32 %58 to float
  %60 = fmul float %59, 0x3EF0000000000000
  %61 = fadd float %60, 2.600000e+01
  %62 = fadd float %55, -6.400000e+02
  %63 = fadd float %61, -3.600000e+02
  %64 = fmul float %63, %63
  %65 = tail call noundef float @llvm.fmuladd.f32(float %62, float %62, float %64)
  %66 = fcmp olt float %65, 4.000000e+04
  br i1 %66, label %45, label %67

67:                                               ; preds = %48
  store float %55, ptr %43, align 4, !tbaa !9
  %68 = getelementptr inbounds nuw i8, ptr %43, i64 4
  store float %61, ptr %68, align 4, !tbaa !9
  %69 = getelementptr inbounds nuw i8, ptr %43, i64 8
  store i32 70, ptr %69, align 4, !tbaa !5
  store i32 1, ptr %44, align 4, !tbaa !5
  br label %70

70:                                               ; preds = %45, %37, %67
  ret void
}

declare i32 @simRand(ptr noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @atan2f(float noundef, float noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #5

declare void @simPutPixel(ptr noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #6

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(errnomem: write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 21.1.8 (++20251221032922+2078da43e25a-1~exp1~20251221153059.70)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !7, i64 0}
!11 = !{!12, !10, i64 8}
!12 = !{!"", !10, i64 0, !10, i64 4, !10, i64 8, !7, i64 12, !6, i64 60, !6, i64 64}
!13 = !{!12, !6, i64 64}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!17, !10, i64 13088}
!17 = !{!"", !7, i64 0, !7, i64 8160, !7, i64 8288, !10, i64 13088}
!18 = !{!19, !6, i64 16}
!19 = !{!"", !10, i64 0, !10, i64 4, !10, i64 8, !10, i64 12, !6, i64 16, !6, i64 20}
!20 = !{!19, !10, i64 12}
!21 = !{!19, !6, i64 20}
!22 = !{!12, !10, i64 0}
!23 = !{!12, !10, i64 4}
!24 = !{!19, !10, i64 0}
!25 = !{!19, !10, i64 4}
!26 = !{!27, !6, i64 12}
!27 = !{!"", !10, i64 0, !10, i64 4, !6, i64 8, !6, i64 12}
!28 = !{!27, !10, i64 0}
!29 = !{!27, !10, i64 4}
!30 = !{!27, !6, i64 8}
!31 = distinct !{!31, !15}
!32 = distinct !{!32, !15}
!33 = !{!19, !10, i64 8}
!34 = distinct !{!34, !15}
!35 = !{!36, !6, i64 16}
!36 = !{!"", !10, i64 0, !10, i64 4, !10, i64 8, !10, i64 12, !6, i64 16}
!37 = !{!36, !10, i64 12}
!38 = !{!36, !10, i64 0}
!39 = !{!36, !10, i64 4}
!40 = !{!36, !10, i64 8}
!41 = distinct !{!41, !15}
!42 = distinct !{!42, !15}
!43 = !{!12, !6, i64 60}
!44 = distinct !{!44, !15}
!45 = distinct !{!45, !15}
!46 = distinct !{!46, !15}
!47 = distinct !{!47, !15}
!48 = distinct !{!48, !15}
!49 = distinct !{!49, !15}
!50 = distinct !{!50, !15}
!51 = distinct !{!51, !15}
!52 = distinct !{!52, !15}
!53 = distinct !{!53, !15}
!54 = distinct !{!54, !15}
!55 = distinct !{!55, !15}
!56 = distinct !{!56, !15}
