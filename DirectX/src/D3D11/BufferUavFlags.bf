namespace DirectX.D3D11
{
	/**
 	 * Identifies unordered-access view options for a buffer resource.
	*/
	public enum BufferUavFlags : uint32
	{
		/**
		 * Resource contains raw, unstructured data.
		 * Requires the UAV format to be Format.R32_Typeless.
		 * D3D11_BUFFER_UAV_FLAG_RAW
		*/
		Raw = 0x1,
		/**
		 * Allow data to be appended to the end of the buffer.
		 * BufferUavFlags.Append flag must also be used for any
		 * view that will be used as a AppendStructuredBuffer or a ConsumeStructuredBuffer.
		 * Requires the UAV format to be Format.Unknown.
		 * D3D11_BUFFER_UAV_FLAG_APPEND
		*/
        Append = 0x2,
		/**
		 * Adds a counter to the unordered-access-view buffer.
		 * BufferUavFlags.Counter can only be used on a UAV that is a RWStructuredBuffer and it
		 * enables the functionality needed for the IncrementCounterand DecrementCounter methods in HLSL.
		 * Requires the UAV format to be DXGI_FORMAT_UNKNOWN.
		 * D3D11_BUFFER_UAV_FLAG_COUNTER
		*/
        Counter = 0x4
	}
}
