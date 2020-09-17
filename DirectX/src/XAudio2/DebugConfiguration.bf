using System;
namespace DirectX.XAudio2
{
	/**
	 * Contains the new global debug configuration for XAudio2. Used with the SetDebugConfiguration function.
	 * @native XAUDIO2_DEBUG_CONFIGURATION
	 */
	[CRepr]
	public struct DebugConfiguration
	{
		/**
		 * Bitmask of enabled debug message types.
		 * Can be any combination of the TraceMask-flags.
		 */
		public TraceMask TraceMask;
		/**
		 * Message types that will cause an immediate break.
		 * Can be any combination of the TraceMask-flags.
		 */
		public BreakMask BreakMask;
		/**
		 * Indicates whether to log the thread ID with each message.
		 */
		public BOOL	  LogThreadID;
		/**
		 * Indicates whether to log source files and line numbers.
		 */
		public BOOL   LogFileline;
		/**
		 * Indicates whether to log function names.
		 */
		public BOOL   LogFunctionName;
		/**
		 * Indicates whether to log message timestamps.
		 */
		public BOOL   LogTiming;

		public this() => this = default;

		public this(TraceMask traceMask = .None, BreakMask breakMask = .None) : this()
		{
			TraceMask = traceMask;
			BreakMask = breakMask;
		}
	}
}
