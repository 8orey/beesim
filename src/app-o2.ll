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
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca %struct.World, align 4
  call void @llvm.lifetime.start.p0(i64 13092, ptr nonnull %1) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(13092) %1, i8 0, i64 13092, i1 false)
  br label %2

2:                                                ; preds = %2, %0
  %3 = phi i64 [ 0, %0 ], [ %41, %2 ]
  %4 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %3
  %5 = tail call i32 @simRand() #7
  %6 = and i32 %5, 65535
  %7 = uitofp nneg i32 %6 to float
  %8 = fmul float %7, 0x401921FB60000000
  %9 = fmul float %8, 0x3EF0000000000000
  %10 = fadd float %9, 0.000000e+00
  %11 = tail call i32 @simRand() #7
  %12 = and i32 %11, 65535
  %13 = mul nuw nsw i32 %12, 48
  %14 = uitofp nneg i32 %13 to float
  %15 = fmul float %14, 0x3EF0000000000000
  %16 = fadd float %15, 0.000000e+00
  %17 = tail call float @cosf(float noundef %10) #7, !tbaa !5
  %18 = tail call float @sinf(float noundef %10) #7, !tbaa !5
  %19 = insertelement <2 x float> poison, float %17, i64 0
  %20 = insertelement <2 x float> %19, float %18, i64 1
  %21 = insertelement <2 x float> poison, float %16, i64 0
  %22 = shufflevector <2 x float> %21, <2 x float> poison, <2 x i32> zeroinitializer
  %23 = tail call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %20, <2 x float> %22, <2 x float> <float 6.400000e+02, float 3.600000e+02>)
  store <2 x float> %23, ptr %4, align 4, !tbaa !9
  %24 = tail call i32 @simRand() #7
  %25 = and i32 %24, 65535
  %26 = uitofp nneg i32 %25 to float
  %27 = fmul float %26, 0x401921FB60000000
  %28 = fmul float %27, 0x3EF0000000000000
  %29 = fadd float %28, 0.000000e+00
  %30 = getelementptr inbounds nuw i8, ptr %4, i64 8
  store float %29, ptr %30, align 4, !tbaa !11
  %31 = trunc i64 %3 to i8
  %32 = urem i8 %31, 20
  %33 = icmp eq i8 %32, 0
  %34 = zext i1 %33 to i32
  %35 = getelementptr inbounds nuw i8, ptr %4, i64 64
  store i32 %34, ptr %35, align 4, !tbaa !13
  %36 = getelementptr inbounds nuw i8, ptr %4, i64 12
  store i64 0, ptr %36, align 4
  %37 = getelementptr inbounds nuw i8, ptr %4, i64 20
  store float 0x46293E5940000000, ptr %37, align 4, !tbaa !9
  %38 = getelementptr inbounds nuw i8, ptr %4, i64 24
  %39 = getelementptr inbounds nuw i8, ptr %4, i64 44
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(20) %38, i8 0, i64 20, i1 false)
  store float 0x46293E5940000000, ptr %39, align 4, !tbaa !9
  %40 = getelementptr inbounds nuw i8, ptr %4, i64 48
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %40, i8 0, i64 12, i1 false)
  %41 = add nuw nsw i64 %3, 1
  %42 = icmp eq i64 %41, 120
  br i1 %42, label %43, label %2, !llvm.loop !14

43:                                               ; preds = %2
  %44 = getelementptr inbounds nuw i8, ptr %1, i64 8160
  %45 = getelementptr inbounds nuw i8, ptr %1, i64 8172
  %46 = load i32, ptr %45, align 4, !tbaa !16
  %47 = icmp eq i32 %46, 0
  %48 = getelementptr inbounds nuw i8, ptr %1, i64 8188
  %49 = load i32, ptr %48, align 4
  %50 = icmp eq i32 %49, 0
  %51 = select i1 %50, i64 8176, i64 8192
  %52 = getelementptr inbounds nuw i8, ptr %1, i64 %51
  %53 = select i1 %47, ptr %44, ptr %52
  %54 = select i1 %50, i64 8188, i64 8204
  %55 = select i1 %47, i64 8172, i64 %54
  %56 = getelementptr inbounds nuw i8, ptr %1, i64 %55
  br label %60

57:                                               ; preds = %60
  %58 = add nuw nsw i32 %61, 1
  %59 = icmp eq i32 %58, 16
  br i1 %59, label %87, label %60, !llvm.loop !18

60:                                               ; preds = %57, %43
  %61 = phi i32 [ 0, %43 ], [ %58, %57 ]
  %62 = tail call i32 @simRand() #7
  %63 = and i32 %62, 65535
  %64 = mul nuw nsw i32 %63, 1228
  %65 = uitofp nneg i32 %64 to float
  %66 = fmul float %65, 0x3EF0000000000000
  %67 = fadd float %66, 2.600000e+01
  %68 = tail call i32 @simRand() #7
  %69 = and i32 %68, 65535
  %70 = mul nuw nsw i32 %69, 668
  %71 = uitofp nneg i32 %70 to float
  %72 = fmul float %71, 0x3EF0000000000000
  %73 = fadd float %72, 2.600000e+01
  %74 = fadd float %67, -6.400000e+02
  %75 = fadd float %73, -3.600000e+02
  %76 = fmul float %75, %75
  %77 = tail call noundef float @llvm.fmuladd.f32(float %74, float %74, float %76)
  %78 = fcmp olt float %77, 4.000000e+04
  br i1 %78, label %57, label %79

79:                                               ; preds = %60
  store float %67, ptr %53, align 4, !tbaa !9
  %80 = select i1 %50, i64 8180, i64 8196
  %81 = select i1 %47, i64 8164, i64 %80
  %82 = getelementptr inbounds nuw i8, ptr %1, i64 %81
  store float %73, ptr %82, align 4, !tbaa !9
  %83 = select i1 %50, i64 8184, i64 8200
  %84 = select i1 %47, i64 8168, i64 %83
  %85 = getelementptr inbounds nuw i8, ptr %1, i64 %84
  store i32 70, ptr %85, align 4, !tbaa !5
  store i32 1, ptr %56, align 4, !tbaa !5
  %86 = load i32, ptr %45, align 4, !tbaa !16
  br label %87

87:                                               ; preds = %57, %79
  %88 = phi i32 [ %86, %79 ], [ %46, %57 ]
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %125, label %90

90:                                               ; preds = %87
  %91 = getelementptr inbounds nuw i8, ptr %1, i64 8176
  %92 = getelementptr inbounds nuw i8, ptr %1, i64 8188
  %93 = load i32, ptr %92, align 4, !tbaa !16
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %125, label %95

95:                                               ; preds = %90
  %96 = getelementptr inbounds nuw i8, ptr %1, i64 8192
  %97 = getelementptr inbounds nuw i8, ptr %1, i64 8204
  %98 = load i32, ptr %97, align 4, !tbaa !16
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %125, label %100

100:                                              ; preds = %95
  %101 = getelementptr inbounds nuw i8, ptr %1, i64 8208
  %102 = getelementptr inbounds nuw i8, ptr %1, i64 8220
  %103 = load i32, ptr %102, align 4, !tbaa !16
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %125, label %105

105:                                              ; preds = %100
  %106 = getelementptr inbounds nuw i8, ptr %1, i64 8224
  %107 = getelementptr inbounds nuw i8, ptr %1, i64 8236
  %108 = load i32, ptr %107, align 4, !tbaa !16
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %125, label %110

110:                                              ; preds = %105
  %111 = getelementptr inbounds nuw i8, ptr %1, i64 8240
  %112 = getelementptr inbounds nuw i8, ptr %1, i64 8252
  %113 = load i32, ptr %112, align 4, !tbaa !16
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %125, label %115

115:                                              ; preds = %110
  %116 = getelementptr inbounds nuw i8, ptr %1, i64 8256
  %117 = getelementptr inbounds nuw i8, ptr %1, i64 8268
  %118 = load i32, ptr %117, align 4, !tbaa !16
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %125, label %120

120:                                              ; preds = %115
  %121 = getelementptr inbounds nuw i8, ptr %1, i64 8272
  %122 = getelementptr inbounds nuw i8, ptr %1, i64 8284
  %123 = load i32, ptr %122, align 4, !tbaa !16
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %125, label %153

125:                                              ; preds = %120, %115, %110, %105, %100, %95, %90, %87
  %126 = phi ptr [ %44, %87 ], [ %91, %90 ], [ %96, %95 ], [ %101, %100 ], [ %106, %105 ], [ %111, %110 ], [ %116, %115 ], [ %121, %120 ]
  %127 = getelementptr inbounds nuw i8, ptr %126, i64 12
  br label %131

128:                                              ; preds = %131
  %129 = add nuw nsw i32 %132, 1
  %130 = icmp eq i32 %129, 16
  br i1 %130, label %153, label %131, !llvm.loop !18

131:                                              ; preds = %128, %125
  %132 = phi i32 [ 0, %125 ], [ %129, %128 ]
  %133 = tail call i32 @simRand() #7
  %134 = and i32 %133, 65535
  %135 = mul nuw nsw i32 %134, 1228
  %136 = uitofp nneg i32 %135 to float
  %137 = fmul float %136, 0x3EF0000000000000
  %138 = fadd float %137, 2.600000e+01
  %139 = tail call i32 @simRand() #7
  %140 = and i32 %139, 65535
  %141 = mul nuw nsw i32 %140, 668
  %142 = uitofp nneg i32 %141 to float
  %143 = fmul float %142, 0x3EF0000000000000
  %144 = fadd float %143, 2.600000e+01
  %145 = fadd float %138, -6.400000e+02
  %146 = fadd float %144, -3.600000e+02
  %147 = fmul float %146, %146
  %148 = tail call noundef float @llvm.fmuladd.f32(float %145, float %145, float %147)
  %149 = fcmp olt float %148, 4.000000e+04
  br i1 %149, label %128, label %150

150:                                              ; preds = %131
  store float %138, ptr %126, align 4, !tbaa !9
  %151 = getelementptr inbounds nuw i8, ptr %126, i64 4
  store float %144, ptr %151, align 4, !tbaa !9
  %152 = getelementptr inbounds nuw i8, ptr %126, i64 8
  store i32 70, ptr %152, align 4, !tbaa !5
  store i32 1, ptr %127, align 4, !tbaa !5
  br label %153

153:                                              ; preds = %128, %120, %150
  %154 = getelementptr inbounds nuw i8, ptr %1, i64 13088
  %155 = getelementptr inbounds nuw i8, ptr %1, i64 8176
  %156 = getelementptr inbounds nuw i8, ptr %1, i64 8188
  %157 = getelementptr inbounds nuw i8, ptr %1, i64 8192
  %158 = getelementptr inbounds nuw i8, ptr %1, i64 8204
  %159 = getelementptr inbounds nuw i8, ptr %1, i64 8208
  %160 = getelementptr inbounds nuw i8, ptr %1, i64 8220
  %161 = getelementptr inbounds nuw i8, ptr %1, i64 8224
  %162 = getelementptr inbounds nuw i8, ptr %1, i64 8236
  %163 = getelementptr inbounds nuw i8, ptr %1, i64 8240
  %164 = getelementptr inbounds nuw i8, ptr %1, i64 8252
  %165 = getelementptr inbounds nuw i8, ptr %1, i64 8256
  %166 = getelementptr inbounds nuw i8, ptr %1, i64 8268
  %167 = getelementptr inbounds nuw i8, ptr %1, i64 8272
  %168 = getelementptr inbounds nuw i8, ptr %1, i64 8284
  %169 = getelementptr inbounds nuw i8, ptr %1, i64 8288
  br label %170

170:                                              ; preds = %885, %153
  %171 = phi i32 [ 0, %153 ], [ %174, %885 ]
  %172 = call i32 @simClicks() #7
  %173 = and i32 %172, 1
  %174 = xor i32 %173, %171
  %175 = load float, ptr %154, align 4, !tbaa !19
  %176 = fadd float %175, 0x3F91111120000000
  store float %176, ptr %154, align 4, !tbaa !19
  %177 = fcmp ult float %176, 1.000000e+01
  br i1 %177, label %231, label %178

178:                                              ; preds = %170
  %179 = fadd float %176, -1.000000e+01
  store float %179, ptr %154, align 4, !tbaa !19
  %180 = load i32, ptr %45, align 4, !tbaa !16
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %203, label %182

182:                                              ; preds = %178
  %183 = load i32, ptr %156, align 4, !tbaa !16
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %203, label %185

185:                                              ; preds = %182
  %186 = load i32, ptr %158, align 4, !tbaa !16
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %203, label %188

188:                                              ; preds = %185
  %189 = load i32, ptr %160, align 4, !tbaa !16
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %203, label %191

191:                                              ; preds = %188
  %192 = load i32, ptr %162, align 4, !tbaa !16
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %203, label %194

194:                                              ; preds = %191
  %195 = load i32, ptr %164, align 4, !tbaa !16
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %203, label %197

197:                                              ; preds = %194
  %198 = load i32, ptr %166, align 4, !tbaa !16
  %199 = icmp eq i32 %198, 0
  br i1 %199, label %203, label %200

200:                                              ; preds = %197
  %201 = load i32, ptr %168, align 4, !tbaa !16
  %202 = icmp eq i32 %201, 0
  br i1 %202, label %203, label %231

203:                                              ; preds = %200, %197, %194, %191, %188, %185, %182, %178
  %204 = phi ptr [ %44, %178 ], [ %155, %182 ], [ %157, %185 ], [ %159, %188 ], [ %161, %191 ], [ %163, %194 ], [ %165, %197 ], [ %167, %200 ]
  %205 = getelementptr inbounds nuw i8, ptr %204, i64 12
  br label %209

206:                                              ; preds = %209
  %207 = add nuw nsw i32 %210, 1
  %208 = icmp eq i32 %207, 16
  br i1 %208, label %231, label %209, !llvm.loop !18

209:                                              ; preds = %206, %203
  %210 = phi i32 [ 0, %203 ], [ %207, %206 ]
  %211 = call i32 @simRand() #7
  %212 = and i32 %211, 65535
  %213 = mul nuw nsw i32 %212, 1228
  %214 = uitofp nneg i32 %213 to float
  %215 = fmul float %214, 0x3EF0000000000000
  %216 = fadd float %215, 2.600000e+01
  %217 = call i32 @simRand() #7
  %218 = and i32 %217, 65535
  %219 = mul nuw nsw i32 %218, 668
  %220 = uitofp nneg i32 %219 to float
  %221 = fmul float %220, 0x3EF0000000000000
  %222 = fadd float %221, 2.600000e+01
  %223 = fadd float %216, -6.400000e+02
  %224 = fadd float %222, -3.600000e+02
  %225 = fmul float %224, %224
  %226 = call noundef float @llvm.fmuladd.f32(float %223, float %223, float %225)
  %227 = fcmp olt float %226, 4.000000e+04
  br i1 %227, label %206, label %228

228:                                              ; preds = %209
  store float %216, ptr %204, align 4, !tbaa !9
  %229 = getelementptr inbounds nuw i8, ptr %204, i64 4
  store float %222, ptr %229, align 4, !tbaa !9
  %230 = getelementptr inbounds nuw i8, ptr %204, i64 8
  store i32 70, ptr %230, align 4, !tbaa !5
  store i32 1, ptr %205, align 4, !tbaa !5
  br label %231

231:                                              ; preds = %206, %228, %200, %170
  br label %232

232:                                              ; preds = %231, %345
  %233 = phi i64 [ %346, %345 ], [ 0, %231 ]
  %234 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %233
  %235 = getelementptr inbounds nuw i8, ptr %234, i64 12
  %236 = getelementptr inbounds nuw i8, ptr %234, i64 4
  %237 = getelementptr inbounds nuw i8, ptr %234, i64 28
  %238 = load i32, ptr %237, align 4, !tbaa !21
  %239 = icmp eq i32 %238, 0
  br i1 %239, label %263, label %240

240:                                              ; preds = %232
  %241 = getelementptr inbounds nuw i8, ptr %234, i64 24
  %242 = load float, ptr %241, align 4, !tbaa !23
  %243 = fadd float %242, 0x3F91111120000000
  store float %243, ptr %241, align 4, !tbaa !23
  %244 = fcmp ult float %243, 3.000000e+00
  br i1 %244, label %245, label %260

245:                                              ; preds = %240
  %246 = getelementptr inbounds nuw i8, ptr %234, i64 32
  %247 = load i32, ptr %246, align 4, !tbaa !24
  %248 = icmp eq i32 %247, 0
  br i1 %248, label %249, label %262

249:                                              ; preds = %245
  %250 = load float, ptr %234, align 4, !tbaa !25
  %251 = load float, ptr %236, align 4, !tbaa !26
  %252 = load float, ptr %235, align 4, !tbaa !27
  %253 = getelementptr inbounds nuw i8, ptr %234, i64 16
  %254 = load float, ptr %253, align 4, !tbaa !28
  %255 = fsub float %250, %252
  %256 = fsub float %251, %254
  %257 = fmul float %256, %256
  %258 = call noundef float @llvm.fmuladd.f32(float %255, float %255, float %257)
  %259 = fcmp olt float %258, 3.600000e+01
  br i1 %259, label %260, label %262

260:                                              ; preds = %249, %240
  store i64 0, ptr %235, align 4
  %261 = getelementptr inbounds nuw i8, ptr %234, i64 20
  store float 0x46293E5940000000, ptr %261, align 4, !tbaa !9
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %241, i8 0, i64 12, i1 false)
  br label %263

262:                                              ; preds = %249, %245
  store i32 0, ptr %246, align 4, !tbaa !24
  br label %263

263:                                              ; preds = %262, %260, %232
  %264 = getelementptr inbounds nuw i8, ptr %234, i64 36
  %265 = getelementptr inbounds nuw i8, ptr %234, i64 52
  %266 = load i32, ptr %265, align 4, !tbaa !21
  %267 = icmp eq i32 %266, 0
  br i1 %267, label %291, label %268

268:                                              ; preds = %263
  %269 = getelementptr inbounds nuw i8, ptr %234, i64 48
  %270 = load float, ptr %269, align 4, !tbaa !23
  %271 = fadd float %270, 0x3F91111120000000
  store float %271, ptr %269, align 4, !tbaa !23
  %272 = fcmp ult float %271, 3.000000e+00
  br i1 %272, label %273, label %289

273:                                              ; preds = %268
  %274 = getelementptr inbounds nuw i8, ptr %234, i64 56
  %275 = load i32, ptr %274, align 4, !tbaa !24
  %276 = icmp eq i32 %275, 0
  br i1 %276, label %277, label %288

277:                                              ; preds = %273
  %278 = load float, ptr %234, align 4, !tbaa !25
  %279 = load float, ptr %236, align 4, !tbaa !26
  %280 = load float, ptr %264, align 4, !tbaa !27
  %281 = getelementptr inbounds nuw i8, ptr %234, i64 40
  %282 = load float, ptr %281, align 4, !tbaa !28
  %283 = fsub float %278, %280
  %284 = fsub float %279, %282
  %285 = fmul float %284, %284
  %286 = call noundef float @llvm.fmuladd.f32(float %283, float %283, float %285)
  %287 = fcmp olt float %286, 3.600000e+01
  br i1 %287, label %289, label %288

288:                                              ; preds = %277, %273
  store i32 0, ptr %274, align 4, !tbaa !24
  br label %291

289:                                              ; preds = %277, %268
  store i64 0, ptr %264, align 4
  %290 = getelementptr inbounds nuw i8, ptr %234, i64 44
  store float 0x46293E5940000000, ptr %290, align 4, !tbaa !9
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %269, i8 0, i64 12, i1 false)
  br label %291

291:                                              ; preds = %289, %288, %263
  %292 = load float, ptr %234, align 4, !tbaa !25
  %293 = load float, ptr %236, align 4, !tbaa !26
  %294 = fadd float %292, -6.400000e+02
  %295 = fadd float %293, -3.600000e+02
  %296 = fmul float %295, %295
  %297 = call noundef float @llvm.fmuladd.f32(float %294, float %294, float %296)
  %298 = fcmp ugt float %297, 1.600000e+03
  br i1 %298, label %301, label %299

299:                                              ; preds = %291
  store <4 x float> <float 6.400000e+02, float 3.600000e+02, float 0.000000e+00, float 0.000000e+00>, ptr %264, align 4, !tbaa !9
  store i32 1, ptr %265, align 4, !tbaa !5
  %300 = getelementptr inbounds nuw i8, ptr %234, i64 56
  store i32 1, ptr %300, align 4, !tbaa !5
  br label %301

301:                                              ; preds = %299, %291
  br label %302

302:                                              ; preds = %301, %332
  %303 = phi i64 [ %335, %332 ], [ 0, %301 ]
  %304 = phi float [ %334, %332 ], [ 4.000000e+01, %301 ]
  %305 = phi i32 [ %333, %332 ], [ -1, %301 ]
  %306 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %44, i64 0, i64 %303
  %307 = getelementptr inbounds nuw i8, ptr %306, i64 12
  %308 = load i32, ptr %307, align 4, !tbaa !16
  %309 = icmp eq i32 %308, 0
  br i1 %309, label %332, label %310

310:                                              ; preds = %302
  %311 = load float, ptr %306, align 4, !tbaa !29
  %312 = getelementptr inbounds nuw i8, ptr %306, i64 4
  %313 = load float, ptr %312, align 4, !tbaa !30
  %314 = fsub float %292, %311
  %315 = fsub float %293, %313
  %316 = fmul float %315, %315
  %317 = call noundef float @llvm.fmuladd.f32(float %314, float %314, float %316)
  %318 = call float @llvm.sqrt.f32(float %317)
  %319 = getelementptr inbounds nuw i8, ptr %306, i64 8
  %320 = load i32, ptr %319, align 4, !tbaa !31
  %321 = sitofp i32 %320 to float
  %322 = fdiv float %321, 7.000000e+01
  %323 = fcmp olt float %322, 0.000000e+00
  %324 = select i1 %323, float 0.000000e+00, float %322
  %325 = call float @llvm.sqrt.f32(float %324)
  %326 = call float @llvm.fmuladd.f32(float %325, float 1.800000e+01, float 8.000000e+00)
  %327 = fsub float %318, %326
  %328 = fcmp olt float %327, %304
  %329 = trunc nuw nsw i64 %303 to i32
  %330 = select i1 %328, i32 %329, i32 %305
  %331 = select i1 %328, float %327, float %304
  br label %332

332:                                              ; preds = %310, %302
  %333 = phi i32 [ %330, %310 ], [ %305, %302 ]
  %334 = phi float [ %331, %310 ], [ %304, %302 ]
  %335 = add nuw nsw i64 %303, 1
  %336 = icmp eq i64 %335, 8
  br i1 %336, label %337, label %302, !llvm.loop !32

337:                                              ; preds = %332
  %338 = icmp sgt i32 %333, -1
  br i1 %338, label %339, label %345

339:                                              ; preds = %337
  %340 = zext nneg i32 %333 to i64
  %341 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %44, i64 0, i64 %340
  %342 = load <2 x float>, ptr %341, align 4, !tbaa !9
  store <2 x float> %342, ptr %235, align 4, !tbaa !9
  %343 = getelementptr inbounds nuw i8, ptr %234, i64 20
  store <2 x float> zeroinitializer, ptr %343, align 4, !tbaa !9
  store i32 1, ptr %237, align 4, !tbaa !5
  %344 = getelementptr inbounds nuw i8, ptr %234, i64 32
  store i32 1, ptr %344, align 4, !tbaa !5
  br label %345

345:                                              ; preds = %339, %337
  %346 = add nuw nsw i64 %233, 1
  %347 = icmp eq i64 %346, 120
  br i1 %347, label %348, label %232, !llvm.loop !33

348:                                              ; preds = %345, %348
  %349 = phi i64 [ %399, %348 ], [ 0, %345 ]
  %350 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %349
  %351 = getelementptr inbounds nuw i8, ptr %350, i64 12
  %352 = getelementptr inbounds nuw [120 x [2 x %struct.Shout]], ptr %169, i64 0, i64 %349, i64 0
  %353 = load float, ptr %351, align 4, !tbaa !27
  %354 = getelementptr inbounds nuw i8, ptr %350, i64 16
  %355 = load float, ptr %354, align 4, !tbaa !28
  %356 = getelementptr inbounds nuw i8, ptr %350, i64 20
  %357 = load float, ptr %356, align 4, !tbaa !34
  %358 = getelementptr inbounds nuw i8, ptr %350, i64 24
  %359 = load float, ptr %358, align 4, !tbaa !23
  %360 = getelementptr inbounds nuw i8, ptr %350, i64 28
  %361 = load i32, ptr %360, align 4, !tbaa !21
  %362 = load <2 x float>, ptr %350, align 4, !tbaa !9
  %363 = extractelement <2 x float> %362, i64 0
  %364 = fsub float %363, %353
  %365 = extractelement <2 x float> %362, i64 1
  %366 = fsub float %365, %355
  %367 = fmul float %366, %366
  %368 = call noundef float @llvm.fmuladd.f32(float %364, float %364, float %367)
  %369 = call float @llvm.sqrt.f32(float %368)
  %370 = fadd float %357, %369
  store <2 x float> %362, ptr %352, align 4, !tbaa !9
  %371 = getelementptr inbounds nuw i8, ptr %352, i64 8
  store float %370, ptr %371, align 4, !tbaa !9
  %372 = getelementptr inbounds nuw i8, ptr %352, i64 12
  store float %359, ptr %372, align 4, !tbaa !9
  %373 = getelementptr inbounds nuw i8, ptr %352, i64 16
  store i32 %361, ptr %373, align 4, !tbaa !5
  %374 = getelementptr inbounds nuw i8, ptr %350, i64 36
  %375 = mul nuw nsw i64 %349, 40
  %376 = getelementptr inbounds nuw i8, ptr %169, i64 %375
  %377 = getelementptr inbounds nuw i8, ptr %376, i64 20
  %378 = load float, ptr %374, align 4, !tbaa !27
  %379 = getelementptr inbounds nuw i8, ptr %350, i64 40
  %380 = load float, ptr %379, align 4, !tbaa !28
  %381 = getelementptr inbounds nuw i8, ptr %350, i64 44
  %382 = load float, ptr %381, align 4, !tbaa !34
  %383 = getelementptr inbounds nuw i8, ptr %350, i64 48
  %384 = load float, ptr %383, align 4, !tbaa !23
  %385 = getelementptr inbounds nuw i8, ptr %350, i64 52
  %386 = load i32, ptr %385, align 4, !tbaa !21
  %387 = load <2 x float>, ptr %350, align 4, !tbaa !9
  %388 = extractelement <2 x float> %387, i64 0
  %389 = fsub float %388, %378
  %390 = extractelement <2 x float> %387, i64 1
  %391 = fsub float %390, %380
  %392 = fmul float %391, %391
  %393 = call noundef float @llvm.fmuladd.f32(float %389, float %389, float %392)
  %394 = call float @llvm.sqrt.f32(float %393)
  %395 = fadd float %382, %394
  store <2 x float> %387, ptr %377, align 4, !tbaa !9
  %396 = getelementptr inbounds nuw i8, ptr %376, i64 28
  store float %395, ptr %396, align 4, !tbaa !9
  %397 = getelementptr inbounds nuw i8, ptr %376, i64 32
  store float %384, ptr %397, align 4, !tbaa !9
  %398 = getelementptr inbounds nuw i8, ptr %376, i64 36
  store i32 %386, ptr %398, align 4, !tbaa !5
  %399 = add nuw nsw i64 %349, 1
  %400 = icmp eq i64 %399, 120
  br i1 %400, label %401, label %348, !llvm.loop !35

401:                                              ; preds = %348, %548
  %402 = phi i64 [ %549, %548 ], [ 0, %348 ]
  %403 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %402
  %404 = getelementptr inbounds nuw i8, ptr %403, i64 12
  %405 = getelementptr inbounds nuw i8, ptr %403, i64 4
  %406 = getelementptr inbounds nuw i8, ptr %403, i64 32
  %407 = load i32, ptr %406, align 4, !tbaa !24
  %408 = icmp eq i32 %407, 0
  br i1 %408, label %409, label %475

409:                                              ; preds = %401
  %410 = getelementptr inbounds nuw i8, ptr %403, i64 28
  %411 = load i32, ptr %410, align 4, !tbaa !21
  %412 = icmp eq i32 %411, 0
  br i1 %412, label %427, label %413

413:                                              ; preds = %409
  %414 = load float, ptr %403, align 4, !tbaa !25
  %415 = load float, ptr %405, align 4, !tbaa !26
  %416 = load float, ptr %404, align 4, !tbaa !27
  %417 = getelementptr inbounds nuw i8, ptr %403, i64 16
  %418 = load float, ptr %417, align 4, !tbaa !28
  %419 = fsub float %414, %416
  %420 = fsub float %415, %418
  %421 = fmul float %420, %420
  %422 = call noundef float @llvm.fmuladd.f32(float %419, float %419, float %421)
  %423 = call float @llvm.sqrt.f32(float %422)
  %424 = getelementptr inbounds nuw i8, ptr %403, i64 20
  %425 = load float, ptr %424, align 4, !tbaa !34
  %426 = fadd float %425, %423
  br label %427

427:                                              ; preds = %413, %409
  %428 = phi float [ %426, %413 ], [ 0x46293E5940000000, %409 ]
  %429 = getelementptr inbounds nuw i8, ptr %403, i64 24
  br label %432

430:                                              ; preds = %468
  %431 = icmp eq ptr %469, null
  br i1 %431, label %475, label %473

432:                                              ; preds = %468, %427
  %433 = phi i64 [ 0, %427 ], [ %471, %468 ]
  %434 = phi float [ %428, %427 ], [ %470, %468 ]
  %435 = phi ptr [ null, %427 ], [ %469, %468 ]
  %436 = getelementptr inbounds nuw [120 x [2 x %struct.Shout]], ptr %169, i64 0, i64 %433, i64 0
  %437 = icmp eq i64 %433, %402
  br i1 %437, label %468, label %438

438:                                              ; preds = %432
  %439 = getelementptr inbounds nuw i8, ptr %436, i64 16
  %440 = load i32, ptr %439, align 4, !tbaa !36
  %441 = icmp eq i32 %440, 0
  br i1 %441, label %468, label %442

442:                                              ; preds = %438
  br i1 %412, label %448, label %443

443:                                              ; preds = %442
  %444 = getelementptr inbounds nuw i8, ptr %436, i64 12
  %445 = load float, ptr %444, align 4, !tbaa !38
  %446 = load float, ptr %429, align 4, !tbaa !23
  %447 = fcmp ogt float %445, %446
  br i1 %447, label %468, label %448

448:                                              ; preds = %443, %442
  %449 = load float, ptr %403, align 4, !tbaa !25
  %450 = load float, ptr %405, align 4, !tbaa !26
  %451 = load float, ptr %436, align 4, !tbaa !39
  %452 = getelementptr inbounds nuw i8, ptr %436, i64 4
  %453 = load float, ptr %452, align 4, !tbaa !40
  %454 = fsub float %449, %451
  %455 = fsub float %450, %453
  %456 = fmul float %455, %455
  %457 = call noundef float @llvm.fmuladd.f32(float %454, float %454, float %456)
  %458 = fcmp ogt float %457, 1.690000e+04
  br i1 %458, label %468, label %459

459:                                              ; preds = %448
  %460 = getelementptr inbounds nuw i8, ptr %436, i64 8
  %461 = load float, ptr %460, align 4, !tbaa !41
  %462 = call float @llvm.sqrt.f32(float %457)
  %463 = fadd float %462, %461
  %464 = fadd float %434, 0x3F50624DE0000000
  %465 = fcmp ugt float %463, %464
  %466 = select i1 %465, ptr %435, ptr %436
  %467 = select i1 %465, float %434, float %463
  br label %468

468:                                              ; preds = %459, %448, %443, %438, %432
  %469 = phi ptr [ %435, %438 ], [ %435, %432 ], [ %435, %443 ], [ %466, %459 ], [ %435, %448 ]
  %470 = phi float [ %434, %438 ], [ %434, %432 ], [ %434, %443 ], [ %467, %459 ], [ %434, %448 ]
  %471 = add nuw nsw i64 %433, 1
  %472 = icmp eq i64 %471, 120
  br i1 %472, label %430, label %432, !llvm.loop !42

473:                                              ; preds = %430
  %474 = load <4 x float>, ptr %469, align 4, !tbaa !9
  store <4 x float> %474, ptr %404, align 4, !tbaa !9
  store i32 1, ptr %410, align 4, !tbaa !5
  store i32 0, ptr %406, align 4, !tbaa !5
  br label %475

475:                                              ; preds = %473, %430, %401
  %476 = getelementptr inbounds nuw i8, ptr %403, i64 36
  %477 = getelementptr inbounds nuw i8, ptr %403, i64 56
  %478 = load i32, ptr %477, align 4, !tbaa !24
  %479 = icmp eq i32 %478, 0
  br i1 %479, label %480, label %548

480:                                              ; preds = %475
  %481 = getelementptr inbounds nuw i8, ptr %403, i64 52
  %482 = load i32, ptr %481, align 4, !tbaa !21
  %483 = icmp eq i32 %482, 0
  br i1 %483, label %498, label %484

484:                                              ; preds = %480
  %485 = load float, ptr %403, align 4, !tbaa !25
  %486 = load float, ptr %405, align 4, !tbaa !26
  %487 = load float, ptr %476, align 4, !tbaa !27
  %488 = getelementptr inbounds nuw i8, ptr %403, i64 40
  %489 = load float, ptr %488, align 4, !tbaa !28
  %490 = fsub float %485, %487
  %491 = fsub float %486, %489
  %492 = fmul float %491, %491
  %493 = call noundef float @llvm.fmuladd.f32(float %490, float %490, float %492)
  %494 = call float @llvm.sqrt.f32(float %493)
  %495 = getelementptr inbounds nuw i8, ptr %403, i64 44
  %496 = load float, ptr %495, align 4, !tbaa !34
  %497 = fadd float %496, %494
  br label %498

498:                                              ; preds = %484, %480
  %499 = phi float [ %497, %484 ], [ 0x46293E5940000000, %480 ]
  %500 = getelementptr inbounds nuw i8, ptr %403, i64 48
  br label %501

501:                                              ; preds = %539, %498
  %502 = phi i64 [ 0, %498 ], [ %542, %539 ]
  %503 = phi float [ %499, %498 ], [ %541, %539 ]
  %504 = phi ptr [ null, %498 ], [ %540, %539 ]
  %505 = mul nuw nsw i64 %502, 40
  %506 = getelementptr inbounds nuw i8, ptr %169, i64 %505
  %507 = getelementptr inbounds nuw i8, ptr %506, i64 20
  %508 = icmp eq i64 %502, %402
  br i1 %508, label %539, label %509

509:                                              ; preds = %501
  %510 = getelementptr inbounds nuw i8, ptr %506, i64 36
  %511 = load i32, ptr %510, align 4, !tbaa !36
  %512 = icmp eq i32 %511, 0
  br i1 %512, label %539, label %513

513:                                              ; preds = %509
  br i1 %483, label %519, label %514

514:                                              ; preds = %513
  %515 = getelementptr inbounds nuw i8, ptr %506, i64 32
  %516 = load float, ptr %515, align 4, !tbaa !38
  %517 = load float, ptr %500, align 4, !tbaa !23
  %518 = fcmp ogt float %516, %517
  br i1 %518, label %539, label %519

519:                                              ; preds = %514, %513
  %520 = load float, ptr %403, align 4, !tbaa !25
  %521 = load float, ptr %405, align 4, !tbaa !26
  %522 = load float, ptr %507, align 4, !tbaa !39
  %523 = getelementptr inbounds nuw i8, ptr %506, i64 24
  %524 = load float, ptr %523, align 4, !tbaa !40
  %525 = fsub float %520, %522
  %526 = fsub float %521, %524
  %527 = fmul float %526, %526
  %528 = call noundef float @llvm.fmuladd.f32(float %525, float %525, float %527)
  %529 = fcmp ogt float %528, 1.690000e+04
  br i1 %529, label %539, label %530

530:                                              ; preds = %519
  %531 = getelementptr inbounds nuw i8, ptr %506, i64 28
  %532 = load float, ptr %531, align 4, !tbaa !41
  %533 = call float @llvm.sqrt.f32(float %528)
  %534 = fadd float %533, %532
  %535 = fadd float %503, 0x3F50624DE0000000
  %536 = fcmp ugt float %534, %535
  %537 = select i1 %536, ptr %504, ptr %507
  %538 = select i1 %536, float %503, float %534
  br label %539

539:                                              ; preds = %530, %519, %514, %509, %501
  %540 = phi ptr [ %504, %509 ], [ %504, %501 ], [ %504, %514 ], [ %537, %530 ], [ %504, %519 ]
  %541 = phi float [ %503, %509 ], [ %503, %501 ], [ %503, %514 ], [ %538, %530 ], [ %503, %519 ]
  %542 = add nuw nsw i64 %502, 1
  %543 = icmp eq i64 %542, 120
  br i1 %543, label %544, label %501, !llvm.loop !42

544:                                              ; preds = %539
  %545 = icmp eq ptr %540, null
  br i1 %545, label %548, label %546

546:                                              ; preds = %544
  %547 = load <4 x float>, ptr %540, align 4, !tbaa !9
  store <4 x float> %547, ptr %476, align 4, !tbaa !9
  store i32 1, ptr %481, align 4, !tbaa !5
  store i32 0, ptr %477, align 4, !tbaa !5
  br label %548

548:                                              ; preds = %546, %544, %475
  %549 = add nuw nsw i64 %402, 1
  %550 = icmp eq i64 %549, 120
  br i1 %550, label %551, label %401, !llvm.loop !43

551:                                              ; preds = %548, %705
  %552 = phi i64 [ %706, %705 ], [ 0, %548 ]
  %553 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %552
  %554 = getelementptr inbounds nuw i8, ptr %553, i64 64
  %555 = load i32, ptr %554, align 4, !tbaa !13
  %556 = icmp eq i32 %555, 0
  br i1 %556, label %557, label %600

557:                                              ; preds = %551
  %558 = getelementptr inbounds nuw i8, ptr %553, i64 60
  %559 = load i32, ptr %558, align 4, !tbaa !44
  %560 = icmp eq i32 %559, 0
  %561 = select i1 %560, i64 28, i64 52
  %562 = getelementptr inbounds nuw i8, ptr %553, i64 %561
  %563 = load i32, ptr %562, align 4, !tbaa !21
  %564 = icmp eq i32 %563, 0
  br i1 %564, label %600, label %565

565:                                              ; preds = %557
  %566 = select i1 %560, i64 12, i64 36
  %567 = getelementptr inbounds nuw i8, ptr %553, i64 %566
  %568 = select i1 %560, i64 16, i64 40
  %569 = getelementptr inbounds nuw i8, ptr %553, i64 %568
  %570 = load float, ptr %569, align 4, !tbaa !28
  %571 = load float, ptr %567, align 4, !tbaa !27
  %572 = load <2 x float>, ptr %553, align 4, !tbaa !9
  %573 = extractelement <2 x float> %572, i64 1
  %574 = fsub float %570, %573
  %575 = extractelement <2 x float> %572, i64 0
  %576 = fsub float %571, %575
  %577 = call float @atan2f(float noundef %574, float noundef %576) #7, !tbaa !5
  %578 = getelementptr inbounds nuw i8, ptr %553, i64 8
  %579 = load float, ptr %578, align 4, !tbaa !11
  %580 = fsub float %577, %579
  %581 = fcmp ogt float %580, 0x400921FB60000000
  br i1 %581, label %585, label %582

582:                                              ; preds = %585, %565
  %583 = phi float [ %580, %565 ], [ %587, %585 ]
  %584 = fcmp olt float %583, 0xC00921FB60000000
  br i1 %584, label %589, label %593

585:                                              ; preds = %565, %585
  %586 = phi float [ %587, %585 ], [ %580, %565 ]
  %587 = fadd float %586, 0xC01921FB60000000
  %588 = fcmp ogt float %587, 0x400921FB60000000
  br i1 %588, label %585, label %582, !llvm.loop !45

589:                                              ; preds = %582, %589
  %590 = phi float [ %591, %589 ], [ %583, %582 ]
  %591 = fadd float %590, 0x401921FB60000000
  %592 = fcmp olt float %591, 0xC00921FB60000000
  br i1 %592, label %589, label %593, !llvm.loop !46

593:                                              ; preds = %589, %582
  %594 = phi float [ %583, %582 ], [ %591, %589 ]
  %595 = fcmp ogt float %594, 0x3FB99999C0000000
  %596 = select i1 %595, float 0x3FB99999C0000000, float %594
  %597 = fcmp olt float %596, 0xBFB99999C0000000
  %598 = select i1 %597, float 0xBFB99999C0000000, float %596
  %599 = fadd float %579, %598
  store float %599, ptr %578, align 4, !tbaa !11
  br label %611

600:                                              ; preds = %557, %551
  %601 = call i32 @simRand() #7
  %602 = and i32 %601, 65535
  %603 = uitofp nneg i32 %602 to float
  %604 = fmul float %603, 0x3FD539F560000000
  %605 = fmul float %604, 0x3EF0000000000000
  %606 = fadd float %605, 0xBFC539F560000000
  %607 = getelementptr inbounds nuw i8, ptr %553, i64 8
  %608 = load float, ptr %607, align 4, !tbaa !11
  %609 = fadd float %608, %606
  store float %609, ptr %607, align 4, !tbaa !11
  %610 = load <2 x float>, ptr %553, align 4, !tbaa !9
  br label %611

611:                                              ; preds = %600, %593
  %612 = phi float [ %609, %600 ], [ %599, %593 ]
  %613 = phi <2 x float> [ %610, %600 ], [ %572, %593 ]
  %614 = getelementptr inbounds nuw i8, ptr %553, i64 8
  %615 = call float @cosf(float noundef %612) #7, !tbaa !5
  %616 = call float @sinf(float noundef %612) #7, !tbaa !5
  %617 = getelementptr inbounds nuw i8, ptr %553, i64 4
  %618 = insertelement <2 x float> poison, float %615, i64 0
  %619 = insertelement <2 x float> %618, float %616, i64 1
  %620 = fmul <2 x float> %619, splat (float 1.100000e+02)
  %621 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %620, <2 x float> splat (float 0x3F91111120000000), <2 x float> %613)
  store <2 x float> %621, ptr %553, align 4, !tbaa !9
  %622 = extractelement <2 x float> %621, i64 0
  %623 = fcmp olt float %622, 1.000000e+00
  br i1 %623, label %626, label %624

624:                                              ; preds = %611
  %625 = fcmp ogt float %622, 1.278000e+03
  br i1 %625, label %626, label %629

626:                                              ; preds = %624, %611
  %627 = phi float [ 1.000000e+00, %611 ], [ 1.278000e+03, %624 ]
  store float %627, ptr %553, align 4, !tbaa !25
  %628 = fsub float 0x400921FB60000000, %612
  store float %628, ptr %614, align 4, !tbaa !11
  br label %629

629:                                              ; preds = %626, %624
  %630 = phi float [ %622, %624 ], [ %627, %626 ]
  %631 = phi float [ %612, %624 ], [ %628, %626 ]
  %632 = extractelement <2 x float> %621, i64 1
  %633 = fcmp olt float %632, 1.000000e+00
  br i1 %633, label %636, label %634

634:                                              ; preds = %629
  %635 = fcmp ogt float %632, 7.180000e+02
  br i1 %635, label %636, label %639

636:                                              ; preds = %634, %629
  %637 = phi float [ 1.000000e+00, %629 ], [ 7.180000e+02, %634 ]
  store float %637, ptr %617, align 4, !tbaa !26
  %638 = fneg float %631
  store float %638, ptr %614, align 4, !tbaa !11
  br label %639

639:                                              ; preds = %636, %634
  %640 = phi float [ %632, %634 ], [ %637, %636 ]
  %641 = load i32, ptr %554, align 4, !tbaa !13
  %642 = icmp eq i32 %641, 0
  br i1 %642, label %643, label %705

643:                                              ; preds = %639
  %644 = getelementptr inbounds nuw i8, ptr %553, i64 60
  %645 = load i32, ptr %644, align 4, !tbaa !44
  %646 = icmp eq i32 %645, 0
  br i1 %646, label %656, label %647

647:                                              ; preds = %643
  %648 = fadd float %630, -6.400000e+02
  %649 = call float @llvm.fabs.f32(float %648)
  %650 = fcmp ugt float %649, 2.400000e+01
  br i1 %650, label %705, label %651

651:                                              ; preds = %647
  %652 = fadd float %640, -3.600000e+02
  %653 = call float @llvm.fabs.f32(float %652)
  %654 = fcmp ugt float %653, 2.400000e+01
  br i1 %654, label %705, label %655

655:                                              ; preds = %651
  store i32 0, ptr %644, align 4, !tbaa !44
  br label %705

656:                                              ; preds = %643, %686
  %657 = phi i64 [ %689, %686 ], [ 0, %643 ]
  %658 = phi float [ %688, %686 ], [ 7.000000e+00, %643 ]
  %659 = phi i32 [ %687, %686 ], [ -1, %643 ]
  %660 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %44, i64 0, i64 %657
  %661 = getelementptr inbounds nuw i8, ptr %660, i64 12
  %662 = load i32, ptr %661, align 4, !tbaa !16
  %663 = icmp eq i32 %662, 0
  br i1 %663, label %686, label %664

664:                                              ; preds = %656
  %665 = load float, ptr %660, align 4, !tbaa !29
  %666 = getelementptr inbounds nuw i8, ptr %660, i64 4
  %667 = load float, ptr %666, align 4, !tbaa !30
  %668 = fsub float %630, %665
  %669 = fsub float %640, %667
  %670 = fmul float %669, %669
  %671 = call noundef float @llvm.fmuladd.f32(float %668, float %668, float %670)
  %672 = call float @llvm.sqrt.f32(float %671)
  %673 = getelementptr inbounds nuw i8, ptr %660, i64 8
  %674 = load i32, ptr %673, align 4, !tbaa !31
  %675 = sitofp i32 %674 to float
  %676 = fdiv float %675, 7.000000e+01
  %677 = fcmp olt float %676, 0.000000e+00
  %678 = select i1 %677, float 0.000000e+00, float %676
  %679 = call float @llvm.sqrt.f32(float %678)
  %680 = call float @llvm.fmuladd.f32(float %679, float 1.800000e+01, float 8.000000e+00)
  %681 = fsub float %672, %680
  %682 = fcmp olt float %681, %658
  %683 = trunc nuw nsw i64 %657 to i32
  %684 = select i1 %682, i32 %683, i32 %659
  %685 = select i1 %682, float %681, float %658
  br label %686

686:                                              ; preds = %664, %656
  %687 = phi i32 [ %684, %664 ], [ %659, %656 ]
  %688 = phi float [ %685, %664 ], [ %658, %656 ]
  %689 = add nuw nsw i64 %657, 1
  %690 = icmp eq i64 %689, 8
  br i1 %690, label %691, label %656, !llvm.loop !32

691:                                              ; preds = %686
  %692 = icmp sgt i32 %687, -1
  br i1 %692, label %693, label %705

693:                                              ; preds = %691
  store i32 1, ptr %644, align 4, !tbaa !44
  %694 = zext nneg i32 %687 to i64
  %695 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %44, i64 0, i64 %694
  %696 = getelementptr inbounds nuw i8, ptr %695, i64 8
  %697 = load i32, ptr %696, align 4, !tbaa !31
  %698 = add nsw i32 %697, -1
  store i32 %698, ptr %696, align 4, !tbaa !31
  %699 = icmp slt i32 %697, 2
  br i1 %699, label %700, label %705

700:                                              ; preds = %693
  %701 = getelementptr inbounds nuw i8, ptr %695, i64 12
  store i32 0, ptr %701, align 4, !tbaa !16
  %702 = getelementptr inbounds nuw i8, ptr %553, i64 12
  store i64 0, ptr %702, align 4
  %703 = getelementptr inbounds nuw i8, ptr %553, i64 20
  store float 0x46293E5940000000, ptr %703, align 4, !tbaa !9
  %704 = getelementptr inbounds nuw i8, ptr %553, i64 24
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(12) %704, i8 0, i64 12, i1 false)
  br label %705

705:                                              ; preds = %700, %693, %691, %655, %651, %647, %639
  %706 = add nuw nsw i64 %552, 1
  %707 = icmp eq i64 %706, 120
  br i1 %707, label %708, label %551, !llvm.loop !47

708:                                              ; preds = %705, %710
  %709 = phi i32 [ %711, %710 ], [ 0, %705 ]
  br label %713

710:                                              ; preds = %713
  %711 = add nuw nsw i32 %709, 1
  %712 = icmp eq i32 %711, 720
  br i1 %712, label %717, label %708, !llvm.loop !48

713:                                              ; preds = %713, %708
  %714 = phi i32 [ 0, %708 ], [ %715, %713 ]
  call void @simPutPixel(i32 noundef %714, i32 noundef %709, i32 noundef range(i32 -15592936, -29655) -15592936) #7
  %715 = add nuw nsw i32 %714, 1
  %716 = icmp eq i32 %715, 1280
  br i1 %716, label %710, label %713, !llvm.loop !49

717:                                              ; preds = %710, %719
  %718 = phi i32 [ %720, %719 ], [ 336, %710 ]
  br label %722

719:                                              ; preds = %722
  %720 = add nuw nsw i32 %718, 1
  %721 = icmp eq i32 %720, 384
  br i1 %721, label %728, label %717, !llvm.loop !48

722:                                              ; preds = %722, %717
  %723 = phi i32 [ 616, %717 ], [ %724, %722 ]
  call void @simPutPixel(i32 noundef %723, i32 noundef %718, i32 noundef range(i32 -15592936, -29655) -997336) #7
  %724 = add nuw nsw i32 %723, 1
  %725 = icmp eq i32 %724, 664
  br i1 %725, label %719, label %722, !llvm.loop !49

726:                                              ; preds = %777
  %727 = icmp eq i32 %171, %173
  br i1 %727, label %844, label %780

728:                                              ; preds = %719, %777
  %729 = phi i64 [ %778, %777 ], [ 0, %719 ]
  %730 = getelementptr inbounds nuw [8 x %struct.Resource], ptr %44, i64 0, i64 %729
  %731 = getelementptr inbounds nuw i8, ptr %730, i64 12
  %732 = load i32, ptr %731, align 4, !tbaa !16
  %733 = icmp eq i32 %732, 0
  br i1 %733, label %777, label %734

734:                                              ; preds = %728
  %735 = getelementptr inbounds nuw i8, ptr %730, i64 8
  %736 = load i32, ptr %735, align 4, !tbaa !31
  %737 = sitofp i32 %736 to float
  %738 = fdiv float %737, 7.000000e+01
  %739 = fcmp olt float %738, 0.000000e+00
  %740 = select i1 %739, float 0.000000e+00, float %738
  %741 = call float @llvm.sqrt.f32(float %740)
  %742 = call float @llvm.fmuladd.f32(float %741, float 1.800000e+01, float 8.000000e+00)
  %743 = fptosi float %742 to i32
  %744 = sub nsw i32 0, %743
  %745 = icmp slt i32 %743, 0
  br i1 %745, label %777, label %746

746:                                              ; preds = %734
  %747 = getelementptr inbounds nuw i8, ptr %730, i64 4
  %748 = load float, ptr %747, align 4, !tbaa !30
  %749 = load float, ptr %730, align 4, !tbaa !29
  %750 = mul nuw nsw i32 %743, %743
  %751 = fptosi float %749 to i32
  %752 = fptosi float %748 to i32
  br label %753

753:                                              ; preds = %758, %746
  %754 = phi i32 [ %744, %746 ], [ %759, %758 ]
  %755 = mul nsw i32 %754, %754
  %756 = add nsw i32 %754, %752
  %757 = icmp slt i32 %756, 720
  br label %761

758:                                              ; preds = %774
  %759 = add i32 %754, 1
  %760 = icmp eq i32 %754, %743
  br i1 %760, label %777, label %753, !llvm.loop !50

761:                                              ; preds = %774, %753
  %762 = phi i32 [ %744, %753 ], [ %775, %774 ]
  %763 = mul nsw i32 %762, %762
  %764 = add nuw nsw i32 %763, %755
  %765 = icmp samesign ugt i32 %764, %750
  br i1 %765, label %774, label %766

766:                                              ; preds = %761
  %767 = add nsw i32 %762, %751
  %768 = or i32 %767, %756
  %769 = icmp sgt i32 %768, -1
  %770 = icmp slt i32 %767, 1280
  %771 = and i1 %770, %769
  %772 = and i1 %757, %771
  br i1 %772, label %773, label %774

773:                                              ; preds = %766
  call void @simPutPixel(i32 noundef %767, i32 noundef %756, i32 noundef -12793766) #7
  br label %774

774:                                              ; preds = %773, %766, %761
  %775 = add i32 %762, 1
  %776 = icmp eq i32 %762, %743
  br i1 %776, label %758, label %761, !llvm.loop !51

777:                                              ; preds = %758, %734, %728
  %778 = add nuw nsw i64 %729, 1
  %779 = icmp eq i64 %778, 8
  br i1 %779, label %726, label %728, !llvm.loop !52

780:                                              ; preds = %726, %841
  %781 = phi i64 [ %842, %841 ], [ 0, %726 ]
  %782 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %781
  %783 = getelementptr inbounds nuw i8, ptr %782, i64 60
  %784 = load i32, ptr %783, align 4, !tbaa !44
  %785 = icmp eq i32 %784, 0
  %786 = select i1 %785, i64 12, i64 36
  %787 = getelementptr inbounds nuw i8, ptr %782, i64 %786
  %788 = getelementptr inbounds nuw i8, ptr %782, i64 64
  %789 = load i32, ptr %788, align 4, !tbaa !13
  %790 = icmp eq i32 %789, 0
  br i1 %790, label %791, label %841

791:                                              ; preds = %780
  %792 = select i1 %785, i64 28, i64 52
  %793 = getelementptr inbounds nuw i8, ptr %782, i64 %792
  %794 = load i32, ptr %793, align 4, !tbaa !21
  %795 = icmp eq i32 %794, 0
  br i1 %795, label %841, label %796

796:                                              ; preds = %791
  %797 = load float, ptr %787, align 4, !tbaa !27
  %798 = select i1 %785, i64 16, i64 40
  %799 = getelementptr inbounds nuw i8, ptr %782, i64 %798
  %800 = load float, ptr %799, align 4, !tbaa !28
  %801 = select i1 %785, i64 32, i64 56
  %802 = getelementptr inbounds nuw i8, ptr %782, i64 %801
  %803 = load i32, ptr %802, align 4, !tbaa !24
  %804 = icmp eq i32 %803, 0
  %805 = select i1 %804, i32 -12171646, i32 -12161466
  %806 = load <2 x float>, ptr %782, align 4, !tbaa !9
  %807 = insertelement <2 x float> poison, float %797, i64 0
  %808 = insertelement <2 x float> %807, float %800, i64 1
  %809 = fsub <2 x float> %808, %806
  %810 = extractelement <2 x float> %809, i64 0
  %811 = call float @llvm.fabs.f32(float %810)
  %812 = extractelement <2 x float> %809, i64 1
  %813 = call float @llvm.fabs.f32(float %812)
  %814 = call float @llvm.maxnum.f32(float %811, float %813)
  %815 = fptosi float %814 to i32
  %816 = icmp slt i32 %815, 0
  br i1 %816, label %841, label %817

817:                                              ; preds = %796
  %818 = icmp eq i32 %815, 0
  %819 = uitofp nneg i32 %815 to float
  br label %820

820:                                              ; preds = %838, %817
  %821 = phi i32 [ 0, %817 ], [ %839, %838 ]
  %822 = uitofp nneg i32 %821 to float
  %823 = fdiv float %822, %819
  %824 = select i1 %818, float 0.000000e+00, float %823
  %825 = insertelement <2 x float> poison, float %824, i64 0
  %826 = shufflevector <2 x float> %825, <2 x float> poison, <2 x i32> zeroinitializer
  %827 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %809, <2 x float> %826, <2 x float> %806)
  %828 = fptosi <2 x float> %827 to <2 x i32>
  %829 = extractelement <2 x i32> %828, i64 0
  %830 = extractelement <2 x i32> %828, i64 1
  %831 = or i32 %830, %829
  %832 = icmp sgt i32 %831, -1
  %833 = icmp slt i32 %829, 1280
  %834 = and i1 %833, %832
  %835 = icmp slt i32 %830, 720
  %836 = and i1 %835, %834
  br i1 %836, label %837, label %838

837:                                              ; preds = %820
  call void @simPutPixel(i32 noundef %829, i32 noundef %830, i32 noundef range(i32 -12171646, -12161465) %805) #7
  br label %838

838:                                              ; preds = %837, %820
  %839 = add nuw i32 %821, 1
  %840 = icmp eq i32 %821, %815
  br i1 %840, label %841, label %820, !llvm.loop !53

841:                                              ; preds = %838, %796, %791, %780
  %842 = add nuw nsw i64 %781, 1
  %843 = icmp eq i64 %842, 120
  br i1 %843, label %844, label %780, !llvm.loop !54

844:                                              ; preds = %841, %726
  br label %845

845:                                              ; preds = %844, %882
  %846 = phi i64 [ %883, %882 ], [ 0, %844 ]
  %847 = getelementptr inbounds nuw [120 x %struct.Bee], ptr %1, i64 0, i64 %846
  %848 = load float, ptr %847, align 4, !tbaa !25
  %849 = fptosi float %848 to i32
  %850 = add nsw i32 %849, -1
  %851 = getelementptr inbounds nuw i8, ptr %847, i64 4
  %852 = load float, ptr %851, align 4, !tbaa !26
  %853 = fptosi float %852 to i32
  %854 = add nsw i32 %853, -1
  %855 = getelementptr inbounds nuw i8, ptr %847, i64 64
  %856 = load i32, ptr %855, align 4, !tbaa !13
  %857 = icmp eq i32 %856, 0
  br i1 %857, label %858, label %863

858:                                              ; preds = %845
  %859 = getelementptr inbounds nuw i8, ptr %847, i64 60
  %860 = load i32, ptr %859, align 4, !tbaa !44
  %861 = icmp eq i32 %860, 0
  %862 = select i1 %861, i32 -1973781, i32 -29656
  br label %863

863:                                              ; preds = %858, %845
  %864 = phi i32 [ %862, %858 ], [ -11485441, %845 ]
  br label %865

865:                                              ; preds = %868, %863
  %866 = phi i32 [ %854, %863 ], [ %869, %868 ]
  %867 = icmp slt i32 %866, 720
  br label %871

868:                                              ; preds = %879
  %869 = add nsw i32 %866, 1
  %870 = icmp sgt i32 %866, %853
  br i1 %870, label %882, label %865, !llvm.loop !48

871:                                              ; preds = %879, %865
  %872 = phi i32 [ %850, %865 ], [ %880, %879 ]
  %873 = or i32 %872, %866
  %874 = icmp sgt i32 %873, -1
  %875 = icmp slt i32 %872, 1280
  %876 = and i1 %875, %874
  %877 = and i1 %867, %876
  br i1 %877, label %878, label %879

878:                                              ; preds = %871
  call void @simPutPixel(i32 noundef %872, i32 noundef %866, i32 noundef range(i32 -15592936, -29655) %864) #7
  br label %879

879:                                              ; preds = %878, %871
  %880 = add nsw i32 %872, 1
  %881 = icmp sgt i32 %872, %849
  br i1 %881, label %868, label %871, !llvm.loop !49

882:                                              ; preds = %868
  %883 = add nuw nsw i64 %846, 1
  %884 = icmp eq i64 %883, 120
  br i1 %884, label %885, label %845, !llvm.loop !55

885:                                              ; preds = %882
  %886 = call i32 @simFlush() #7
  %887 = icmp eq i32 %886, 0
  br i1 %887, label %888, label %170, !llvm.loop !56

888:                                              ; preds = %885
  call void @llvm.lifetime.end.p0(i64 13092, ptr nonnull %1) #7
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

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @cosf(float noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #5

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @sinf(float noundef) local_unnamed_addr #4

declare i32 @simRand() local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(errnomem: write)
declare float @atan2f(float noundef, float noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #5

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

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
!16 = !{!17, !6, i64 12}
!17 = !{!"", !10, i64 0, !10, i64 4, !6, i64 8, !6, i64 12}
!18 = distinct !{!18, !15}
!19 = !{!20, !10, i64 13088}
!20 = !{!"", !7, i64 0, !7, i64 8160, !7, i64 8288, !10, i64 13088}
!21 = !{!22, !6, i64 16}
!22 = !{!"", !10, i64 0, !10, i64 4, !10, i64 8, !10, i64 12, !6, i64 16, !6, i64 20}
!23 = !{!22, !10, i64 12}
!24 = !{!22, !6, i64 20}
!25 = !{!12, !10, i64 0}
!26 = !{!12, !10, i64 4}
!27 = !{!22, !10, i64 0}
!28 = !{!22, !10, i64 4}
!29 = !{!17, !10, i64 0}
!30 = !{!17, !10, i64 4}
!31 = !{!17, !6, i64 8}
!32 = distinct !{!32, !15}
!33 = distinct !{!33, !15}
!34 = !{!22, !10, i64 8}
!35 = distinct !{!35, !15}
!36 = !{!37, !6, i64 16}
!37 = !{!"", !10, i64 0, !10, i64 4, !10, i64 8, !10, i64 12, !6, i64 16}
!38 = !{!37, !10, i64 12}
!39 = !{!37, !10, i64 0}
!40 = !{!37, !10, i64 4}
!41 = !{!37, !10, i64 8}
!42 = distinct !{!42, !15}
!43 = distinct !{!43, !15}
!44 = !{!12, !6, i64 60}
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
