using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * An input-layout interface holds a definition of how to feed vertex data that is laid out in memory into the input-assembler stage of the graphics pipeline.
	*/
	public struct ID3D11InputLayout	: ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => .("e4819ddc-4cf0-4025-bd26-5de82a3e07b7");
		
		// This interface doesn't implement any new methods.
	}
}
