namespace DirectX.D3D11
{
	/**
	Specifies how the CPU should respond when an application calls the ID3D11DeviceContext::Map method on a resource that is being used by the GPU.
	*/
	public enum MapFlags : uint32
	{
		/**
		Specifies that ID3D11DeviceContext::Map should return DXGI_ERROR_WAS_STILL_DRAWING when the GPU blocks the CPU from accessing a resource. 
		D3D11_MAP_FLAG_DO_NOT_WAIT
		*/
		DoNotWait = 0x100000L,
		/**
		No mapflags specified
		*/
		None = 0,
	}
}
