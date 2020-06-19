using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	// Todo: continue
	/**
	 * A function-reflection interface accesses function info. 
	*/
	public struct ID3D11FunctionReflection : IInterfaceID
	{
		public static Guid IID => .(0x207bcecb, 0xd683, 0x4a06, 0xa8, 0xa3, 0x9b, 0x14, 0x9b, 0x9f, 0x73, 0xa4);

		public struct VTable
		{
			public function HResult(ID3D11FunctionReflection* self, FunctionDescription *pDesc) GetDesc;
			
			public function ID3D11ShaderReflectionConstantBuffer*(ID3D11FunctionReflection* self, uint32 index) GetConstantBufferByIndex;
			public function ID3D11ShaderReflectionConstantBuffer*(ID3D11FunctionReflection* self, char8* name) GetConstantBufferByName;
			
			public function HResult(ID3D11FunctionReflection* self, uint32 resourceIndex, ShaderInputBindDescription *pDesc) GetResourceBindingDesc;
			
			public function ID3D11ShaderReflectionVariable*(ID3D11FunctionReflection* self, char8* name) GetVariableByName;
			
			public function HResult(ID3D11FunctionReflection* self, char8* name, ShaderInputBindDescription *pDesc) GetResourceBindingDescByName;

			// Use D3D_RETURN_PARAMETER_INDEX to get description of the return value.
			public function ID3D11FunctionParameterReflection*(ID3D11FunctionReflection* self, int32 parameterIndex) GetFunctionParameter;
		}

		protected VTable* _vt;

		public VTable* VT => _vt;

		/**
		 * Gets a constant buffer by index for a function.
		 *
		 * @param bufferIndex	Zero-based index.
		 * @return A pointer to a ID3D11ShaderReflectionConstantBuffer interface that represents the constant buffer.
		*/
		public ID3D11ShaderReflectionConstantBuffer* GetConstantBufferByIndex(uint32 bufferIndex) mut
		{
			return VT.GetConstantBufferByIndex(&this, bufferIndex);
		}

		/**
		 * Gets a constant buffer by name for a function.
		 *
		 * @param name	The constant-buffer name.
		 * @return A pointer to a ID3D11ShaderReflectionConstantBuffer interface that represents the constant buffer.
		*/
		public ID3D11ShaderReflectionConstantBuffer* GetConstantBufferByName(char8* name) mut
		{
			return VT.GetConstantBufferByName(&this, name);
		}

		/**
		 * Fills the function descriptor structure for the function.
		 *
		 * @param desc	A reference to a FunctionDescription structure that receives a description of the function.
		*/
		public HResult GetDescription(out FunctionDescription desc) mut
		{
			desc = ?;
			return _vt.GetDesc(&this, &desc);
		}

		/**
		 * Gets the function parameter reflector.
		 *
		 * @param parameterIndex	The zero-based index of the function parameter reflector to retrieve.
		 * @return A pointer to a ID3D11FunctionParameterReflection interface that represents the function parameter reflector.
		*/
		public ID3D11FunctionParameterReflection* GetFunctionParameter(int32 parameterIndex) mut
		{
			return VT.GetFunctionParameter(&this, parameterIndex);
		}

		/**
		 * Gets a description of how a resource is bound to a function.
		 *
		 * @param resourceIndex	A zero-based resource index.
		 * @param desc			A reference to a ShaderInputBindDescription structure that describes input binding of the resource.
		*/
		public HResult GetResourceBindingDescription(uint32 resourceIndex, out ShaderInputBindDescription desc) mut
		{
			desc = ?;
			return VT.GetResourceBindingDesc(&this, resourceIndex, &desc);
		}

		/**
		 * Gets a description of how a resource is bound to a function.
		 *
		 * @param name	The constant-buffer name of the resource.
		 * @param desc	A reference to a ShaderInputBindDescription structure that describes input binding of the resource.
		*/
		public HResult GetResourceBindingDescriptionByName(char8* name, out ShaderInputBindDescription desc) mut
		{
			desc = ?;
			return VT.GetResourceBindingDescByName(&this, name, &desc);
		}

		/**
		 * Gets a variable by name.
		 *
		 * @param name A pointer to a string containing the variable name.
		 * @return Returns a ID3D11ShaderReflectionVariable interface.
		*/
		public ID3D11ShaderReflectionVariable* GetVariableByName(char8* name) mut
		{
			return VT.GetVariableByName(&this, name);
		}
	}
}