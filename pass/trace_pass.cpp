#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include <map>
#include <string>
using namespace llvm;

struct TracePass : public PassInfoMixin<TracePass> {
  FunctionCallee logFunc;
  std::map<std::string, Value *> strings;

  Value *getString(IRBuilder<> &builder, StringRef str) {
    Value *&value = strings[str.str()];
    if (!value) {
      value = builder.CreateGlobalString(str);
    }
    return value;
  }

  void forEachInstruction(Instruction &I, IRBuilder<> &builder) {
    if (isa<PHINode>(I)) {
      return;
    }
    for (auto &&U : I.operands()) {
      auto op = dyn_cast<Instruction>(U.get());
      if (!op) {
        continue;
      }
      builder.SetInsertPoint(&I);
      Value *user = getString(builder, I.getOpcodeName());
      Value *operand = getString(builder, op->getOpcodeName());
      builder.CreateCall(logFunc, {user, operand});
    }
  }

  void forEachBlock(BasicBlock &B, IRBuilder<> &builder) {
    for (auto &I : B) {
      forEachInstruction(I, builder);
    }
  }

  void forEachFunction(Function &F, IRBuilder<> &builder) {
    if (F.isDeclaration()) {
      return;
    }
    outs() << "[Function] " << F.getName() << " (arg_size: " << F.arg_size()
           << ")\n";

    for (auto &B : F) {
      forEachBlock(B, builder);
    }
  }

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
    outs() << "\n[Module] Module: " << M.getName() << '\n';

    LLVMContext &Ctx = M.getContext();
    IRBuilder<> builder(Ctx);
    PointerType *ptrTy = PointerType::getUnqual(Ctx);
    FunctionType *logFuncType =
        FunctionType::get(Type::getVoidTy(Ctx), {ptrTy, ptrTy}, false);
    logFunc = M.getOrInsertFunction("useLogger", logFuncType);
    strings.clear();

    for (auto &F : M) {
      forEachFunction(F, builder);
    }

    return PreservedAnalyses::none();
  };
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    PB.registerPipelineStartEPCallback([](ModulePassManager &MPM, auto...) {
      outs() << "Add pass to ModulePassManager in "
                "registerPipelineStartEPCallback\n";
      return true;
    });
    PB.registerOptimizerLastEPCallback([](ModulePassManager &MPM, auto...) {
      MPM.addPass(TracePass{});
      outs() << "Add pass to ModulePassManager in "
                "registerOptimizerLastEPCallback\n";
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "trace_pass", "0.0.1", callback};
};

extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}
