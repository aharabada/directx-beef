namespace DirectX.D3D11
{
	/**
	Device context options.
	D3D11_DEVICE_CONTEXT_TYPE
	*/
	public enum DeviceContextType : uint32
	{
		/**
		The device context is an immediate context.
		D3D11_DEVICE_CONTEXT_IMMEDIATE
		*/
		Immediate = 0,
		/**
		The device context is a deferred context.
		D3D11_DEVICE_CONTEXT_DEFERRED
		*/
		Deferred = 1
	}
}
