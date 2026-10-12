separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})

add_library(trace_pass MODULE trace_pass.cpp)
target_include_directories(trace_pass PRIVATE ${LLVM_INCLUDE_DIRS})
target_compile_definitions(trace_pass PRIVATE ${LLVM_DEFINITIONS_LIST})

add_library(trace_logger OBJECT log.cpp)
target_compile_features(trace_logger PRIVATE cxx_std_20)

set(PLUGIN ${CMAKE_CURRENT_BINARY_DIR}/libtrace_pass.so)
set_source_files_properties(../src/app.c PROPERTIES OBJECT_DEPENDS ${PLUGIN})

foreach(OPT O2 Os)
  add_executable(beesim_trace_${OPT} ../src/app.c)
  target_compile_options(beesim_trace_${OPT} PRIVATE -${OPT} -fpass-plugin=${PLUGIN})
  target_link_libraries(beesim_trace_${OPT} PRIVATE platform trace_logger)
endforeach()
