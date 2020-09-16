namespace DirectX.Common
{
	/**
	 * XAudio2 specific error codes returned by XAudio2 methods.
	 */
	public extension HResult
	{
		/**
		 * Returned by XAudio2 for certain API usage errors (invalid calls and so on) that are hard to avoid completely and should be handled by a title at runtime.
		 * (API usage errors that are completely avoidable, such as invalid parameters, cause an ASSERT in debug builds and undefined behavior in retail builds, so no error code is defined for them.)
		 */
		public const HResult XAUDIO2_E_INVALID_CALL = (HResult)0x88960001;
		/**
		 * The Xbox 360 XMA hardware suffered an unrecoverable error.
		 */
		public const HResult XAUDIO2_E_XMA_DECODER_ERROR = (HResult)0x88960002;
		/**
		 * An effect failed to instantiate.
		 */
		public const HResult XAUDIO2_E_XAPO_CREATION_FAILED = (HResult)0x88960003;
		/**
		 * An audio device became unusable through being unplugged or some other event.
		 */
		public const HResult XAUDIO2_E_DEVICE_INVALIDATED = (HResult)0x88960004;
	}
}
