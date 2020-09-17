using System;

namespace DirectX.XAudio2
{
	/**
	 * Represents an audio data buffer, used with IXAudio2SourceVoice.SubmitSourceBuffer.
	 */
	[CRepr]
	public struct XAudio2Buffer
	{
		public enum Flags : uint32
		{
			/**
			 * No flags specified.
			 */
			None = 0,
			/**
			 * Indicates that there cannot be any buffers in the queue after this buffer. The only effect of this flag is to suppress debug output warnings caused by starvation of the buffer queue.
			 * @native XAUDIO2_END_OF_STREAM
			 */
			EndOfStream = 0x0040
		}

		/**
		 * Flags that provide additional information about the audio buffer.
		 */
		public Flags Flags;
		/**
		 * Size of the audio data, in bytes.
		 */
		public uint32 AudioBytes;
		/**
		 * Pointer to the audio data.
		 */
		public uint8 *pAudioData;
		/**
		 * First sample in the buffer that should be played.
		 */
		public uint32 PlayBegin;
		/**
		 * Length of the region to be played, in samples.
		 */
		public uint32 PlayLength;
		/**
		 * First sample of the region to be looped.
		 */
		public uint32 LoopBegin;
		/**
		 * Length of the loop region, in samples.
		 */
		public uint32 LoopLength;
		/**
		 * umber of times to loop through the loop region.
		 */
		public uint32 LoopCount;
		/**
		 * Context value to be passed back in callbacks to the client. This may be NULL.
		 */
		public void *pContext;
	}
}
