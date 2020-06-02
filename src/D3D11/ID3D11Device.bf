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

			private function HResult(ID3D11Device* self) CreateTexture1D;

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

			public function HResult(ID3D11Device* self, Format format, ref FormatSupport formatSupport) CheckFormatSupport;
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
		@param bufferDesc A pointer to a BufferDescription structure that describes the buffer.
		@param initialData A pointer to a SubresourceData structure that describes the initialization data;
				use NULL to allocate space only (with the exception that it cannot be NULL if the usage flag is D3D11_USAGE_IMMUTABLE).
				If you don't pass anything to pInitialData, the initial content of the memory for the buffer is undefined. In this case, you need to write the buffer content some other way before the resource is read.
		@param buffer Address of a pointer to the ID3D11Buffer interface for the buffer object created. Set this parameter to NULL to validate the other input parameters (S_FALSE indicates a pass).
		*/
		public HResult CreateBuffer(BufferDescription* bufferDesc, SubresourceData* initialData, out ID3D11Buffer* buffer) mut
		{
			buffer = ?;
			return VT.CreateBuffer(&this, bufferDesc, initialData, &buffer);
		}	

		/**
		* Get the support of a given format on the installed video device.
		* @param format The format for which to check for support.
		* @return FormatSupport bitfield describing how the specified format is supported on the installed device.
		*/
		public FormatSupport CheckFormatSupport(Format format) mut
		{
			FormatSupport result = .None;

			if(VT.CheckFormatSupport(&this, format, ref result).Error)
				Runtime.FatalError("Could not check the format support.");

			return result;
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
