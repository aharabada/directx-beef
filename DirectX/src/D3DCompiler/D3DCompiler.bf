using System;
using DirectX.Common;
using DirectX.D3D11Shader;

namespace DirectX.D3DCompiler
{
	public static class D3DCompiler
	{
		public const int D3D_COMPILER_VERSION = 47;

		/**
		 * Reads a file that is on disk into memory.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DReadFileToBlob(char16 *fileName, ID3DBlob **contents);

		/**
		 * Writes a memory blob to a file on disk.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DWriteFileToBlob(ID3DBlob* blob, char16 *fileName, BOOL overwrite);

		// D3DCOMPILE flags:
		public const uint32 D3DCOMPILE_DEBUG = (1 << 0);
		public const uint32 D3DCOMPILE_SKIP_VALIDATION = (1 << 1);
		public const uint32 D3DCOMPILE_SKIP_OPTIMIZATION = (1 << 2);
		public const uint32 D3DCOMPILE_PACK_MATRIX_ROW_MAJOR = (1 << 3);
		public const uint32 D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR = (1 << 4);
		public const uint32 D3DCOMPILE_PARTIAL_PRECISION = (1 << 5);
		public const uint32 D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT = (1 << 6);
		public const uint32 D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT = (1 << 7);
		public const uint32 D3DCOMPILE_NO_PRESHADER =    (1 << 8);
		public const uint32 D3DCOMPILE_AVOID_FLOW_CONTROL =  (1 << 9);
		public const uint32 D3DCOMPILE_PREFER_FLOW_CONTROL = (1 << 10);
		public const uint32 D3DCOMPILE_ENABLE_STRICTNESS =   (1 << 11);
		public const uint32 D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY = (1 << 12);
		public const uint32 D3DCOMPILE_IEEE_STRICTNESS = (1 << 13);
		public const uint32 D3DCOMPILE_OPTIMIZATION_LEVEL0 = (1 << 14);
		public const uint32 D3DCOMPILE_OPTIMIZATION_LEVEL1 = 0;
		public const uint32 D3DCOMPILE_OPTIMIZATION_LEVEL2 = ((1 << 14) | (1 << 15));
		public const uint32 D3DCOMPILE_OPTIMIZATION_LEVEL3 = (1 << 15);
		public const uint32 D3DCOMPILE_RESERVED16 = (1 << 16);
		public const uint32 D3DCOMPILE_RESERVED17 = (1 << 17);
		public const uint32 D3DCOMPILE_WARNINGS_ARE_ERRORS = (1 << 18);
		public const uint32 D3DCOMPILE_RESOURCES_MAY_ALIAS = (1 << 19);
		public const uint32 D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES = (1 << 20);
		public const uint32 D3DCOMPILE_ALL_RESOURCES_BOUND = (1 << 21);
		public const uint32 D3DCOMPILE_DEBUG_NAME_FOR_SOURCE = (1 << 22);
		public const uint32 D3DCOMPILE_DEBUG_NAME_FOR_BINARY  = (1 << 23);

		// D3DCOMPILE_EFFECT flags:
		public const uint32 D3DCOMPILE_EFFECT_CHILD_EFFECT = (1 << 0);
		public const uint32 D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS = (1 << 1);

		// D3DCOMPILE Flags2:
		public const uint32 D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST = 0;
		public const uint32 D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 = (1 << 4);
		public const uint32 D3DCOMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 = (1 << 5);

		/**
		D3D_COMPILE_STANDARD_FILE_INCLUDE can be passed for pInclude in any
		API and indicates that a simple default include handler should be
		used.  The include handler will include files relative to the
		current directory and files relative to the directory of the initial source
		file.  When used with APIs like D3DCompile pSourceName must be a
		file name and the initial relative directory will be derived from it.
		*/
		public static readonly ID3DInclude* D3D_COMPILE_STANDARD_FILE_INCLUDE = ((ID3DInclude*)(void*)1);

		/**
		 * Compile HLSL code or an effect file into bytecode for a given target.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DCompile(void *srcData, uint srcDataSize, char8 *sourceName, ShaderMacro *defines,
			ID3DInclude *include, char8 *entrypoint, char8 *target, ShaderCompileFlags shaderFlags, EffectCompileFlags effectFlags, ID3DBlob **code, ID3DBlob **errorMsgs);

		/**
		 * Compiles Microsoft High Level Shader Language (HLSL) code into bytecode for a given target.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DCompile2(void *srcData, uint srcDataSize, char8 *sourceName, ShaderMacro *defines, ID3DInclude *include, char8 *entrypoint, char8 *target,
			ShaderCompileFlags shaderFlags, EffectCompileFlags effectFlags, SecondaryDataFlags secondaryDataFlags, void *secondaryData, uint secondaryDataSize, ID3DBlob **code, ID3DBlob **errorMsgs);

		/**
		* Compile HLSL code or an effect file into bytecode for a given target.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DCompileFromFile(char16 *fileName, ShaderMacro* defines, ID3DInclude* include, char8* entryPoint, char8* target,
			ShaderCompileFlags shaderCompileFlags, EffectCompileFlags effectCompileFlags, ID3DBlob** code, ID3DBlob** errorMsgs);

		/**
		 * Preprocesses uncompiled HLSL code.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DPreprocess(void *srcData, uint srcDataSize, char8 *sourceName, ShaderMacro* defines, ID3DInclude* include, ID3DBlob** code, ID3DBlob** errorMsgs);

		/**
		 * Gets shader debug information.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DGetDebugInfo(void *srcData, uint srcDataSize, ID3DBlob** debugInfo);

		/**
		 * Gets a pointer to a reflection interface.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DReflect(void *srcData, uint srcDataSize, Guid* riid, void** reflector);
		
		/**
		 * Gets a pointer to a reflection interface.
		*/
		public static HResult D3DReflect<T>(void *srcData, uint srcDataSize, T** reflector) where T : IUnknown, IComObject
		{
			Guid iid = T.IID;
			return D3DReflect(srcData, srcDataSize, &iid, (.)reflector);
		}

		/**
		 * Creates a library-reflection interface from source data that contains an HLSL library of functions.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DReflectLibrary(void *srcData, uint srcDataSize, Guid* riid, void** reflector);
		
		/**
		 * Gets a pointer to a reflection interface.
		*/
		public static HResult D3DReflectLibrary<T>(void *srcData, uint srcDataSize, T** reflector) where T : IUnknown, IComObject
		{
			Guid iid = T.IID;
			return D3DReflectLibrary(srcData, srcDataSize, &iid, (.)reflector);
		}

		public const uint32 D3D_DISASM_ENABLE_COLOR_CODE            = 0x00000001;
		public const uint32 D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS  = 0x00000002;
		public const uint32 D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING = 0x00000004;
		public const uint32 D3D_DISASM_ENABLE_INSTRUCTION_CYCLE     = 0x00000008;
		public const uint32 D3D_DISASM_DISABLE_DEBUG_INFO           = 0x00000010;
		public const uint32 D3D_DISASM_ENABLE_INSTRUCTION_OFFSET    = 0x00000020;
		public const uint32 D3D_DISASM_INSTRUCTION_ONLY             = 0x00000040;
		public const uint32 D3D_DISASM_PRINT_HEX_LITERALS           = 0x00000080;

		/**
		 * Disassembles compiled HLSL code.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DDisassemble(void *srcData, uint srcDataSize, DisassembleFlags flags, char8* comments, ID3DBlob** disassembly);

		/**
		 * Disassembles a specific region of compiled Microsoft High Level Shader Language (HLSL) code.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DDisassembleRegion(void *srcData, uint srcDataSize, DisassembleFlags flags, char8* comments, uint startByteOffset, uint numInsts, uint *finishByteOffset, ID3DBlob** disassembly);

		/**
		 * Creates a linker interface.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DCreateLinker(ID3D11Linker** linker);

		/**
		 * Creates a shader module interface from source data for the shader module.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DLoadModule(void *srcData, uint srcDataSize, ID3D11Module** module);

		/**
		 * Creates a function-linking-graph interface.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DCreateFunctionLinkingGraph(uint flags, ID3D11FunctionLinkingGraph** functionLinkingGraph);

		public const uint32 D3D_GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE = 0x00000001;

		/**
		 * Retrieves the byte offsets for instructions within a section of shader code.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DGetTraceInstructionOffsets(void *srcData, uint srcDataSize, GetTraceInstructionOffsetFlags flags, uint startInstIndex, uint numInsts, uint *offsets, uint *totalInsts);

		/**
		 * Gets the input signature from a compilation result.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DGetInputSignatureBlob(void *srcData, uint srcDataSize, ID3DBlob** sinatureBlob);

		/**
		 * Gets the output signature from a compilation result.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DGetOutputSignatureBlob(void *srcData, uint srcDataSize, ID3DBlob** sinatureBlob);

		/**
		 * Gets the input and output signatures from a compilation result.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DGetInputAndOutputSignatureBlob(void *srcData, uint srcDataSSize, ID3DBlob** sinatureBlob);

		/**
		 * Removes unwanted blobs from a compilation result.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DStripShader(void *shaderBytecode, uint bytecodeLength, StripFlags stripFlags, ID3DBlob** strippedBlob);

		/**
		 * Retrieves a specific part from a compilation result.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DGetBlobPart(void *srcData, uint srcDataSize, BlobPartFlags flags, ID3DBlob** ppPart);

		/**
		 * RSets information in a compilation result.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DSetBlobPart(void *srcData, uint srcDataSize, BlobPartFlags part, uint32 flags, void *pPart, uint partSize, ID3DBlob** newShader);

		/**
		 * Creates a buffer.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DCreateBlob(uint size, ID3DBlob** blob);

		public const uint32 D3D_COMPRESS_SHADER_KEEP_ALL_PARTS = 0x00000001;

		/**
		 * Compresses a set of shaders into a more compact form.
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DCompressShaders(uint32 numShaders, D3DShaderData *shaderDatas, CompressShaderFlags flags, ID3DBlob** compressedData);

		/**
		 * Decompresses one or more shaders from a compressed set. 
		*/
		[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DDecompressShaders(void* srcData, uint srcDataSize, uint32 numShaders, uint32 startIndex, uint32 *indices, DecompressShaderFlags flags, ID3DBlob** shaders, uint32* totalShaders);

		/**
		 * Disassembles compiled HLSL code from a Direct3D10 effect.
		*/
		//[Import("d3dcompiler.lib"), CallingConvention(.Stdcall), CLink]
		//public static extern HResult D3DDisassemble10Effect(ID3D10Effect *pEffect, uint32 flags, ID3DBlob** disassembly);
	}
}
