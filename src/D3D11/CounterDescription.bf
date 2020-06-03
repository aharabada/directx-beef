using System;

namespace DirectX.D3D11
{
	/**
	 * Options for performance counters.
	*/
	[CRepr]
	public struct CounterDescription
	{
		/**
		 * Type of counter.
		*/
		public Counter Counter;
		/**
		 * Reserved.
		*/
		public UINT MiscFlags;
	}
}
