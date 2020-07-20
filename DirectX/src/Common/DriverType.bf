namespace DirectX.Common
{
	// Native: D3D_DRIVER_TYPE
	public enum DriverType : uint32
	{
	    Unknown = 0, 				// Native: D3D_DRIVER_TYPE_UNKNOWN	= 0,
	    Hardware = Unknown + 1, 	// Native: D3D_DRIVER_TYPE_HARDWARE	= ( D3D_DRIVER_TYPE_UNKNOWN + 1 ) ,
	    Reference = Hardware + 1, 	// Native: D3D_DRIVER_TYPE_REFERENCE	= ( D3D_DRIVER_TYPE_HARDWARE + 1 ) ,
	    Null = Reference + 1, 		// Native: D3D_DRIVER_TYPE_NULL	= ( D3D_DRIVER_TYPE_REFERENCE + 1 ) ,
	    Software = Null + 1, 		// Native: D3D_DRIVER_TYPE_SOFTWARE	= ( D3D_DRIVER_TYPE_NULL + 1 ) ,
	    Warp = Software + 1,			// Native: D3D_DRIVER_TYPE_WARP	= ( D3D_DRIVER_TYPE_SOFTWARE + 1 ) 
	}
}
