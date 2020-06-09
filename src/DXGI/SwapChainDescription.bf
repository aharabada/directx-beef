using System;

namespace DirectX.DXGI
{
	[CRepr]
	public struct SwapChainDescription // DXGI_SWAP_CHAIN_DESC
	{
		public ModeDescription BufferDesc;	// DXGI_MODE_DESC
		public SampleDescription SampleDesc; // DXGI_SAMPLE_DESC
		public Usage BufferUsage; // DXGI_USAGE
		public uint32 BufferCount;	// uint
		public Windows.Handle OutputWindow; // HWND
		public bool Windowed;
		public SwapEffect SwapEffect; // DXGI_SWAP_EFFECT
		public SwapChainFlags Flags; // uint
	}
}
