namespace DirectX.Common
{
	/**
	 * Values that identify resource types that can be bound to a shader and that are reflected as part of the resource description for the shader.
	 * D3D_SHADER_INPUT_TYPE
	*/
	public enum ShaderInputType : uint32
	{
		/**
		 * The shader resource is a constant buffer.
		 * D3D_SIT_CBUFFER
		*/
		ConstantBuffer = 0,
		/**
		 * The shader resource is a texture buffer.
		 * D3D_SIT_TBUFFER
		*/
	    TextureBuffer = ( ConstantBuffer + 1 ) ,
		/**
		 * The shader resource is a texture.
		 * D3D_SIT_TEXTURE
		*/
	    Texture = ( TextureBuffer + 1 ) ,
		/**
		 * The shader resource is a sampler.
		 * D3D_SIT_SAMPLER
		*/
	    Sampler = ( Texture + 1 ) ,
		/**
		 * The shader resource is a read-and-write buffer.
		 * D3D_SIT_UAV_RWTYPED
		*/
	    ReadWriteBuffer = ( Sampler + 1 ) ,
		/**
		 * The shader resource is a structured buffer.
		 * D3D_SIT_STRUCTURED
		*/
		StructuredBuffer = ( ReadWriteBuffer + 1 ) ,
		/**
		 * The shader resource is a read-and-write structured buffer.
		 * D3D_SIT_UAV_RWSTRUCTURED
		*/
	    ReadWriteStructuredBuffer = ( StructuredBuffer + 1 ) ,
		/**
		 * The shader resource is a byte-address buffer.
		 * D3D_SIT_BYTEADDRESS
		*/
		ByteAddressBuffer = ( ReadWriteStructuredBuffer + 1 ) ,
		/**
		 * The shader resource is a read-and-write byte-address buffer.
		 * D3D_SIT_UAV_RWBYTEADDRESS
		*/
		ReadWriteByteAddressBuffer = ( ByteAddressBuffer + 1 ) ,
		/**
		 * The shader resource is an append-structured buffer.
		 * D3D_SIT_UAV_APPEND_STRUCTURED
		*/
		AppendStrcturedBuffer = ( ReadWriteByteAddressBuffer + 1 ) ,
		/**
		 * The shader resource is a consume-structured buffer.
		 * D3D_SIT_UAV_CONSUME_STRUCTURED
		*/
		ConsumeStrcturedBuffer = ( AppendStrcturedBuffer + 1 ) ,
		/**
		 * The shader resource is a read-and-write structured buffer that uses the built-in counter to append or consume.
		 * D3D_SIT_UAV_RWSTRUCTURED_WITH_COUNTER
		*/
		ReadWriteStrcturedBufferWithCounter = ( ConsumeStrcturedBuffer + 1 )
	}
}
