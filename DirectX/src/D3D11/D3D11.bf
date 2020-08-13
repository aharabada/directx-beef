using System;
using DirectX;
using DirectX.DXGI;
using DirectX.Common;

namespace DirectX.D3D11
{
	static
	{
		public static readonly uint32 SDK_VERSION = 7;

		/**
		 * Calculates a subresource index for a texture.
		 *
		 * @param MipSlice		A zero-based index for the mipmap level to address; 0 indicates the first, most detailed mipmap level.
		 * @param ArraySlice	The zero-based index for the array level to address; always use 0 for volume (3D) textures.
		 * @param MipLevels		Number of mipmap levels in the resource.
		 *
		 * @return The index which equals MipSlice + (ArraySlice * MipLevels).
		*/
		[Inline]
		public static UINT D3D11CalcSubresource(UINT MipSlice, UINT ArraySlice, UINT MipLevels)
		{
			return MipSlice + ArraySlice * MipLevels;
		}

		[Import("D3D11.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern HResult D3D11CreateDevice(
			IUnknown* pAdapter,
			DriverType DriverType,
			Windows.HModule Software,
			DeviceCreationFlags Flags,
			FeatureLevel* pFeatureLevels,
			uint32 FeatureLevels,
			uint32 SDKVersion,
			ID3D11Device** ppDevice,
			FeatureLevel* pFeatureLevel,	 
			ID3D11DeviceContext** ppImmediateContext);

		/**
		 * Creates a device that represents the display adapter and a swap chain used for rendering.
		*/
		[Import("D3D11.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern HResult D3D11CreateDeviceAndSwapChain(IDXGIAdapter *pAdapter, DriverType driverType, Windows.HModule software,
			DeviceCreationFlags flags, FeatureLevel *pFeatureLevels, UINT featureLevels, UINT SDKVersion, SwapChainDescription *pSwapChainDesc,
			IDXGISwapChain **ppSwapChain, ID3D11Device **ppDevice, FeatureLevel *pFeatureLevel, ID3D11DeviceContext **ppImmediateContext);

		/**
		 * Creates a device that represents the display adapter.
		 * 
		 * @param adapter 			A pointer to the video adapter to use when creating a device. Pass NULL to use the default adapter, which is the first adapter that is enumerated by IDXGIFactory1::EnumAdapters.
		 * @param driverType		The driver type to create.
		 * @param software			A handle to a DLL that implements a software rasterizer. If DriverType is D3D_DRIVER_TYPE_SOFTWARE, Software must not be NULL.
		 * @param creationFlags		The runtime layers to enable (see D3D11_CREATE_DEVICE_FLAG); values can be bitwise OR'd together.
		 * @param featureLevels		An array of FeatureLevels, which determine the order of feature levels to attempt to create. 
		 * @param device			Returns the address of a pointer to an ID3D11Device object that represents the device created.
		 * @param featureLevel		If successful, returns the first D3D_FEATURE_LEVEL from the featureLevels array which succeeded.
		 * @param immediateContext	Returns the address of a pointer to an ID3D11DeviceContext object that represents the device context.
		*/
		public static HResult D3D11CreateDevice(IUnknown* adapter, DriverType driverType, Windows.HModule software, DeviceCreationFlags creationFlags, FeatureLevel[] featureLevels,
			ID3D11Device** device, FeatureLevel *featureLevel, ID3D11DeviceContext** immediateContext)
		{
			return D3D11CreateDevice(adapter, .Hardware, software, creationFlags, featureLevels.CArray(), (uint32)featureLevels.Count, DirectX.D3D11.SDK_VERSION, device, featureLevel, immediateContext);
		}
	}
}
