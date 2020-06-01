using System;

namespace DirectX.D3D11
{
	[CRepr]
	public struct D3D11_TEXCUBE_ARRAY_SRV
	{
		public uint32 MostDetailedMip;
		public uint32 MipLevels;
		public uint32 First2DArrayFace;
		public uint32 NumCubes;
	}
}
