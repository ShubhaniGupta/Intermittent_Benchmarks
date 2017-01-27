# Intermittent_Benchmarks

Steps to follow:
0. Install an MSP430 compiler toolchain such as mspgcc or gcc 4.9 (which includes an MSP430 backend in later releases).  If you are using mspgcc, ensure that `msp430-gcc` is in your `$PATH`.
```sh   
sudo apt-get install gcc-msp430
```
1. Build and install llvm 3.5.0 [LLVM](http://llvm.org/) and
[Clang](http://clang.llvm.org/) using the [CMake-style
build](http://llvm.org/docs/CMake.html).  The rest of these instructions assume
you have chosen to put your LLVM installation in `/opt/llvm`.

```sh
# download LLVM, Clang, compiler-rt 3.5.0.src as mentioned below:
Checkout LLVM:
$ cd where-you-want-llvm-to-live
$ svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm

Checkout Clang:
$ cd where-you-want-llvm-to-live
$ cd llvm/tools
$ svn co http://llvm.org/svn/llvm-project/cfe/trunk clang

Checkout Compiler-RT (required to build the sanitizers) [Optional]:

$ cd where-you-want-llvm-to-live
$ cd llvm/projects
$ svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt

# build instructions

$ cd where you want to build llvm
$ mkdir build && cd build
$ cmake -DLLVM_TARGETS_TO_BUILD="X86;MSP430" -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/opt/llvm  where-you-want-llvm-to-live/llvm
$ cmake --build .
$ cmake -DCMAKE_INSTALL_PREFIX=/opt/llvm -P cmake_install.cmake
$ cmake --build . --target install

```
2. Clone this repository.
```sh
$ git clone https://github.com/ShubhaniGupta/Intermittent_Benchmarks.git dino
```

3. First generate the Mementos related libraries and LLVM Passes
```sh
$ export MEMENTOS="$PWD/dino/Mementos"
$ cd "$MEMENTOS"

-- Build `libmementos_fram.a`, which you can link into your own programs:
$ make -f Makefile.wolverine

-- Build and install Mementos's LLVM passes:
$ cd "$MEMENTOS"/llvm
$ mkdir build && cd build
$ cmake -DLLVM_ROOT=/opt/llvm ..
$ sudo make install

-- Fetch the Mementos fork of MSPsim:
$ cd "$MEMENTOS"
$ git clone git://github.com/ransford/mspsim.git mspsim
$ cd mspsim
$ ant

-- Configure Mementos's non-LLVM component:
$ cd Mementos
$ ./configure --with-llvm=/opt/llvm

```
