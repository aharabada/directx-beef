using System;

namespace DirectX.XAudio2
{
	/**
	 * Defines a set of voices to receive data from a single output voice.
	 * @native XAUDIO2_VOICE_SENDS
	 */
	[CRepr]
	public struct VoiceSends
	{
		/**
		 * Number of voices to receive the output of the voice. An OutputCount value of 0 indicates the voice should not send output to any voices.
		 */
		public uint32 SendCount;
		/**
		 * Array of SendDescriptor structures describing destination voices and the filters that should be used when sending to the voices.
		 * This array should contain SendCount elements. If SendCount is 0 Sends should be NULL. Note that Sends cannot contain the same voice more than once.
		 */
		public SendDescriptor* Sends;

		public this() => this = default;

		public this(Span<SendDescriptor> sends)
		{
			Sends = sends.Ptr;
			SendCount = (uint32)sends.Length;
		}
	}

	public enum SendFlags : uint32
	{
		/**
		 * No flags specified.
		 */
		None = 0,
		/**
		 * @native XAUDIO2_SEND_USEFILTER
		 */
		UseFilter = 0x0080
	}

	/**
	 * Defines a destination voice that is the target of a send from another voice and specifies whether a filter should be used.
	 * @native XAUDIO2_SEND_DESCRIPTOR
	*/
	[CRepr]
	public struct SendDescriptor
	{
		/**
		 * Indicates whether a filter should be used on data sent to the voice pointed to by OutputVoice. Flags can be 0 or XAUDIO2_SEND_USEFILTER.
		 */
		public SendFlags Flags;
		/**
		 * A pointer to an IXAudio2Voice that will be the target of the send. The OutputVoice member cannot be NULL.
		 */
		public IXAudio2Voice* OutputVoice;

		public this() => this = default;

		public this(IXAudio2Voice* outputVoice, SendFlags flags = .None)
		{
			OutputVoice = outputVoice;
			Flags = flags;
		}
	}
}
