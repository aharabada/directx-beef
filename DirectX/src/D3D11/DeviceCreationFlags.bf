namespace DirectX.D3D11
{
	// Native: D3D11_CREATE_DEVICE_FLAG
	public enum DeviceCreationFlags : uint32
	{
	    None = 0x0, 									// Native: D3D11_CREATE_DEVICE_NONE	= 0x0,
	    Singlethreaded = 0x1, 							// Native: D3D11_CREATE_DEVICE_SINGLETHREADED	= 0x1,
	    Debug = 0x2,									// Native: D3D11_CREATE_DEVICE_DEBUG	= 0x2,
	    SwitchToRef = 0x4,								// Native: D3D11_CREATE_DEVICE_SWITCH_TO_REF	= 0x4,
	    PreventThreadingOptimizations = 0x8, 			// Native: D3D11_CREATE_DEVICE_PREVENT_INTERNAL_THREADING_OPTIMIZATIONS	= 0x8,
	    BrgaSupport = 0x20, 							// Native:  D3D11_CREATE_DEVICE_BGRA_SUPPORT	= 0x20,
	    Debuggable = 0x40, 								// Native: D3D11_CREATE_DEVICE_DEBUGGABLE	= 0x40,
	    PreventAleringLayerSettingsFromRegistry = 0x80, // Native: D3D11_CREATE_DEVICE_PREVENT_ALTERING_LAYER_SETTINGS_FROM_REGISTRY	= 0x80,
	    DisableGpuTimeout = 0x100, 						// Native: D3D11_CREATE_DEVICE_DISABLE_GPU_TIMEOUT	= 0x100,
	    VideoSupport = 0x800 							// Native: D3D11_CREATE_DEVICE_VIDEO_SUPPORT	= 0x800
	}
}
