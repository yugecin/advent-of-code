my solutions for the 2021 Advent of Code: https://adventofcode.com/2021

================================================================================

nasm: NASM version 2.15.05 compiled on Aug 28 2020
link: Microsoft (R) Incremental Linker Version 8.00.50727.42 (from VC2005)
debugger: IDA freeware and/or CheatEngine

aoc2021.exe is built with VCS2015 from aoc2021.cs

================================================================================

aoc2021.exe loads aoc.dll and calls exported function "aoc" while having a
Stopwatch running to time the duration, at least two times (to check if the
result doesn't change), and optionally 500 times to get average/high/low timings.

aoc.dll requirements:
- export a function named "aoc" that takes no parameters and returns the result

================================================================================

build.bat is a small script that compiles each file (defined inside the script)
into aoc.dll and invokes aoc2021.exe

run "build.bat /DEBUG" to make aoc2021.exe wait before running each solution,
this is useful to attach a debugger to the waiting process to debug the dll.

run "build.bat /BENCH" to make aoc2021.exe run the solutions multiple times,
to get an average timing over 500 iterations.
