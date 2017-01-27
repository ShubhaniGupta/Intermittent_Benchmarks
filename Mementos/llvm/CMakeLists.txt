cmake_minimum_required(VERSION 2.8)
set(LLVM_DIR "${LLVM_ROOT}/share/llvm/cmake")
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${LLVM_DIR})

include_directories("include")

find_package(LLVM)

# Define add_llvm_* macro's.
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
  include(AddLLVM)
  include(HandleLLVMOptions)
  set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/bin)
  set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/lib)

  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LLVM_CXXFLAGS} -fno-rtti")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${LLVM_LDFLAGS}")

  set(LLVM_REQUIRES_RTTI TRUE)
  set(LLVM_REQUIRES_EH TRUE)

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

add_subdirectory(lib/Mementos)
