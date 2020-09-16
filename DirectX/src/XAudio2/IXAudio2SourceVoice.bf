using System;
using DirectX.Common;

namespace DirectX.XAudio2
{
	/**
	 * A submix voice is used primarily for performance improvements and effects processing.
	 */
	public struct IXAudio2SourceVoice : IXAudio2Voice
	{
		public struct VTable : IXAudio2Voice.VTable
		{
			// Todo:
			public function HResult(IXAudio2SourceVoice *self, uint32 Flags, uint32 OperationSet) Start;
			public function HResult(IXAudio2SourceVoice *self) Stop;
			public function HResult(IXAudio2SourceVoice *self, XAudio2Buffer *pBuffer, /*XAUDIO2_BUFFER_WMA*/void *pBufferWNA) SubmitSourceBuffer;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}
		/*
		/**
		 * Returns the channel mask for this voice.
		 * @param channelMask Returns the channel mask for this voice. This corresponds to the dwChannelMask member of the WAVEFORMATEXTENSIBLE structure.
		 */
		public HResult GetChannelMask(out int32 channelMask) mut
		{
			channelMask = ?;
			return VT.GetChannelMask(&this, &channelMask);
		}
		*/

		public HResult Start(uint32 flags = 0, uint32 operationSet = XAudio2.CommitNow) mut
		{
			return VT.Start(&this, flags, operationSet);
		}

		public HResult SubmitSourceBuffer(XAudio2Buffer* buffer, void* bufferWMA = null) mut // XAUDIO2_BUFFER_WMA
		{
			return VT.SubmitSourceBuffer(&this, buffer, bufferWMA);
		}
	}
}
