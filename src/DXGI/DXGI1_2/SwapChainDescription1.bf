using System; 
using DirectX.DXGI;

namespace DirectX.DXGI.DXGI1_2
{
	[CRepr]
	public struct SwapChainDescription1 // DXGI_SWAP_CHAIN_DESC1
	{
		public uint32 Width;
		public uint32 Height;
		public Format Format;
		public bool Stereo;
		public SampleDescription SampleDescription;
		public Usage BufferUsage;
		public uint32 BufferCount;
		public DXGI1_2.Scaling Scaling;
		public SwapEffect SwapEffect; // DXGI_SWAP_EFFECT
		public AlphaMode AlphaMode;
		public SwapChainFlags Flags; // uint
	}
}

