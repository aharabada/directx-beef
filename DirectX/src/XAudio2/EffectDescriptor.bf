using System;
using DirectX.Common;

namespace DirectX.XAudio2
{
	/**
	 * Contains information about and XAPO for use in an effect chain.
	 */
	[CRepr]
	public struct EffectDescriptor
	{
		/**
		 * Pointer to the IUnknown interface of the XAPO object.
		 */
		public IUnknown* Effect;
		/**
		 * TRUE if the effect should begin in the enabled state; FALSE otherwise.
		 */
		public BOOL InitialState;
		/**
		 * Number of output channels the effect should produce.
		 */
		public uint32 OutputChannels;
	}
}
