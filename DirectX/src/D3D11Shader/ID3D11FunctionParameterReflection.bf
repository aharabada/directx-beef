using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * A function-parameter-reflection interface accesses function-parameter info.
	*/
	public struct ID3D11FunctionParameterReflection : IInterfaceID
	{
		public static Guid IID => .(0x42757488, 0x334f, 0x47fe, 0x98, 0x2e, 0x1a, 0x65, 0xd0, 0x8c, 0xc4, 0x62);

		public struct VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(ID3D11FunctionParameterReflection* self, ParameterDescription *pDesc) GetDesc;
		}

		protected VTable _vt;

		public VTable VT => _vt;

		/**
		 * Fills the parameter descriptor structure for the function's parameter.
		 *
		 * @param desc	A reference to a ParameterDescription structure that receives a description of the function's parameter.
		*/
		public HResult GetDescription(out ParameterDescription desc) mut
		{
			desc = ?;
			return _vt.GetDesc(&this, &desc);
		}
	}
}
