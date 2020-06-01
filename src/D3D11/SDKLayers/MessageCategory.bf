namespace DirectX.D3D11.SDKLayers
{
	/**
	Categories of debug messages.
	This will identify the category of a message when retrieving a message with ID3D11InfoQueue::GetMessage and when adding a message with ID3D11InfoQueue::AddMessage.
	When creating an info queue filter, these values can be used to allow or deny any categories of messages to pass through the storage and retrieval filters.
	D3D11_MESSAGE_CATEGORY 
	*/
	public enum MessageCategory : uint32
	{
		/**
		User defined message. See ID3D11InfoQueue.AddMessage.
		D3D11_MESSAGE_CATEGORY_APPLICATION_DEFINED
		*/
		ApplicationDefined = 0,
		/**
		D3D11_MESSAGE_CATEGORY_MISCELLANEOUS
		*/
		Miscellaneous = (ApplicationDefined + 1),
		/**
		D3D11_MESSAGE_CATEGORY_INITIALIZATION
		*/
		Initialization = (Miscellaneous + 1),
		/**
		D3D11_MESSAGE_CATEGORY_CLEANUP
		*/
		Cleanup = (Initialization + 1),
		/**
		D3D11_MESSAGE_CATEGORY_COMPILATION
		*/
		Compilation = (Cleanup + 1),
		/**
		D3D11_MESSAGE_CATEGORY_STATE_CREATION
		*/
		StateCreation = (Compilation + 1),
		/**
		D3D11_MESSAGE_CATEGORY_STATE_SETTING
		*/
		StateSetting = (StateCreation + 1),
		/**
		D3D11_MESSAGE_CATEGORY_STATE_GETTING
		*/
		StateGetting = (StateSetting + 1),
		/**
		D3D11_MESSAGE_CATEGORY_RESOURCE_MANIPULATION
		*/
		ResourceManipulation = (StateGetting + 1),
		/**
		D3D11_MESSAGE_CATEGORY_EXECUTION
		*/
		Execution = (ResourceManipulation + 1),
		/**
		Direct3D 11:  This value is not supported until Direct3D 11.1.
		D3D11_MESSAGE_CATEGORY_SHADER
		*/
		Shader = (Execution + 1) 
	}
}
