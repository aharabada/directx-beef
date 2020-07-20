namespace DirectX.D3D11
{
	/**
	A Bitfield defining Which resources are supported for a given format and given device (see ID3D11Device::CheckFormatSupport and ID3D11Device::CheckFeatureSupport).
	D3D11_FORMAT_SUPPORT
	*/
	public enum FormatSupport : uint32
	{
		/**
		Buffer resources supported.
		D3D11_FORMAT_SUPPORT_BUFFER
		*/
	    Buffer = 0x1,
	    /**
		Vertex buffers supported.
		D3D11_FORMAT_SUPPORT_IA_VERTEX_BUFFER
		*/
	    VertexBuffer = 0x2,
	    /**
		Index buffers supported.
		D3D11_FORMAT_SUPPORT_IA_INDEX_BUFFER
		*/
	    IndexBuffer = 0x4,
	    /**
		Streaming output buffers supported.
		D3D11_FORMAT_SUPPORT_SO_BUFFER
		*/
	    StreamingOutputBuffer = 0x8,
	    /**
		1D texture resources supported.
		D3D11_FORMAT_SUPPORT_TEXTURE1D
		*/
	    Texture1D = 0x10,
	    /**
		2D texture resources supported.
		D3D11_FORMAT_SUPPORT_TEXTURE2D
		*/
	    Texture2D = 0x20,
	    /**
		3D texture resources supported.
		D3D11_FORMAT_SUPPORT_TEXTURE3D
		*/
	    Texture3D = 0x40,
	    /**
		Cube texture resources supported.
		D3D11_FORMAT_SUPPORT_TEXTURECUBE
		*/
	    TextureCube = 0x80,
	    /**
		The HLSL Load function for texture objects is supported.
		D3D11_FORMAT_SUPPORT_SHADER_LOAD
		*/
	    ShaderLoad = 0x100,
	    /**
		The HLSL Sample function for texture objects is supported.
		Note: If the device supports the format as a resource (1D, 2D, 3D, or cube map) but doesn't support this option,
		the resource can still use the Sample method but must use only the point filtering sampler state to perform the sample.
		D3D11_FORMAT_SUPPORT_SHADER_SAMPLE
		*/
	    ShaderSample = 0x200,
	    /**
		The HLSL SampleCmp and SampleCmpLevelZero functions for texture objects are supported.
		Note: Windows 8 and later might provide limited support for these functions on Direct3D feature levels 9_1, 9_2, and 9_3.
		D3D11_FORMAT_SUPPORT_SHADER_SAMPLE_COMPARISON
		*/
	    ShaderSampleComparison = 0x400,
	    /**
		Reserved.
		D3D11_FORMAT_SUPPORT_SHADER_SAMPLE_MONO_TEXT
		*/
	    ShaderSampleMonoText = 0x800,
	    /**
		Mipmaps are supported.
		D3D11_FORMAT_SUPPORT_MIP
		*/
	    Mipmaps = 0x1000,
	    /**
		Automatic generation of mipmaps is supported.
		D3D11_FORMAT_SUPPORT_MIP_AUTOGEN
		*/
	    MipmapAutoGeneration = 0x2000,
	    /**
		Render targets are supported.
		D3D11_FORMAT_SUPPORT_RENDER_TARGET
		*/
	    RenderTarget = 0x4000,
	    /**
		Blend operations supported.
		D3D11_FORMAT_SUPPORT_BLENDABLE
		*/
	    Blendable = 0x8000,
	    /**
		Depth stencils supported.
		D3D11_FORMAT_SUPPORT_DEPTH_STENCIL
		*/
	    DepthStencil = 0x10000,
	    /**
		CPU locking supported.
		D3D11_FORMAT_SUPPORT_CPU_LOCKABLE
		*/
	    CpuLockable = 0x20000,
	    /**
		Multisample antialiasing (MSAA) resolve operations are supported.
		D3D11_FORMAT_SUPPORT_MULTISAMPLE_RESOLVE
		*/
	    MultisampleResolve = 0x40000,
	    /**
		Format can be displayed on screen.
		D3D11_FORMAT_SUPPORT_DISPLAY
		*/
	    Display = 0x80000,
	    /**
		Format cannot be cast to another format.
		D3D11_FORMAT_SUPPORT_CAST_WITHIN_BIT_LAYOUT
		*/
	    CastWithinBitLayout = 0x100000,
	    /**
		Format can be used as a multisampled rendertarget.
		D3D11_FORMAT_SUPPORT_MULTISAMPLE_RENDERTARGET
		*/
	    MultisampleRenderTarget= 0x200000,
	    /**
		Format can be used as a multisampled texture and read into a shader with the HLSL load function.
		D3D11_FORMAT_SUPPORT_MULTISAMPLE_LOAD
		*/
	    MultisampleLoad = 0x400000,
	    /**
		Format can be used with the HLSL gather function. This value is available in DirectX 10.1 or higher.
		D3D11_FORMAT_SUPPORT_SHADER_GATHER
		*/
	    ShaderGather = 0x800000,
	    /**
		Format supports casting when the resource is a back buffer.
		D3D11_FORMAT_SUPPORT_BACK_BUFFER_CAST
		*/
	    BackBufferCast = 0x01000000,
	    /**
		Format can be used for an unordered access view.
		D3D11_FORMAT_SUPPORT_TYPED_UNORDERED_ACCESS_VIEW
		*/
	    UnorderedAccessView = 0x02000000,
	    /**
		Format can be used with the HLSL gather with comparison function.
		D3D11_FORMAT_SUPPORT_SHADER_GATHER_COMPARISON
		*/
	    ShaderGatherComparison = 0x04000000,
	    /**
		Format can be used with the decoder output.
		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_FORMAT_SUPPORT_DECODER_OUTPUT
		*/
	    DecoderOutput = 0x08000000,
	    /**
		Format can be used with the video processor output.
		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_FORMAT_SUPPORT_VIDEO_PROCESSOR_OUTPUT
		*/
	    VideoProcessorOutput = 0x10000000,
	    /**
		Format can be used with the video processor input.
		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_FORMAT_SUPPORT_VIDEO_PROCESSOR_INPUT
		*/
	    VideoProcessorInput = 0x20000000,
	    /**
		Format can be used with the video encoder.
		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_FORMAT_SUPPORT_VIDEO_ENCODER
		*/
	    VideoEncoder = 0x40000000,
		/**
		No FormatSupport-Flags set.
		*/
	    None = 0
	}
}
