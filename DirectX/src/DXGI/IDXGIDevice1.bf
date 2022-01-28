using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * An IDXGIDevice1 interface implements a derived class for DXGI objects that produce image data.
	*/
	public struct IDXGIDevice1 : IDXGIDevice, IComObject
	{
		public static new Guid IID => .("77db970f-6276-48ba-ba28-070143b4392c");

		public struct VTable : IDXGIDevice.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(IDXGIDevice1* self, UINT maxLatency) SetMaximumFrameLatency;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIDevice1* self, UINT *pMaxLatency) GetMaximumFrameLatency;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the number of frames that the system is allowed to queue for rendering.
		 *
		 * @param maxLatency	This value is set to the number of frames that can be queued for render.
		 *						This value defaults to 3, but can range from 1 to 16.
		*/
		public HResult GetMaximumFrameLatency(out UINT maxLatency) mut
		{
			maxLatency = ?;
			return VT.GetMaximumFrameLatency(&this, &maxLatency);
		}

		/**
		 * Sets the number of frames that the system is allowed to queue for rendering.
		 *
		 * @param maxLatency	The maximum number of back buffer frames that a driver can queue.
		 *						The value defaults to 3, but can range from 1 to 16.
		 *						A value of 0 will reset latency to the default.
		 *						For multi-head devices, this value is specified per-head.
		*/
		public HResult SetMaximumFrameLatency(UINT maxLatency) mut
		{
			return VT.SetMaximumFrameLatency(&this, maxLatency);
		}
	}
}