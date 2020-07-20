using System;
using DirectX;
using DirectX.Common;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * The IDXGIDisplayControl interface exposes methods to indicate user preference for the operating system's stereoscopic 3D display behavior and to set stereoscopic 3D display status to enable or disable.
	*/
	public struct IDXGIDisplayControl : IUnknown, IComObject
	{	 
		public static new Guid IID => .("ea9dbf1a-c88e-4486-854a-98aa0138f30c");
		
		public struct VTable : IUnknown.VTable
		{
			public function BOOL(IDXGIDisplayControl* self) IsStereoEnabled;
			public function void(IDXGIDisplayControl* self, BOOL enabled) SetStereoEnabled;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Retrieves a Boolean value that indicates whether the operating system's stereoscopic 3D display behavior is enabled.
		 *
		 * @return	IsStereoEnabled returns TRUE when the operating system's stereoscopic 3D display behavior is enabled and FALSE when this behavior is disabled.
		*/
		public BOOL IsStereoEnabled() mut
		{
			return VT.IsStereoEnabled(&this);
		}

		/**
		 * Set a Boolean value to either enable or disable the operating system's stereoscopic 3D display behavior.
		 *
		 * @param enabled	A Boolean value that either enables or disables the operating system's stereoscopic 3D display behavior.
		 *					TRUE enables the operating system's stereoscopic 3D display behavior and FALSE disables it.
		*/
		public void SetStereoEnabled(BOOL enabled) mut
		{
			VT.SetStereoEnabled(&this, enabled);
		}
	}
}