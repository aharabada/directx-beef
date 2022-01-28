using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * This shader-reflection interface provides access to a constant buffer.
	*/
	public struct ID3D11ShaderReflectionConstantBuffer : IInterfaceID
	{
		public static Guid IID => .(0xeb62d63d, 0x93dd, 0x4318, 0x8a, 0xe8, 0xc6, 0xf8, 0x3a, 0xd3, 0x71, 0xb8);

		public struct VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflectionConstantBuffer* self, ShaderBufferDescription *pDesc) GetDesc;

			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionVariable*(ID3D11ShaderReflectionConstantBuffer* self, uint32 index) GetVariableByIndex;
			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionVariable*(ID3D11ShaderReflectionConstantBuffer* self, char8* name) GetVariableByName;
		}

		protected VTable* _vt;

		public VTable* VT => _vt;

		/**
		 * Get a constant-buffer description.
		 *
		 * @param desc	A pointer to a ShaderBufferDescription, which represents a shader-buffer description.
		*/
		public HResult GetDescription(out ShaderBufferDescription desc) mut
		{
			desc = ?;
			return _vt.GetDesc(&this, &desc);
		}

		/**
		 * Get a shader-reflection variable by index.
		 *
		 * @param index	Zero-based index.
		 * @return A pointer to a shader-reflection variable interface.
		*/
		public ID3D11ShaderReflectionVariable* GetVariableByIndex(uint32 index) mut
		{
			return _vt.GetVariableByIndex(&this, index);
		}

		/**
		 * Get a shader-reflection variable by name.
		 *
		 * @param name	Variable name.
		 * @return	Returns a sentinel object (end of list marker).
		 *			To determine if GetVariableByName successfully completed, call ID3D11ShaderReflectionVariable::GetDesc and check the returned HRESULT;
		 *			any return value other than success means that GetVariableByName failed.
		*/
		public ID3D11ShaderReflectionVariable* GetVariableByName(char8* name) mut
		{
			return _vt.GetVariableByName(&this, name);
		}
	}
}
