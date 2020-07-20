namespace DirectX.D3D11
{
	/**
	Identifies options for resources.
	D3D11_RESOURCE_MISC_FLAG
	*/
	public enum ResourceMiscFlags : uint32 
	{
		/**
		Enables MIP map generation by using ID3D11DeviceContext::GenerateMips on a texture resource.
		The resource must be created with the bind flags that specify that the resource is a render target and a shader resource.
		D3D11_RESOURCE_MISC_GENERATE_MIPS
		*/
	    GenerateMipMaps = 0x1L,
		/**
		Enables resource data sharing between two or more Direct3D devices.
		The only resources that can be shared are 2D non-mipmapped textures.

		ResourceMiscFlags.Shared and ResourceMiscFlags.SharedKeyedmutex are mutually exclusive.
		D3D11_RESOURCE_MISC_SHARED
		*/
	    Shared = 0x2L,
		/**
		Sets a resource to be a cube texture created from a Texture2DArray that contains 6 textures.
		D3D11_RESOURCE_MISC_TEXTURECUBE
		*/
	    TextureCube = 0x4L,
		/**
		Enables instancing of GPU-generated content.
		D3D11_RESOURCE_MISC_DRAWINDIRECT_ARGS
		*/
	    DrawIndirectArguments	= 0x10L,
		/**
		Enables a resource as a byte address buffer.
		D3D11_RESOURCE_MISC_BUFFER_ALLOW_RAW_VIEWS
		*/
	    BufferAllowRawViews	= 0x20L,
		/**
		Enables a resource as a structured buffer.
		D3D11_RESOURCE_MISC_BUFFER_STRUCTURED
		*/
	    BufferStrctured = 0x40L,
		/**
		Enables a resource with MIP map clamping for use with ID3D11DeviceContext::SetResourceMinLOD.
		D3D11_RESOURCE_MISC_RESOURCE_CLAMP
		*/
	    ResourceClamp = 0x80L,
		/**
		Enables the resource to be synchronized by using the IDXGIKeyedMutex::AcquireSync and
		IDXGIKeyedMutex::ReleaseSync APIs.
		The following Direct3D 11 resource creation APIs, that take ResourceMiscFlags parameters, have been extended to support the new flag.
		    ID3D11Device::CreateTexture1D
		    ID3D11Device::CreateTexture2D
		    ID3D11Device::CreateTexture3D
		    ID3D11Device::CreateBuffer

		If you call any of these methods with the SharedKeyedmutex flag set, the interface returned will support the IDXGIKeyedMutex interface.
		You can retrieve a pointer to the IDXGIKeyedMutex interface from the resource by using IUnknown::QueryInterface.
		The IDXGIKeyedMutex interface implements the IDXGIKeyedMutex::AcquireSync and IDXGIKeyedMutex::ReleaseSync APIs to synchronize access to the surface.
		The device that creates the surface, and any other device that opens the surface by using OpenSharedResource,
		must call IDXGIKeyedMutex::AcquireSync before they issue any rendering commands to the surface.
		When those devices finish rendering, they must call IDXGIKeyedMutex::ReleaseSync.

		Shared and SharedKeyedmutex are mutually exclusive.
		D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX
		*/
	    SharedKeyedmutex = 0x100L,
		/**
		Enables a resource compatible with GDI. You must set the ResourceMiscFlags.GdiCompatible flag on surfaces that you use with GDI.
		Setting the ResourceMiscFlags.GdiCompatible flag allows GDI rendering on the surface via IDXGISurface1::GetDC.

		Consider the following programming tips for using ResourceMiscFlags.GdiCompatible when you create a texture or use that texture in a swap chain:
		    - ResourceMiscFlags.SharedKeyedmutex and ResourceMiscFlags.GdiCompatible are mutually exclusive. Therefore, do not use them together.
		    - ResourceMiscFlags.ResourceClamp and ResourceMiscFlags.GdiCompatible are mutually exclusive. Therefore, do not use them together.
		    - You must bind the texture as a render target for the output-merger stage. For example, set the BindFlags.RenderTarget flag in the BindFlags member of the D3D11_TEXTURE2D_DESC structure.
		    - You must set the maximum number of MIP map levels to 1. For example, set the MipLevels member of the D3D11_TEXTURE2D_DESC structure to 1.
		    - You must specify that the texture requires read and write access by the GPU. For example, set the Usage member of the D3D11_TEXTURE2D_DESC structure to Usage.Default.

		    You must set the texture format to one of the following types.
		        DXGI_FORMAT_B8G8R8A8_UNORM
		        DXGI_FORMAT_B8G8R8A8_TYPELESS
		        DXGI_FORMAT_B8G8R8A8_UNORM_SRGB

		    For example, set the Format member of the D3D11_TEXTURE2D_DESC structure to one of these types.

		    You cannot use ResourceMiscFlags.GdiCompatible with multisampling. Therefore, set the Count member of the DXGI_SAMPLE_DESC structure to 1. Then, set the SampleDesc member of the D3D11_TEXTURE2D_DESC structure to this DXGI_SAMPLE_DESC structure.
		D3D11_RESOURCE_MISC_GDI_COMPATIBLE
		*/
	    GdiCompatible	= 0x200L,
		/**
		Set this flag to enable the use of NT HANDLE values when you create a shared resource.
		By enabling this flag, you deprecate the use of existing HANDLE values.

		The value specifies a new shared resource type that directs the runtime to use NT HANDLE values for the shared resource.
		The runtime then must confirm that the shared resource works on all hardware at the specified feature level.

		Without this flag set, the runtime does not strictly validate shared resource parameters (that is, formats, flags, usage, and so on).
		When the runtime does not validate shared resource parameters, behavior of much of the Direct3D API might be undefined and might vary from driver to driver.

		Direct3D 11 and earlier:  This value is not supported until Direct3D 11.1.
		D3D11_RESOURCE_MISC_SHARED_NTHANDLE
		*/
	    SharedNthandle	= 0x800L,
		/**
		Set this flag to indicate that the resource might contain protected content;
		therefore, the operating system should use the resource only when the driver and hardware support content protection.
		If the driver and hardware do not support content protection and you try to create a resource with this flag, the resource creation fails.

		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_RESOURCE_MISC_RESTRICTED_CONTENT
		*/
	    RestrictedContent	= 0x1000L,
		/**
		Set this flag to indicate that the operating system restricts access to the shared surface.
		You can use this flag together with the D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE_DRIVER flag and only when you create a shared surface.
		The process that creates the shared resource can always open the shared resource.

		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE
		*/
	    RestrictedSharedResource	= 0x2000L,
		/**
		Set this flag to indicate that the driver restricts access to the shared surface.
		You can use this flag in conjunction with the ResourceMiscFlags.RestrictedSharedResource flag and only when you create a shared surface.
		The process that creates the shared resource can always open the shared resource.

		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE_DRIVER
		*/
	    RestrictedSharedResourceDriver	= 0x4000L,
		/**
		Set this flag to indicate that the resource is guarded.
		Such a resource is returned by the IDCompositionSurface::BeginDraw (DirectComposition) and ISurfaceImageSourceNative::BeginDraw (Windows Runtime) APIs.
		For these APIs, you provide a region of interest (ROI) on a surface to update. This surface isn't compatible with multiple render targets (MRT).

		A guarded resource automatically restricts all writes to the region that is related to one of the preceding APIs.
		Additionally, the resource enforces access to the ROI with these restrictions:
		    - Copy operations from the resource by using ID3D11DeviceContext::CopyResource or ID3D11DeviceContext::CopySubresourceRegion are restricted to only copy from the ROI.
		    - When a guarded resource is set as a render target, it must be the only target.

		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_RESOURCE_MISC_GUARDED
		*/
	    Guarded = 0x8000L,
		/**
		Set this flag to indicate that the resource is a tile pool.

		Direct3D 11:  This value is not supported until Direct3D 11.2.
		D3D11_RESOURCE_MISC_TILE_POOL
		*/
	    TilePool = 0x20000L,
		/**
		Set this flag to indicate that the resource is a tiled resource.

		Direct3D 11:  This value is not supported until Direct3D 11.2.
		D3D11_RESOURCE_MISC_TILED
		*/
	    Tiled = 0x40000L,
		/**
		Set this flag to indicate that the resource should be created such that it will be protected by the hardware.
		Resource creation will fail if hardware content protection is not supported.

		This flag has the following restrictions:
		    - This flag cannot be used with the following Usage values:
		        Usage.Dynamic
		        Usage.Staging
		    - This flag cannot be used with the following BindFlags values.
		        BindFlags.VertexBuffer
		        BindFlags.IndexBuffer
		    - No CPU access flags can be specified.
		D3D11_RESOURCE_MISC_HW_PROTECTED
		*/
	    HardwareProtected = 0x80000L,
		None = 0
	}
}
