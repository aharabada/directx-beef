using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	* A hull-shader interface manages an executable program (a hull shader) that controls the hull-shader stage.
	*/
	public struct ID3D11HullShader : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("8e5c6061-628a-4c8e-8264-bbe45cb3d5dd");

		// This interface doesn't implement any new methods.
	}
}