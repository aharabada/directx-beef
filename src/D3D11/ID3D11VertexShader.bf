using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	public struct ID3D11VertexShader : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("3b301d64-d678-4289-8897-22f8928b72f3");
		
		// This interface doesn't implement any new methods.
	}
}
