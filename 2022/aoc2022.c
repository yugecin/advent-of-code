#include <stdio.h>
#include <windows.h>

int main(int argc, char **argv)
{
	unsigned int debug, bench, iterations, i, zzz, min, max, total, nanos_per_tick;
	long long (*aoc)(void), res0, res1;
	LARGE_INTEGER start, end, freq;
	FARPROC aocproc;
	HMODULE lib;
	float avg;

	// https://learn.microsoft.com/en-us/windows/win32/sysinfo/acquiring-high-resolution-time-stamps#using-qpc-in-native-code
	QueryPerformanceFrequency(&freq);
	nanos_per_tick = (int) (1000LL * 1000LL * 1000LL / freq.QuadPart); // bite me

	debug = argc > 1 && !strcmp("/DEBUG", argv[1]);
	bench = argc > 1 && !strcmp("/BENCH", argv[1]);
	lib = LoadLibraryA("aoc.dll");
	if (!lib) {
		printf("couldn't load aoc.dll, error: %ld\n", GetLastError());
		return 1;
	}
	aocproc = GetProcAddress(lib, "aoc");
	if (!aocproc) {
		printf("did not find proc 'aoc', error: %ld\n", GetLastError());
		return 2;
	}
	if (debug) {
		printf("aoc2022.exe: /DEBUG present: press enter to continue\n");
		getc(stdin);
	}
	aoc = (void*) aocproc;
	res0 = aoc();
	// always do at least one extra iteration,
	// to check if the result is always the same
	iterations = bench ? 500 : 1;
	max = 0;
	min = -1;
	total = 0;
	for (i = 0; i < iterations;) {
		i++;
		QueryPerformanceCounter(&start);
		res1 = aoc();
		QueryPerformanceCounter(&end);
		if (res0 != res1) {
			// the %I64d is somehow what my mingw-gcc-whateverthefuck uses,
			// I'd expect %lld to work but no
			printf("iteration %d: different result: %I64d vs %I64d\n", i, res0, res1);
			return 3;
		}
		res0 = res1;
		zzz = (int) (end.QuadPart - start.QuadPart); // bite me
		if (zzz < min) min = zzz;
		if (zzz > max) max = zzz;
		total += zzz;
	}
	avg = total / (float) iterations;
	if (bench) {
		printf(
			"%I64d %.0fticks/%.0fns lo %d/%dns hi %d/%dns timer resolution %dns\n",
			res0,
			avg, avg * (int)nanos_per_tick,
			min, min * nanos_per_tick,
			max, max * nanos_per_tick,
			nanos_per_tick
		);
	} else {
		printf(
			"%I64d %.0fticks/%.0fns timer resolution %dns\n",
			res0,
			avg, avg * nanos_per_tick,
			nanos_per_tick
		);
	}
	return 0;
}
