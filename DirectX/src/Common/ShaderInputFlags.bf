namespace DirectX.Common
{
	/**
	 * Values that identify shader-input options.
	 * D3D_SHADER_INPUT_FLAGS
	*/
	public enum ShaderInputFlags : uint32
	{
		/**
		 * Assign a shader input to a register based on the register assignment in the HLSL code (instead of letting the compiler choose the register).
		 * D3D_SIF_USERPACKED
		*/
		Userpacked = 0x1,
		/**
		 * Use a comparison sampler, which uses the SampleCmp (DirectX HLSL Texture Object) and SampleCmpLevelZero (DirectX HLSL Texture Object) sampling functions.
		 * D3D_SIF_COMPARISON_SAMPLER
		*/
		ComparisonSampler = 0x2,
		/**
		 * A 2-bit value for encoding texture components.
		 * D3D_SIF_TEXTURE_COMPONENT_0
		*/
		TextureComponents0 = 0x4,
		/**
		 * A 2-bit value for encoding texture components.
		 * D3D_SIF_TEXTURE_COMPONENT_1
		*/
		TextureComponents1 = 0x8,
		/**
		 * A 2-bit value for encoding texture components.
		 * D3D_SIF_TEXTURE_COMPONENTS
		*/
		TextureComponents = 0xc,
		/**
		 * This value is reserved.
		 * D3D_SIF_UNUSED
		*/
		Unused = 0x10,
		/**
		 * Forces the enumeration to compile to 32 bits.
		 * This value is not used directly by titles.
		 * D3D_SIF_FORCE_DWORD
		*/
		ForceDWord = 0x7fffffff
	}
}
