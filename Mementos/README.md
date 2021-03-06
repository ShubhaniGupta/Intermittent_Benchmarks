# Mementos

A system that makes programs robust against frequent power loss on
intermittently powered computers.

Currently implemented for the MSP430 family of processors.

The [ASPLOS '11 paper](https://spqr.eecs.umich.edu/papers/ransford-mementos-asplos11.pdf) describes Mementos in detail.

See [license.txt](https://github.com/spqr/mementos/raw/master/license.txt) for licensing terms.


## Mementos-izing a Program #

By _Mementosize_ a program, we mean instrument the program with energy checks called _trigger points_.  By default, Mementos will build several variants of your program around several different instrumentation strategies: loop-latch instrumentation, function-return instrumentation, and timer-aided loop-latch instrumentation.  We'll call these variants `myfoo+latch`, `myfoo+return`, and `myfoo+timer`.  It additionally tries to build separate "plain" (uninstrumented) versions with clang and mspgcc.

## Caveats #

Things known not to work:

* If you have your own TimerA interrupt defined, it will clash with the one Mementos tries to introduce in the `myfoo+timer` variant.
