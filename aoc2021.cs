using System;
using System.Diagnostics;
using System.Runtime.InteropServices;

namespace aoc2021
{
	class Aoc2021
	{
		[DllImport("aoc.dll", CallingConvention = CallingConvention.StdCall)]
		public static extern int aoc();

		public static void Main(string[] args)
		{
			if (args.Length > 0 && args[0].ToUpper() == "/DEBUG") {
				Console.WriteLine("aoc2021.exe: /DEBUG present: press a key to continue");
				Console.ReadKey(true);
			}
			// see https://docs.microsoft.com/en-us/dotnet/api/system.diagnostics.stopwatch
			long nanosPerTick = (1000L * 1000L * 1000L) / Stopwatch.Frequency;
			long min = long.MaxValue, max = long.MinValue, total = 0;
			int res = aoc();
			Stopwatch sw = new Stopwatch();
			for (int i = 0; i < 500; i++) {
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
