#include <stdio.h>
#include <windows.h>

int main(int argc, char **argv)
{
	static char buf[1000];
	unsigned int debug, bench, iterations, i, zzz, min, max, total, nanos_per_tick, t;
	LARGE_INTEGER start, end, freq;
	long long int (*aoc)(void);
	int (*type)(void);
	FARPROC proc;
	HMODULE lib;
	float avg;
	union {
		long long i64;
		int i32;
		char *s0;
	} res0, res1;

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
	proc = GetProcAddress(lib, "aoc");
	if (!proc) {
		printf("did not find proc 'aoc'\n");
		return 2;
	}
	aoc = (void*) proc;
	proc = GetProcAddress(lib, "type");
	if (!proc) {
		printf("did not find proc 'type'\n");
		return 2;
	}
	type = (void*) proc;
	t = type();
	if (debug) {
		printf("aoc2022.exe: /DEBUG present: press enter to continue\n");
		getc(stdin);
	}
	res0.i64 = aoc();
	if (t == 0) {
		if (strlen(res0.s0) > sizeof(buf)) {
			printf("resulting string is too big\n");
			return 5;
		}
		strcpy(buf, res0.s0);
	}
	// always do at least one extra iteration,
	// to check if the result is always the same
	iterations = bench ? 500 : 1;
	max = 0;
	min = -1;
	total = 0;
	for (i = 0; i < iterations;) {
		i++;
		QueryPerformanceCounter(&start);
		res1.i64 = aoc();
		QueryPerformanceCounter(&end);
		switch (t) {
		case 64:
			if (res0.i64 != res1.i64) {
				// the %I64d is somehow what my mingw-gcc-whateverthefuck uses,
				// I'd expect %lld to work but no
				printf("iteration %d: different result: %I64d vs %I64d\n", i, res0.i64, res1.i64);
				return 3;
			}
			break;
		case 32:
			if (res0.i32 != res1.i32) {
				printf("iteration %d: different result: %d vs %d\n", i, res0.i32, res1.i32);
				return 3;
			}
			break;
		case 0:
			if (strcmp(buf, res1.s0)) {
				printf("iteration %d: different result: '%s' vs '%s'\n", i, buf, res1.s0);
				return 3;
			}
			break;
		}
		res0 = res1;
		zzz = (int) (end.QuadPart - start.QuadPart); // bite me
		if (zzz < min) min = zzz;
		if (zzz > max) max = zzz;
		total += zzz;
	}
	avg = total / (float) iterations;
	switch (t) {
	case 64:
		printf("%I64d ", res0.i64);
		break;
	case 32:
		printf("%d ", res0.i32);
		break;
	case 0:
		printf("%s ", res0.s0);
		break;
	}
	printf("avg %.0fticks/%.0fns ", avg, avg * nanos_per_tick);
	if (bench) {
		printf(
			"lo %d/%dns hi %d/%dns ",
			min, min * nanos_per_tick,
			max, max * nanos_per_tick
		);
	}
	printf("timer resolution %dns\n", nanos_per_tick);
	return 0;
}
