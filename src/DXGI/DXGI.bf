using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	static
	{
		/**
		* Creates a DXGI 1.1 factory that you can use to generate other DXGI objects.
		@param rrid The globally unique identifier (GUID) of the IDXGIFactory1 object referenced by the ppFactory parameter.
		@param ppFactory Address of a pointer to an IDXGIFactory1 object.
		@return Returns S_OK if successful; an error code otherwise.
		*/
		[Import("DXGI.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern HResult CreateDXGIFactory(ref Guid riid, out IDXGIFactory* ppFactory);

		/**
		* Creates a DXGI 1.1 factory that you can use to generate other DXGI objects.
		@param rrid The globally unique identifier (GUID) of the IDXGIFactory1 object referenced by the ppFactory parameter.
		@param ppFactory Address of a pointer to an IDXGIFactory1 object.
		@return Returns S_OK if successful; an error code otherwise.
		*/
		[Import("DXGI.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern HResult CreateDXGIFactory1(ref Guid riid, out IDXGIFactory1* ppFactory);
	}
}
