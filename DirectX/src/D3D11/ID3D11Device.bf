using System;
using DirectX; 
using DirectX.DXGI;
using DirectX.D3D11;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * The device interface represents a virtual adapter; it is used to create resources.
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
			
			public function HResult(ID3D11Device* self, Texture3DDescription *pDesc, SubresourceData* pInitialData, ID3D11Texture3D** ppTexture3D) CreateTexture3D;

			public function HResult(ID3D11Device* self, ID3D11Resource* pResource, ShaderResourceViewDescription* pDesc, ID3D11ShaderResourceView** ppSRView) CreateShaderResourceView;

			public function HResult(ID3D11Device* self, ID3D11Resource *resource, UnorderedAccessViewDescription* description, ID3D11UnorderedAccessView **uaView) CreateUnorderedAccessView;

			public function HResult(ID3D11Device* self, ID3D11Resource *pResource, RenderTargetViewDescription *pDesc, ID3D11RenderTargetView **ppRTView) CreateRenderTargetView;
			public function HResult(ID3D11Device* self, ID3D11Resource *pResource, DepthStencilViewDescription *pDesc, ID3D11DepthStencilView **ppDepthStencilView) CreateDepthStencilView;
			public function HResult(ID3D11Device* self, InputElementDescription* pInputElementDescs, uint32 numElements, void* pShaderBytecodeWithInputSignature, uint64 bytecodeLength, ID3D11InputLayout** ppInputLayout) CreateInputLayout;

			public function HResult(ID3D11Device* self, void* pShaderBytecode, uint64 bytecodeLength, ID3D11ClassLinkage* pClassLinkage, ID3D11VertexShader** ppVertexShader) CreateVertexShader;
			public function HResult(ID3D11Device* self, void* pShaderBytecode, uint64 bytecodeLength, ID3D11ClassLinkage* pClassLinkage, ID3D11GeometryShader** ppGeometryShader) CreateGeometryShader;
			public function HResult(ID3D11Device* self, void *pShaderBytecode, SIZE_T bytecodeLength, StreamOutputDeclarationEntry *pSODeclaration, UINT numEntries, UINT *pBufferStrides, UINT numStrides, UINT rasterizedStream,
				ID3D11ClassLinkage *pClassLinkage, ID3D11GeometryShader **ppGeometryShader) CreateGeometryShaderWithStreamOutput;
			public function HResult(ID3D11Device* self, void* pShaderBytecode, uint64 bytecodeLength, ID3D11ClassLinkage* pClassLinkage, ID3D11PixelShader** ppPixelShader) CreatePixelShader;
			public function HResult(ID3D11Device* self, void* pShaderBytecode, uint64 bytecodeLength, ID3D11ClassLinkage* pClassLinkage, ID3D11HullShader** ppHullShader) CreateHullShader;
			public function HResult(ID3D11Device* self, void* pShaderBytecode, uint64 bytecodeLength, ID3D11ClassLinkage* pClassLinkage, ID3D11DomainShader** ppDomainShader) CreateDomainShader;
			public function HResult(ID3D11Device* self, void* pShaderBytecode, uint64 bytecodeLength, ID3D11ClassLinkage* pClassLinkage, ID3D11ComputeShader** ppComputeShader) CreateComputeShader;

			public function HResult(ID3D11Device* self, ID3D11ClassLinkage **ppLinkage) CreateClassLinkage;
			public function HResult(ID3D11Device* self, BlendDescription *pBlendStateDesc, ID3D11BlendState **ppBlendState) CreateBlendState;

			public function HResult(ID3D11Device* self, DepthStencilStateDescription* pDepthStencilStateDescription, ID3D11DepthStencilState** ppDepthStencilState) CreateDepthStencilState;
			public function HResult(ID3D11Device* self, RasterizerStateDescription* pRasterizerDesc, ID3D11RasterizerState** ppRasterizerState) CreateRasterizerState;
			public function HResult(ID3D11Device* self, SamplerStateDescription* pSamplerDesc, ID3D11SamplerState** ppSamplerState) CreateSamplerState;	

			public function HResult(ID3D11Device* self, QueryDescription *pPredicateDesc, ID3D11Query **ppQuery) CreateQuery;
			public function HResult(ID3D11Device* self, QueryDescription *pPredicateDesc, ID3D11Predicate **ppPredicate) CreatePredicate;
			public function HResult(ID3D11Device* self, CounterDescription *counterDesc, Counter **ppCounter) CreateCounter;
			public function HResult(ID3D11Device* self, UINT contextFlags, ID3D11DeviceContext **ppDeferredContext) CreateDeferredContext;
			public function HResult(ID3D11Device* self, Windows.Handle hResource, Guid *iid, void **ppResource) OpenSharedResource;

			public function HResult(ID3D11Device* self, Format format, FormatSupport* formatSupport) CheckFormatSupport;
			public function HResult(ID3D11Device* self, Format format, UINT sampleCount, UINT *pNumQualityLevels) CheckMultisampleQualityLevels;

			public function void(ID3D11Device* self, CounterInfo *counterInfo) CheckCounterInfo;
			public function HResult(ID3D11Device* self, CounterDescription *desc, CounterType *type, UINT *pActiveCounters, LPSTR szName, UINT *pNameLength, LPSTR szUnits, UINT *pUnitsLength, LPSTR szDescription, UINT *pDescriptionLength) CheckCounter;
			public function HResult(ID3D11Device* self, Feature feature, void *featureSupportData, uint32 featureSupportDataSize) CheckFeatureSupport;
			
			public function HResult(ID3D11Device* self, ref Guid name, uint32* pDataSize, void* pData) GetPrivateData;	
			public function HResult(ID3D11Device* self, ref Guid name, uint32 dataSize, void* pData) SetPrivateData; 
			public function HResult(ID3D11Device* self, ref Guid name, IUnknown* pUnknown) SetPrivateDataInterface;

			public function FeatureLevel(ID3D11Device* self) GetFeatureLevel;	
			public function DeviceCreationFlags(ID3D11Device* self) GetCreationFlags;
			public function HResult(ID3D11Device* self) GetDeviceRemovedReason;

			public function void(ID3D11Device* self, ID3D11DeviceContext** ppImmediateContext) GetImmediateContext;

			public function HResult(ID3D11Device* self, RaiseFlags raiseFlags) SetExceptionMode;
			public function RaiseFlags(ID3D11Device* self) GetExceptionMode;
		}

		public new VTable* VT
		{
			[Inline]
			get =>(.)mVT;
		}

		/**
		 * Get the type, name, units of measure, and a description of an existing counter.
		 *
		 * @param desc					Pointer to a counter description. Specifies which counter information is to be retrieved about.
		 * @param type					Pointer to the data type of a counter. Specifies the data type of the counter being retrieved.
		 * @param pActiveCounters		Pointer to the number of hardware counters that are needed for this counter type to be created.
		 *								All instances of the same counter type use the same hardware counters.
		 * @param szName				String to be filled with a brief name for the counter. May be NULL if the application is not interested in the name of the counter.
		 * @param pNameLength			Length of the string returned to szName. Can be NULL.
		 * @param szUnits				Name of the units a counter measures, provided the memory the pointer points to has enough room to hold the string. Can be NULL.
		 *								The returned string will always be in English.
		 * @param pUnitsLength			Length of the string returned to szUnits. Can be NULL.
		 * @param szDescription			A description of the counter, provided the memory the pointer points to has enough room to hold the string. Can be NULL.
		 *								The returned string will always be in English.
		 * @param pDescriptionLength	Length of the string returned to szDescription. Can be NULL.
		*/
		public HResult CheckCounter(CounterDescription *desc, CounterType *type, UINT *pActiveCounters, LPSTR szName,
			UINT *pNameLength, LPSTR szUnits, UINT *pUnitsLength, LPSTR szDescription, UINT *pDescriptionLength) mut
		{
			return VT.CheckCounter(&this, desc, type, pActiveCounters, szName, pNameLength, szUnits, pUnitsLength, szDescription, pDescriptionLength);
		}

		/**
		 * Get a counter's information.
		 *
		 * @param counterInfo	Pointer to counter information (see D3D11_COUNTER_INFO).
		*/
		public void CheckCounterInfo(CounterInfo *counterInfo) mut
		{
			VT.CheckCounterInfo(&this, counterInfo);
		}

		/**
		 * Gets information about the features that are supported by the current graphics driver.
		 *
		 * @param feature					A member of the D3D11_FEATURE enumerated type that describes which feature to query for support.
		 * @param featureSupportData		Upon completion of the method, the passed structure is filled with data that describes the feature support.
		 * @param featureSupportDataSize	The size of the structure passed to the pFeatureSupportData parameter.
		*/
		public HResult CheckFeatureSupport(Feature feature, void *featureSupportData, uint32 featureSupportDataSize) mut
		{
			return VT.CheckFeatureSupport(&this, feature, featureSupportData, featureSupportDataSize);
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
		 * Get the number of quality levels available during multisampling.
		 *
		 * @param format			The texture format
		 * @param sampleCount		The number of samples during multisampling.
		 * @param numQualityLevels	Number of quality levels supported by the adapter.
		*/
		public HResult CheckMultisampleQualityLevels(Format format, uint32 sampleCount, out uint32 numQualityLevels) mut
		{
			numQualityLevels = ?;
			return VT.CheckMultisampleQualityLevels(&this, format, sampleCount, &numQualityLevels);
		}
		
		/**
		 * Creates a buffer (vertex buffer, index buffer, or shader-constant buffer).
		 *
		 * @param pBlendStateDesc 	Reference to a blend-state description.
		 * @param ppBlendState 		Address of a pointer to the blend-state object created.
		*/
		public HResult CreateBlendState(ref BlendDescription pBlendStateDesc, ID3D11BlendState **ppBlendState) mut
		{
			return VT.CreateBlendState(&this, &pBlendStateDesc, ppBlendState);
		}

		/**
		 * Creates a buffer (vertex buffer, index buffer, or shader-constant buffer).
		 *
		 * @param bufferDesc 	A reference to a BufferDescription structure that describes the buffer.
		 * @param initialData 	A pointer to a SubresourceData structure that describes the initialization data;
		 *						use NULL to allocate space only (with the exception that it cannot be NULL if the usage flag is Usage.Immutable).
		 *						If you don't pass anything to pInitialData, the initial content of the memory for the buffer is undefined. In this case, you need to write the buffer content some other way before the resource is read.
		 * @param buffer 		Address of a pointer to the ID3D11Buffer interface for the buffer object created.
		 *						Set this parameter to NULL to validate the other input parameters (S_FALSE indicates a pass).
		*/
		public HResult CreateBuffer(ref BufferDescription bufferDesc, SubresourceData* initialData, ID3D11Buffer** buffer) mut
		{
			return VT.CreateBuffer(&this, &bufferDesc, initialData, buffer);
		}

		/**
		 * Creates class linkage libraries to enable dynamic shader linkage.
		 *
		 * @param ppLinkage	A pointer to a class-linkage interface pointer.
		*/
		public HResult CreateClassLinkage(ID3D11ClassLinkage **ppLinkage) mut
		{
			return VT.CreateClassLinkage(&this, ppLinkage);
		}	

		/**
		 * Create a compute shader.
		 *
		 * @param pShaderBytecode	A pointer to a compiled shader.
		 * @param bytecodeLength	Size of the compiled shader in pShaderBytecode.
		 * @param pClassLinkage		A pointer to a ID3D11ClassLinkage, which represents class linkage interface; the value can be NULL.
		 * @param ppComputeShader	Address of a pointer to an ID3D11ComputeShader interface.
		 *							If this is NULL, all other parameters will be validated;
		 *							if validation passes, CreateComputeShader returns S_FALSE instead of S_OK.
		*/
		public HResult CreateComputeShader(void *pShaderBytecode, SIZE_T bytecodeLength, ID3D11ClassLinkage *pClassLinkage, ID3D11ComputeShader **ppComputeShader) mut
		{
			return VT.CreateComputeShader(&this, pShaderBytecode, bytecodeLength, pClassLinkage, ppComputeShader);
		}

		/**
		 * Create a counter object for measuring GPU performance.
		 *
		 * @param counterDesc	Pointer to a counter description.
		 * @param ppCounter		Address of a pointer to a counter.
		*/
		public HResult CreateCounter(ref CounterDescription counterDesc, Counter **ppCounter) mut
		{
			return VT.CreateCounter(&this, &counterDesc, ppCounter);
		}

		/**
		 * Creates a deferred context, which can record command lists.
		 *
		 * @param contextFlags 		Reserved for future use. Pass 0.
		 * @param ppDeferredContext Upon completion of the method, the passed pointer to an ID3D11DeviceContext interface pointer is initialized.
		*/
		public HResult CreateDeferredContext(UINT contextFlags, ID3D11DeviceContext **ppDeferredContext) mut
		{
		   return VT.CreateDeferredContext(&this, contextFlags, ppDeferredContext);
		}

		/**
		 * Create a depth-stencil state object that encapsulates depth-stencil test information for the output-merger stage.
		 *
		 * @param desc					Reference to a depth-stencil state description.
		 * @param ppDepthStencilState	Address of a pointer to the depth-stencil state object created.
		*/
		public HResult CreateDepthStencilState(ref DepthStencilStateDescription desc, ID3D11DepthStencilState **ppDepthStencilState) mut
		{
			return VT.CreateDepthStencilState(&this, &desc, ppDepthStencilState);
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
		 * Create a domain shader.
		 *
		 * @param pShaderBytecode	A pointer to a compiled shader.
		 * @param bytecodeLength	Size of the compiled shader in pShaderBytecode.
		 * @param pClassLinkage		A pointer to a ID3D11ClassLinkage, which represents class linkage interface; the value can be NULL.
		 * @param ppDomainShader	Address of a pointer to an ID3D11DomainShader interface.
		 *							If this is NULL, all other parameters will be validated;
		 *							if validation passes, CreateDomainShader returns S_FALSE instead of S_OK.
		*/
		public HResult CreateDomainShader(void *pShaderBytecode, SIZE_T bytecodeLength, ID3D11ClassLinkage *pClassLinkage, ID3D11DomainShader **ppDomainShader) mut
		{
			return VT.CreateDomainShader(&this, pShaderBytecode, bytecodeLength, pClassLinkage, ppDomainShader);
		}
		
		/**
		 * Create a geometry shader.
		 *
		 * @param pShaderBytecode	A pointer to a compiled shader.
		 * @param bytecodeLength	Size of the compiled shader in pShaderBytecode.
		 * @param pClassLinkage		A pointer to a ID3D11ClassLinkage, which represents class linkage interface; the value can be NULL.
		 * @param ppGeometryShader	Address of a pointer to an ID3D11GeometryShader interface.
		 *							If this is NULL, all other parameters will be validated;
		 *							if validation passes, CreateGeometryShader returns S_FALSE instead of S_OK.
		*/
		public HResult CreateGeometryShader(void *pShaderBytecode, SIZE_T bytecodeLength, ID3D11ClassLinkage *pClassLinkage, ID3D11GeometryShader **ppGeometryShader) mut
		{
			return VT.CreateGeometryShader(&this, pShaderBytecode, bytecodeLength, pClassLinkage, ppGeometryShader);
		}
		
		/**
		 * Creates a geometry shader that can write to streaming output buffers.
		 *
		 * @param pShaderBytecode	A pointer to the compiled geometry shader for a standard geometry shader plus stream output. For info on how to get this pointer, see Getting a Pointer to a Compiled Shader.
		 * @param bytecodeLength	Size of the compiled geometry shader.
		 * @param pSODeclaration	Pointer to a D3D11_SO_DECLARATION_ENTRY array. Cannot be NULL if NumEntries > 0.
		 * @param numEntries		The number of entries in the stream output declaration ( ranges from 0 to D3D11_SO_STREAM_COUNT * D3D11_SO_OUTPUT_COMPONENT_COUNT ).
		 * @param pBufferStrides	An array of buffer strides; each stride is the size of an element for that buffer.
		 * @param numStrides		The number of strides (or buffers) in pBufferStrides (ranges from 0 to D3D11_SO_BUFFER_SLOT_COUNT).
		 * @param rasterizedStream	The index number of the stream to be sent to the rasterizer stage (ranges from 0 to D3D11_SO_STREAM_COUNT - 1). Set to D3D11_SO_NO_RASTERIZED_STREAM if no stream is to be rasterized.
		 * @param pClassLinkage		A pointer to a ID3D11ClassLinkage, which represents class linkage interface; the value can be NULL.
		 * @param ppComputeShader	Address of a pointer to an ID3D11GeometryShader interface.
		 *							If this is NULL, all other parameters will be validated;
		 *							if validation passes, CreateGeometryShader returns S_FALSE instead of S_OK.
		*/
		public HResult CreateGeometryShaderWithStreamOutput(void *pShaderBytecode, SIZE_T bytecodeLength, StreamOutputDeclarationEntry *pSODeclaration, UINT numEntries,
			UINT *pBufferStrides, UINT numStrides, UINT rasterizedStream, ID3D11ClassLinkage *pClassLinkage, ID3D11GeometryShader **ppGeometryShader) mut
		{
			return VT.CreateGeometryShaderWithStreamOutput(&this, pShaderBytecode, bytecodeLength, pSODeclaration, numEntries, pBufferStrides, numStrides, rasterizedStream, pClassLinkage, ppGeometryShader);
		}

		/**
		 * Create a geometry shader.
		 *
		 * @param pShaderBytecode	A pointer to a compiled shader.
		 * @param bytecodeLength	Size of the compiled shader in pShaderBytecode.
		 * @param pClassLinkage		A pointer to a ID3D11ClassLinkage, which represents class linkage interface; the value can be NULL.
		 * @param ppHullShader		Address of a pointer to an ID3D11HullShader interface.
		 *							If this is NULL, all other parameters will be validated;
		 *							if validation passes, CreateHullShader returns S_FALSE instead of S_OK.
		*/
		public HResult CreateHullShader(void *pShaderBytecode, SIZE_T bytecodeLength, ID3D11ClassLinkage *pClassLinkage, ID3D11HullShader **ppHullShader) mut
		{
			return VT.CreateHullShader(&this, pShaderBytecode, bytecodeLength, pClassLinkage, ppHullShader);
		}

		/**
		 * Create an input-layout object to describe the input-buffer data for the input-assembler stage.
		 *
		 * @param inputElementDescs					An array of the input-assembler stage input data types; each type is described by an element description.
		 * @param numElements						The number of input-data types in the array of input-elements.
		 * @param pShaderBytecodeWithInputSignature	A pointer to the compiled shader.
		 *											The compiled shader code contains a input signature which is validated against the array of elements.
		 * @param bytecodeLength					Size of the compiled shader.
		 * @param ppInputLayout						A pointer to the input-layout object created (see ID3D11InputLayout).
		 *											To validate the other input parameters, set this pointer to be NULL and verify that the method returns S_FALSE.
		*/
		public HResult CreateInputLayout(InputElementDescription *inputElementDescs, uint32 numElements, void *pShaderBytecodeWithInputSignature, SIZE_T bytecodeLength, ID3D11InputLayout **ppInputLayout) mut
		{
			return VT.CreateInputLayout(&this, inputElementDescs, numElements, pShaderBytecodeWithInputSignature, bytecodeLength, ppInputLayout);
		}
		
		/**
		 * Create a geometry shader.
		 *
		 * @param pShaderBytecode	A pointer to a compiled shader.
		 * @param bytecodeLength	Size of the compiled shader in pShaderBytecode.
		 * @param pClassLinkage		A pointer to a ID3D11ClassLinkage, which represents class linkage interface; the value can be NULL.
		 * @param ppPixelShader		Address of a pointer to an ID3D11PixelShader interface.
		 *							If this is NULL, all other parameters will be validated;
		 *							if validation passes, CreatePixelShader returns S_FALSE instead of S_OK.
		*/
		public HResult CreatePixelShader(void *pShaderBytecode, SIZE_T bytecodeLength, ID3D11ClassLinkage *pClassLinkage, ID3D11PixelShader **ppPixelShader) mut
		{
			return VT.CreatePixelShader(&this, pShaderBytecode, bytecodeLength, pClassLinkage, ppPixelShader);
		}

		/**
		 * Creates a predicate.
		 *
		 * @param pPredicateDesc	Pointer to a query description where the type of query must be a D3D11_QUERY_SO_OVERFLOW_PREDICATE or OcclusionPredicate.
		 * @param ppPredicate		Address of a pointer to a predicate.
		*/
		public HResult CreatePredicate(QueryDescription *pPredicateDesc, ID3D11Predicate **ppPredicate) mut
		{
			return VT.CreatePredicate(&this, pPredicateDesc, ppPredicate);
		}
		
		/**
		 * This interface encapsulates methods for querying information from the GPU.
		 *
		 * @param pPredicateDesc	Pointer to a query description.
		 * @param ppQuery		Address of a pointer to the query object created.
		*/
		public HResult CreateQuery(QueryDescription *pPredicateDesc, ID3D11Query **ppQuery) mut
		{
			return VT.CreateQuery(&this, pPredicateDesc, ppQuery);
		}

		/**
		 * Create a rasterizer state object that tells the rasterizer stage how to behave.
		 *
		 * @param description		Reference to the rasterizer state description.
		 * @param rasterizerState	Address of a pointer to the rasterizer state object created.
		*/
		public HResult CreateRasterizerState(ref RasterizerStateDescription description, ID3D11RasterizerState **rasterizerState) mut
		{
			return VT.CreateRasterizerState(&this, &description, rasterizerState);
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
		 * Create a sampler-state object that encapsulates sampling information for a texture.
		 *
		 * @param description	Reference to a sampler state description.
		 * @param samplerState	Address of a pointer to the sampler state object created.
		*/
		public HResult CreateSamplerState(ref SamplerStateDescription description, ID3D11SamplerState **samplerState) mut
		{
			return VT.CreateSamplerState(&this, &description, samplerState);
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
		 * Create a single 3D texture.
		 *
		 * @param desc			A reference to a Texture3DDescription structure that describes a 3D texture resource.
		 * @param initialData	A pointer to an array of D3D11_SUBRESOURCE_DATA structures that describe subresources for the 3D texture resource.
		 * @param texture2D		A pointer to a buffer that receives a pointer to a ID3D11Texture3D interface for the created texture.
		 * 						Set this parameter to NULL to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
		*/
		public HResult CreateTexture3D(ref Texture3DDescription desc, SubresourceData* initialData, ID3D11Texture3D** texture2D) mut
		{
			return VT.CreateTexture3D(&this, &desc, initialData, texture2D);
		}

		/**
		 * Creates a view for accessing an unordered access resource.
		 *
		 * @param resource		Pointer to an ID3D11Resource that represents a resources that will serve as an input to a shader.
		 * @param description	Pointer to an UnorderedAccessViewDescription that represents a shader-resource view description.
		 *						Set this parameter to NULL to create a view that accesses the entire resource (using the format the resource was created with).
		 * @param uaView		Address of a pointer to an ID3D11UnorderedAccessView that represents an unordered-access view.
		 *						Set this parameter to NULL to validate the other input parameters (the method will return S_FALSE if the other input parameters pass validation).
		*/
		public HResult CreateUnorderedAccessView(ID3D11Resource *resource, UnorderedAccessViewDescription* description, ID3D11UnorderedAccessView **uaView) mut
		{
			return VT.CreateUnorderedAccessView(&this, resource, description, uaView);
		}

		/**
		 * Create a vertex-shader object from a compiled shader.
		 *
		 * @param pShaderBytecode	A pointer to a compiled shader.
		 * @param bytecodeLength	Size of the compiled shader in pShaderBytecode.
		 * @param pClassLinkage		A pointer to a ID3D11ClassLinkage, which represents class linkage interface; the value can be NULL.
		 * @param ppVertexShader	Address of a pointer to a ID3D11VertexShader interface.
		 *							If this is NULL, all other parameters will be validated,
		 *							and if all parameters pass validation this API will return S_FALSE instead of S_OK.
		*/
		public HResult CreateVertexShader(void *pShaderBytecode, SIZE_T bytecodeLength, ID3D11ClassLinkage *pClassLinkage, ID3D11VertexShader **ppVertexShader) mut
		{
			return VT.CreateVertexShader(&this, pShaderBytecode, bytecodeLength, pClassLinkage, ppVertexShader);
		}

		/**
		 * Get the flags used during the call to create the device with D3D11CreateDevice.
		 *
		 * @return A bitfield containing the flags used to create the device.
		*/
		public DeviceCreationFlags GetCreationFlags() mut
		{
		   return VT.GetCreationFlags(&this);
		}

		/**
		 * Get the reason why the device was removed.
		 *
		 * @return	Possible return values include:
    	 *			- DXGI_ERROR_DEVICE_HUNG
    	 *		 	- DXGI_ERROR_DEVICE_REMOVED
    	 *			- DXGI_ERROR_DEVICE_RESET
    	 *			- DXGI_ERROR_DRIVER_INTERNAL_ERROR
    	 *			- DXGI_ERROR_INVALID_CALL
    	 *			- S_OK
		*/
		public HResult GetDeviceRemovedReason() mut
		{
			return VT.GetDeviceRemovedReason(&this);
		}

		/**
		 * Get the exception-mode flags.
		 *
		 * @return  A value that contains one or more exception flags;
		 *			each flag specifies a condition which will cause an exception to be raised.
		 * 			The flags are listed in RaiseFlags.
		 *			A default value of 0 means there are no flags.
		*/
		public RaiseFlags GetExceptionMode() mut
		{
			return VT.GetExceptionMode(&this);
		}

		/**
		 * Gets the feature level of the hardware device.
		*/
		public FeatureLevel GetFeatureLevel() mut
		{
			return VT.GetFeatureLevel(&this);
		}

		/**
		 * Gets an immediate context, which can play back command lists.
		 *
		 * @param ppImmediateContext	Upon completion of the method, the passed pointer to an ID3D11DeviceContext interface pointer is initialized.
		*/
		public void GetImmediateContext(out ID3D11DeviceContext *ppImmediateContext) mut
		{
			ppImmediateContext = ?;
			VT.GetImmediateContext(&this, &ppImmediateContext);
		}

		/**
		 * Get application-defined data from a device.
		 *
		 * @param guid 		Guid associated with the data.
		 * @param pDataSize A pointer to a variable that on input contains the size, in bytes, of the buffer that pData points to, and on output contains the size, in bytes, of the amount of data that GetPrivateData retrieved.
		 * @param pData		A pointer to a buffer that GetPrivateData fills with data from the device if pDataSize points to a value that specifies a buffer large enough to hold the data.
		*/
		public HResult GetPrivateData(Guid guid, UINT *pDataSize, void *pData) mut
 		{
			 Guid rguid = guid;
			 return VT.GetPrivateData(&this, ref rguid, pDataSize, pData);
		}

		/**
		 * Give a device access to a shared resource created on a different device.
		 *
		 * @param hResource		A resource handle.
		 * @param iid			The globally unique identifier (GUID) for the resource interface.
		 * @param ppResource	Address of a pointer to the resource we are gaining access to.
		*/
		public HResult OpenSharedResource(Windows.Handle hResource, Guid iid, void **ppResource) mut
		{
			Guid riid = iid;
			return VT.OpenSharedResource(&this, hResource, &riid, ppResource);
		}

		/**
		 * Get the exception-mode flags.
		 *
		 * @param raiseFlags	A value that contains one or more exception flags;
		 *						each flag specifies a condition which will cause an exception to be raised.
		 *						A default value of None (0) means there are no flags.
		*/
		public HResult SetExceptionMode(RaiseFlags raiseFlags) mut
		{
			return VT.SetExceptionMode(&this, raiseFlags);
		}

		/**
		 * Set data to a device and associate that data with a guid.
		 *
		 * @param guid		Guid associated with the data.
		 * @param dataSize	Size of the data.
		 * @param pData		Pointer to the data to be stored with this device.
		 *					If pData is NULL, DataSize must also be 0, and any data previously associated with the guid will be destroyed.
		*/
		public HResult SetPrivateData(Guid guid, UINT dataSize, void *pData) mut
		{
			Guid riid = guid;
			return VT.SetPrivateData(&this, ref riid, dataSize, pData);
		}

		/**
		 * Associate an IUnknown-derived interface with this device child and associate that interface with an application-defined guid.
		 *
		 * @param guid		Guid associated with the interface.
		 * @param pData		Pointer to an IUnknown-derived interface to be associated with the device child.
		*/
		public HResult SetPrivateDataInterface(Guid guid, IUnknown *pData) mut
		{
			Guid riid = guid;
			return VT.SetPrivateDataInterface(&this, ref riid, pData);
		}
	}
}
