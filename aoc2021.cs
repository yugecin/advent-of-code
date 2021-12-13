using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace aoc2021
{
	class Aoc2021
	{
		[DllImport("aoc.dll")]
		public static extern int aoc();
		[DllImport("kernel32.dll", CallingConvention = CallingConvention.StdCall)]
		public static extern int LoadLibraryA(string lpLibFileName);

		public static void Main(string[] args)
		{
			bool debug = args.Length > 0 && args[0].ToUpper() == "/DEBUG";
			bool bench = args.Length > 0 && args[0].ToUpper() == "/BENCH";
			if (debug) {
				// The module doesn't get loaded until the "aoc" function is called the
				// first time, and if it's not loaded you can't set a breakpoint in that
				// function (unless you're using IDA, but I'd like to use CheatEngine as
				// debugger too). So load the library now, so we can set a breakpoint
				// while this runner program is waiting for input.
				LoadLibraryA("aoc.dll");
				Console.WriteLine("aoc2021.exe: /DEBUG present: press enter to continue");
				Console.Read();
			}
			// see https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.stopwatch
			long nanosPerTick = (1000L * 1000L * 1000L) / Stopwatch.Frequency;
			long min = long.MaxValue, max = long.MinValue, total = 0;
			int res = aoc();
			if (debug) {
				return;
			}
			// always do at least one extra iteration, to check if the result is always the same
			int iterations = bench ? 500 : 1;
			Stopwatch sw = new Stopwatch();
			for (int i = 0; i < iterations; i++) {
				sw.Start();
				int newres = aoc();
				sw.Stop();
				min = Math.Min(min, sw.ElapsedTicks);
				max = Math.Max(max, sw.ElapsedTicks);
				total += sw.ElapsedTicks;
				sw.Reset();
				if (newres != res) {
					Console.WriteLine(
						"!! results differ over iterations, was {0} now {1}",
						res, newres
					);
					return;
				}
				res = newres;
			}
			if (!bench) {
				Console.WriteLine(
					"{0} {1:F0}ticks/{2:F0}ns timer resolution {3}ns",
					res,
					total / 500f, total / 500f * nanosPerTick,
					nanosPerTick
				);
				return;
			}
			Console.WriteLine(
				"{0} avg {1:F0}ticks/{2:F0}ns lo {3}/{4}ns hi {5}/{6}ns timer resolution {7}ns",
				res,
				total / 500f, total / 500f * nanosPerTick,
				min, min * nanosPerTick,
				max, max * nanosPerTick,
				nanosPerTick
			);
		}
	}
}
