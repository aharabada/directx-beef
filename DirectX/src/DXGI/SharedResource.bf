using System;

namespace DirectX.DXGI
{
	/**
	 * Represents a handle to a shared resource.
	*/
	[CRepr]
	public struct SharedResource
	{
		/**
		 * A handle to a shared resource.
		*/
		public Windows.Handle Handle;
	}
}
