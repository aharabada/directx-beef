using System;
using System.Diagnostics;

namespace SimpleTriangleExample
{
	/**
	 * A timer providing functionality to meassure frame times and game runtime.
	*/
	public class GameTime : Stopwatch
	{
		private uint64 _frameCount;

		private TimeSpan _totalTime;
		private TimeSpan _frameTime;

		/**
		The amount of time that has passed since the timer was started.
		*/
		public TimeSpan TotalTime => _totalTime;
		/**
		The amount of time that has passed since the start of the last frame.
		*/
		public TimeSpan FrameTime => _frameTime;
		/**
		The number of frames that have been computed since the timer was started.
		*/
		public uint64 FrameCount => _frameCount;

		private Stopwatch _stopWatch ~ delete _;

		public this() : base(){}

		/**
		 * Initializes a new instance of a GameTime.
		 * @param startNow If set to true, the timer will start immediately.
		 *				   If set to false, the timer has to be started manually.
		 */
		public this(bool startNow) : base(startNow){}
		
		/**
		 * Starts or continues the internal timer.
		 */
		public new void Start()
		{
			_stopWatch.Start();
		}
		
		/**
		 * Restarts the internal timer and resets the counters.
		 */
		public new void Restart()
		{
			_totalTime = 0;
			_frameTime = 0;	
			_frameCount = 0;
			base.Restart();
		}

		/**
		 * Stops the internal timer.
		 */
		public new void Stop()
		{
			base.Stop();
		}

		/**
		 * Resets the timer.
		 */
		public new void Reset()
		{
			_totalTime = 0;
			_frameTime = 0;
			_frameCount = 0;
			base.Reset();
		}

		/**
		 * Tells the timer that a frame has passed and updates the counters.
		 */
		public void Tick()
		{
			TimeSpan old = _totalTime;
			_totalTime = Elapsed;
			_frameTime = _totalTime - old;

			_frameCount++;
		}
	}
}
