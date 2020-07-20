using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A pixel-shader interface manages an executable program (a pixel shader) that controls the pixel-shader stage.
	*/
	public struct ID3D11PixelShader : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("ea82e40d-51dc-4f33-93d4-db7c9125ae8c");
		
		// This interface doesn't implement any new methods.
	}
}
