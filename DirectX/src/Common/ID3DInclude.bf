using DirectX.D3DCompiler;
using System;

namespace DirectX.Common
{
	/**
	 * An include interface that the user implements to allow an application to call user-overridable methods for opening and closing shader #include files.
	 */
	public struct ID3DInclude
	{
		public struct VTable
		{
			/**
			 * A user-implemented method for opening and reading the contents of a shader #include file.
			 * @param self A reference to the ID3DInclude object
			 * @param includeType A D3D_INCLUDE_TYPE-typed value that indicates the location of the #include file.
			 * @param pFileName Name of the #include file.
			 * @param pParentName Pointer to the container that includes the #include file. The compiler might pass NULL in pParentData.
			 * 		For more information, see the "Searching for Include Files" section in Compile an Effect (Direct3D 11).
			 * @param ppData Pointer to the buffer that contains the include directives. This pointer remains valid until you callID3DInclude::Close.
			 * @param pBytes Pointer to the number of bytes that Open returns in ppData.
			 * @return The user-implemented method must return S_OK. If Open fails when it reads the #include file,
			 * 	the application programming interface (API) that caused Open to be called fails.
			 * 	This failure can occur in one of the following situations:
    		 * 	- The high-level shader language (HLSL) shader fails one of the D3D10CompileShader*** functions.
    		 * 	- The effect fails one of the D3D10CreateEffect*** functions.
			*/
			public function [CallingConvention(.Stdcall)] HResult(ID3DInclude* self, IncludeType includeType, /*LPCSTR*/ char8 *pFileName, /*LPCVOID*/ void *pParentData, /*LPCVOID*/ void **ppData, uint32 *pBytes) Open;

			/**
			 * A user-implemented method for closing a shader #include file.
			 * @param self A reference to the ID3DInclude object
			 * @param ppData Pointer to the buffer that contains the include directives. This is the pointer that was returned by the corresponding ID3DInclude::Open call.
 			 * @return The user-implemented Close method should return S_OK.
			 * 	If Close fails when it closes the #include file, the application programming interface (API) that caused Close to be called fails.
			 * 	This failure can occur in one of the following situations:
    		 * 		- The high-level shader language (HLSL) shader fails one of the D3D10CompileShader*** functions.
    		 * 		- The effect fails one of the D3D10CreateEffect*** functions.
			*/
			public function [CallingConvention(.Stdcall)] HResult(ID3DInclude* self, /*LPCVOID*/ void **ppData) Close;
		}

		protected VTable* _vt;
		
		public VTable* VT
		{
			get => _vt;
			set mut => _vt = value;
		}

		/**
		 * Can be passed for pInclude in any API and indicates that a simple default include handler should be used.
		 * The include handler will include files relative to the current directory and files relative to the
		 * directory of the initial source file. When used with APIs like D3DCompile pSourceName must be a
		 * file name and the initial relative directory will be derived from it.
		 */
		public static readonly ID3DInclude* StandardInclude = D3DCompiler.D3D_COMPILE_STANDARD_FILE_INCLUDE;
	}
}
