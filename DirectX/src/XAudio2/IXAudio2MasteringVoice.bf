using System;
using DirectX.Common;

namespace DirectX.XAudio2
{
	/**
	 * A submix voice is used primarily for performance improvements and effects processing.
	 */
	public struct IXAudio2MasteringVoice : IXAudio2Voice
	{
		public struct VTable : IXAudio2Voice.VTable
		{
			public function HResult(IXAudio2MasteringVoice *self, int32 *pChannelmask) GetChannelMask;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Returns the channel mask for this voice.
		 * @param channelMask Returns the channel mask for this voice. This corresponds to the dwChannelMask member of the WAVEFORMATEXTENSIBLE structure.
		 */
		public HResult GetChannelMask(out int32 channelMask) mut
		{
			channelMask = ?;
			return VT.GetChannelMask(&this, &channelMask);
		}
	}
}
