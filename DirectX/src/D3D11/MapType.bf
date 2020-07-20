namespace DirectX.D3D11
{
	/**
	Identifies a resource to be accessed for reading and writing by the CPU. Applications may combine one or more of these flags.
	D3D11_MAP
	*/
	public enum MapType : uint32
	{
		/**
		Resource is mapped for reading. 
		The resource must have been created with read access.
 		D3D11_MAP_READ
		*/
	    Read = 1,
		/**
		Resource is mapped for writing. 
		The resource must have been created with write access.
		D3D11_MAP_WRITE
		*/
	    Write = 2,
		/**
		Resource is mapped for reading and writing. 
		The resource must have been created with read and write access.
		access.
		D3D11_MAP_READ_WRITE
		*/
	    ReadWrite = 3,
		/**
		Resource is mapped for writing; the previous contents of the resource will be undefined.
		The resource must have been created with write access and dynamic usage.
		D3D11_MAP_WRITE_DISCARD
		*/
	    WriteDiscard = 4,
		/**
		Resource is mapped for writing; the existing contents of the resource cannot be overwritten. 
		This flag is only valid on vertex and index buffers. 
		The resource must have been created with write access. 
		Cannot be used on a resource created with the D3D11_BIND_CONSTANT_BUFFER flag. 
		D3D11_MAP_WRITE_NO_OVERWRITE
		*/
	    WriteNoOverwrite = 5
	}
}
