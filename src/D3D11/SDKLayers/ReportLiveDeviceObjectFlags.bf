namespace DirectX.D3D11.SDKLayers
{
	/**
	Options for the amount of information to report about a device object's lifetime.
	D3D11_RLDO_FLAGS
	*/
	public enum ReportLiveDeviceObjectFlags : uint32
	{
		/**
		Specifies to obtain a summary about a device object's lifetime.
		D3D11_RLDO_SUMMARY
		*/
		Summary = 0x1,
		/**
		Specifies to obtain detailed information about a device object's lifetime.
		D3D11_RLDO_DETAIL
		*/
		Detail 	= 0x2,
		/**
		This flag indicates to ignore objects which have no external refcounts keeping them alive. 
		D3D objects are printed using an external refcount and an internal refcount. Typically, all objects are printed.
		This flag means ignore the objects whose external refcount is 0, because the application is not responsible for keeping them alive.
		D3D11_RLDO_IGNORE_INTERNAL
		*/
		IgnoreInternal = 0x4
	}
}
