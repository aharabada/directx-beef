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

		
		[Import("D3D11.lib"), LinkName("D3D11CreateDevice"), CLink, CallingConvention(.Stdcall)]
		public static extern HResult D3D11CreateDevice(
			IUnknown* pAdapter,
			DriverType DriverType,
			Windows.HModule Software,
			DeviceCreationFlags Flags,
			FeatureLevel* pFeatureLevels,
			uint32 FeatureLevels,
			uint32 SDKVersion,
			IUnknown** ppDevice,
			out FeatureLevel pFeatureLevel,	 
			out ID3D11DeviceContext* ppImmediateContext);

	}
}
