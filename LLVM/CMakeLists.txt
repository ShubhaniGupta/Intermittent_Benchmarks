# Call like cmake -DDINO_LLVM_DIR=/path/to/llvm
#        or cmake -G Xcode -DDINO_LLVM_DIR=/path/to/llvm

cmake_minimum_required(VERSION 2.8)

set(LLVM_DIR ${DINO_LLVM_DIR}/share/llvm/cmake)

# hack for Windows
if(WIN32)
  set(CMAKE_LEGACY_CYGWIN_WIN32 0)
  set(CYGWIN 1)
endif(WIN32)

find_package(LLVM)
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
  include(AddLLVM)
  include(HandleLLVMOptions)
  set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/bin)
  set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/lib)

  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${LLVM_CXXFLAGS}")
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${LLVM_LDFLAGS}")

  set(LLVM_REQUIRES_RTTI TRUE)
  set(LLVM_REQUIRES_EH TRUE)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(/usr/include)
link_directories(${LLVM_LIBRARY_DIRS})

add_subdirectory(DINO)
