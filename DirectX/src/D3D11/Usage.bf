namespace DirectX.D3D11
{
	/**
	Identifies expected resource use during rendering.
	The usage directly reflects whether a resource is accessible by the CPU and/or the graphics processing unit (GPU). 
	D3D11_USAGE
	*/
	public enum Usage : uint32
	{
		/**
		A resource that requires read and write access by the GPU. This is likely to be the most common usage choice. 
		D3D11_USAGE_DEFAULT
		*/
		Default	= 0,
		/**
		A resource that can only be read by the GPU. It cannot be written by the GPU, and cannot be accessed at all by the CPU. 
		This type of resource must be initialized when it is created, since it cannot be changed after creation.
		D3D11_USAGE_IMMUTABLE
		*/
		Immutable = 1,
		/**
		A resource that is accessible by both the GPU (read only) and the CPU (write only). 
		A dynamic resource is a good choice for a resource that will be updated by the CPU at least once per frame. 
		To update a dynamic resource, use a Map method.
		D3D11_USAGE_DYNAMIC
		*/
		Dynamic = 2,
		/**
		A resource that supports data transfer (copy) from the GPU to the CPU.
		D3D11_USAGE_STAGING
		*/
		Staging = 3
	}
}
