; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.World = type { [120 x %struct.Bee], [8 x %struct.Resource], [120 x [2 x %struct.Shout]], float }
%struct.Bee = type { float, float, float, float, [2 x %struct.Belief], i32, i32 }
%struct.Belief = type { float, float, float, float, i32, i32 }
%struct.Resource = type { float, float, i32, i32 }
%struct.Shout = type { float, float, float, float, i32 }

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca %struct.World, align 4
  call void @llvm.lifetime.start.p0(i64 13572, ptr nonnull %1) #6
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(13572) %1, i8 0, i64 13572, i1 false)
  br label %2

2:                                                ; preds = %49, %0
  %3 = phi i64 [ 0, %0 ], [ %65, %49 ]
  %4 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %3
  %5 = tail call i32 @simRand() #6
  %6 = and i32 %5, 65535
  %7 = mul nuw nsw i32 %6, 96
  %8 = uitofp nneg i32 %7 to float
  %9 = fmul float %8, 0x3EF0000000000000
  %10 = fadd float %9, -4.800000e+01
  %11 = fadd float %10, 6.400000e+02
  store float %11, ptr %4, align 4, !tbaa !5
  %12 = tail call i32 @simRand() #6
  %13 = and i32 %12, 65535
  %14 = mul nuw nsw i32 %13, 96
  %15 = uitofp nneg i32 %14 to float
  %16 = fmul float %15, 0x3EF0000000000000
  %17 = fadd float %16, -4.800000e+01
  %18 = fadd float %17, 3.600000e+02
  %19 = getelementptr inbounds nuw i8, ptr %4, i64 4
  store float %18, ptr %19, align 4, !tbaa !11
  %20 = tail call i32 @simRand() #6
  %21 = tail call i32 @simRand() #6
  %22 = insertelement <2 x i32> poison, i32 %20, i64 0
  %23 = insertelement <2 x i32> %22, i32 %21, i64 1
  %24 = shl <2 x i32> %23, splat (i32 1)
  %25 = and <2 x i32> %24, splat (i32 131070)
  %26 = uitofp nneg <2 x i32> %25 to <2 x float>
  %27 = fmul <2 x float> %26, splat (float 0x3EF0000000000000)
  %28 = fadd <2 x float> %27, splat (float -1.000000e+00)
  %29 = fmul <2 x float> %28, %28
  %30 = extractelement <2 x float> %29, i64 1
  %31 = extractelement <2 x float> %28, i64 0
  %32 = tail call float @llvm.fmuladd.f32(float %31, float %31, float %30)
  %33 = fcmp ugt float %32, 0.000000e+00
  br i1 %33, label %34, label %49

34:                                               ; preds = %2
  %35 = bitcast float %32 to i32
  %36 = lshr i32 %35, 1
  %37 = add nuw i32 %36, 532676608
  %38 = bitcast i32 %37 to float
  %39 = fdiv float %32, %38
  %40 = fadd float %39, %38
  %41 = fmul float %40, 5.000000e-01
  %42 = fdiv float %32, %41
  %43 = fadd float %41, %42
  %44 = fmul float %43, 5.000000e-01
  %45 = fdiv float %32, %44
  %46 = fadd float %44, %45
  %47 = fmul float %46, 5.000000e-01
  %48 = fadd float %47, 0x3EB0C6F7A0000000
  br label %49

49:                                               ; preds = %34, %2
  %50 = phi float [ 0x3EB0C6F7A0000000, %2 ], [ %48, %34 ]
  %51 = insertelement <2 x float> poison, float %50, i64 0
  %52 = shufflevector <2 x float> %51, <2 x float> poison, <2 x i32> zeroinitializer
  %53 = fdiv <2 x float> %28, %52
  %54 = getelementptr inbounds nuw i8, ptr %4, i64 8
  store <2 x float> %53, ptr %54, align 4, !tbaa !12
  %55 = trunc i64 %3 to i8
  %56 = urem i8 %55, 20
  %57 = icmp eq i8 %56, 0
  %58 = zext i1 %57 to i32
  %59 = getelementptr inbounds nuw i8, ptr %4, i64 68
  store i32 %58, ptr %59, align 4, !tbaa !13
  %60 = getelementptr inbounds nuw i8, ptr %4, i64 16
  store i64 0, ptr %60, align 4
  %61 = getelementptr inbounds nuw i8, ptr %4, i64 24
  store float 0x46293E5940000000, ptr %61, align 4, !tbaa !12
  %62 = getelementptr inbounds nuw i8, ptr %4, i64 28
  %63 = getelementptr inbounds nuw i8, ptr %4, i64 48
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(20) %62, i8 0, i64 20, i1 false)
  store float 0x46293E5940000000, ptr %63, align 4, !tbaa !12
  %64 = getelementptr inbounds nuw i8, ptr %4, i64 52
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %64, i8 0, i64 12, i1 false)
  %65 = add nuw nsw i64 %3, 1
  %66 = icmp eq i64 %65, 120
  br i1 %66, label %67, label %2, !llvm.loop !14

67:                                               ; preds = %49
  %68 = getelementptr inbounds nuw i8, ptr %1, i64 8640
  %69 = getelementptr inbounds nuw i8, ptr %1, i64 8652
  %70 = getelementptr inbounds nuw i8, ptr %1, i64 8652
  br label %74

71:                                               ; preds = %74
  %72 = add nuw nsw i32 %75, 1
  %73 = icmp eq i32 %72, 16
  br i1 %73, label %111, label %74, !llvm.loop !16

74:                                               ; preds = %71, %67
  %75 = phi i32 [ 0, %67 ], [ %72, %71 ]
  %76 = tail call i32 @simRand() #6
  %77 = and i32 %76, 65535
  %78 = mul nuw nsw i32 %77, 1228
  %79 = uitofp nneg i32 %78 to float
  %80 = fmul float %79, 0x3EF0000000000000
  %81 = fadd float %80, 2.600000e+01
  %82 = tail call i32 @simRand() #6
  %83 = and i32 %82, 65535
  %84 = mul nuw nsw i32 %83, 668
  %85 = uitofp nneg i32 %84 to float
  %86 = fmul float %85, 0x3EF0000000000000
  %87 = fadd float %86, 2.600000e+01
  %88 = fadd float %81, -6.400000e+02
  %89 = fadd float %87, -3.600000e+02
  %90 = fmul float %89, %89
  %91 = tail call noundef float @llvm.fmuladd.f32(float %88, float %88, float %90)
  %92 = fcmp olt float %91, 4.000000e+04
  br i1 %92, label %71, label %93

93:                                               ; preds = %74
  store float %81, ptr %68, align 4, !tbaa !12
  %94 = getelementptr inbounds nuw i8, ptr %1, i64 8644
  store float %87, ptr %94, align 4, !tbaa !12
  %95 = getelementptr inbounds nuw i8, ptr %1, i64 8648
  store i32 70, ptr %95, align 4, !tbaa !17
  store i32 1, ptr %70, align 4, !tbaa !17
  %96 = getelementptr inbounds nuw i8, ptr %1, i64 8656
  %97 = getelementptr inbounds nuw i8, ptr %1, i64 8668
  %98 = load i32, ptr %97, align 4, !tbaa !18
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %111, label %100

100:                                              ; preds = %93
  %101 = getelementptr inbounds nuw i8, ptr %1, i64 8672
  %102 = getelementptr inbounds nuw i8, ptr %1, i64 8684
  %103 = load i32, ptr %102, align 4, !tbaa !18
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %111, label %105

105:                                              ; preds = %100
  %106 = getelementptr inbounds nuw i8, ptr %1, i64 8700
  %107 = load i32, ptr %106, align 4, !tbaa !18
  %108 = icmp eq i32 %107, 0
  %109 = select i1 %108, i64 8688, i64 8704
  %110 = getelementptr inbounds nuw i8, ptr %1, i64 %109
  br label %111

111:                                              ; preds = %71, %105, %100, %93
  %112 = phi ptr [ %96, %93 ], [ %101, %100 ], [ %110, %105 ], [ %68, %71 ]
  %113 = getelementptr inbounds nuw i8, ptr %112, i64 12
  br label %117

114:                                              ; preds = %117
  %115 = add nuw nsw i32 %118, 1
  %116 = icmp eq i32 %115, 16
  br i1 %116, label %139, label %117, !llvm.loop !16

117:                                              ; preds = %114, %111
  %118 = phi i32 [ 0, %111 ], [ %115, %114 ]
  %119 = tail call i32 @simRand() #6
  %120 = and i32 %119, 65535
  %121 = mul nuw nsw i32 %120, 1228
  %122 = uitofp nneg i32 %121 to float
  %123 = fmul float %122, 0x3EF0000000000000
  %124 = fadd float %123, 2.600000e+01
  %125 = tail call i32 @simRand() #6
  %126 = and i32 %125, 65535
  %127 = mul nuw nsw i32 %126, 668
  %128 = uitofp nneg i32 %127 to float
  %129 = fmul float %128, 0x3EF0000000000000
  %130 = fadd float %129, 2.600000e+01
  %131 = fadd float %124, -6.400000e+02
  %132 = fadd float %130, -3.600000e+02
  %133 = fmul float %132, %132
  %134 = tail call noundef float @llvm.fmuladd.f32(float %131, float %131, float %133)
  %135 = fcmp olt float %134, 4.000000e+04
  br i1 %135, label %114, label %136

136:                                              ; preds = %117
  store float %124, ptr %112, align 4, !tbaa !12
  %137 = getelementptr inbounds nuw i8, ptr %112, i64 4
  store float %130, ptr %137, align 4, !tbaa !12
  %138 = getelementptr inbounds nuw i8, ptr %112, i64 8
  store i32 70, ptr %138, align 4, !tbaa !17
  store i32 1, ptr %113, align 4, !tbaa !17
  br label %139

139:                                              ; preds = %114, %136
  %140 = getelementptr inbounds nuw i8, ptr %1, i64 13568
  %141 = getelementptr inbounds nuw i8, ptr %1, i64 8656
  %142 = getelementptr inbounds nuw i8, ptr %1, i64 8668
  %143 = getelementptr inbounds nuw i8, ptr %1, i64 8672
  %144 = getelementptr inbounds nuw i8, ptr %1, i64 8684
  %145 = getelementptr inbounds nuw i8, ptr %1, i64 8688
  %146 = getelementptr inbounds nuw i8, ptr %1, i64 8700
  %147 = getelementptr inbounds nuw i8, ptr %1, i64 8704
  %148 = getelementptr inbounds nuw i8, ptr %1, i64 8716
  %149 = getelementptr inbounds nuw i8, ptr %1, i64 8720
  %150 = getelementptr inbounds nuw i8, ptr %1, i64 8732
  %151 = getelementptr inbounds nuw i8, ptr %1, i64 8736
  %152 = getelementptr inbounds nuw i8, ptr %1, i64 8748
  %153 = getelementptr inbounds nuw i8, ptr %1, i64 8752
  %154 = getelementptr inbounds nuw i8, ptr %1, i64 8764
  %155 = getelementptr inbounds nuw i8, ptr %1, i64 8768
  br label %156

156:                                              ; preds = %1144, %139
  %157 = phi i32 [ 0, %139 ], [ %160, %1144 ]
  %158 = call i32 @simClicks() #6
  %159 = and i32 %158, 1
  %160 = xor i32 %159, %157
  %161 = load float, ptr %140, align 4, !tbaa !20
  %162 = fadd float %161, 0x3F91111120000000
  store float %162, ptr %140, align 4, !tbaa !20
  %163 = fcmp ult float %162, 1.000000e+01
  br i1 %163, label %217, label %164

164:                                              ; preds = %156
  %165 = fadd float %162, -1.000000e+01
  store float %165, ptr %140, align 4, !tbaa !20
  %166 = load i32, ptr %69, align 4, !tbaa !18
  %167 = icmp eq i32 %166, 0
  br i1 %167, label %189, label %168

168:                                              ; preds = %164
  %169 = load i32, ptr %142, align 4, !tbaa !18
  %170 = icmp eq i32 %169, 0
  br i1 %170, label %189, label %171

171:                                              ; preds = %168
  %172 = load i32, ptr %144, align 4, !tbaa !18
  %173 = icmp eq i32 %172, 0
  br i1 %173, label %189, label %174

174:                                              ; preds = %171
  %175 = load i32, ptr %146, align 4, !tbaa !18
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %189, label %177

177:                                              ; preds = %174
  %178 = load i32, ptr %148, align 4, !tbaa !18
  %179 = icmp eq i32 %178, 0
  br i1 %179, label %189, label %180

180:                                              ; preds = %177
  %181 = load i32, ptr %150, align 4, !tbaa !18
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %189, label %183

183:                                              ; preds = %180
  %184 = load i32, ptr %152, align 4, !tbaa !18
  %185 = icmp eq i32 %184, 0
  br i1 %185, label %189, label %186

186:                                              ; preds = %183
  %187 = load i32, ptr %154, align 4, !tbaa !18
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %189, label %217

189:                                              ; preds = %186, %183, %180, %177, %174, %171, %168, %164
  %190 = phi ptr [ %68, %164 ], [ %141, %168 ], [ %143, %171 ], [ %145, %174 ], [ %147, %177 ], [ %149, %180 ], [ %151, %183 ], [ %153, %186 ]
  %191 = getelementptr inbounds nuw i8, ptr %190, i64 12
  br label %195

192:                                              ; preds = %195
  %193 = add nuw nsw i32 %196, 1
  %194 = icmp eq i32 %193, 16
  br i1 %194, label %217, label %195, !llvm.loop !16

195:                                              ; preds = %192, %189
  %196 = phi i32 [ 0, %189 ], [ %193, %192 ]
  %197 = call i32 @simRand() #6
  %198 = and i32 %197, 65535
  %199 = mul nuw nsw i32 %198, 1228
  %200 = uitofp nneg i32 %199 to float
  %201 = fmul float %200, 0x3EF0000000000000
  %202 = fadd float %201, 2.600000e+01
  %203 = call i32 @simRand() #6
  %204 = and i32 %203, 65535
  %205 = mul nuw nsw i32 %204, 668
  %206 = uitofp nneg i32 %205 to float
  %207 = fmul float %206, 0x3EF0000000000000
  %208 = fadd float %207, 2.600000e+01
  %209 = fadd float %202, -6.400000e+02
  %210 = fadd float %208, -3.600000e+02
  %211 = fmul float %210, %210
  %212 = call noundef float @llvm.fmuladd.f32(float %209, float %209, float %211)
  %213 = fcmp olt float %212, 4.000000e+04
  br i1 %213, label %192, label %214

214:                                              ; preds = %195
  store float %202, ptr %190, align 4, !tbaa !12
  %215 = getelementptr inbounds nuw i8, ptr %190, i64 4
  store float %208, ptr %215, align 4, !tbaa !12
  %216 = getelementptr inbounds nuw i8, ptr %190, i64 8
  store i32 70, ptr %216, align 4, !tbaa !17
  store i32 1, ptr %191, align 4, !tbaa !17
  br label %217

217:                                              ; preds = %192, %214, %186, %156
  br label %218

218:                                              ; preds = %217, %363
  %219 = phi i64 [ %364, %363 ], [ 0, %217 ]
  %220 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %219
  %221 = getelementptr inbounds nuw i8, ptr %220, i64 16
  %222 = getelementptr inbounds nuw i8, ptr %220, i64 4
  %223 = getelementptr inbounds nuw i8, ptr %220, i64 32
  %224 = load i32, ptr %223, align 4, !tbaa !22
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %249, label %226

226:                                              ; preds = %218
  %227 = getelementptr inbounds nuw i8, ptr %220, i64 28
  %228 = load float, ptr %227, align 4, !tbaa !24
  %229 = fadd float %228, 0x3F91111120000000
  store float %229, ptr %227, align 4, !tbaa !24
  %230 = fcmp ult float %229, 3.000000e+00
  br i1 %230, label %231, label %246

231:                                              ; preds = %226
  %232 = getelementptr inbounds nuw i8, ptr %220, i64 36
  %233 = load i32, ptr %232, align 4, !tbaa !25
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %235, label %248

235:                                              ; preds = %231
  %236 = load float, ptr %220, align 4, !tbaa !5
  %237 = load float, ptr %222, align 4, !tbaa !11
  %238 = load float, ptr %221, align 4, !tbaa !26
  %239 = getelementptr inbounds nuw i8, ptr %220, i64 20
  %240 = load float, ptr %239, align 4, !tbaa !27
  %241 = fsub float %236, %238
  %242 = fsub float %237, %240
  %243 = fmul float %242, %242
  %244 = call noundef float @llvm.fmuladd.f32(float %241, float %241, float %243)
  %245 = fcmp olt float %244, 3.600000e+01
  br i1 %245, label %246, label %248

246:                                              ; preds = %235, %226
  store i64 0, ptr %221, align 4
  %247 = getelementptr inbounds nuw i8, ptr %220, i64 24
  store float 0x46293E5940000000, ptr %247, align 4, !tbaa !12
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %227, i8 0, i64 12, i1 false)
  br label %249

248:                                              ; preds = %235, %231
  store i32 0, ptr %232, align 4, !tbaa !25
  br label %249

249:                                              ; preds = %248, %246, %218
  %250 = getelementptr inbounds nuw i8, ptr %220, i64 40
  %251 = getelementptr inbounds nuw i8, ptr %220, i64 56
  %252 = load i32, ptr %251, align 4, !tbaa !22
  %253 = icmp eq i32 %252, 0
  br i1 %253, label %277, label %254

254:                                              ; preds = %249
  %255 = getelementptr inbounds nuw i8, ptr %220, i64 52
  %256 = load float, ptr %255, align 4, !tbaa !24
  %257 = fadd float %256, 0x3F91111120000000
  store float %257, ptr %255, align 4, !tbaa !24
  %258 = fcmp ult float %257, 3.000000e+00
  br i1 %258, label %259, label %275

259:                                              ; preds = %254
  %260 = getelementptr inbounds nuw i8, ptr %220, i64 60
  %261 = load i32, ptr %260, align 4, !tbaa !25
  %262 = icmp eq i32 %261, 0
  br i1 %262, label %263, label %274

263:                                              ; preds = %259
  %264 = load float, ptr %220, align 4, !tbaa !5
  %265 = load float, ptr %222, align 4, !tbaa !11
  %266 = load float, ptr %250, align 4, !tbaa !26
  %267 = getelementptr inbounds nuw i8, ptr %220, i64 44
  %268 = load float, ptr %267, align 4, !tbaa !27
  %269 = fsub float %264, %266
  %270 = fsub float %265, %268
  %271 = fmul float %270, %270
  %272 = call noundef float @llvm.fmuladd.f32(float %269, float %269, float %271)
  %273 = fcmp olt float %272, 3.600000e+01
  br i1 %273, label %275, label %274

274:                                              ; preds = %263, %259
  store i32 0, ptr %260, align 4, !tbaa !25
  br label %277

275:                                              ; preds = %263, %254
  store i64 0, ptr %250, align 4
  %276 = getelementptr inbounds nuw i8, ptr %220, i64 48
  store float 0x46293E5940000000, ptr %276, align 4, !tbaa !12
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %255, i8 0, i64 12, i1 false)
  br label %277

277:                                              ; preds = %275, %274, %249
  %278 = load float, ptr %220, align 4, !tbaa !5
  %279 = load float, ptr %222, align 4, !tbaa !11
  %280 = fadd float %278, -6.400000e+02
  %281 = fadd float %279, -3.600000e+02
  %282 = fmul float %281, %281
  %283 = call noundef float @llvm.fmuladd.f32(float %280, float %280, float %282)
  %284 = fcmp ugt float %283, 1.600000e+03
  br i1 %284, label %287, label %285

285:                                              ; preds = %277
  store <4 x float> <float 6.400000e+02, float 3.600000e+02, float 0.000000e+00, float 0.000000e+00>, ptr %250, align 4, !tbaa !12
  store i32 1, ptr %251, align 4, !tbaa !17
  %286 = getelementptr inbounds nuw i8, ptr %220, i64 60
  store i32 1, ptr %286, align 4, !tbaa !17
  br label %287

287:                                              ; preds = %285, %277
  br label %288

288:                                              ; preds = %287, %350
  %289 = phi i64 [ %353, %350 ], [ 0, %287 ]
  %290 = phi float [ %352, %350 ], [ 4.000000e+01, %287 ]
  %291 = phi i32 [ %351, %350 ], [ -1, %287 ]
  %292 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %68, i64 0, i64 %289
  %293 = getelementptr inbounds nuw i8, ptr %292, i64 12
  %294 = load i32, ptr %293, align 4, !tbaa !18
  %295 = icmp eq i32 %294, 0
  br i1 %295, label %350, label %296

296:                                              ; preds = %288
  %297 = load float, ptr %292, align 4, !tbaa !28
  %298 = getelementptr inbounds nuw i8, ptr %292, i64 4
  %299 = load float, ptr %298, align 4, !tbaa !29
  %300 = fsub float %278, %297
  %301 = fsub float %279, %299
  %302 = fmul float %301, %301
  %303 = call noundef float @llvm.fmuladd.f32(float %300, float %300, float %302)
  %304 = fcmp ugt float %303, 0.000000e+00
  br i1 %304, label %305, label %319

305:                                              ; preds = %296
  %306 = bitcast float %303 to i32
  %307 = lshr i32 %306, 1
  %308 = add nuw i32 %307, 532676608
  %309 = bitcast i32 %308 to float
  %310 = fdiv float %303, %309
  %311 = fadd float %310, %309
  %312 = fmul float %311, 5.000000e-01
  %313 = fdiv float %303, %312
  %314 = fadd float %312, %313
  %315 = fmul float %314, 5.000000e-01
  %316 = fdiv float %303, %315
  %317 = fadd float %315, %316
  %318 = fmul float %317, 5.000000e-01
  br label %319

319:                                              ; preds = %305, %296
  %320 = phi float [ 0.000000e+00, %296 ], [ %318, %305 ]
  %321 = getelementptr inbounds nuw i8, ptr %292, i64 8
  %322 = load i32, ptr %321, align 4, !tbaa !30
  %323 = sitofp i32 %322 to float
  %324 = fdiv float %323, 7.000000e+01
  %325 = fcmp olt float %324, 0.000000e+00
  %326 = select i1 %325, float 0.000000e+00, float %324
  %327 = fcmp ugt float %326, 0.000000e+00
  br i1 %327, label %328, label %342

328:                                              ; preds = %319
  %329 = bitcast float %326 to i32
  %330 = lshr i32 %329, 1
  %331 = add nuw nsw i32 %330, 532676608
  %332 = bitcast i32 %331 to float
  %333 = fdiv float %326, %332
  %334 = fadd float %333, %332
  %335 = fmul float %334, 5.000000e-01
  %336 = fdiv float %326, %335
  %337 = fadd float %335, %336
  %338 = fmul float %337, 5.000000e-01
  %339 = fdiv float %326, %338
  %340 = fadd float %338, %339
  %341 = fmul float %340, 5.000000e-01
  br label %342

342:                                              ; preds = %328, %319
  %343 = phi float [ 0.000000e+00, %319 ], [ %341, %328 ]
  %344 = call float @llvm.fmuladd.f32(float %343, float 1.800000e+01, float 8.000000e+00)
  %345 = fsub float %320, %344
  %346 = fcmp olt float %345, %290
  %347 = trunc nuw nsw i64 %289 to i32
  %348 = select i1 %346, i32 %347, i32 %291
  %349 = select i1 %346, float %345, float %290
  br label %350

350:                                              ; preds = %342, %288
  %351 = phi i32 [ %348, %342 ], [ %291, %288 ]
  %352 = phi float [ %349, %342 ], [ %290, %288 ]
  %353 = add nuw nsw i64 %289, 1
  %354 = icmp eq i64 %353, 8
  br i1 %354, label %355, label %288, !llvm.loop !31

355:                                              ; preds = %350
  %356 = icmp sgt i32 %351, -1
  br i1 %356, label %357, label %363

357:                                              ; preds = %355
  %358 = zext nneg i32 %351 to i64
  %359 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %68, i64 0, i64 %358
  %360 = load <2 x float>, ptr %359, align 4, !tbaa !12
  store <2 x float> %360, ptr %221, align 4, !tbaa !12
  %361 = getelementptr inbounds nuw i8, ptr %220, i64 24
  store <2 x float> zeroinitializer, ptr %361, align 4, !tbaa !12
  store i32 1, ptr %223, align 4, !tbaa !17
  %362 = getelementptr inbounds nuw i8, ptr %220, i64 36
  store i32 1, ptr %362, align 4, !tbaa !17
  br label %363

363:                                              ; preds = %357, %355
  %364 = add nuw nsw i64 %219, 1
  %365 = icmp eq i64 %364, 120
  br i1 %365, label %366, label %218, !llvm.loop !32

366:                                              ; preds = %363, %366
  %367 = phi i64 [ %591, %366 ], [ 0, %363 ]
  %368 = or disjoint i64 %367, 1
  %369 = or disjoint i64 %367, 2
  %370 = or disjoint i64 %367, 3
  %371 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %367
  %372 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %368
  %373 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %369
  %374 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %370
  %375 = getelementptr inbounds nuw i8, ptr %371, i64 16
  %376 = getelementptr inbounds nuw i8, ptr %372, i64 16
  %377 = getelementptr inbounds nuw i8, ptr %373, i64 16
  %378 = getelementptr inbounds nuw i8, ptr %374, i64 16
  %379 = getelementptr inbounds nuw [120 x [2 x %struct.Shout]], ptr %155, i64 0, i64 %367, i64 0
  %380 = getelementptr inbounds nuw [120 x [2 x %struct.Shout]], ptr %155, i64 0, i64 %368, i64 0
  %381 = getelementptr inbounds nuw [120 x [2 x %struct.Shout]], ptr %155, i64 0, i64 %369, i64 0
  %382 = getelementptr inbounds nuw [120 x [2 x %struct.Shout]], ptr %155, i64 0, i64 %370, i64 0
  %383 = load float, ptr %375, align 4, !tbaa !26
  %384 = load float, ptr %376, align 4, !tbaa !26
  %385 = load float, ptr %377, align 4, !tbaa !26
  %386 = load float, ptr %378, align 4, !tbaa !26
  %387 = insertelement <4 x float> poison, float %383, i64 0
  %388 = insertelement <4 x float> %387, float %384, i64 1
  %389 = insertelement <4 x float> %388, float %385, i64 2
  %390 = insertelement <4 x float> %389, float %386, i64 3
  %391 = getelementptr inbounds nuw i8, ptr %371, i64 20
  %392 = getelementptr inbounds nuw i8, ptr %372, i64 20
  %393 = getelementptr inbounds nuw i8, ptr %373, i64 20
  %394 = getelementptr inbounds nuw i8, ptr %374, i64 20
  %395 = load float, ptr %391, align 4, !tbaa !27
  %396 = load float, ptr %392, align 4, !tbaa !27
  %397 = load float, ptr %393, align 4, !tbaa !27
  %398 = load float, ptr %394, align 4, !tbaa !27
  %399 = insertelement <4 x float> poison, float %395, i64 0
  %400 = insertelement <4 x float> %399, float %396, i64 1
  %401 = insertelement <4 x float> %400, float %397, i64 2
  %402 = insertelement <4 x float> %401, float %398, i64 3
  %403 = getelementptr inbounds nuw i8, ptr %371, i64 24
  %404 = getelementptr inbounds nuw i8, ptr %372, i64 24
  %405 = getelementptr inbounds nuw i8, ptr %373, i64 24
  %406 = getelementptr inbounds nuw i8, ptr %374, i64 24
  %407 = load float, ptr %403, align 4, !tbaa !33
  %408 = load float, ptr %404, align 4, !tbaa !33
  %409 = load float, ptr %405, align 4, !tbaa !33
  %410 = load float, ptr %406, align 4, !tbaa !33
  %411 = insertelement <4 x float> poison, float %407, i64 0
  %412 = insertelement <4 x float> %411, float %408, i64 1
  %413 = insertelement <4 x float> %412, float %409, i64 2
  %414 = insertelement <4 x float> %413, float %410, i64 3
  %415 = getelementptr inbounds nuw i8, ptr %371, i64 28
  %416 = getelementptr inbounds nuw i8, ptr %372, i64 28
  %417 = getelementptr inbounds nuw i8, ptr %373, i64 28
  %418 = getelementptr inbounds nuw i8, ptr %374, i64 28
  %419 = load float, ptr %415, align 4, !tbaa !24
  %420 = load float, ptr %416, align 4, !tbaa !24
  %421 = load float, ptr %417, align 4, !tbaa !24
  %422 = load float, ptr %418, align 4, !tbaa !24
  %423 = getelementptr inbounds nuw i8, ptr %371, i64 32
  %424 = getelementptr inbounds nuw i8, ptr %372, i64 32
  %425 = getelementptr inbounds nuw i8, ptr %373, i64 32
  %426 = getelementptr inbounds nuw i8, ptr %374, i64 32
  %427 = load i32, ptr %423, align 4, !tbaa !22
  %428 = load i32, ptr %424, align 4, !tbaa !22
  %429 = load i32, ptr %425, align 4, !tbaa !22
  %430 = load i32, ptr %426, align 4, !tbaa !22
  %431 = load <2 x float>, ptr %371, align 4, !tbaa !12
  store <2 x float> %431, ptr %379, align 4, !tbaa !12
  %432 = load <2 x float>, ptr %372, align 4, !tbaa !12
  %433 = shufflevector <2 x float> %431, <2 x float> %432, <4 x i32> <i32 0, i32 2, i32 poison, i32 poison>
  %434 = shufflevector <2 x float> %431, <2 x float> %432, <4 x i32> <i32 1, i32 3, i32 poison, i32 poison>
  store <2 x float> %432, ptr %380, align 4, !tbaa !12
  %435 = load <2 x float>, ptr %373, align 4, !tbaa !12
  %436 = shufflevector <2 x float> %435, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %437 = shufflevector <4 x float> %433, <4 x float> %436, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %438 = shufflevector <4 x float> %434, <4 x float> %436, <4 x i32> <i32 0, i32 1, i32 5, i32 poison>
  store <2 x float> %435, ptr %381, align 4, !tbaa !12
  %439 = load <2 x float>, ptr %374, align 4, !tbaa !12
  %440 = shufflevector <2 x float> %439, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %441 = shufflevector <4 x float> %437, <4 x float> %440, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %442 = shufflevector <4 x float> %438, <4 x float> %440, <4 x i32> <i32 0, i32 1, i32 2, i32 5>
  %443 = fsub <4 x float> %441, %390
  %444 = fsub <4 x float> %442, %402
  %445 = fmul <4 x float> %444, %444
  %446 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %443, <4 x float> %443, <4 x float> %445)
  %447 = fcmp ugt <4 x float> %446, zeroinitializer
  %448 = bitcast <4 x float> %446 to <4 x i32>
  %449 = lshr <4 x i32> %448, splat (i32 1)
  %450 = add nuw <4 x i32> %449, splat (i32 532676608)
  %451 = bitcast <4 x i32> %450 to <4 x float>
  %452 = fdiv <4 x float> %446, %451
  %453 = fadd <4 x float> %452, %451
  %454 = fmul <4 x float> %453, splat (float 5.000000e-01)
  %455 = fdiv <4 x float> %446, %454
  %456 = fadd <4 x float> %454, %455
  %457 = fmul <4 x float> %456, splat (float 5.000000e-01)
  %458 = fdiv <4 x float> %446, %457
  %459 = fadd <4 x float> %457, %458
  %460 = fmul <4 x float> %459, splat (float 5.000000e-01)
  %461 = select <4 x i1> %447, <4 x float> %460, <4 x float> zeroinitializer
  %462 = fadd <4 x float> %461, %414
  store <2 x float> %439, ptr %382, align 4, !tbaa !12
  %463 = getelementptr inbounds nuw i8, ptr %379, i64 8
  %464 = getelementptr inbounds nuw i8, ptr %380, i64 8
  %465 = getelementptr inbounds nuw i8, ptr %381, i64 8
  %466 = getelementptr inbounds nuw i8, ptr %382, i64 8
  %467 = extractelement <4 x float> %462, i64 0
  store float %467, ptr %463, align 4, !tbaa !12
  %468 = extractelement <4 x float> %462, i64 1
  store float %468, ptr %464, align 4, !tbaa !12
  %469 = extractelement <4 x float> %462, i64 2
  store float %469, ptr %465, align 4, !tbaa !12
  %470 = extractelement <4 x float> %462, i64 3
  store float %470, ptr %466, align 4, !tbaa !12
  %471 = getelementptr inbounds nuw i8, ptr %379, i64 12
  %472 = getelementptr inbounds nuw i8, ptr %380, i64 12
  %473 = getelementptr inbounds nuw i8, ptr %381, i64 12
  %474 = getelementptr inbounds nuw i8, ptr %382, i64 12
  store float %419, ptr %471, align 4, !tbaa !12
  store float %420, ptr %472, align 4, !tbaa !12
  store float %421, ptr %473, align 4, !tbaa !12
  store float %422, ptr %474, align 4, !tbaa !12
  %475 = getelementptr inbounds nuw i8, ptr %379, i64 16
  %476 = getelementptr inbounds nuw i8, ptr %380, i64 16
  %477 = getelementptr inbounds nuw i8, ptr %381, i64 16
  %478 = getelementptr inbounds nuw i8, ptr %382, i64 16
  store i32 %427, ptr %475, align 4, !tbaa !17
  store i32 %428, ptr %476, align 4, !tbaa !17
  store i32 %429, ptr %477, align 4, !tbaa !17
  store i32 %430, ptr %478, align 4, !tbaa !17
  %479 = getelementptr inbounds nuw i8, ptr %371, i64 40
  %480 = getelementptr inbounds nuw i8, ptr %372, i64 40
  %481 = getelementptr inbounds nuw i8, ptr %373, i64 40
  %482 = getelementptr inbounds nuw i8, ptr %374, i64 40
  %483 = mul nuw nsw i64 %367, 40
  %484 = mul nuw nsw i64 %368, 40
  %485 = mul nuw nsw i64 %369, 40
  %486 = mul nuw nsw i64 %370, 40
  %487 = getelementptr inbounds nuw i8, ptr %155, i64 %483
  %488 = getelementptr inbounds nuw i8, ptr %155, i64 %484
  %489 = getelementptr inbounds nuw i8, ptr %155, i64 %485
  %490 = getelementptr inbounds nuw i8, ptr %155, i64 %486
  %491 = getelementptr inbounds nuw i8, ptr %487, i64 20
  %492 = getelementptr inbounds nuw i8, ptr %488, i64 20
  %493 = getelementptr inbounds nuw i8, ptr %489, i64 20
  %494 = getelementptr inbounds nuw i8, ptr %490, i64 20
  %495 = load float, ptr %479, align 4, !tbaa !26
  %496 = load float, ptr %480, align 4, !tbaa !26
  %497 = load float, ptr %481, align 4, !tbaa !26
  %498 = load float, ptr %482, align 4, !tbaa !26
  %499 = insertelement <4 x float> poison, float %495, i64 0
  %500 = insertelement <4 x float> %499, float %496, i64 1
  %501 = insertelement <4 x float> %500, float %497, i64 2
  %502 = insertelement <4 x float> %501, float %498, i64 3
  %503 = getelementptr inbounds nuw i8, ptr %371, i64 44
  %504 = getelementptr inbounds nuw i8, ptr %372, i64 44
  %505 = getelementptr inbounds nuw i8, ptr %373, i64 44
  %506 = getelementptr inbounds nuw i8, ptr %374, i64 44
  %507 = load float, ptr %503, align 4, !tbaa !27
  %508 = load float, ptr %504, align 4, !tbaa !27
  %509 = load float, ptr %505, align 4, !tbaa !27
  %510 = load float, ptr %506, align 4, !tbaa !27
  %511 = insertelement <4 x float> poison, float %507, i64 0
  %512 = insertelement <4 x float> %511, float %508, i64 1
  %513 = insertelement <4 x float> %512, float %509, i64 2
  %514 = insertelement <4 x float> %513, float %510, i64 3
  %515 = getelementptr inbounds nuw i8, ptr %371, i64 48
  %516 = getelementptr inbounds nuw i8, ptr %372, i64 48
  %517 = getelementptr inbounds nuw i8, ptr %373, i64 48
  %518 = getelementptr inbounds nuw i8, ptr %374, i64 48
  %519 = load float, ptr %515, align 4, !tbaa !33
  %520 = load float, ptr %516, align 4, !tbaa !33
  %521 = load float, ptr %517, align 4, !tbaa !33
  %522 = load float, ptr %518, align 4, !tbaa !33
  %523 = insertelement <4 x float> poison, float %519, i64 0
  %524 = insertelement <4 x float> %523, float %520, i64 1
  %525 = insertelement <4 x float> %524, float %521, i64 2
  %526 = insertelement <4 x float> %525, float %522, i64 3
  %527 = getelementptr inbounds nuw i8, ptr %371, i64 52
  %528 = getelementptr inbounds nuw i8, ptr %372, i64 52
  %529 = getelementptr inbounds nuw i8, ptr %373, i64 52
  %530 = getelementptr inbounds nuw i8, ptr %374, i64 52
  %531 = load float, ptr %527, align 4, !tbaa !24
  %532 = load float, ptr %528, align 4, !tbaa !24
  %533 = load float, ptr %529, align 4, !tbaa !24
  %534 = load float, ptr %530, align 4, !tbaa !24
  %535 = getelementptr inbounds nuw i8, ptr %371, i64 56
  %536 = getelementptr inbounds nuw i8, ptr %372, i64 56
  %537 = getelementptr inbounds nuw i8, ptr %373, i64 56
  %538 = getelementptr inbounds nuw i8, ptr %374, i64 56
  %539 = load i32, ptr %535, align 4, !tbaa !22
  %540 = load i32, ptr %536, align 4, !tbaa !22
  %541 = load i32, ptr %537, align 4, !tbaa !22
  %542 = load i32, ptr %538, align 4, !tbaa !22
  %543 = load <2 x float>, ptr %371, align 4, !tbaa !12
  %544 = load <2 x float>, ptr %372, align 4, !tbaa !12
  %545 = shufflevector <2 x float> %543, <2 x float> %544, <4 x i32> <i32 0, i32 2, i32 poison, i32 poison>
  %546 = shufflevector <2 x float> %543, <2 x float> %544, <4 x i32> <i32 1, i32 3, i32 poison, i32 poison>
  %547 = load <2 x float>, ptr %373, align 4, !tbaa !12
  %548 = shufflevector <2 x float> %547, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %549 = shufflevector <4 x float> %545, <4 x float> %548, <4 x i32> <i32 0, i32 1, i32 4, i32 poison>
  %550 = shufflevector <4 x float> %546, <4 x float> %548, <4 x i32> <i32 0, i32 1, i32 5, i32 poison>
  store <2 x float> %547, ptr %493, align 4, !tbaa !12
  %551 = load <2 x float>, ptr %374, align 4, !tbaa !12
  store <2 x float> %544, ptr %492, align 4, !tbaa !12
  store <2 x float> %543, ptr %491, align 4, !tbaa !12
  %552 = shufflevector <2 x float> %551, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %553 = shufflevector <4 x float> %549, <4 x float> %552, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %554 = shufflevector <4 x float> %550, <4 x float> %552, <4 x i32> <i32 0, i32 1, i32 2, i32 5>
  %555 = fsub <4 x float> %553, %502
  %556 = fsub <4 x float> %554, %514
  %557 = fmul <4 x float> %556, %556
  %558 = call <4 x float> @llvm.fmuladd.v4f32(<4 x float> %555, <4 x float> %555, <4 x float> %557)
  %559 = fcmp ole <4 x float> %558, zeroinitializer
  %560 = bitcast <4 x float> %558 to <4 x i32>
  %561 = lshr <4 x i32> %560, splat (i32 1)
  %562 = add nuw <4 x i32> %561, splat (i32 532676608)
  %563 = bitcast <4 x i32> %562 to <4 x float>
  %564 = fdiv <4 x float> %558, %563
  %565 = fadd <4 x float> %564, %563
  %566 = fmul <4 x float> %565, splat (float 5.000000e-01)
  %567 = fdiv <4 x float> %558, %566
  %568 = fadd <4 x float> %566, %567
  %569 = fmul <4 x float> %568, splat (float 5.000000e-01)
  %570 = fdiv <4 x float> %558, %569
  %571 = fadd <4 x float> %569, %570
  %572 = fmul <4 x float> %571, splat (float 5.000000e-01)
  %573 = select <4 x i1> %559, <4 x float> zeroinitializer, <4 x float> %572
  %574 = fadd <4 x float> %573, %526
  store <2 x float> %551, ptr %494, align 4, !tbaa !12
  %575 = getelementptr inbounds nuw i8, ptr %487, i64 28
  %576 = getelementptr inbounds nuw i8, ptr %488, i64 28
  %577 = getelementptr inbounds nuw i8, ptr %489, i64 28
  %578 = getelementptr inbounds nuw i8, ptr %490, i64 28
  %579 = extractelement <4 x float> %574, i64 0
  store float %579, ptr %575, align 4, !tbaa !12
  %580 = extractelement <4 x float> %574, i64 1
  store float %580, ptr %576, align 4, !tbaa !12
  %581 = extractelement <4 x float> %574, i64 2
  store float %581, ptr %577, align 4, !tbaa !12
  %582 = extractelement <4 x float> %574, i64 3
  store float %582, ptr %578, align 4, !tbaa !12
  %583 = getelementptr inbounds nuw i8, ptr %487, i64 32
  %584 = getelementptr inbounds nuw i8, ptr %488, i64 32
  %585 = getelementptr inbounds nuw i8, ptr %489, i64 32
  %586 = getelementptr inbounds nuw i8, ptr %490, i64 32
  store float %531, ptr %583, align 4, !tbaa !12
  store float %532, ptr %584, align 4, !tbaa !12
  store float %533, ptr %585, align 4, !tbaa !12
  store float %534, ptr %586, align 4, !tbaa !12
  %587 = getelementptr inbounds nuw i8, ptr %487, i64 36
  %588 = getelementptr inbounds nuw i8, ptr %488, i64 36
  %589 = getelementptr inbounds nuw i8, ptr %489, i64 36
  %590 = getelementptr inbounds nuw i8, ptr %490, i64 36
  store i32 %539, ptr %587, align 4, !tbaa !17
  store i32 %540, ptr %588, align 4, !tbaa !17
  store i32 %541, ptr %589, align 4, !tbaa !17
  store i32 %542, ptr %590, align 4, !tbaa !17
  %591 = add nuw i64 %367, 4
  %592 = icmp eq i64 %591, 120
  br i1 %592, label %593, label %366, !llvm.loop !34

593:                                              ; preds = %366, %598
  %594 = phi i64 [ %599, %598 ], [ 0, %366 ]
  %595 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %594
  %596 = getelementptr inbounds nuw i8, ptr %595, i64 16
  %597 = getelementptr inbounds nuw i8, ptr %595, i64 4
  br label %601

598:                                              ; preds = %706
  %599 = add nuw nsw i64 %594, 1
  %600 = icmp eq i64 %599, 120
  br i1 %600, label %707, label %593, !llvm.loop !37

601:                                              ; preds = %706, %593
  %602 = phi i1 [ true, %593 ], [ false, %706 ]
  %603 = phi i64 [ 0, %593 ], [ 1, %706 ]
  %604 = getelementptr inbounds nuw [2 x %struct.Belief], ptr %596, i64 0, i64 %603
  %605 = getelementptr inbounds nuw i8, ptr %604, i64 20
  %606 = load i32, ptr %605, align 4, !tbaa !25
  %607 = icmp eq i32 %606, 0
  br i1 %607, label %608, label %706

608:                                              ; preds = %601
  %609 = getelementptr inbounds nuw i8, ptr %604, i64 16
  %610 = load i32, ptr %609, align 4, !tbaa !22
  %611 = icmp eq i32 %610, 0
  br i1 %611, label %642, label %612

612:                                              ; preds = %608
  %613 = load float, ptr %595, align 4, !tbaa !5
  %614 = load float, ptr %597, align 4, !tbaa !11
  %615 = load float, ptr %604, align 4, !tbaa !26
  %616 = getelementptr inbounds nuw i8, ptr %604, i64 4
  %617 = load float, ptr %616, align 4, !tbaa !27
  %618 = fsub float %613, %615
  %619 = fsub float %614, %617
  %620 = fmul float %619, %619
  %621 = call noundef float @llvm.fmuladd.f32(float %618, float %618, float %620)
  %622 = fcmp ugt float %621, 0.000000e+00
  br i1 %622, label %623, label %637

623:                                              ; preds = %612
  %624 = bitcast float %621 to i32
  %625 = lshr i32 %624, 1
  %626 = add nuw i32 %625, 532676608
  %627 = bitcast i32 %626 to float
  %628 = fdiv float %621, %627
  %629 = fadd float %628, %627
  %630 = fmul float %629, 5.000000e-01
  %631 = fdiv float %621, %630
  %632 = fadd float %630, %631
  %633 = fmul float %632, 5.000000e-01
  %634 = fdiv float %621, %633
  %635 = fadd float %633, %634
  %636 = fmul float %635, 5.000000e-01
  br label %637

637:                                              ; preds = %623, %612
  %638 = phi float [ 0.000000e+00, %612 ], [ %636, %623 ]
  %639 = getelementptr inbounds nuw i8, ptr %604, i64 8
  %640 = load float, ptr %639, align 4, !tbaa !33
  %641 = fadd float %638, %640
  br label %642

642:                                              ; preds = %637, %608
  %643 = phi float [ %641, %637 ], [ 0x46293E5940000000, %608 ]
  %644 = getelementptr inbounds nuw i8, ptr %604, i64 12
  br label %647

645:                                              ; preds = %699
  %646 = icmp eq ptr %700, null
  br i1 %646, label %706, label %704

647:                                              ; preds = %699, %642
  %648 = phi i64 [ 0, %642 ], [ %702, %699 ]
  %649 = phi float [ %643, %642 ], [ %701, %699 ]
  %650 = phi ptr [ null, %642 ], [ %700, %699 ]
  %651 = getelementptr inbounds nuw [120 x [2 x %struct.Shout]], ptr %155, i64 0, i64 %648, i64 %603
  %652 = icmp eq i64 %648, %594
  br i1 %652, label %699, label %653

653:                                              ; preds = %647
  %654 = getelementptr inbounds nuw i8, ptr %651, i64 16
  %655 = load i32, ptr %654, align 4, !tbaa !38
  %656 = icmp eq i32 %655, 0
  br i1 %656, label %699, label %657

657:                                              ; preds = %653
  br i1 %611, label %663, label %658

658:                                              ; preds = %657
  %659 = getelementptr inbounds nuw i8, ptr %651, i64 12
  %660 = load float, ptr %659, align 4, !tbaa !40
  %661 = load float, ptr %644, align 4, !tbaa !24
  %662 = fcmp ogt float %660, %661
  br i1 %662, label %699, label %663

663:                                              ; preds = %658, %657
  %664 = load float, ptr %595, align 4, !tbaa !5
  %665 = load float, ptr %597, align 4, !tbaa !11
  %666 = load float, ptr %651, align 4, !tbaa !41
  %667 = getelementptr inbounds nuw i8, ptr %651, i64 4
  %668 = load float, ptr %667, align 4, !tbaa !42
  %669 = fsub float %664, %666
  %670 = fsub float %665, %668
  %671 = fmul float %670, %670
  %672 = call noundef float @llvm.fmuladd.f32(float %669, float %669, float %671)
  %673 = fcmp ogt float %672, 1.690000e+04
  br i1 %673, label %699, label %674

674:                                              ; preds = %663
  %675 = getelementptr inbounds nuw i8, ptr %651, i64 8
  %676 = load float, ptr %675, align 4, !tbaa !43
  %677 = fcmp ugt float %672, 0.000000e+00
  br i1 %677, label %678, label %692

678:                                              ; preds = %674
  %679 = bitcast float %672 to i32
  %680 = lshr i32 %679, 1
  %681 = add nuw i32 %680, 532676608
  %682 = bitcast i32 %681 to float
  %683 = fdiv float %672, %682
  %684 = fadd float %683, %682
  %685 = fmul float %684, 5.000000e-01
  %686 = fdiv float %672, %685
  %687 = fadd float %685, %686
  %688 = fmul float %687, 5.000000e-01
  %689 = fdiv float %672, %688
  %690 = fadd float %688, %689
  %691 = fmul float %690, 5.000000e-01
  br label %692

692:                                              ; preds = %678, %674
  %693 = phi float [ 0.000000e+00, %674 ], [ %691, %678 ]
  %694 = fadd float %676, %693
  %695 = fadd float %649, 0x3F50624DE0000000
  %696 = fcmp ugt float %694, %695
  %697 = select i1 %696, ptr %650, ptr %651
  %698 = select i1 %696, float %649, float %694
  br label %699

699:                                              ; preds = %692, %663, %658, %653, %647
  %700 = phi ptr [ %650, %653 ], [ %650, %647 ], [ %650, %658 ], [ %697, %692 ], [ %650, %663 ]
  %701 = phi float [ %649, %653 ], [ %649, %647 ], [ %649, %658 ], [ %698, %692 ], [ %649, %663 ]
  %702 = add nuw nsw i64 %648, 1
  %703 = icmp eq i64 %702, 120
  br i1 %703, label %645, label %647, !llvm.loop !44

704:                                              ; preds = %645
  %705 = load <4 x float>, ptr %700, align 4, !tbaa !12
  store <4 x float> %705, ptr %604, align 4, !tbaa !12
  store i32 1, ptr %609, align 4, !tbaa !17
  store i32 0, ptr %605, align 4, !tbaa !17
  br label %706

706:                                              ; preds = %704, %645, %601
  br i1 %602, label %601, label %598, !llvm.loop !45

707:                                              ; preds = %598, %946
  %708 = phi i64 [ %947, %946 ], [ 0, %598 ]
  %709 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %708
  %710 = getelementptr inbounds nuw i8, ptr %709, i64 68
  %711 = load i32, ptr %710, align 4, !tbaa !13
  %712 = icmp eq i32 %711, 0
  br i1 %712, label %713, label %790

713:                                              ; preds = %707
  %714 = getelementptr inbounds nuw i8, ptr %709, i64 64
  %715 = load i32, ptr %714, align 4, !tbaa !46
  %716 = icmp eq i32 %715, 0
  %717 = select i1 %716, i64 32, i64 56
  %718 = getelementptr inbounds nuw i8, ptr %709, i64 %717
  %719 = load i32, ptr %718, align 4, !tbaa !22
  %720 = icmp eq i32 %719, 0
  br i1 %720, label %790, label %721

721:                                              ; preds = %713
  %722 = select i1 %716, i64 16, i64 40
  %723 = getelementptr inbounds nuw i8, ptr %709, i64 %722
  %724 = load float, ptr %723, align 4, !tbaa !26
  %725 = select i1 %716, i64 20, i64 44
  %726 = getelementptr inbounds nuw i8, ptr %709, i64 %725
  %727 = load float, ptr %726, align 4, !tbaa !27
  %728 = load <2 x float>, ptr %709, align 4, !tbaa !12
  %729 = insertelement <2 x float> poison, float %724, i64 0
  %730 = insertelement <2 x float> %729, float %727, i64 1
  %731 = fsub <2 x float> %730, %728
  %732 = fmul <2 x float> %731, %731
  %733 = extractelement <2 x float> %732, i64 1
  %734 = extractelement <2 x float> %731, i64 0
  %735 = call float @llvm.fmuladd.f32(float %734, float %734, float %733)
  %736 = fcmp ugt float %735, 0.000000e+00
  br i1 %736, label %737, label %822

737:                                              ; preds = %721
  %738 = bitcast float %735 to i32
  %739 = lshr i32 %738, 1
  %740 = add nuw i32 %739, 532676608
  %741 = bitcast i32 %740 to float
  %742 = fdiv float %735, %741
  %743 = fadd float %742, %741
  %744 = fmul float %743, 5.000000e-01
  %745 = fdiv float %735, %744
  %746 = fadd float %744, %745
  %747 = fmul float %746, 5.000000e-01
  %748 = fdiv float %735, %747
  %749 = fadd float %747, %748
  %750 = fmul float %749, 5.000000e-01
  %751 = fcmp ogt float %750, 0.000000e+00
  br i1 %751, label %752, label %822

752:                                              ; preds = %737
  %753 = insertelement <2 x float> poison, float %750, i64 0
  %754 = shufflevector <2 x float> %753, <2 x float> poison, <2 x i32> zeroinitializer
  %755 = fdiv <2 x float> %731, %754
  %756 = getelementptr inbounds nuw i8, ptr %709, i64 8
  %757 = load float, ptr %756, align 4, !tbaa !47
  %758 = getelementptr inbounds nuw i8, ptr %709, i64 12
  %759 = load float, ptr %758, align 4, !tbaa !48
  %760 = extractelement <2 x float> %755, i64 1
  %761 = fmul float %760, %759
  %762 = extractelement <2 x float> %755, i64 0
  %763 = call float @llvm.fmuladd.f32(float %757, float %762, float %761)
  %764 = fcmp ult float %763, 0x3FEFD70A40000000
  br i1 %764, label %766, label %765

765:                                              ; preds = %752
  store <2 x float> %755, ptr %756, align 4, !tbaa !12
  br label %822

766:                                              ; preds = %752
  %767 = fneg float %762
  %768 = fmul float %759, %767
  %769 = call float @llvm.fmuladd.f32(float %757, float %760, float %768)
  %770 = fcmp oge float %769, 0.000000e+00
  %771 = select i1 %770, float 0x3FB98EAD80000000, float 0xBFB98EAD80000000
  %772 = fneg float %759
  %773 = insertelement <2 x float> poison, float %771, i64 0
  %774 = insertelement <2 x float> %773, float %759, i64 1
  %775 = insertelement <2 x float> <float poison, float 0x3FEFD71300000000>, float %772, i64 0
  %776 = fmul <2 x float> %774, %775
  %777 = insertelement <2 x float> <float 0x3FEFD71300000000, float poison>, float %771, i64 1
  %778 = insertelement <2 x float> poison, float %757, i64 0
  %779 = shufflevector <2 x float> %778, <2 x float> poison, <2 x i32> zeroinitializer
  %780 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %777, <2 x float> %779, <2 x float> %776)
  %781 = fmul <2 x float> %780, %780
  %782 = extractelement <2 x float> %781, i64 1
  %783 = extractelement <2 x float> %780, i64 0
  %784 = call float @llvm.fmuladd.f32(float %783, float %783, float %782)
  %785 = fsub float 3.000000e+00, %784
  %786 = fmul float %785, 5.000000e-01
  %787 = insertelement <2 x float> poison, float %786, i64 0
  %788 = shufflevector <2 x float> %787, <2 x float> poison, <2 x i32> zeroinitializer
  %789 = fmul <2 x float> %780, %788
  store <2 x float> %789, ptr %756, align 4, !tbaa !12
  br label %822

790:                                              ; preds = %713, %707
  %791 = call i32 @simRand() #6
  %792 = and i32 %791, 65535
  %793 = uitofp nneg i32 %792 to float
  %794 = fmul float %793, 0x3FD539F560000000
  %795 = fmul float %794, 0x3EF0000000000000
  %796 = fadd float %795, 0xBFC539F560000000
  %797 = fmul float %796, %796
  %798 = fmul float %797, 5.000000e-01
  %799 = fsub float 1.000000e+00, %798
  %800 = fmul float %797, %797
  %801 = fdiv float %800, 2.400000e+01
  %802 = fadd float %799, %801
  %803 = fdiv float %797, 6.000000e+00
  %804 = fsub float 1.000000e+00, %803
  %805 = fmul float %796, %804
  %806 = getelementptr inbounds nuw i8, ptr %709, i64 8
  %807 = load float, ptr %806, align 4, !tbaa !47
  %808 = getelementptr inbounds nuw i8, ptr %709, i64 12
  %809 = load float, ptr %808, align 4, !tbaa !48
  %810 = fneg float %809
  %811 = fmul float %805, %810
  %812 = call float @llvm.fmuladd.f32(float %802, float %807, float %811)
  %813 = fmul float %809, %802
  %814 = call float @llvm.fmuladd.f32(float %805, float %807, float %813)
  %815 = fmul float %814, %814
  %816 = call float @llvm.fmuladd.f32(float %812, float %812, float %815)
  %817 = fsub float 3.000000e+00, %816
  %818 = fmul float %817, 5.000000e-01
  %819 = fmul float %812, %818
  store float %819, ptr %806, align 4, !tbaa !47
  %820 = fmul float %814, %818
  store float %820, ptr %808, align 4, !tbaa !48
  %821 = load <2 x float>, ptr %709, align 4, !tbaa !12
  br label %822

822:                                              ; preds = %790, %766, %765, %737, %721
  %823 = phi <2 x float> [ %728, %721 ], [ %728, %737 ], [ %728, %766 ], [ %728, %765 ], [ %821, %790 ]
  %824 = getelementptr inbounds nuw i8, ptr %709, i64 8
  %825 = getelementptr inbounds nuw i8, ptr %709, i64 12
  %826 = getelementptr inbounds nuw i8, ptr %709, i64 4
  %827 = load <2 x float>, ptr %824, align 4, !tbaa !12
  %828 = fmul <2 x float> %827, splat (float 1.100000e+02)
  %829 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %828, <2 x float> splat (float 0x3F91111120000000), <2 x float> %823)
  store <2 x float> %829, ptr %709, align 4, !tbaa !12
  %830 = extractelement <2 x float> %829, i64 0
  %831 = fcmp olt float %830, 1.000000e+00
  br i1 %831, label %834, label %832

832:                                              ; preds = %822
  %833 = fcmp ogt float %830, 1.278000e+03
  br i1 %833, label %834, label %838

834:                                              ; preds = %832, %822
  %835 = phi float [ 1.000000e+00, %822 ], [ 1.278000e+03, %832 ]
  store float %835, ptr %709, align 4, !tbaa !5
  %836 = extractelement <2 x float> %827, i64 0
  %837 = fneg float %836
  store float %837, ptr %824, align 4, !tbaa !47
  br label %838

838:                                              ; preds = %834, %832
  %839 = phi float [ %830, %832 ], [ %835, %834 ]
  %840 = extractelement <2 x float> %829, i64 1
  %841 = fcmp olt float %840, 1.000000e+00
  br i1 %841, label %844, label %842

842:                                              ; preds = %838
  %843 = fcmp ogt float %840, 7.180000e+02
  br i1 %843, label %844, label %848

844:                                              ; preds = %842, %838
  %845 = phi float [ 1.000000e+00, %838 ], [ 7.180000e+02, %842 ]
  store float %845, ptr %826, align 4, !tbaa !11
  %846 = extractelement <2 x float> %827, i64 1
  %847 = fneg float %846
  store float %847, ptr %825, align 4, !tbaa !48
  br label %848

848:                                              ; preds = %844, %842
  %849 = phi float [ %840, %842 ], [ %845, %844 ]
  %850 = load i32, ptr %710, align 4, !tbaa !13
  %851 = icmp eq i32 %850, 0
  br i1 %851, label %852, label %946

852:                                              ; preds = %848
  %853 = getelementptr inbounds nuw i8, ptr %709, i64 64
  %854 = load i32, ptr %853, align 4, !tbaa !46
  %855 = icmp eq i32 %854, 0
  br i1 %855, label %865, label %856

856:                                              ; preds = %852
  %857 = fadd float %839, -6.400000e+02
  %858 = call float @llvm.fabs.f32(float %857)
  %859 = fcmp ugt float %858, 2.400000e+01
  br i1 %859, label %946, label %860

860:                                              ; preds = %856
  %861 = fadd float %849, -3.600000e+02
  %862 = call float @llvm.fabs.f32(float %861)
  %863 = fcmp ugt float %862, 2.400000e+01
  br i1 %863, label %946, label %864

864:                                              ; preds = %860
  store i32 0, ptr %853, align 4, !tbaa !46
  br label %946

865:                                              ; preds = %852, %927
  %866 = phi i64 [ %930, %927 ], [ 0, %852 ]
  %867 = phi float [ %929, %927 ], [ 7.000000e+00, %852 ]
  %868 = phi i32 [ %928, %927 ], [ -1, %852 ]
  %869 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %68, i64 0, i64 %866
  %870 = getelementptr inbounds nuw i8, ptr %869, i64 12
  %871 = load i32, ptr %870, align 4, !tbaa !18
  %872 = icmp eq i32 %871, 0
  br i1 %872, label %927, label %873

873:                                              ; preds = %865
  %874 = load float, ptr %869, align 4, !tbaa !28
  %875 = getelementptr inbounds nuw i8, ptr %869, i64 4
  %876 = load float, ptr %875, align 4, !tbaa !29
  %877 = fsub float %839, %874
  %878 = fsub float %849, %876
  %879 = fmul float %878, %878
  %880 = call noundef float @llvm.fmuladd.f32(float %877, float %877, float %879)
  %881 = fcmp ugt float %880, 0.000000e+00
  br i1 %881, label %882, label %896

882:                                              ; preds = %873
  %883 = bitcast float %880 to i32
  %884 = lshr i32 %883, 1
  %885 = add nuw i32 %884, 532676608
  %886 = bitcast i32 %885 to float
  %887 = fdiv float %880, %886
  %888 = fadd float %887, %886
  %889 = fmul float %888, 5.000000e-01
  %890 = fdiv float %880, %889
  %891 = fadd float %889, %890
  %892 = fmul float %891, 5.000000e-01
  %893 = fdiv float %880, %892
  %894 = fadd float %892, %893
  %895 = fmul float %894, 5.000000e-01
  br label %896

896:                                              ; preds = %882, %873
  %897 = phi float [ 0.000000e+00, %873 ], [ %895, %882 ]
  %898 = getelementptr inbounds nuw i8, ptr %869, i64 8
  %899 = load i32, ptr %898, align 4, !tbaa !30
  %900 = sitofp i32 %899 to float
  %901 = fdiv float %900, 7.000000e+01
  %902 = fcmp olt float %901, 0.000000e+00
  %903 = select i1 %902, float 0.000000e+00, float %901
  %904 = fcmp ugt float %903, 0.000000e+00
  br i1 %904, label %905, label %919

905:                                              ; preds = %896
  %906 = bitcast float %903 to i32
  %907 = lshr i32 %906, 1
  %908 = add nuw nsw i32 %907, 532676608
  %909 = bitcast i32 %908 to float
  %910 = fdiv float %903, %909
  %911 = fadd float %910, %909
  %912 = fmul float %911, 5.000000e-01
  %913 = fdiv float %903, %912
  %914 = fadd float %912, %913
  %915 = fmul float %914, 5.000000e-01
  %916 = fdiv float %903, %915
  %917 = fadd float %915, %916
  %918 = fmul float %917, 5.000000e-01
  br label %919

919:                                              ; preds = %905, %896
  %920 = phi float [ 0.000000e+00, %896 ], [ %918, %905 ]
  %921 = call float @llvm.fmuladd.f32(float %920, float 1.800000e+01, float 8.000000e+00)
  %922 = fsub float %897, %921
  %923 = fcmp olt float %922, %867
  %924 = trunc nuw nsw i64 %866 to i32
  %925 = select i1 %923, i32 %924, i32 %868
  %926 = select i1 %923, float %922, float %867
  br label %927

927:                                              ; preds = %919, %865
  %928 = phi i32 [ %925, %919 ], [ %868, %865 ]
  %929 = phi float [ %926, %919 ], [ %867, %865 ]
  %930 = add nuw nsw i64 %866, 1
  %931 = icmp eq i64 %930, 8
  br i1 %931, label %932, label %865, !llvm.loop !31

932:                                              ; preds = %927
  %933 = icmp sgt i32 %928, -1
  br i1 %933, label %934, label %946

934:                                              ; preds = %932
  store i32 1, ptr %853, align 4, !tbaa !46
  %935 = zext nneg i32 %928 to i64
  %936 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %68, i64 0, i64 %935
  %937 = getelementptr inbounds nuw i8, ptr %936, i64 8
  %938 = load i32, ptr %937, align 4, !tbaa !30
  %939 = add nsw i32 %938, -1
  store i32 %939, ptr %937, align 4, !tbaa !30
  %940 = icmp slt i32 %938, 2
  br i1 %940, label %941, label %946

941:                                              ; preds = %934
  %942 = getelementptr inbounds nuw i8, ptr %936, i64 12
  store i32 0, ptr %942, align 4, !tbaa !18
  %943 = getelementptr inbounds nuw i8, ptr %709, i64 16
  store i64 0, ptr %943, align 4
  %944 = getelementptr inbounds nuw i8, ptr %709, i64 24
  store float 0x46293E5940000000, ptr %944, align 4, !tbaa !12
  %945 = getelementptr inbounds nuw i8, ptr %709, i64 28
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %945, i8 0, i64 12, i1 false)
  br label %946

946:                                              ; preds = %941, %934, %932, %864, %860, %856, %848
  %947 = add nuw nsw i64 %708, 1
  %948 = icmp eq i64 %947, 120
  br i1 %948, label %949, label %707, !llvm.loop !49

949:                                              ; preds = %946, %951
  %950 = phi i32 [ %952, %951 ], [ 0, %946 ]
  br label %954

951:                                              ; preds = %954
  %952 = add nuw nsw i32 %950, 1
  %953 = icmp eq i32 %952, 720
  br i1 %953, label %958, label %949, !llvm.loop !50

954:                                              ; preds = %954, %949
  %955 = phi i32 [ 0, %949 ], [ %956, %954 ]
  call void @simPutPixel(i32 noundef %955, i32 noundef %950, i32 noundef range(i32 -15592936, -29655) -15592936) #6
  %956 = add nuw nsw i32 %955, 1
  %957 = icmp eq i32 %956, 1280
  br i1 %957, label %951, label %954, !llvm.loop !51

958:                                              ; preds = %951, %960
  %959 = phi i32 [ %961, %960 ], [ 336, %951 ]
  br label %963

960:                                              ; preds = %963
  %961 = add nuw nsw i32 %959, 1
  %962 = icmp eq i32 %961, 384
  br i1 %962, label %969, label %958, !llvm.loop !50

963:                                              ; preds = %963, %958
  %964 = phi i32 [ 616, %958 ], [ %965, %963 ]
  call void @simPutPixel(i32 noundef %964, i32 noundef %959, i32 noundef range(i32 -15592936, -29655) -997336) #6
  %965 = add nuw nsw i32 %964, 1
  %966 = icmp eq i32 %965, 664
  br i1 %966, label %960, label %963, !llvm.loop !51

967:                                              ; preds = %1034
  %968 = icmp eq i32 %157, %159
  br i1 %968, label %1103, label %1037

969:                                              ; preds = %960, %1034
  %970 = phi i64 [ %1035, %1034 ], [ 0, %960 ]
  %971 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %68, i64 0, i64 %970
  %972 = getelementptr inbounds nuw i8, ptr %971, i64 12
  %973 = load i32, ptr %972, align 4, !tbaa !18
  %974 = icmp eq i32 %973, 0
  br i1 %974, label %1034, label %975

975:                                              ; preds = %969
  %976 = load float, ptr %971, align 4, !tbaa !28
  %977 = getelementptr inbounds nuw i8, ptr %971, i64 4
  %978 = load float, ptr %977, align 4, !tbaa !29
  %979 = getelementptr inbounds nuw i8, ptr %971, i64 8
  %980 = load i32, ptr %979, align 4, !tbaa !30
  %981 = sitofp i32 %980 to float
  %982 = fdiv float %981, 7.000000e+01
  %983 = fcmp olt float %982, 0.000000e+00
  %984 = select i1 %983, float 0.000000e+00, float %982
  %985 = fcmp ugt float %984, 0.000000e+00
  br i1 %985, label %986, label %1000

986:                                              ; preds = %975
  %987 = bitcast float %984 to i32
  %988 = lshr i32 %987, 1
  %989 = add nuw nsw i32 %988, 532676608
  %990 = bitcast i32 %989 to float
  %991 = fdiv float %984, %990
  %992 = fadd float %991, %990
  %993 = fmul float %992, 5.000000e-01
  %994 = fdiv float %984, %993
  %995 = fadd float %993, %994
  %996 = fmul float %995, 5.000000e-01
  %997 = fdiv float %984, %996
  %998 = fadd float %996, %997
  %999 = fmul float %998, 5.000000e-01
  br label %1000

1000:                                             ; preds = %986, %975
  %1001 = phi float [ 0.000000e+00, %975 ], [ %999, %986 ]
  %1002 = call float @llvm.fmuladd.f32(float %1001, float 1.800000e+01, float 8.000000e+00)
  %1003 = fptosi float %1002 to i32
  %1004 = sub nsw i32 0, %1003
  %1005 = icmp slt i32 %1003, 0
  br i1 %1005, label %1034, label %1006

1006:                                             ; preds = %1000
  %1007 = mul nuw nsw i32 %1003, %1003
  %1008 = fptosi float %976 to i32
  %1009 = fptosi float %978 to i32
  br label %1010

1010:                                             ; preds = %1015, %1006
  %1011 = phi i32 [ %1004, %1006 ], [ %1016, %1015 ]
  %1012 = mul nsw i32 %1011, %1011
  %1013 = add nsw i32 %1011, %1009
  %1014 = icmp slt i32 %1013, 720
  br label %1018

1015:                                             ; preds = %1031
  %1016 = add i32 %1011, 1
  %1017 = icmp eq i32 %1011, %1003
  br i1 %1017, label %1034, label %1010, !llvm.loop !52

1018:                                             ; preds = %1031, %1010
  %1019 = phi i32 [ %1004, %1010 ], [ %1032, %1031 ]
  %1020 = mul nsw i32 %1019, %1019
  %1021 = add nuw nsw i32 %1020, %1012
  %1022 = icmp samesign ugt i32 %1021, %1007
  br i1 %1022, label %1031, label %1023

1023:                                             ; preds = %1018
  %1024 = add nsw i32 %1019, %1008
  %1025 = or i32 %1024, %1013
  %1026 = icmp sgt i32 %1025, -1
  %1027 = icmp slt i32 %1024, 1280
  %1028 = and i1 %1027, %1026
  %1029 = and i1 %1014, %1028
  br i1 %1029, label %1030, label %1031

1030:                                             ; preds = %1023
  call void @simPutPixel(i32 noundef %1024, i32 noundef %1013, i32 noundef -12793766) #6
  br label %1031

1031:                                             ; preds = %1030, %1023, %1018
  %1032 = add i32 %1019, 1
  %1033 = icmp eq i32 %1019, %1003
  br i1 %1033, label %1015, label %1018, !llvm.loop !53

1034:                                             ; preds = %1015, %1000, %969
  %1035 = add nuw nsw i64 %970, 1
  %1036 = icmp eq i64 %1035, 8
  br i1 %1036, label %967, label %969, !llvm.loop !54

1037:                                             ; preds = %967, %1100
  %1038 = phi i64 [ %1101, %1100 ], [ 0, %967 ]
  %1039 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %1038
  %1040 = getelementptr inbounds nuw i8, ptr %1039, i64 64
  %1041 = load i32, ptr %1040, align 4, !tbaa !46
  %1042 = icmp eq i32 %1041, 0
  %1043 = select i1 %1042, i64 16, i64 40
  %1044 = getelementptr inbounds nuw i8, ptr %1039, i64 %1043
  %1045 = getelementptr inbounds nuw i8, ptr %1039, i64 68
  %1046 = load i32, ptr %1045, align 4, !tbaa !13
  %1047 = icmp eq i32 %1046, 0
  br i1 %1047, label %1048, label %1100

1048:                                             ; preds = %1037
  %1049 = select i1 %1042, i64 32, i64 56
  %1050 = getelementptr inbounds nuw i8, ptr %1039, i64 %1049
  %1051 = load i32, ptr %1050, align 4, !tbaa !22
  %1052 = icmp eq i32 %1051, 0
  br i1 %1052, label %1100, label %1053

1053:                                             ; preds = %1048
  %1054 = load float, ptr %1044, align 4, !tbaa !26
  %1055 = select i1 %1042, i64 20, i64 44
  %1056 = getelementptr inbounds nuw i8, ptr %1039, i64 %1055
  %1057 = load float, ptr %1056, align 4, !tbaa !27
  %1058 = select i1 %1042, i64 36, i64 60
  %1059 = getelementptr inbounds nuw i8, ptr %1039, i64 %1058
  %1060 = load i32, ptr %1059, align 4, !tbaa !25
  %1061 = icmp eq i32 %1060, 0
  %1062 = select i1 %1061, i32 -12171646, i32 -12161466
  %1063 = load <2 x float>, ptr %1039, align 4, !tbaa !12
  %1064 = insertelement <2 x float> poison, float %1054, i64 0
  %1065 = insertelement <2 x float> %1064, float %1057, i64 1
  %1066 = fsub <2 x float> %1065, %1063
  %1067 = fcmp olt <2 x float> %1066, zeroinitializer
  %1068 = fneg <2 x float> %1066
  %1069 = select <2 x i1> %1067, <2 x float> %1068, <2 x float> %1066
  %1070 = extractelement <2 x float> %1069, i64 0
  %1071 = extractelement <2 x float> %1069, i64 1
  %1072 = fcmp ogt float %1070, %1071
  %1073 = select i1 %1072, float %1070, float %1071
  %1074 = fptosi float %1073 to i32
  %1075 = icmp slt i32 %1074, 0
  br i1 %1075, label %1100, label %1076

1076:                                             ; preds = %1053
  %1077 = icmp eq i32 %1074, 0
  %1078 = uitofp nneg i32 %1074 to float
  br label %1079

1079:                                             ; preds = %1097, %1076
  %1080 = phi i32 [ 0, %1076 ], [ %1098, %1097 ]
  %1081 = uitofp nneg i32 %1080 to float
  %1082 = fdiv float %1081, %1078
  %1083 = select i1 %1077, float 0.000000e+00, float %1082
  %1084 = insertelement <2 x float> poison, float %1083, i64 0
  %1085 = shufflevector <2 x float> %1084, <2 x float> poison, <2 x i32> zeroinitializer
  %1086 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %1066, <2 x float> %1085, <2 x float> %1063)
  %1087 = fptosi <2 x float> %1086 to <2 x i32>
  %1088 = extractelement <2 x i32> %1087, i64 0
  %1089 = extractelement <2 x i32> %1087, i64 1
  %1090 = or i32 %1089, %1088
  %1091 = icmp sgt i32 %1090, -1
  %1092 = icmp slt i32 %1088, 1280
  %1093 = and i1 %1092, %1091
  %1094 = icmp slt i32 %1089, 720
  %1095 = and i1 %1094, %1093
  br i1 %1095, label %1096, label %1097

1096:                                             ; preds = %1079
  call void @simPutPixel(i32 noundef %1088, i32 noundef %1089, i32 noundef range(i32 -12171646, -12161465) %1062) #6
  br label %1097

1097:                                             ; preds = %1096, %1079
  %1098 = add nuw i32 %1080, 1
  %1099 = icmp eq i32 %1080, %1074
  br i1 %1099, label %1100, label %1079, !llvm.loop !55

1100:                                             ; preds = %1097, %1053, %1048, %1037
  %1101 = add nuw nsw i64 %1038, 1
  %1102 = icmp eq i64 %1101, 120
  br i1 %1102, label %1103, label %1037, !llvm.loop !56

1103:                                             ; preds = %1100, %967
  br label %1104

1104:                                             ; preds = %1103, %1141
  %1105 = phi i64 [ %1142, %1141 ], [ 0, %1103 ]
  %1106 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %1105
  %1107 = load float, ptr %1106, align 4, !tbaa !5
  %1108 = fptosi float %1107 to i32
  %1109 = add nsw i32 %1108, -1
  %1110 = getelementptr inbounds nuw i8, ptr %1106, i64 4
  %1111 = load float, ptr %1110, align 4, !tbaa !11
  %1112 = fptosi float %1111 to i32
  %1113 = add nsw i32 %1112, -1
  %1114 = getelementptr inbounds nuw i8, ptr %1106, i64 68
  %1115 = load i32, ptr %1114, align 4, !tbaa !13
  %1116 = icmp eq i32 %1115, 0
  br i1 %1116, label %1117, label %1122

1117:                                             ; preds = %1104
  %1118 = getelementptr inbounds nuw i8, ptr %1106, i64 64
  %1119 = load i32, ptr %1118, align 4, !tbaa !46
  %1120 = icmp eq i32 %1119, 0
  %1121 = select i1 %1120, i32 -1973781, i32 -29656
  br label %1122

1122:                                             ; preds = %1117, %1104
  %1123 = phi i32 [ %1121, %1117 ], [ -11485441, %1104 ]
  br label %1124

1124:                                             ; preds = %1127, %1122
  %1125 = phi i32 [ %1113, %1122 ], [ %1128, %1127 ]
  %1126 = icmp slt i32 %1125, 720
  br label %1130

1127:                                             ; preds = %1138
  %1128 = add nsw i32 %1125, 1
  %1129 = icmp sgt i32 %1125, %1112
  br i1 %1129, label %1141, label %1124, !llvm.loop !50

1130:                                             ; preds = %1138, %1124
  %1131 = phi i32 [ %1109, %1124 ], [ %1139, %1138 ]
  %1132 = or i32 %1131, %1125
  %1133 = icmp sgt i32 %1132, -1
  %1134 = icmp slt i32 %1131, 1280
  %1135 = and i1 %1134, %1133
  %1136 = and i1 %1126, %1135
  br i1 %1136, label %1137, label %1138

1137:                                             ; preds = %1130
  call void @simPutPixel(i32 noundef %1131, i32 noundef %1125, i32 noundef range(i32 -15592936, -29655) %1123) #6
  br label %1138

1138:                                             ; preds = %1137, %1130
  %1139 = add nsw i32 %1131, 1
  %1140 = icmp sgt i32 %1131, %1108
  br i1 %1140, label %1127, label %1130, !llvm.loop !51

1141:                                             ; preds = %1127
  %1142 = add nuw nsw i64 %1105, 1
  %1143 = icmp eq i64 %1142, 120
  br i1 %1143, label %1144, label %1104, !llvm.loop !57

1144:                                             ; preds = %1141
  %1145 = call i32 @simFlush() #6
  %1146 = icmp eq i32 %1145, 0
  br i1 %1146, label %1147, label %156, !llvm.loop !58

1147:                                             ; preds = %1144
  call void @llvm.lifetime.end.p0(i64 13572, ptr nonnull %1) #6
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #2

declare i32 @simClicks() local_unnamed_addr #3

declare i32 @simFlush() local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #4

declare i32 @simRand() local_unnamed_addr #3

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fmuladd.v4f32(<4 x float>, <4 x float>, <4 x float>) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #5

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 21.1.8 (++20251221032922+2078da43e25a-1~exp1~20251221153059.70)"}
!5 = !{!6, !7, i64 0}
!6 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !8, i64 16, !10, i64 64, !10, i64 68}
!7 = !{!"float", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!6, !7, i64 4}
!12 = !{!7, !7, i64 0}
!13 = !{!6, !10, i64 68}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = !{!10, !10, i64 0}
!18 = !{!19, !10, i64 12}
!19 = !{!"", !7, i64 0, !7, i64 4, !10, i64 8, !10, i64 12}
!20 = !{!21, !7, i64 13568}
!21 = !{!"", !8, i64 0, !8, i64 8640, !8, i64 8768, !7, i64 13568}
!22 = !{!23, !10, i64 16}
!23 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !10, i64 16, !10, i64 20}
!24 = !{!23, !7, i64 12}
!25 = !{!23, !10, i64 20}
!26 = !{!23, !7, i64 0}
!27 = !{!23, !7, i64 4}
!28 = !{!19, !7, i64 0}
!29 = !{!19, !7, i64 4}
!30 = !{!19, !10, i64 8}
!31 = distinct !{!31, !15}
!32 = distinct !{!32, !15}
!33 = !{!23, !7, i64 8}
!34 = distinct !{!34, !15, !35, !36}
!35 = !{!"llvm.loop.isvectorized", i32 1}
!36 = !{!"llvm.loop.unroll.runtime.disable"}
!37 = distinct !{!37, !15}
!38 = !{!39, !10, i64 16}
!39 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !7, i64 12, !10, i64 16}
!40 = !{!39, !7, i64 12}
!41 = !{!39, !7, i64 0}
!42 = !{!39, !7, i64 4}
!43 = !{!39, !7, i64 8}
!44 = distinct !{!44, !15}
!45 = distinct !{!45, !15}
!46 = !{!6, !10, i64 64}
!47 = !{!6, !7, i64 8}
!48 = !{!6, !7, i64 12}
!49 = distinct !{!49, !15}
!50 = distinct !{!50, !15}
!51 = distinct !{!51, !15}
!52 = distinct !{!52, !15}
!53 = distinct !{!53, !15}
!54 = distinct !{!54, !15}
!55 = distinct !{!55, !15}
!56 = distinct !{!56, !15}
!57 = distinct !{!57, !15}
!58 = distinct !{!58, !15}
