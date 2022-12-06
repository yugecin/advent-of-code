differences from 2021:

aoc2022.exe is built with:
gcc -Wall -fno-strict-aliasing -x c aoc2022.c -o aoc2022.exe

aoc.dll must export 'aoc', as previous, but also 'type'
the 'type' function must return 0, 32 or 64:
- 0 means the result of 'aoc' is a 0 terminated string
- 32 means the result of 'aoc' is a 32 bit int
- 64 means the result of 'aoc' is a 64 bit int
