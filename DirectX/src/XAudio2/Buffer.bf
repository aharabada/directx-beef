using System;

namespace DirectX.XAudio2
{
	// Todo: https://docs.microsoft.com/en-us/windows/win32/api/xaudio2/ns-xaudio2-xaudio2_buffer
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
		public uint32 AudioBytes;
		public uint8 *pAudioData;
		public uint32 PlayBegin;
		public uint32 PlayLength;
		public uint32 LoopBegin;
		public uint32 LoopLength;
		public uint32 LoopCount;
		public void *pContext;
	}
}
