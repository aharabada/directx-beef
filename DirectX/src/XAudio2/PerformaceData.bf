using System;

namespace DirectX.XAudio2
{
	/**
	 * Contains performance information.
	 */
	[CRepr]
	public struct PerformaceData
	{
		/**
		 * CPU cycles spent on audio processing since the last call to the IXAudio2.StartEngine or IXAudio2.GetPerformanceData function.
		 */
		public uint64 AudioCyclesSinceLastQuery;
		/**
		 * Total CPU cycles elapsed since the last call.
		 * Note: This only counts cycles on the CPU on which XAudio2 is running.
		 */
		public uint64 TotalCyclesSinceLastQuery;
		/**
		 * Fewest CPU cycles spent on processing any single audio quantum since the last call.
		 */
		public uint32 MinimumCyclesPerQuantum;
		/**
		 * Most CPU cycles spent on processing any single audio quantum since the last call.
		 */
		public uint32 MaximumCyclesPerQuantum;
		/**
		 * Total memory currently in use.
		 */
		public uint32 MemoryUsageInBytes;
		/**
		 * Minimum delay that occurs between the time a sample is read from a source buffer and the time it reaches the speakers.
		*/
		public uint32 CurrentLatencyInSamples;
		/**
		 * Total audio dropouts since the engine started.
		 */
		public uint32 GlitchesSinceEngineStarted;
		/**
		 * Number of source voices currently playing.
		 */
		public uint32 ActiveSourceVoiceCount;
		/**
		 * Total number of source voices currently in existence.
		 */
		public uint32 TotalSourceVoiceCount;
		/**
		 * Number of submix voices currently playing.
		 */
		public uint32 ActiveSubmixVoiceCount;
		/**
		 * Number of resampler xAPOs currently active.
		 */
		public uint32 ActiveResamplerCount;
		/**
		 * Number of matrix mix xAPOs currently active.
		*/
		public uint32 ActiveMatrixMixCount;
		/**
		 * Windows: Unsupported.
		 * Xbox 360: Number of source voices decoding XMA data.
		*/
		public uint32 ActiveXmaSourceVoices;
		/**
		 * Windows: Unsupported.
		 * Xbox 360: A voice can use more than one XMA stream.
		*/
		public uint32 ActiveXmaStreams;

	}
}
