using System;
using DirectX.Common;
using DirectX.Math;

namespace DirectX.DXGI
{
	/**
	 * The IDXGISurface1 interface extends the IDXGISurface by adding support for using Windows Graphics Device Interface (GDI) to render to a Microsoft DirectX Graphics Infrastructure (DXGI) surface.
	*/
	public struct IDXGISurface1 : IDXGISurface, IComObject
	{
		public static new Guid IID => .("4AE63092-6327-4c1b-80AE-BFE12EA32B86");

		public struct VTable : IDXGISurface.VTable
		{
			public function HResult(IDXGISurface *self, BOOL discard, Windows.Handle *phdc) GetDC;
			public function HResult(IDXGISurface *self, Rectangle *pDirctyRect) ReleaseDC;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Returns a device context (DC) that allows you to render to a Microsoft DirectX Graphics Infrastructure (DXGI) surface using Windows Graphics Device Interface (GDI).
		 *
		 * @param discard	A Boolean value that specifies whether to preserve Direct3D contents in the GDI DC.
		 *					TRUE directs the runtime not to preserve Direct3D contents in the GDI DC;
		 *					that is, the runtime discards the Direct3D contents.
		 *					FALSE guarantees that Direct3D contents are available in the GDI DC.
		 * @param hdc		A reference to an HDC handle that represents the current device context for GDI rendering.
		*/
		public HResult GetDeviceContext(BOOL discard, out Windows.Handle hdc) mut
		{
			hdc = ?;
			return VT.GetDC(&this, discard, &hdc);
		}


		/**
		 * Releases the GDI device context (DC) that is associated with the current surface and allows you to use Direct3D to render.
		 *
		 * @param pDirctyRect	A pointer to a RECT structure that identifies the dirty region of the surface.
		*/
		public HResult ReleaseDeviceContext(Rectangle *pDirctyRect) mut
		{
			return VT.ReleaseDC(&this, pDirctyRect);
		}
	}
}
