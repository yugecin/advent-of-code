my solutions for the 2023 Advent of Code: https://adventofcode.com/2023

================================================================================

nasm: NASM version 2.15.05 compiled on Aug 28 2020
link: Microsoft (R) Incremental Linker Version 8.00.50727.42 (from VC2005)
debugger: IDA freeware and/or CheatEngine

run "build.bat" and it compiles and spouts all solutions

run "build.bat /DEBUG" to make aoc2023.exe wait before running each solution,
this is useful to attach a debugger to the waiting process to debug the dll.

run "build.bat /BENCH" to make aoc2023.exe run the solutions multiple times,
to get an average timing over 500 iterations.

================================================================================

differences from 2022:

output formatting bullshit :)

aoc.dll must now also export 'getprintf',
this is a __cdecl function that accepts 1 arguments: a ptr to printf :)
