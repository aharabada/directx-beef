using System;

namespace DirectX.XAudio2
{
	/**
	 * Used with IXAudio2SourceVoice::SubmitSourceBuffer when submitting xWMA data.
	 */
	[CRepr]
	public struct BufferWMA
	{
		/**
		 * Decoded packet cumulative data size array, each element is the number of bytes accumulated after the corresponding xWMA packet is decoded in order, must have PacketCount elements.
		 */
		public uint32* DecodedPacketComulativeBytes;
		/**
		 * Number of xWMA packets submitted, must be >= 1 and divide evenly into the respective XAudio2Buffer.AudioBytes value passed to IXAudio2SourceVoice::SubmitSourceBuffer.
		 */
		public uint32 PackedCount;
	}
}
