namespace DirectX.D3D11
{
	/**
	 * Direct3D 11 feature options.
	*/
	public enum Feature : uint32
	{
		/**
		 * The driver supports multithreading.
		 * Refer to FeatureDataThreading.
		 * D3D11_FEATURE_THREADING
		*/
		Threading	= 0,
		/**
		 * Supports the use of the double-precision shaders in HLSL.
		 * Refer to FeatureDataDoubles
		 * D3D11_FEATURE_DOUBLES
		*/
		Doubles	= ( Threading + 1 ) ,
		/**
		 * Supports the formats in FormatSupport.
		 * Refer to FeatureDataFormatSupport
		 * D3D11_FEATURE_FORMAT_SUPPORT
		*/
		FormatSupport = ( Doubles + 1 ) ,
		/**
		 * Supports the formats in FormatSupport2.
		 * Refer to FeatureDataFormatSupport2
		 * D3D11_FEATURE_FORMAT_SUPPORT2
		*/
		FormatSupport2 = ( FormatSupport + 1 ) ,
		/**
		 * Supports compute shaders and raw and structured buffers.
		 * Refer to FeatureDataD3D10xHardwareOptions.
		 * D3D11_FEATURE_D3D10_X_HARDWARE_OPTIONS
		*/
		D3D10xHardwareOptions = ( FormatSupport2 + 1 ) ,
		/**
		 * Supports Direct3D 11.1 feature options.
		 * Refer to FeatureDataD3D11Options
		 * Direct3D 11:  This value is not supported until Direct3D 11.1.
		 * D3D11_FEATURE_D3D11_OPTIONS
		*/
		D3D11Options = ( D3D10xHardwareOptions + 1 ) ,
		/**
		 * Supports specific adapter architecture.
		 * Refer to FeatureDataArchitectureInfo.
		 * Direct3D 11:  This value is not supported until Direct3D 11.1.
		 * D3D11_FEATURE_ARCHITECTURE_INFO
		*/
		ArchitectureInfo = ( D3D11Options + 1 ) ,
		/**
		 * Supports specific adapter architecture.
		 * Refer to FeatureDataD3D9Options
		 * Direct3D 11:  This value is not supported until Direct3D 11.1.
		 * D3D11_FEATURE_D3D9_OPTIONS
		*/
		D3D9Options	= ( ArchitectureInfo + 1 ) ,
		/**
		 * Supports minimum precision of shaders.
		 * Refer to FeatureDataShaderMinimumPrecision
		 * Direct3D 11:  This value is not supported until Direct3D 11.1.
		 * D3D11_FEATURE_SHADER_MIN_PRECISION_SUPPORT
		*/
		ShaderMinimumPrecision	= ( D3D9Options + 1 ) ,
		/**
		 * Supports Direct3D 9 shadowing feature.
		 * Refer to FeatureDataD3D9ShadowSupport
		 * Direct3D 11:  This value is not supported until Direct3D 11.1.
		 * D3D11_FEATURE_D3D9_SHADOW_SUPPORT
		*/
		D3D9ShadowSupport = ( ShaderMinimumPrecision + 1 ) ,
		/**
		 * Supports Direct3D 11.2 feature options.
		 * Refer to FeatureDataD3D11Options1
		 * Direct3D 11:  This value is not supported until Direct3D 11.1.
		 * D3D11_FEATURE_D3D11_OPTIONS1
		*/
		FeatureDataD3D11Options1 = ( D3D9ShadowSupport + 1 ) ,
		/**
		 * Supports Direct3D 11.2 instancing options.
		 * Refer to FeatureDataD3D9SimpleInstancingSupport
		 * Direct3D 11:  This value is not supported until Direct3D 11.2.
		 * D3D11_FEATURE_D3D9_SIMPLE_INSTANCING_SUPPORT
		*/
		D3D9SimpleInstancingSupport	= ( FeatureDataD3D11Options1 + 1 ) ,
		/**
		 * Supports Direct3D 11.2 marker options.
		 * Refer to FeatureDataMarkerSupport
		 * Direct3D 11:  This value is not supported until Direct3D 11.2.
		 * D3D11_FEATURE_MARKER_SUPPORT
		*/
		MarkerSupport	= ( D3D9SimpleInstancingSupport + 1 ) ,
		/**
		 * Supports Direct3D 9 feature options, which includes the Direct3D 9 shadowing feature and instancing support.
		 * Refer to FeatureDataD3D9Options1
		 * Direct3D 11:  This value is not supported until Direct3D 11.2.
		 * D3D11_FEATURE_D3D9_OPTIONS1
		*/
		D3D9Options1 = ( MarkerSupport + 1 ) ,
		/**
		 * Supports Direct3D 11.3 conservative rasterization feature options.
		 * Refer to FeatureDataD3D11Options2
		 * Direct3D 11:  This value is not supported until Direct3D 11.3.
		 * D3D11_FEATURE_D3D11_OPTIONS2
		*/
		D3D11Options2	= ( D3D9Options1 + 1 ) ,
		/**
		 * Supports Direct3D 11.4 conservative rasterization feature options.
		 * Refer to FeatureDataD3D11Options3
		 * Direct3D 11:  This value is not supported until Direct3D 11.4.
		 * D3D11_FEATURE_D3D11_OPTIONS3
		*/
		D3D11Options3 = ( D3D11Options2 + 1 ) ,
		/**
		 * Supports GPU virtual addresses.
		 * Refer to FeatureDataGpuVirtualAddressSupport
		 * D3D11_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT
		*/
		GpuVirtualAddressSupport = ( D3D11Options3 + 1 ) ,
		/**
		 * Supports a single boolean for NV12 shared textures.
		 * Refer to FeatureDataD3D11Options4
		 * Direct3D 11:  This value is not supported until Direct3D 11.4.
		 * D3D11_FEATURE_D3D11_OPTIONS4
		*/
		D3D11Options4 = ( GpuVirtualAddressSupport + 1 ) ,
		/**
		 * Supports shader cache, described in FeatureDataShaderCache.
		 * D3D11_FEATURE_SHADER_CACHE
		*/
		ShaderCache = ( D3D11Options4 + 1 ) ,
		/**
		 * Supports a SharedResourceTier to indicate a tier for shared resource support.
		 * Refer to FeatureDataD3D11Options5
		 * D3D11_FEATURE_D3D11_OPTIONS5
		*/
		D3D11Options5 = ( ShaderCache + 1 )
	}
	using System;

	/**
	 * Describes the multi-threading features that are supported by the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataThreading
	{
		/**
		 * TRUE means resources can be created concurrently on multiple threads while drawing;
		 * FALSE means that the presence of coarse synchronization will prevent concurrency.
		*/
		public BOOL DriverConcurrentCreates;
		/**
		 * TRUE means command lists are supported by the current driver;
		 * FALSE means that the API will emulate deferred contexts and command lists with software.
		*/
		public BOOL DriverCommandLists;
	}
	
	using System;

	/**
	 * Describes double data type support in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataDoubles
	{
		/**
		 * Specifies whether double types are allowed. If TRUE, double types are allowed;
		 * otherwise FALSE.
		 * The runtime must set DoublePrecisionFloatShaderOps to TRUE in order for you to use any HLSL shader that is compiled with a double type.
		*/
		public BOOL DoublePrecisionFloatShaderOps;
	}
	
	using System;
	using DirectX.DXGI;

	/**
	 * Describes which resources are supported by the current graphics driver for a given format.
	*/
	[CRepr]
	public struct FeatureDataFormatSupport
	{
		/**
		 * Format to return information on.
		*/
		public Format InFormat;
		/**
		 * Combination of FormatSupport flags indicating which resources are supported.
		*/
		public FormatSupport OutFormatSupport;
	}

	using System;
	using DirectX.DXGI;

	/**
	 * Describes which unordered resource options are supported by the current graphics driver for a given format.
	*/
	[CRepr]
	public struct FeatureDataFormatSupport2
	{
		/**
		 * Format to return information on.
		*/
		public Format InFormat;
		/**
		 * Combination of FormatSupport2 flags indicating which unordered resource options are supported.
		*/
		public FormatSupport2 OutFormatSupport;
	}
	
	using System;

	/**
	 * Describes compute shader and raw and structured buffer support in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataD3D10xHardwareOptions
	{
		/**
		 * TRUE if compute shaders and raw and structured buffers are supported;
		 * otherwise FALSE.
		*/
		public BOOL ComputeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x;
	}
	
	using System;

	/**
	 * Describes Direct3D 11.1 feature options in the current graphics driver.
	 * For further info refer to the msdn-page of D3D11_FEATURE_DATA_D3D11_OPTIONS.
	*/
	[CRepr]
	public struct FeatureDataD3D11Options
	{
		public BOOL OutputMergerLogicOp;
		public BOOL UAVOnlyRenderingForcedSampleCount;
		public BOOL DiscardAPIsSeenByDriver;
		public BOOL FlagsForUpdateAndCopySeenByDriver;
		public BOOL ClearView;
		public BOOL CopyWithOverlap;
		public BOOL ConstantBufferPartialUpdate;
		public BOOL ConstantBufferOffsetting;
		public BOOL MapNoOverwriteOnDynamicConstantBuffer;
		public BOOL MapNoOverwriteOnDynamicBufferSRV;
		public BOOL MultisampleRTVWithForcedSampleCountOne;
		public BOOL SAD4ShaderInstructions;
		public BOOL ExtendedDoublesShaderInstructions;
		public BOOL ExtendedResourceSharing;
	}
	
	using System;

	/**
	 * Describes information about Direct3D 11.1 adapter architecture. 
	*/
	[CRepr]
	public struct FeatureDataArchitectureInfo
	{
		/**
		 * Specifies whether a rendering device batches rendering commands and performs multipass rendering into tiles or bins over a render area.
		 * Certain API usage patterns that are fine for TileBasedDefferredRenderers (TBDRs) can perform worse on non-TBDRs and vice versa.
		 * Applications that are careful about rendering can be friendly to both TBDR and non-TBDR architectures.
		 * TRUE if the rendering device batches rendering commands and FALSE otherwise.
		*/
		public BOOL TileBasedDeferredRenderer;
	}

	using System;

	/**
	 * Describes Direct3D 9 feature options in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataD3D9Options
	{
		/**
		 * Specifies whether the driver supports the nonpowers-of-2-unconditionally feature. For more information about this feature, see feature level.
		 * The runtime sets this member to TRUE for hardware at Direct3D 10 and higher feature levels.
		 * For hardware at Direct3D 9.3 and lower feature levels, the runtime sets this member to FALSE if the hardware and driver support the powers-of-2
		 * (2D textures must have widths and heights specified as powers of two) feature or the nonpowers-of-2-conditionally feature.
		 * For more information about this feature, see feature level.
		*/
		public BOOL FullNonPow2TextureSupport;
	}

	using System;

	/**
	 * Describes precision support options for shaders in the current graphics driver. 
	*/
	[CRepr]
	public struct FeatureDataShaderMinimumPrecision
	{
		/**
		 * A combination of ShaderMinimumPrecision values that are combined by using a bitwise OR operation.
		 * The resulting value specifies minimum precision levels that the driver supports for the pixel shader.
		*/
		ShaderMinimumPrecision PixelShaderMinPrecision;
		/**
		 * A combination of ShaderMinimumPrecision values that are combined by using a bitwise OR operation.
		 * The resulting value specifies minimum precision levels that the driver supports for all other shader stages.
		*/
		ShaderMinimumPrecision AllOtherShaderStagesMinPrecision;
	}

	using System;

	/**
	 * Describes Direct3D 9 shadow support in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataD3D9ShadowSupport
	{
		/**
		 * Specifies whether the driver supports the shadowing feature with the comparison-filtering mode set to less than or equal to.
		 * The runtime sets this member to TRUE for hardware at Direct3D 10 and higher feature levels.
		 * For hardware at Direct3D 9.3 and lower feature levels, the runtime sets this member to TRUE only if the hardware and driver support the shadowing feature; otherwise FALSE.
		*/
		BOOL SupportsDepthAsTextureWithLessEqualComparisonFilter;
	}

	using System;

	/**
	 * Describes Direct3D 11.2 feature options in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataD3D11Options1
	{
		/**
		 * Specifies whether the hardware and driver support tiled resources.
		 * The runtime sets this member to a TiledResourceTier value that indicates if the hardware and driver support tiled resources and at what tier level.
		*/
		public TiledResourceTier TiledResourcesTier;
		/**
		 * Specifies whether the hardware and driver support the filtering options (D3D11_FILTER) of comparing the result to the minimum or maximum value during texture sampling.
		 * The runtime sets this member to TRUE if the hardware and driver support these filtering options.
		*/
		public BOOL MinMaxFiltering;
		/**
		 * Specifies whether the hardware and driver also support the ID3D11DeviceContext1::ClearView method on depth formats.
		 * For info about valid depth formats, see DepthStencilViewDescription.
		*/
		public BOOL ClearViewAlsoSupportsDepthOnlyFormats;
		/**
		 * Specifies support for creating ID3D11Buffer resources that can be passed to the ID3D11DeviceContext::Map and ID3D11DeviceContext::Unmap methods.
		 * This means that the CPUAccessFlags member of the D3D11_BUFFER_DESC structure may be set with the desired D3D11_CPU_ACCESS_FLAG elements when the Usage member of D3D11_BUFFER_DESC is set to D3D11_USAGE_DEFAULT.
		 * The runtime sets this member to TRUE if the hardware is capable of at least D3D_FEATURE_LEVEL_11_0 and the graphics device driver supports mappable default buffers.
		*/
		public BOOL MapOnDefaultBuffers;
	}

	using System;

	/**
	 * Describes whether simple instancing is supported.
	*/
	[CRepr]
	public struct FeatureDataD3D9SimpleInstancingSupport
	{
		/**
		 * Specifies whether the hardware and driver support simple instancing.
		 * The runtime sets this member to TRUE if the hardware and driver support simple instancing.
		*/
		public BOOL SimpleInstancingSupported;
	}

	using System;

	/**
	 * Describes whether a GPU profiling technique is supported. 
	*/
	[CRepr]
	public struct FeatureDataMarkerSupport
	{
		/**
		 * Specifies whether the hardware and driver support a GPU profiling technique that can be used with development tools.
		 * The runtime sets this member to TRUE if the hardware and driver support data marking.
		*/
		public BOOL Profile;
	}

	using System;

	/**
	 * Describes Direct3D 9 feature options in the current graphics driver.
	 * For further information check out the msdn page for D3D11_FEATURE_DATA_D3D9_OPTIONS1
	*/
	[CRepr]
	public struct FeatureDataD3D9Options1
	{
		public BOOL FullNonPow2TextureSupported;
		public BOOL DepthAsTextureWithLessEqualComparisonFilterSupported;
		public BOOL SimpleInstancingSupported;
		public BOOL TextureCubeFaceRenderTargetWithNonCubeDepthStencilSupported;
	}

	using System;

	/**
	 * Describes Direct3D 11.3 feature options in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataD3D11Options2
	{
		/**
		 * Specifies whether the hardware and driver support PSSpecifiedStencilRef.
		 * The runtime sets this member to TRUE if the hardware and driver support this option.
		*/
		public BOOL PSSpecifiedStencilRefSupported;
		/**
		 * Specifies whether the hardware and driver support TypedUAVLoadAdditionalFormats.
		 * The runtime sets this member to TRUE if the hardware and driver support this option.
		*/
		public BOOL TypedUAVLoadAdditionalFormats;
		/**
		 * Specifies whether the hardware and driver support ROVs.
		 * The runtime sets this member to TRUE if the hardware and driver support this option.
		*/
		public BOOL ROVsSupported;
		/**
		 * Specifies whether the hardware and driver support conservative rasterization.
		 * The runtime sets this member to a ConservativeRasterizationTier value that indicates if the hardware and driver support conservative rasterization and at what tier level.
		*/
		public ConservativeRasterizationTier ConservativeRasterizationTier;
		/**
		 * Specifies whether the hardware and driver support tiled resources.
		 * The runtime sets this member to a TiledResourceTier value that indicates if the hardware and driver support tiled resources and at what tier level.
		*/
		public TiledResourceTier TiledResourcesTier;
		/**
		 * Specifies whether the hardware and driver support mapping on default textures.
		 * The runtime sets this member to TRUE if the hardware and driver support this option.
		*/
		public BOOL MapOnDefaultTextures;
		/**
		 * Specifies whether the hardware and driver support standard swizzle.
		 * The runtime sets this member to TRUE if the hardware and driver support this option.
		*/
		public BOOL StandardSwizzle;
		/**
		 * Specifies whether the hardware and driver support Unified Memory Architecture.
		 * The runtime sets this member to TRUE if the hardware and driver support this option.
		*/
		public BOOL UnifiedMemoryArchitecture;
	}

	using System;

	/**
	 * Describes Direct3D 11.3 feature options in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataD3D11Options3
	{
		/**
		 * Whether to use the VP and RT array index from any shader feeding the rasterizer.
		*/
		public BOOL VPAndRTArrayIndexFromAnyShaderFeedingRasterizer;
	}

	using System;

	/**
	 * Describes feature data GPU virtual address support, including maximum address bits per resource and per process.
	*/
	[CRepr]
	public struct FeatureDataGpuVirtualAddressSupport
	{
		/**
		 * The maximum GPU virtual address bits per resource.
		*/
		public UINT MaxGPUVirtualAddressBitsPerResource;
		/**
		 * The maximum GPU virtual address bits per process.
		*/
		public UINT MaxGPUVirtualAddressBitsPerProcess;
	}

	using System;

	/**
	 * Describes Direct3D 11.4 feature options in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataD3D11Options4
	{
		/**
		 * Specifies a BOOL that determines if NV12 textures can be shared across processes and D3D devices.
		*/
		public BOOL ExtendedNV12SharedTextureSupported;
	}

	using System;

	/**
	 * Describes the level of shader caching supported in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataShaderCache
	{
		// Todo: what support flags?
		/**
		 * Indicates the level of caching supported.
		*/
		public UINT SupportFlags;
	}

	using System;

	/**
	 * Describes the level of support for shared resources in the current graphics driver.
	*/
	[CRepr]
	public struct FeatureDataD3D11Options5
	{
		/**
		 * A shared resource support tier.
		*/
		public SharedResourceTier SharedResourceTier;
	}
}
