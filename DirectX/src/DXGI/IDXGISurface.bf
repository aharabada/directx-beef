using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * The IDXGISurface interface implements methods for image-data objects.
	*/
	public struct IDXGISurface : IDXGIDeviceSubObject, IComObject
	{
		public static new Guid IID => .("cafcb56c-6ac3-4889-bf47-9e23bbd260ec");

		public struct VTable : IDXGIDeviceSubObject.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(IDXGISurface *self, SurfaceDescription *pDesc) GetDesc;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISurface *self, MappedRectangle *pLockedRect, MapFlags mapFlags) Map;
			public function [CallingConvention(.Stdcall)] HResult(IDXGISurface *self) Unmap;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get a description of the surface.
		 *
		 * @param desc	A reference to the surface description.
		*/
		public HResult GetDescription(out SurfaceDescription desc) mut
		{
			desc = ?;
			return VT.GetDesc(&this, &desc);
		}

		/**
		 * Get a pointer to the data contained in the surface, and deny GPU access to the surface.
		 *
		 * @param lockedRect	A reference to the surface data.
		 * @param mapFlags		CPU read-write flags.
		*/
		public HResult Map(out MappedRectangle lockedRect, MapFlags mapFlags) mut
		{
			lockedRect = ?;
			return VT.Map(&this, &lockedRect, mapFlags);
		}

		/**
		 * Invalidate the pointer to the surface retrieved by IDXGISurface::Map and re-enable GPU access to the resource.
		*/
		public HResult Unmap() mut
		{
			return VT.Unmap(&this);
		}
	}
}
