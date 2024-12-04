my solutions for the 2023 Advent of Code: https://adventofcode.com/2023

================================================================================

nasm: NASM version 2.15.05 compiled on Aug 28 2020
link: Microsoft (R) Incremental Linker Version 8.00.50727.42 (from VC2005)
gcc: gcc version 8.3.0 (i686-posix-dwarf, Built by strawberryperl.com project)
debugger: IDA freeware and/or CheatEngine

aoc2023.exe is built with:
gcc -Wall -fno-strict-aliasing -x c aoc2023.c -o aoc2023.exe

================================================================================

aoc2023.exe loads aoc.dll and calls exported function "aoc" between calling
QueryPerformanceCounter to time the duration, at least two times (to check if the
result doesn't change), and optionally 500 times to get average/high/low timings.

aoc.dll requirements:
- export a function named "aoc" that takes no arguments and returns the result
- export a function named "type" that takes no arguments and returns:
  - 0 to interpret the result of "aoc" as a 0 terminated string
  - 32 to interpret the result of "aoc" as a 32 bit int
  - 64 to interpret the result of "aoc" as a 64 bit int
- export a function named "get64ops" that takes 3 arguments (__cdecl):
  - a pointer to a 64 bit division function
  - a pointer to a 64 bit multiplication function
  - a pointer to a 64 bit modulo function
  these functions have a signature of:
    'long long int __cdecl xxx(long long int a, long long int b)'
  this function will be called before calling "aoc"

new this year:

- export a function named "getprintf" that takes 1 argument (__cdelc):
  - a pointer to a printf function

also different from the 2022 version: slightly changed output formatting

================================================================================

build.bat is a small script that compiles each file (defined inside the script)
into aoc.dll and invokes aoc2023.exe

run "build.bat /DEBUG" to make aoc2023.exe wait before running each solution,
this is useful to attach a debugger to the waiting process to debug the dll.

run "build.bat /BENCH" to make aoc2023.exe run the solutions multiple times,
to get an average timing over 500 iterations.
