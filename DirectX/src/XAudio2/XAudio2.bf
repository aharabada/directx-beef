using System;
using DirectX.Math;
using DirectX.Common;

namespace DirectX.XAudio2
{
	/**
	 * Contains functions and Constants related to XAudio2
	*/
	public static class XAudio2
	{
		/**
		* Maximum bytes allowed in a source buffer.
		* @native XAUDIO2_MAX_BUFFER_BYTES
		*/
		public const uint32 MaxBufferBytes = 0x80000000;
		/**
		* Maximum buffers allowed in a voice queue.
		* @native XAUDIO2_MAX_QUEUED_BUFFERS
		*/
		public const uint32 MaxQueuedBuffers = 64;
		/**
		 * Maximum channels in an audio stream.
		 * @native XAUDIO2_MAX_AUDIO_CHANNELS
		 */
		public const uint32 MaxAudioChannels = 64;
		/**
		 * Minimum audio sample rate supported.
		 * @native XAUDIO2_MIN_SAMPLE_RATE
		 */
		public const uint32 MinSampleRate = 1000;
		/**
		 * Maximum audio sample rate supported.
		 * @native XAUDIO2_MIN_SAMPLE_RATE
		 */
		public const uint32 MaxSampleRate = 200000;
		/**
		 * Maximum acceptable volume level (2^24)
		 * @native XAUDIO2_MAX_VOLUME_LEVEL
		 */
		public const float MaxVolumeLevel = 16777216.0f;
		/**
		 * Minimum SetFrequencyRatio argument.
		 * @native XAUDIO2_MIN_FREQ_RATIO
		 */
		public const float MinFrequencyRatio = (1/1024.0f);

		/**
		 * Maximum MaxFrequencyRatio argument.
		 * @native XAUDIO2_MAX_FREQ_RATIO
		 */
		public const float MaxFrequencyRatio = 1024.0f;
		/**
		 * Default MaxFrequencyRatio argument
		 * @native XAUDIO2_DEFAULT_FREQ_RATIO
		 */
		public const float DefaultFrequencyRatio = 2.0f;
		/**
		 * Maximum FilterParameters.OneOverQ
		 * @native XAUDIO2_MAX_FILTER_ONEOVERQ
		 */
		public const float MaxFilterOneOverQ = 1.5f;
		/**
		 * Maximum FilterParameters.Frequency
		 * @native XAUDIO2_MAX_FILTER_FREQUENCY
		 */
		public const float MaxFilterFrequency = 1.0f;
		/**
		 * Maximum non-infinite XAudio2Buffer.LoopCount
		 * @native XAUDIO2_MAX_LOOP_COUNT
		 */
		public const uint32 MaxLoopCount = 254;

		/**
		 * Used as an OperationSet argument.
		 * Applies the changes immediately.
		 * @native XAUDIO2_COMMIT_NOW
		 */
		public const uint32 CommitNow = 0;
		/**
		 * Used in IXAudio2::CommitChanges.
		 * Applies all pending changes.
		 * @native XAUDIO2_COMMIT_ALL
		 */
		public const uint32 CommitAll = 0;
		/**
		 * Not allowed for OperationSet arguments.
		 * @native XAUDIO2_INVALID_OPSET
		 */
		public const uint32 InvalidOperationSet = (uint32)-1;
		/**
		 * Used in XAudio2Buffer.LoopCount.
		 * @native XAUDIO2_NO_LOOP_REGION
		 */
		public const uint32 NoLoopRegion = 0;
		/**
		 * Used in XAudio2Buffer.LoopCount.
		 * @native XAUDIO2_LOOP_INFINITE
		 */
		public const uint32 LoopInfinite = 255;
		/**
		 * Used in CreateMasteringVoice.
		 * @native XAUDIO2_DEFAULT_CHANNELS
		 */
		public const uint32 DefaultChannels = 0;

		/**
		 * Used in CreateMasteringVoice.
		 * @native XAUDIO2_DEFAULT_SAMPLERATE
		 */
		public const uint32 DefaultSamplerate = 0;
		
		/**
		 * On Windows, XAudio2 processes audio.
		 * @native XAUDIO2_QUANTUM_NUMERATOR
		 */
		public const uint32 QuantumNumerator = 1;
		
		/**
		 * in 10ms chunks (= 1/100 seconds)
		 * @native XAUDIO2_QUANTUM_DENOMINATOR
		 */
		public const uint32 QuantumDenominator = 100;
		
		/**
		 * (1000.0f * QuantumNumerator / QuantumDenominator)
		 * @native XAUDIO2_QUANTUM_MS
		 */
		public const float QuantumMs = (1000.0f * QuantumNumerator / QuantumDenominator);

		public static this()
		{
			// Todo: version check, maybe defines?
		}

		/**
		 * Creates a new XAudio2 object and returns a pointer to its IXAudio2 interface.
		 * @param xAudio2 If the operation is successful, returns a pointer to an IXAudio2 object.
		 * @param flags Flags that specify the behavior of the IXAudio2 object. The value of this parameter must be 0.
		 * @param xAduio2Processor An XAUDIO2_PROCESSOR-typed value that specifies which CPU to use. If multiple bits are specified, the system will create a separate worker thread for each processor.
		 * @returns S_OK if successful, an error code otherwise. See XAudio2 Error Codes for descriptions of XAudio2 specific error codes.
		 */
		[Import("XAudio2.lib"), LinkName("XAudio2Create"), CallingConvention(.Stdcall)]
		public static extern HResult Create(out IXAudio2* xAudio2, uint32 flags = 0, Processor xAudio2Processor = .DefaultProcessor);

		/**
		 * Converts from filter cutoff frequencies expressed in hertz to the radian frequency values used in the Frequency member of the FilterParameters structure.
		 * @param cutoffFrequency The cutoff frequency in hertz. Frequencies greater than SampleRate ÷ 6 are clamped to MaxFilterFrequency.
		 * @param sampleRate The sample rate of the audio data affected by the FilterParameters structure.
		 * @returns a radian frequency for use in the FilterParameters structure.
		 */
		[Inline]
		public static float CutoffFrequencyToRadians(float cutoffFrequency, uint32 sampleRate)
		{
			if ((uint32)(cutoffFrequency * 6.0f) >= sampleRate)
			{
			    return MaxFilterFrequency;
			}

			return 2.0f * Math.Sin((float)MathUtil.Pi * cutoffFrequency / sampleRate);
		}

		/**
		 * Converts from the radian frequencies used in FilterParameters back to absolute frequencies in hertz.
		 * @param radians Value of the Frequency member of the FilterParameters structure.
		 * @param sampleRate The sample rate of the audio data affected by the FilterParameters structure.
		 * @returns a floating-point value that represents the frequency in hertz.
		 */
		[Inline]
		public static float RadiansToCutoffFrequency(float radians, float sampleRate)
		{
		    return sampleRate * Math.Asin(radians / 2.0f) / (float)MathUtil.Pi;
		}

		/**
		 * Converts from filter cutoff frequencies expressed in hertz to the filter coefficients used with the Frequency member of the FilterParameters structure.
		 * @param cutoffFrequency The cutoff frequency in hertz. Frequencies greater than SampleRate are clamped to MaxFilterFrequency.
		 * @param sampleRate The sample rate of the audio data affected by the FilterParameters structure.
		 * @returns a filter coefficient for use in the FilterParameters structure.
		 */
		[Inline]
		public static float CutoffFrequencyToOnePoleCoefficient(float cutoffFrequency, uint32 sampleRate)
		{
		    if ((uint32)cutoffFrequency >= sampleRate)
		    {
		        return MaxFilterFrequency;
		    }
		    return (1.0f - Math.Pow(1.0f - 2.0f * cutoffFrequency / sampleRate, 2.0f));
		}
	}
}
