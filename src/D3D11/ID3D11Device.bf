using System;
using DirectX; 
using DirectX.DXGI;
using DirectX.D3D11;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	The device interface represents a virtual adapter; it is used to create resources.
	*/
	public struct ID3D11Device : IUnknown, IComObject
	{	 
		public static new Guid IID => .("db6f6ddb-ac77-4e88-8253-819df9bbf140");
		
		public struct VTable : IUnknown.VTable
		{
			// Todo: alle private functions müssen noch gemacht werden
			public function HResult(ID3D11Device* self, BufferDescription* pDesc, SubresourceData* pInitialData, ID3D11Buffer** ppBuffer) CreateBuffer;

			public function HResult(ID3D11Device* self, Texture1DDescription* desc, SubresourceData* initialData, ID3D11Texture1D** texture1D) CreateTexture1D;

			public function HResult(ID3D11Device* self, Texture2DDescription *pDesc, SubresourceData* pInitialData, ID3D11Texture2D** ppTexture2D) CreateTexture2D;

			private function HResult(ID3D11Device* self) CreateTexture3D;

			public function HResult(ID3D11Device* self, ID3D11Resource* pResource, ShaderResourceViewDescription* pDesc, ID3D11ShaderResourceView** ppSRView) CreateShaderResourceView;

			private function HResult(ID3D11Device* self) CreateUnorderedAccessView;

			public function HResult(ID3D11Device* self, ID3D11Resource *pResource, RenderTargetViewDescription *pDesc, ID3D11RenderTargetView **ppRTView) CreateRenderTargetView;
			public function HResult(ID3D11Device* self, ID3D11Resource *pResource, DepthStencilViewDescription *pDesc, ID3D11DepthStencilView **ppDepthStencilView) CreateDepthStencilView;
			public function HResult(ID3D11Device* self, InputElementDescription* pInputElementDescs, uint32 numElements, void* pShaderBytecodeWithInputSignature, uint64 bytecodeLength, ID3D11InputLayout** ppInputLayout) CreateInputLayout;
			public function HResult(ID3D11Device* self, void* pShaderBytecode, uint64 bytecodeLength, ID3D11ClassLinkage* pClassLinkage, ID3D11VertexShader** ppVertexShader) CreateVertexShader;
	
			private function HResult(ID3D11Device* self) CreateGeometryShader;
			private function HResult(ID3D11Device* self) CreateGeometryShaderWithStreamOutput;

			public function HResult(ID3D11Device* self, void* pShaderBytecode, uint64 bytecodeLength, ID3D11ClassLinkage* pClassLinkage, ID3D11PixelShader** ppVertexShader) CreatePixelShader;

			private function HResult(ID3D11Device* self) CreateHullShader;
			private function HResult(ID3D11Device* self) CreateDomainShader;
			private function HResult(ID3D11Device* self) CreateComputeShader;
			private function HResult(ID3D11Device* self) CreateClassLinkage;
			private function HResult(ID3D11Device* self) CreateBlendState;

			public function HResult(ID3D11Device* self, DepthStencilStateDescription* pDepthStencilStateDescription, ID3D11DepthStencilState** ppDepthStencilState) CreateDepthStencilState;
			public function HResult(ID3D11Device* self, RasterizerStateDescription* pRasterizerDesc, ID3D11RasterizerState** ppRasterizerState) CreateRasterizerState;
			public function HResult(ID3D11Device* self, SamplerStateDescription* pSamplerDesc, ID3D11SamplerState** ppSamplerState) CreateSamplerState;	

			private function HResult(ID3D11Device* self) CreateQuery;
			private function HResult(ID3D11Device* self) CreatePredicate;
			private function HResult(ID3D11Device* self) CreateCounter;
			private function HResult(ID3D11Device* self) CreateDeferredContext;
			private function HResult(ID3D11Device* self) OpenSharedResource;

			public function HResult(ID3D11Device* self, Format format, FormatSupport* formatSupport) CheckFormatSupport;
			public function HResult(ID3D11Device* self, Format format, UINT sampleCount, UINT *pNumQualityLevels) CheckMultisampleQualityLevels;

			private function HResult(ID3D11Device* self) CheckCounterInfo;
			private function HResult(ID3D11Device* self) CheckCounter;
			private function HResult(ID3D11Device* self) CheckFeatureSupport;
			
			public function HResult(ref Guid name, ref uint32 pDataSize, void* pData) GetPrivateData;	
			public function HResult(ref Guid name, uint32 dataSize, void* pData) SetPrivateData; 
			public function HResult(ref Guid name, Windows.COM_IUnknown* pUnknown) SetPrivateDataInterface;

			public function FeatureLevel() GetFeatureLevel;	
			public function DeviceCreationFlags() GetCreationFlags;
			public function HResult() GetDeviceRemovedReason;

			public function void(ID3D11Device* self, ID3D11DeviceContext** ppImmediateContext) GetImmediateContext;

			public function HResult(ID3D11Device* self, RaiseFlags raiseFlags) SetExceptionMode;
			public function RaiseFlags() GetExceptionMode;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		/**
		 * Creates a buffer (vertex buffer, index buffer, or shader-constant buffer).
		 * @param bufferDesc 	A reference to a BufferDescription structure that describes the buffer.
		 * @param initialData 	A pointer to a SubresourceData structure that describes the initialization data;
								use NULL to allocate space only (with the exception that it cannot be NULL if the usage flag is D3D11_USAGE_IMMUTABLE).
								If you don't pass anything to pInitialData, the initial content of the memory for the buffer is undefined. In this case, you need to write the buffer content some other way before the resource is read.
		@param buffer 			Address of a pointer to the ID3D11Buffer interface for the buffer object created. Set this parameter to NULL to validate the other input parameters (S_FALSE indicates a pass).
		*/
		public HResult CreateBuffer(ref BufferDescription bufferDesc, SubresourceData* initialData, ID3D11Buffer** buffer) mut
		{
			return VT.CreateBuffer(&this, &bufferDesc, initialData, buffer);
		}	
		
		/**
		 * Creates an array of 1D textures.
		 *
		 * @param desc			A reference to a Texture1DDescription structure that describes a 1D texture resource.
		 * @param initialData	A pointer to an array of SubresourceData structures that describe subresources for the 1D texture resource.
		 * @param texture1D		A pointer to a buffer that receives a pointer to a ID3D11Texture1D interface for the created texture.
		 *						Set this parameter to NULL to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
		*/
		public HResult CreateTexture1D(ref Texture1DDescription desc, SubresourceData* initialData, ID3D11Texture1D** texture1D) mut
		{
			return VT.CreateTexture1D(&this, &desc, initialData, texture1D);
		}

		/**
		 * Create an array of 2D textures.
		 *
		 * @param desc			A reference to a Texture2DDescription structure that describes a 2D texture resource.
		 * @param initialData	A pointer to an array of SubresourceData structures that describe subresources for the 2D texture resource.
		 * @param texture2D		A pointer to a buffer that receives a pointer to a ID3D11Texture2D interface for the created texture.
		 *						Set this parameter to NULL to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
		*/
		public HResult CreateTexture2D(ref Texture2DDescription desc, SubresourceData* initialData, ID3D11Texture2D** texture2D) mut
		{
			return VT.CreateTexture2D(&this, &desc, initialData, texture2D);
		}
		
		/**
		 * Creates a render-target view for accessing resource data.
		 *
		 * @param resource	Pointer to a ID3D11Resource that represents a render target. This resource must have been created with the D3D11_BIND_RENDER_TARGET flag.
		 * @param desc		Pointer to a RenderTargetViewDescription that represents a render-target view description. Set this parameter to NULL to create a view that accesses all of the subresources in mipmap level 0.
		 * @param rtView	Address of a pointer to an ID3D11RenderTargetView.
		 *					Set this parameter to NULL to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
		*/
		public HResult CreateRenderTargetView(ID3D11Resource* resource, RenderTargetViewDescription* desc, ID3D11RenderTargetView **rtView) mut
		{
			return VT.CreateRenderTargetView(&this, resource, desc, rtView);
		}
		
		/**
		 * Create a shader-resource view for accessing data in a resource.
		 *
		 * @param resource	Pointer to the resource that will serve as input to a shader. This resource must have been created with the D3D11_BIND_SHADER_RESOURCE flag.
		 * @param desc		Pointer to a shader-resource view description (see D3D11_SHADER_RESOURCE_VIEW_DESC). Set this parameter to NULL to create a view that accesses the entire resource (using the format the resource was created with).
		 * @param srView	Address of a pointer to an ID3D11ShaderResourceView.
		 *					Set this parameter to NULL to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
		*/
		public HResult CreateShaderResourceView(ID3D11Resource* resource, ShaderResourceViewDescription* desc, ID3D11ShaderResourceView **srView) mut
		{
			return VT.CreateShaderResourceView(&this, resource, desc, srView);
		}

		/**
		 * Create a depth-stencil view for accessing resource data.
		 *
		 * @param resource	Pointer to the resource that will serve as the depth-stencil surface. This resource must have been created with the D3D11_BIND_DEPTH_STENCIL flag.
		 * @param desc		Pointer to a depth-stencil-view description (see D3D11_DEPTH_STENCIL_VIEW_DESC).
		 * @param dsView	Address of a pointer to an ID3D11DepthStencilView.
		 *					Set this parameter to NULL to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
		*/
		public HResult CreateDepthStencilView(ID3D11Resource* resource, DepthStencilViewDescription* desc, ID3D11DepthStencilView **dsView) mut
		{
			return VT.CreateDepthStencilView(&this, resource, desc, dsView);
		}

		/**
		 * Get the support of a given format on the installed video device.
		 *
		 * @param format 		The format for which to check for support.
		 * @param formatSupport	bitfield describing how the specified format is supported on the installed device.
		*/
		public HResult CheckFormatSupport(Format format, out FormatSupport formatSupport) mut
		{
			formatSupport = ?;
			return VT.CheckFormatSupport(&this, format, &formatSupport);
		}

		/**
		* Get the flags used during the call to create the device with D3D11CreateDevice.
		*/
		public DeviceCreationFlags DeviceCreationFlags
		{
			get
			{
				return VT.GetCreationFlags();
			}
		}

		/**
		* Gets the feature level of the hardware device.
		*/
		public FeatureLevel FeatureLevel
		{
			get
			{
				return VT.GetFeatureLevel();
			}
		}

		/**
		* Gets or Sets the exception-mode flags.
		*/
		public RaiseFlags ExceptionMode
		{
			get
			{
				return VT.GetExceptionMode();
			}
			set	mut
			{
				if(VT.SetExceptionMode(&this, value).Error)
					Runtime.FatalError("Could not check the format support.");
			}
		}
	}
}
