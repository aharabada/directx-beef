namespace DirectX.D3DCompiler
{
	/**
	 * Values that identify parts of the content of an arbitrary length data buffer.
	*/
	public enum BlobPartFlags : uint32
	{
		/**
		 * The blob part is an input signature.
		 * D3D_BLOB_INPUT_SIGNATURE_BLOB
		*/
		InputSignatureBlob,
		/**
		 * The blob part is an output signature.
		 * D3D_BLOB_OUTPUT_SIGNATURE_BLOB
		*/
		OutputSignatureBlob,
		/**
		 * The blob part is an input and output signature.
		 * D3D_BLOB_INPUT_AND_OUTPUT_SIGNATURE_BLOB
		*/
		InputAndOutputSignatureBlob,
		/**
		 * The blob part is a patch constant signature.
		 * D3D_BLOB_PATCH_CONSTANT_SIGNATURE_BLOB
		*/
		PatchConstantSignatureBlob,
		/**
		 * The blob part is all signature.
		 * D3D_BLOB_ALL_SIGNATURE_BLOB
		*/
		AllSignatureBlob,
		/**
		 * The blob part is debug information.
		 * D3D_BLOB_DEBUG_INFO
		*/
		DebugInfo,
		/**
		 * The blob part is a legacy shader.
		 * D3D_BLOB_LEGACY_SHADER
		*/
		LegacyShader,
		/**
		 * The blob part is an XNA prepass shader.
		 * D3D_BLOB_XNA_PREPASS_SHADER
		*/
		XnaPrepassShader,
		/**
		 * The blob part is an XNA shader.
		 * D3D_BLOB_XNA_SHADER
		*/
		XnaShader,
		/**
		 * The blob part is program database (PDB) information.
		 * D3D_BLOB_PDB
		*/
		PDB,
		/**
		 * The blob part is private data.
		 * D3D_BLOB_PRIVATE_DATA
		*/
		PrivateData,
		/**
		 * The blob part is a root signature.
		 * D3D_BLOB_ROOT_SIGNATURE
		*/
		RootSignature,
		/**
		 * The blob part is the debug name of the shader.
		 * If the application does not specify the debug name itself,
		 * an auto-generated name matching the PDB file of the shader is provided instead.
		 * D3D_BLOB_DEBUG_NAME
		*/
		DebugName,

		// Test parts are only produced by special compiler versions and so
		// are usually not present in shaders.
		/**
		 * The blob part is a test alternate shader.
		 * D3D_BLOB_TEST_ALTERNATE_SHADER 
		*/
		TestAlternativeShader = 0x8000,
		/**
		 * The blob part is test compilation details.
		 * D3D_BLOB_TEST_COMPILE_DETAILS
		*/
		TestCompileDetails,
		/**
		 * The blob part is test compilation performance.
		 * D3D_BLOB_TEST_COMPILE_PERF
		*/
		TestCompilePerformance,
		/**
		 * The blob part is a test compilation report.
		 * D3D_BLOB_TEST_COMPILE_REPORT
		*/
		TestCompileReport,
	}
}
