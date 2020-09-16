using System;

namespace DirectX.XAudio2
{
	/**
	 * Defines an effect chain.
	 */
	[CRepr]
	public struct EffectChain
	{
		/**
		 * Number of effects in the effect chain for the voice.
		 */
		public uint32 EffectCount;
		/**
		 * Array of EffectDescriptor structures containing pointers to XAPO instances.
		 */
		public EffectDescriptor* EffectDescriptors;
	}
}
