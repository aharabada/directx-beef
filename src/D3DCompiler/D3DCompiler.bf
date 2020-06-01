using System;
using DirectX.Common;

namespace DirectX.D3DCompiler
{
	static
	{	
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
		Compile HLSL code or an effect file into bytecode for a given target.
		*/
		[LinkName("D3DCompile"), CallingConvention(.Stdcall), CLink]
		private static extern HResult D3DCompile();
		
		/**
		* Compile HLSL code or an effect file into bytecode for a given target.
		@param pFileName A pointer to a constant null-terminated string that contains the name of the file that contains the shader code.
		@param pDefines An optional array of ShaderMacro structures that define shader macros.
				Each macro definition contains a name and a NULL-terminated definition. If not used, set to NULL.			  
		@param pInclude An optional pointer to an ID3DInclude interface that the compiler uses to handle include files.
					If you set this parameter to NULL and the shader contains a #include, a compile error occurs.
					You can pass the D3D_COMPILE_STANDARD_FILE_INCLUDE macro, which is a pointer to a default include handler.
					This default include handler includes files that are relative to the current directory. 
		@param pEntrypoint A pointer to a constant null-terminated string that contains the name of the shader entry point function where shader execution begins.
					When you compile an effect, D3DCompileFromFile ignores pEntrypoint;
					we recommend that you set pEntrypoint to NULL because it is good programming practice to set a pointer parameter to NULL if the called function will not use it.
		@param pTarget A pointer to a constant null-terminated string that specifies the shader target or set of shader features to compile against.
					The shader target can be a shader model (for example, shader model 2, shader model 3, shader model 4, or shader model 5 and later).
					The target can also be an effect type (for example, fx_4_1). For info about the targets that various profiles support, see Specifying Compiler Targets.
		@param shaderCompileFlags A combination of shader compile options that are combined by using a bitwise OR operation.
					The resulting value specifies how the compiler compiles the HLSL code.
		@param effectCompileFlags A combination of effect compile options that are combined by using a bitwise OR operation.
					The resulting value specifies how the compiler compiles the effect. When you compile a shader and not an effect file,
					D3DCompileFromFile ignores effectCompileFlags; we recommend that you set effectCompileFlags to zero because it is good programming practice to set a nonpointer parameter to zero if the called function will not use it.
		@param ppCode A pointer to a variable that receives a pointer to the ID3DBlob interface that you can use to access the compiled code.
		@param ppErrorMsgs An optional pointer to a variable that receives a pointer to the ID3DBlob interface that you can use to access compiler error messages, or NULL if there are no errors.
		@return Returns one of the Direct3D 11 return codes.
		*/
		[Import("d3dcompiler.lib"), LinkName("D3DCompileFromFile"), CallingConvention(.Stdcall), CLink]
		public static extern HResult D3DCompileFromFile(char16 *pFileName, ShaderMacro* pDefines, ID3DInclude* pInclude, char8* pEntryPoint, char8* pTarget,
			ShaderCompileFlags shaderCompileFlags, EffectCompileFlags effectCompileFlags, ID3DBlob** ppCode, ID3DBlob** ppErrorMsgs);
	}
}
