namespace DirectX.D3D11.SDKLayers
{
	/**
	D3D11_MESSAGE_SEVERITY
	*/
	public enum MessageSeverity : uint32
	{
		/**
		Defines some type of corruption which has occurred.
		D3D11_MESSAGE_SEVERITY_CORRUPTION
		*/
		Corruption = 0,
		/**
		Defines an error message.
		D3D11_MESSAGE_SEVERITY_ERROR
		*/
	    Error = (Corruption + 1),
		/**
		Defines a warning message.
		D3D11_MESSAGE_SEVERITY_WARNING
		*/
	    Warning = (Error + 1),
		/**
		Defines an information message.
		D3D11_MESSAGE_SEVERITY_INFO
		*/
	    Info = (Warning + 1),
		/**
		Defines a message other than corruption, error, warning, or information.
		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_MESSAGE_SEVERITY_MESSAGE
		*/
	    Message = (Info + 1) 
	}
}
