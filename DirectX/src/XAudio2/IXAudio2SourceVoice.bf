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
			public function [CallingConvention(.Stdcall)] HResult(IXAudio2SourceVoice *self, uint32 Flags, uint32 OperationSet) Start;
			public function [CallingConvention(.Stdcall)] HResult(IXAudio2SourceVoice *self) Stop;
			public function [CallingConvention(.Stdcall)] HResult(IXAudio2SourceVoice *self, XAudio2Buffer *pBuffer, BufferWMA *pBufferWNA) SubmitSourceBuffer;
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

		/**
		 * Adds a new audio buffer to the voice queue.
		 * @param buffer  
		 * @param bufferVMA
		 */
		public HResult SubmitSourceBuffer(ref XAudio2Buffer buffer, BufferWMA* bufferWMA = null) mut
		{
			return VT.SubmitSourceBuffer(&this, &buffer, bufferWMA);
		}
	}
}
