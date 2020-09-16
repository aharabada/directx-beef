using System;

namespace DirectX.XAudio2
{
	/**
	 * Contains information about the creation flags, input channels, and sample rate of a voice.
	 * @native XAUDIO2_VOICE_DETAILS
	*/
	[CRepr]
	public struct VoiceDetails
	{
		/**
		 * Flags used to create the voice; see the individual voice interfaces for more information.
		 */
		public uint32 CreationFlags; // Todo: enumerate flags
		/**
		 * Flags that are currently set on the voice.
		 */
		public uint32 ActiveFlags; // Todo: enumerate flags
		/**
		 * The number of input channels the voice expects.
		 */
		public uint32 InputChannels;
		/**
		 * The input sample rate the voice expects.
		 */
		public uint32 InputSampleRate;
	}
}
