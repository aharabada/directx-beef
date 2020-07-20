namespace DirectX.D3D11
{
	/**
	Identifies how to bind a resource to the pipeline.
	D3D11_BIND_FLAG
	*/
	public enum BindFlags : uint32 
	{
		/**
		Bind a buffer as a vertex buffer to the input-assembler stage.
		D3D11_BIND_VERTEX_BUFFER
		*/
	    VertexBuffer = 0x1L,
		/**
		Bind a buffer as an index buffer to the input-assembler stage.
		D3D11_BIND_INDEX_BUFFER
		*/
	    IndexBuffer = 0x2L,
	    /**
		Bind a buffer as a constant buffer to a shader stage; this flag may NOT be combined with any other bind flag.
		D3D11_BIND_CONSTANT_BUFFER
		*/
		ConstantBuffer = 0x4L,
		/**
		Bind a buffer or texture to a shader stage; this flag cannot be used with the D3D11_MAP_WRITE_NO_OVERWRITE flag.
		D3D11_BIND_SHADER_RESOURCE
		*/
	    ShaderResource = 0x8L,
		/**
		Bind an output buffer for the stream-output stage.
		D3D11_BIND_STREAM_OUTPUT
		*/
	    StreamOutput = 0x10L,
		/**
		Bind a texture as a render target for the output-merger stage.
		D3D11_BIND_RENDER_TARGET
		*/
	    RenderTarget = 0x20L,
		/**
		Bind a texture as a depth-stencil target for the output-merger stage.
		D3D11_BIND_DEPTH_STENCIL
		*/
	    DepthStencil = 0x40L,
		/**
		Bind an unordered access resource.
		D3D11_BIND_UNORDERED_ACCESS
		*/
	    UnorderedAccess = 0x80L,
		/**
		Set this flag to indicate that a 2D texture is used to receive output from the decoder API.
		The common way to create resources for a decoder output is by calling the
		ID3D11Device::CreateTexture2D method to create an array of 2D textures. However,
		you cannot use texture arrays that are created with this flag in calls to ID3D11Device::CreateShaderResourceView.

		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_BIND_DECODER
		*/
	    Decoder = 0x200L,
		/**
		Set this flag to indicate that a 2D texture is used to receive input from the video encoder API.
		The common way to create resources for a video encoder is by calling the
		ID3D11Device::CreateTexture2D method to create an array of 2D textures.
		However, you cannot use texture arrays that are created with this flag in calls to ID3D11Device::CreateShaderResourceView.

		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_BIND_VIDEO_ENCODER
		*/
	    VideoEncoder = 0x400L,
		/**
		No binding flags specified
		*/
	    None = 0,
	}
}
