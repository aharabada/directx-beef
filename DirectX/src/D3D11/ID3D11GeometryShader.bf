using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A geometry-shader interface manages an executable program (a geometry shader) that controls the geometry-shader stage.
	*/
	public struct ID3D11GeometryShader : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("38325b96-effb-4022-ba02-2e795b70275c");

		// This interface doesn't implement any new methods.
	}
}