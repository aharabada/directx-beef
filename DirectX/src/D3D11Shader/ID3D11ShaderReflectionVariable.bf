using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * This shader-reflection interface provides access to a variable.
	*/
	public struct ID3D11ShaderReflectionVariable : IInterfaceID
	{
		public static Guid IID => .(0x51f23923, 0xf3e5, 0x4bd1, 0x91, 0xcb, 0x60, 0x61, 0x77, 0xd8, 0xdb, 0x4c);

		public struct VTable
		{
			public function HResult(ID3D11ShaderReflectionVariable* self, ShaderVariableDescription *pDesc) GetDesc;

			public function ID3D11ShaderReflectionType*(ID3D11ShaderReflectionVariable* self) GetVarType;
			public function ID3D11ShaderReflectionConstantBuffer*(ID3D11ShaderReflectionVariable* self) GetBuffer;

			public function uint32(ID3D11ShaderReflectionVariable* self, uint32 arrayIndex) GetInterfaceSlot;
		}

		protected VTable* _vt;

		public VTable* VT => _vt;
		
		/**
		 * This method returns the buffer of the current ID3D11ShaderReflectionVariable.
		 *
		 * @return Returns a pointer to the ID3D11ShaderReflectionConstantBuffer of the present ID3D11ShaderReflectionVariable.
		*/
		public ID3D11ShaderReflectionConstantBuffer* GetBuffer() mut
		{
			return _vt.GetBuffer(&this);
		}

		/**
		 * Get a shader-variable description.
		 *
		 * @param desc	A reference to a shader-variable description.
		*/
		public HResult GetDescription(out ShaderVariableDescription desc) mut
		{
			desc = ?;
			return _vt.GetDesc(&this, &desc);
		}

		/**
		 * Gets the corresponding interface slot for a variable that represents an interface pointer.
		 *
		 * @param arrayIndex 	Index of the array element to get the slot number for.
		 *						For a non-array variable this value will be zero.
		 * @return Returns the index of the interface in the interface array.
		*/
		public uint32 GetInterfaceSlot(uint32 arrayIndex) mut
		{
			return _vt.GetInterfaceSlot(&this, arrayIndex);
		}


		/**
		 * Get a shader-variable type.
		 *
		 * @return Returns the index of the interface in the interface array.
		*/
		public ID3D11ShaderReflectionType* GetVariableType() mut
		{
			return _vt.GetVarType(&this);
		}
	}
}
