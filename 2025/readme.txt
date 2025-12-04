my solutions for the 2025 Advent of Code: https://adventofcode.com/2025

================================================================================

nasm: NASM version 2.15.05 compiled on Aug 28 2020
link: Microsoft (R) Incremental Linker Version 8.00.50727.42 (from VC2005)
debugger: IDA freeware and/or CheatEngine

================================================================================

currently this is using ../2023/aoc2023.exe because no changes are needed (yet).
check the readme of ../2023/readme.txt for more info about aoc2023.exe and the
requirements for aoc.dll

================================================================================

build.bat is a small script that compiles each file (defined inside the script)
into aoc.dll and invokes aoc2023.exe

run "build.bat /DEBUG" to make aoc2023.exe wait before running each solution,
this is useful to attach a debugger to the waiting process to debug the dll.

run "build.bat /BENCH" to make aoc2023.exe run the solutions multiple times,
to get an average timing over 500 iterations.
