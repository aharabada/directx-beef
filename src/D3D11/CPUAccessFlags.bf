namespace DirectX.D3D11
{
	/**
	Specifies the types of CPU access allowed for a resource.
	D3D11_CPU_ACCESS_FLAG
	*/
	public enum CpuAccessFlags : uint32 
	{
		/**
		The resource is to be mappable so that the CPU can change its contents.
		Resources created with this flag cannot be set as outputs of the pipeline and must be created with either dynamic or staging usage.
		D3D11_CPU_ACCESS_WRITE
		*/
        Write = 0x10000L,
		/**
		The resource is to be mappable so that the CPU can read its contents. 
		Resources created with this flag cannot be set as either inputs or outputs to the pipeline and must be created with staging usage.
		D3D11_CPU_ACCESS_READ
		*/
        Read  = 0x20000L,
		/**
		No CPU access. When possible, create resources with no CPU access, as this enables better resource optimization.
		*/
		None = 0
	}
}
