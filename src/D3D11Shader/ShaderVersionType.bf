namespace DirectX.D3D11Shader
{
	/**
	 * Indicates shader type.
	 * D3D11_SHADER_VERSION_TYPE
	*/
	public enum ShaderVersionType : uint32
	{
		/**
		 * Pixel Shader.
		 * D3D11_SHVER_PIXEL_SHADER
		*/
		PixelShader = 0,
		/**
		 * Vertex Shader.
		 * D3D11_SHVER_VERTEX_SHADER
		*/
		VertexShader = 1,
		/**
		 * Geometry Shader.
		 * D3D11_SHVER_GEOMETRY_SHADER
		*/
		GeometryShader = 2,

		// D3D11 Shaders
		/**
		 * Hull Shader.
		 * D3D11_SHVER_HULL_SHADER
		*/
		HullShader = 3,
		/**
		 * Domain Shader.
		 * D3D11_SHVER_DOMAIN_SHADER
		*/
		DomainShader = 4,
		/**
		 * Compute shader.
		 * D3D11_SHVER_COMPUTE_SHADER
		*/
		ComputeShader = 5,

		/**
		 * Indicates the end of the enumeration constants.
		 * D3D11_SHVER_RESERVED0
		*/
		Reserved0 = 0xFFF0,
	}
}
