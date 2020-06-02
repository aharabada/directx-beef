using System;
using DirectX;
using DirectX.Common;

namespace DirectX.D3D11
{
	static
	{
		/**	D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT */
		public static readonly uint32 SimultaneousRenderTargetCount = 8;

		/**	D3D11_KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL */
		public static readonly uint32 KeepRenderTargetsAndDepthStencil = 0xffffffff;
		/**	D3D11_KEEP_UNORDERED_ACCESS_VIEWS */
		public static readonly uint32 KeepUnorderedAccessViews = 0xffffffff;
		/**	D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE */
		public static readonly uint32 ViewportAndScissorrectObjectCountPerPipeline = 16;

		public static readonly uint32 SDK_VERSION = 7;

		[Import("D3D11.lib"), CLink, CallingConvention(.Stdcall)]
		public static extern HResult D3D11CreateDevice(
			IUnknown* pAdapter,
			DriverType DriverType,
			Windows.HModule Software,
			DeviceCreationFlags Flags,
			FeatureLevel* pFeatureLevels,
			uint32 FeatureLevels,
			uint32 SDKVersion,
			out ID3D11Device* ppDevice,
			out FeatureLevel pFeatureLevel,	 
			out ID3D11DeviceContext* ppImmediateContext);
		
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
			out ID3D11Device* device, out FeatureLevel featureLevel, out ID3D11DeviceContext* immediateContext)
		{
			return D3D11CreateDevice(adapter, .Hardware, software, creationFlags, featureLevels.CArray(), (uint32)featureLevels.Count, DirectX.D3D11.SDK_VERSION, out device, out featureLevel, out immediateContext);
		}
	}
}
