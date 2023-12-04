my solutions for the 2022 Advent of Code: https://adventofcode.com/2022

================================================================================

nasm: NASM version 2.15.05 compiled on Aug 28 2020
link: Microsoft (R) Incremental Linker Version 8.00.50727.42 (from VC2005)
debugger: IDA freeware and/or CheatEngine

run "build.bat" and it compiles and spouts all solutions

run "build.bat /DEBUG" to make aoc2022.exe wait before running each solution,
this is useful to attach a debugger to the waiting process to debug the dll.

run "build.bat /BENCH" to make aoc2022.exe run the solutions multiple times,
to get an average timing over 500 iterations.

================================================================================

differences from 2021:

aoc2022.exe is built with:
gcc -Wall -fno-strict-aliasing -x c aoc2022.c -o aoc2022.exe

aoc.dll must export 'aoc', as previous, but also 'type'
the 'type' function must return 0, 32 or 64:
- 0 means the result of 'aoc' is a 0 terminated string
- 32 means the result of 'aoc' is a 32 bit int
- 64 means the result of 'aoc' is a 64 bit int

aoc.dll must also export 'get64ops',
this is a __cdecl function that accepts 3 arguments:
- a pointer to a 64 bit division function
- a pointer to a 64 bit multiplication function
- a pointer to a 64 bit modulo function
these functions have a signature of:
'long long int xxx(long long int a, long long int b)'
