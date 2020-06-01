using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	public struct ID3D11GeometryShader : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("38325b96-effb-4022-ba02-2e795b70275c");

		// This interface doesn't implement any new methods.
	}
}