using System;
using DirectX.Common;
using DirectX.Windows;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * An IDXGIResource interface allows resource sharing and identifies the memory that a resource resides in.
	*/
	public struct IDXGIResource1 : IDXGIResource, IComObject
	{
		public static new Guid IID => .("30961379-4609-4a41-998e-54fe567ee0c1");

		public struct VTable : IDXGIResource.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(IDXGIResource1 *self, UINT index, IDXGISurface2 **ppSurface) CreateSubresourceSurface;
			public function [CallingConvention(.Stdcall)] HResult(IDXGIResource1 *self, SecurityAttributes *pAttributes, DWORD dwAccess, LPCWSTR lpName, Windows.Handle *pHandle) CreateSharedHandle;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}
		
		/**
		 * Creates a handle to a shared resource. You can then use the returned handle with multiple Direct3D devices.
		 *
		 * @param attributes	A reference to a SecurityAttributes structure that contains two separate but related data members:
		 *						an optional security descriptor, and a Boolean value that determines whether child processes can inherit the returned handle.
		 * @param access		The requested access rights to the resource.
		 * @param name			The name of the resource to share.
		 *						The name is limited to MAX_PATH characters.
		 *						Name comparison is case sensitive.
		 * @param handle		A reference to a variable that receives the NT HANDLE value to the resource to share.
		 *						You can use this handle in calls to access the resource.
		*/
		public HResult CreateSharedHandle(ref SecurityAttributes attributes, DWORD access, LPCWSTR name, out Windows.Handle handle) mut
		{
			handle = ?;
			return VT.CreateSharedHandle(&this, &attributes, access, name, &handle);
		}

		/**
		 * Creates a subresource surface object.
		 *
		 * @param index		The index of the subresource surface object to enumerate.
		 * @param surface	The address of a pointer to a IDXGISurface2 interface that represents the created subresource surface object at the position specified by the index parameter.
		*/
		public HResult CreateSubresourceSurface(UINT index, IDXGISurface2 **surface) mut
		{
			return VT.CreateSubresourceSurface(&this, index, surface);
		}
	}
}
