using System;

namespace DirectX.XAudio2
{
	/**
	 * Bitmask of enabled debug message types.
	 * @native XAUDIO2_LOG_*
	 */
	public enum TraceMask : uint32
	{
		/**
		 * No flags enabled.
		 */
		None = 0,
		/**
		 * Log error messages. 
		 * @native XAUDIO2_LOG_ERRORS
		 */
		Errors        = 0x0001,
		/**
		 * Log warning messages.
		 * Note: Enabling TraceMask.Warnings also enables TraceMask.Errors.
		 * @native XAUDIO2_LOG_WARNINGS
		 */
		Warnings      = 0x0002,
		/**
		 * Log informational messages.
		 * @native XAUDIO2_LOG_INFO
		 */
		Info          = 0x0004,
		/**
		 * Log detailed informational messages.
		 * Note: Enabling TraceMask.Detail also enables TraceMask.Info.
		 * @native XAUDIO2_LOG_DETAIL
		*/
		Detail        = 0x0008,
		/**
		 * Log public API function entries and exits.
		 * @native XAUDIO2_LOG_API_CALLS
		*/
		ApiCalls      = 0x0010,
		/**
		 * Log internal function entries and exits.
		 * Note: Enabling TraceMask.FunctionCalls also enables TraceMask.ApiCalls.
		 * @native XAUDIO2_LOG_FUNC_CALLS
		 */
		FunctionCalls = 0x0020,
		/**
		 * Log delays detected and other timing data.
		 * @native XAUDIO2_LOG_TIMING
		 */
		Timing        = 0x0040,
		/**
		 * Log usage of critical sections and mutexes. 
		 * @native XAUDIO2_LOG_LOCKS
		 */
		Locks         = 0x0080,
		/**
		 * Log memory heap usage information.
		 * @native XAUDIO2_LOG_MEMORY
		 */
		Memory        = 0x0100,
		/**
		 * Log audio streaming information.
		 * @native XAUDIO2_LOG_STREAMING
		 */
		Streaming     = 0x1000,
		/**
		 * All flags specified.
		 */
		All = Errors | Warnings | Info | Detail | ApiCalls | FunctionCalls | Timing | Locks | Memory | Streaming
	}

	/**
	 * Message types that will cause an immediate break.
	 */
	public enum BreakMask : uint32
	{
		/**
		 * No flags enabled.
		 */
		None = 0,
		/**
		 * Log error messages. 
		 * @native XAUDIO2_LOG_ERRORS
		 */
		Errors        = 0x0001,
		/**
		 * Log warning messages.
		 * Note: Enabling TraceMask.Warnings also enables TraceMask.Errors.
		 * @native XAUDIO2_LOG_WARNINGS
		 */
		Warnings      = 0x0002,
		/**
		 * All flags specified.
		 */
		All = Errors | Warnings
	}

	/**
	 * Identifier of the set of operations to be applied.
	 */
	[AllowDuplicates]
	public enum CommitFlags : uint32
	{
		/**
		 * Used as an OperationSet argument
		 * @native XAUDIO2_COMMIT_NOW
		*/
		//Now = 0,
		/**
		 * Used in IXAudio2::CommitChanges
		 * @native XAUDIO2_COMMIT_ALL
		*/
		//All = 0,
      	/**
		 * Not allowed for OperationSet arguments
		 * @native XAUDIO2_INVALID_OPSET
		*/
		InvalidOpset = (uint32)(-1),
		/**
		 * Used in XAUDIO2_BUFFER.LoopCount
		 * @native XAUDIO2_NO_LOOP_REGION
		*/
		NoLoopRegion = 0,
		/*
		 * Used in XAUDIO2_BUFFER.LoopCount
		 * @native XAUDIO2_LOOP_INFINITE
		 */
		LoopInfinite = 255,
		/**
		 * Used in CreateMasteringVoice
		 * @native XAUDIO2_DEFAULT_CHANNELS
		 */
		DefaultChannels = 0,
		/**
		 * Used in CreateMasteringVoice
		 * @native XAUDIO2_DEFAULT_SAMPLERATE
		*/
		DefaultSamplerate = 0
	}

	/**
	 * Specifies the category of an audio stream.
	 * @native AUDIO_STREAM_CATEGORY
	 */
	public enum AudioStreamCategory : uint32
	{
		/**
		 * Other audio stream.
		 */
		Other = 0,
		/**
		 * Media that will only stream when the app is in the foreground. This enumeration value has been deprecated.
		 */
		ForegroundOnlyMedia = 1,
		//#if NTDDI_VERSION < NTDDI_WINTHRESHOLD
		/**
		 * Media that can be streamed when the app is in the background. This enumeration value has been deprecated.
		 */
		BackgroundCapableMedia = 2,
		//#endif
		/**
		 * Real-time communications, such as VOIP or chat.
		 */
		Communications = 3,
		/**
		 * Alert sounds.
		 */
		Alerts = 4,
		/**
		 * Sound effects.
		 */
		SoundEffects = 5,
		/**
		 * Game sound effects.
		 */
		GameEffects = 6,
		/**
		 * Background audio for games.
		 */
		GameMedia = 7,
		/**
		 * Game chat audio. Similar to AudioStreamCategory.Communications except that AudioStreamCategory.GameChat will not attenuate other streams.
		 */
		GameChat = 8,
		/**
		 * Speech.
		 */
		Speech = 9,
		/**
		 * Stream that includes audio with dialog.
		 */
		Movie = 10,
		/**
		 * Stream that includes audio without dialog.
		 */
		Media = 11,
	}
	
	/**
	 * Flags that specify the behavior of a voice.
	 */
	public enum VoiceFlags : uint32
	{
		/**
		 * No flags specified.
		*/
		None,
		/**
		 * No pitch control is available on the voice.
		 * Used in IXAudio2::CreateSourceVoice
		 * @native XAUDIO2_VOICE_NOPITCH
		 */
		NoPitch = 2,
		/**
		 * No sample rate conversion is available on the voice. The voice's outputs must have the same sample rate.
		 * Note: The NoSampleRateConversion flag causes the voice to behave as though the NoPitch flag also is specified.
		 * Used in IXAudio2::CreateSourceVoice
		 * @native XAUDIO2_VOICE_NOSRC
		 */
		NoSampleRateConversion = 4,
		/**
		 * The filter effect should be available on this voice. 
		 * Used in IXAudio2::CreateSource/SubmixVoice
		 * @native XAUDIO2_VOICE_USEFILTER
		 */
		UseFilter = 8
	}
}
