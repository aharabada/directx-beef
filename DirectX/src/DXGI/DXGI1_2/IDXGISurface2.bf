using System;
using DirectX.Common;
using DirectX.Math;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * The IDXGISurface2 interface extends the IDXGISurface1 interface by adding support for subresource surfaces and getting a handle to a shared resource.
	*/
	public struct IDXGISurface2 : IDXGISurface1, IComObject
	{
		public static new Guid IID => .("aba496dd-b617-4cb8-a866-bc44d7eb1fa2");

		public struct VTable : IDXGISurface1.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(IDXGISurface2 *self, Guid *riid, void **ppParentResource, UINT *pSubresourceIndex) GetResource;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the parent resource and subresource index that support a subresource surface.
		 *
		 * @param iid				The globally unique identifier (GUID) of the requested interface type.
		 * @param parentResource	A reference to a buffer that receives a pointer to the parent resource object for the subresource surface.
		 * @param subresourceIndex	A reference to a variable that receives the index of the subresource surface.
		*/
		public HResult GetResource(Guid iid, out void *parentResource, out UINT subresourceIndex) mut
		{
			Guid riid = iid;
			parentResource = ?;
			subresourceIndex = ?;
			return VT.GetResource(&this, &riid, &parentResource, &subresourceIndex);
		}

		/**
		 * Gets the parent resource and subresource index that support a subresource surface.
		 *
		 * @param parentResource	A reference to a buffer that receives a pointer to the parent resource object for the subresource surface.
		 * @param subresourceIndex	A reference to a variable that receives the index of the subresource surface.
		*/
		public HResult GetResource<T>(out T *parentResource, out UINT subresourceIndex) mut where T : IUnknown, IComObject
		{
			Guid riid = T.IID;
			parentResource = ?;
			subresourceIndex = ?;
			return VT.GetResource(&this, &riid, (.)&parentResource, &subresourceIndex);
		}
	}
}
