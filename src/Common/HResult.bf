namespace DirectX.Common
{
	public enum HResult : int32
	{	
		public const HResult S_OK = (.)0;
		public const HResult S_FALSE = (.)1;
		
		public const HResult E_INVALIDARG = (.)0x80000003L;
		public const HResult E_ABORT = (.)0x80004004L;
		public const HResult E_FAIL = (.)0x80004005L;  
		public const HResult E_FILENOTFOUND = (.)0x80070002L;  
		public const HResult E_ACCESSDENIED = (.)0x80070005L;  
		public const HResult E_OUTOFMEMORY = (.)0x8007000E; 
		public const HResult E_NOTIMPL = (.)0x80004001;

		/**
		The file was not found.
		*/
		public const HResult D3D11_ERROR_FILE_NOT_FOUND = (.)0x887C0002;
 		/**
		There are too many unique instances of a particular type of state object.
		*/
		public const HResult D3D11_ERROR_TOO_MANY_UNIQUE_STATE_OBJECTS = (.)0x887C0001;
 		/**
		There are too many unique instances of a particular type of view object.
		*/
		public const HResult D3D11_ERROR_TOO_MANY_UNIQUE_VIEW_OBJECTS = (.)0x887C0003;
 		/**
		The first call to ID3D11DeviceContext::Map after either ID3D11Device::CreateDeferredContext or ID3D11DeviceContext::FinishCommandList per Resource was not D3D11_MAP_WRITE_DISCARD.
		*/
		public const HResult D3D11_ERROR_DEFERRED_CONTEXT_MAP_WITHOUT_INITIAL_DISCARD = (.)0x887C0004;
		/**
		You tried to use a resource to which you did not have the required access privileges. This error is most typically caused when you write to a shared resource with read-only access.
		*/
		public const HResult DXGI_ERROR_ACCESS_DENIED = (.)0x887A002B;
		/**
		The desktop duplication interface is invalid. The desktop duplication interface typically becomes invalid when a different type of image is displayed on the desktop.
		*/
		public const HResult DXGI_ERROR_ACCESS_LOST = (.)0x887A0026; 
		/**
		The desired element already exists. This is returned by DXGIDeclareAdapterRemovalSupport if it is not the first time that the function is called.
		*/
		public const HResult DXGI_ERROR_ALREADY_EXISTS = (.)0x887A0036L; 
		/**
		DXGI can't provide content protection on the swap chain. This error is typically caused by an older driver, or when you use a swap chain that is incompatible with content protection.
		*/
		public const HResult DXGI_ERROR_CANNOT_PROTECT_CONTENT = (.)0x887A002A;	
		/**
		The application's device failed due to badly formed commands sent by the application. This is an design-time issue that should be investigated and fixed.
		*/
		public const HResult DXGI_ERROR_DEVICE_HUNG = (.)0x887A0006; 
		/**
		The video card has been physically removed from the system, or a driver upgrade for the video card has occurred. The application should destroy and recreate the device. For help debugging the problem, call ID3D??Device::GetDeviceRemovedReason.
		*/
		public const HResult DXGI_ERROR_DEVICE_REMOVED = (.)0x887A0005;	
		/**
		The device failed due to a badly formed command. This is a run-time issue; The application should destroy and recreate the device.
		*/
		public const HResult DXGI_ERROR_DEVICE_RESET = (.)0x887A0007;
		/**
		The driver encountered a problem and was put into the device removed state.
		*/
		public const HResult DXGI_ERROR_DRIVER_INTERNAL_ERROR = (.)0x887A0020;
		/**
		An event (for example, a power cycle) interrupted the gathering of presentation statistics.
		*/
		public const HResult DXGI_ERROR_FRAME_STATISTICS_DISJOINT = (.)0x887A000B; 
		/**
		The application attempted to acquire exclusive ownership of an output, but failed because some other application (or device within the application) already acquired ownership.
		*/
		public const HResult DXGI_ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE = (.)0x887A000C; 
 		/**
		The method call is invalid. For example, a method's parameter may not be a valid pointer.
		*/
		public const HResult DXGI_ERROR_INVALID_CALL = (.)0x887A0001;
 		/**
		The buffer supplied by the application is not big enough to hold the requested data.
		*/
		public const HResult DXGI_ERROR_MORE_DATA = (.)0x887A0003; 
 		/**
		The supplied name of a resource in a call to IDXGIResource1::CreateSharedHandle is already associated with some other resource.
		*/
		public const HResult DXGI_ERROR_NAME_ALREADY_EXISTS = (.)0x887A002C;
 		/**
		A global counter resource is in use, and the Direct3D device can't currently use the counter resource.
		*/
		public const HResult DXGI_ERROR_NONEXCLUSIVE = (.)0x887A0021; 
 		/**
		The resource or request is not currently available, but it might become available later.
		*/
		public const HResult DXGI_ERROR_NOT_CURRENTLY_AVAILABLE = (.)0x887A0022; 
 		/**
		When calling IDXGIObject::GetPrivateData, the GUID passed in is not recognized as one previously passed to IDXGIObject::SetPrivateData or
		IDXGIObject::SetPrivateDataInterface. When calling IDXGIFactory::EnumAdapters or IDXGIAdapter::EnumOutputs, the enumerated ordinal is out of range.
		*/
		public const HResult DXGI_ERROR_NOT_FOUND = (.)0x887A0002; 
 		/**
		Reserved
		*/
		public const HResult DXGI_ERROR_REMOTE_CLIENT_DISCONNECTED = (.)0x887A0023;
 		/**
		Reserved
		*/
		public const HResult DXGI_ERROR_REMOTE_OUTOFMEMORY = (.)0x887A0024;	
 		/**
		The DXGI output (monitor) to which the swap chain content was restricted is now disconnected or changed.
		*/
		public const HResult DXGI_ERROR_RESTRICT_TO_OUTPUT_STALE = (.)0x887A0029;
 		/**
		The operation depends on an SDK component that is missing or mismatched.
		*/
		public const HResult DXGI_ERROR_SDK_COMPONENT_MISSING = (.)0x887A002D;
 		/**
		The Remote Desktop Services session is currently disconnected.
		*/
		public const HResult DXGI_ERROR_SESSION_DISCONNECTED = (.)0x887A0028;  
 		/**
		The requested functionality is not supported by the device or the driver.
		*/
		public const HResult DXGI_ERROR_UNSUPPORTED = (.)0x887A0004; 
 		/**
		The time-out interval elapsed before the next desktop frame was available.
		*/
		public const HResult DXGI_ERROR_WAIT_TIMEOUT = (.)0x887A0027; 
 		/**
		The previous blit operation that is transferring information to or from this surface is incomplete.
		*/
		public const HResult DXGI_ERROR_WAS_STILL_DRAWING = (.)0x887A000A;

		/**
		 * The shared surface and keyed mutex are no longer in a consistent state.
		 * If AcquireSync returns this value, you should release and recreate both the keyed mutex and the shared surface.
		*/
		public const HResult WAIT_ABANDONED = 0x00000080L;

		/**
		 * The time-out interval elapsed before the specified key was released.
		*/
		public const HResult WAIT_TIMEOUT  = 258L;

		public bool Succeeded
		{
			get
			{
				return this > -1;
			}
		}

		public bool Failed
		{
			get
			{
				return this < 0;
			}
		}
	}
}
