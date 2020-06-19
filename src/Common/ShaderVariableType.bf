namespace DirectX.Common
{
	/**
	 * Values that identify various data, texture, and buffer types that can be assigned to a shader variable.
	 * D3D_SHADER_VARIABLE_TYPE 
	*/
	public enum ShaderVariableType : uint32
	{
		/**
		 * The variable is a void pointer.
		 * D3D_SVT_VOID
		*/
        Void = 0,
		/**
		 * The variable is a boolean.
		 * D3D_SVT_BOOL
		*/
        Bool = 1,
		/**
		 * The variable is an integer.
		 * D3D_SVT_INT
		*/
        Int = 2,
		/**
		 * The variable is a floating-point number.
		 * D3D_SVT_FLOAT
		*/
        Float = 3,
		/**
		 * The variable is a string.
		 * D3D_SVT_STRING
		*/
        String = 4,
		/**
		 * The variable is a texture.
		 * D3D_SVT_TEXTURE
		*/
        Texture = 5,
		/**
		 * The variable is a 1D texture.
		 * D3D_SVT_TEXTURE1D
		*/
        Texture1D = 6,
		/**
		 * The variable is a 2D texture.
		 * D3D_SVT_TEXTURE2D
		*/
        Texture2D	= 7,
		/**
		 * The variable is a 3D texture.
		 * D3D_SVT_TEXTURE3D
		*/
        Texture3D	= 8,
		/**
		 * The variable is a texture cube.
		 * D3D_SVT_TEXTURECUBE
		*/
        TextureCube	= 9,
		/**
		 * The variable is a sampler.
		 * D3D_SVT_SAMPLER
		*/
        Sampler = 10,
		/**
		 * The variable is a 1D sampler.
		 * D3D_SVT_SAMPLER1D
		*/
        Sampler1D = 11,
		/**
		 * The variable is a 2D sampler.
		 * D3D_SVT_SAMPLER2D
		*/
        Sampler2D = 12,
		/**
		 * The variable is a 3D sampler.
		 * D3D_SVT_SAMPLER3D
		*/
        Sampler3D = 13,
		/**
		 * The variable is a cube sampler.
		 * D3D_SVT_SAMPLERCUBE
		*/
        SamplerCube = 14,
		/**
		 * The variable is a pixel shader.
		 * D3D_SVT_PIXELSHADER
		*/
        PixelShader = 15,
		/**
		 * The variable is a vertex shader.
		 * D3D_SVT_VERTEXSHADER
		*/
        VertexShader = 16,
		/**
		 * The variable is a pixel fragment.
		 * D3D_SVT_PIXELFRAGMENT
		*/
        PixelFragment = 17,
		/**
		 * The variable is a vertex fragment.
		 * D3D_SVT_VERTEXFRAGMENT
		*/
        VertexFragment = 18,
		/**
		 * The variable is an unsigned integer.
		 * D3D_SVT_UINT
		*/
        UInt = 19,
		/**
		 * The variable is an 8-bit unsigned integer.
		 * D3D_SVT_UINT8
		*/
        UInt8 = 20,
		/**
		 * The variable is a geometry shader.
		 * D3D_SVT_GEOMETRYSHADER
		*/
        GeometryShader = 21,
		/**
		 * The variable is a rasterizer-state object.
		 * D3D_SVT_RASTERIZER
		*/
        Rasterizer = 22,
		/**
		 * The variable is a depth-stencil-state object.
		 * D3D_SVT_DEPTHSTENCIL
		*/
        DepthStencil = 23,
		/**
		 * The variable is a blend-state object.
		 * D3D_SVT_BLEND
		*/
        Blend = 24,
		/**
		 * The variable is a buffer.
		 * D3D_SVT_BUFFER
		*/
        Buffer = 25,
		/**
		 * The variable is a constant buffer.
		 * D3D_SVT_CBUFFER
		*/
        ConstantBuffer = 26,
		/**
		 * The variable is a texture buffer.
		 * D3D_SVT_TBUFFER
		*/
        TextureBuffer = 27,
		/**
		 * The variable is a 1D-texture array.
		 * D3D_SVT_TEXTURE1DARRAY
		*/
        Texture1DArray = 28,
		/**
		 * The variable is a 2D-texture array.
		 * D3D_SVT_TEXTURE2DARRAY
		*/
        Texture2DArray = 29,
		/**
		 * The variable is a render-target view.
		 * D3D_SVT_RENDERTARGETVIEW
		*/
        RenderTargetView = 30,
		/**
		 * The variable is a depth-stencil view.
		 * D3D_SVT_DEPTHSTENCILVIEW
		*/
        DepthStencilView = 31,
		/**
		 * The variable is a 2D-multisampled texture.
		 * D3D_SVT_TEXTURE2DMS
		*/
        Texture2DMultisampled = 32,
		/**
		 * The variable is a 2D-multisampled-texture array.
		 * D3D_SVT_TEXTURE2DMSARRAY
		*/
        Texture2DMultisampledArray = 33,
		/**
		 * The variable is a texture-cube array.
		 * D3D_SVT_TEXTURECUBEARRAY
		*/
        TextureCubeArray = 34,
		/**
		 * The variable holds a compiled hull-shader binary.
		 * D3D_SVT_HULLSHADER
		*/
        HullShader = 35,
		/**
		 * The variable holds a compiled domain-shader binary.
		 * D3D_SVT_DOMAINSHADER
		*/
        DomainShader = 36,
		/**
		 * The variable is an interface.
		 * D3D_SVT_INTERFACE_POINTER
		*/
        InterfacePointer = 37,
		/**
		 * The variable holds a compiled compute-shader binary.
		 * D3D_SVT_COMPUTESHADER
		*/
        ComputeShader = 38,
		/**
		 * The variable is a double precision (64-bit) floating-point number.
		 * D3D_SVT_DOUBLE
		*/
        Double = 39,
		/**
		 * The variable is a 1D read-and-write texture.
		 * D3D_SVT_RWTEXTURE1D
		*/
        RWTexture1D = 40,
		/**
		 * The variable is an array of 1D read-and-write textures.
		 * D3D_SVT_RWTEXTURE1DARRAY
		*/
        RWTexture1DArray = 41,
		/**
		 * The variable is a 2D read-and-write texture.
		 * D3D_SVT_RWTEXTURE2D
		*/
        RWTexture2D = 42,
		/**
		 * The variable is an array of 2D read-and-write textures.
		 * D3D_SVT_RWTEXTURE2DARRAY
		*/
        RWTexture2DArray = 43,
		/**
		 * The variable is a 3D read-and-write texture.
		 * D3D_SVT_RWTEXTURE3D
		*/
        RWTexture3D = 44,
		/**
		 * The variable is a read-and-write buffer.
		 * D3D_SVT_RWBUFFER
		*/
        RWBuffer = 45,
		/**
		 * The variable is a byte-address buffer.
		 * D3D_SVT_BYTEADDRESS_BUFFER
		*/
        ByteAddressBuffer = 46,
		/**
		 * The variable is a read-and-write byte-address buffer.
		 * D3D_SVT_RWBYTEADDRESS_BUFFER
		*/
        RWByteAddressBuffer = 47,
		/**
		 * The variable is a structured buffer. 
		 * D3D_SVT_STRUCTURED_BUFFER
		*/
        StructuredBuffer = 48,
		/**
		 * The variable is a read-and-write structured buffer.
		 * D3D_SVT_RWSTRUCTURED_BUFFER
		*/
        RWStructuredBuffer = 49,
		/**
		 * The variable is an append structured buffer.
		 * D3D_SVT_APPEND_STRUCTURED_BUFFER
		*/
        AppendStructuredBuffer = 50,
		/**
		 * The variable is a consume structured buffer.
		 * D3D_SVT_CONSUME_STRUCTURED_BUFFER
		*/
        ConsumeStructuredBuffer = 51,
		/**
		 * The variable is an 8-byte FLOAT.
		 * D3D_SVT_MIN8FLOAT
		*/
        Min8Float = 52,
		/**
		 * The variable is a 10-byte FLOAT.
		 * D3D_SVT_MIN10FLOAT
		*/
        Min10Float = 53,
		/**
		 * The variable is a 16-byte FLOAT.
		 * D3D_SVT_MIN16FLOAT
		*/
        Min16Float = 54,
		/**
		 * The variable is a 12-byte INT.
		 * D3D_SVT_MIN12INT
		*/
        Min12Int = 55,
		/**
		 * The variable is a 16-byte INT.
		 * D3D_SVT_MIN16INT
		*/
        Min16Int = 56,
		/**
		 * The variable is a 16-byte INT.
		 * D3D_SVT_MIN16UINT
		*/
        Min16UInt = 57,
		/**
		 * This value is not used by a programmer;
		 * it exists to force the enumeration to compile to 32 bits.
		 * D3D_SVT_FORCE_DWORD
		*/
        ForceDWord = 0x7fffffff
	}
}
