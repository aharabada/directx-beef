using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A compute-shader interface manages an executable program (a compute shader) that controls the compute-shader stage.
	*/
	public struct ID3D11ComputeShader : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("4f5b196e-c2bd-495e-bd01-1fded38e4969");
		
		// This interface doesn't implement any new methods.
	}
}
