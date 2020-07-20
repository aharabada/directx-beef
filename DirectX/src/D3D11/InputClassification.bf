namespace DirectX.D3D11
{
	/**
	Type of data contained in an input slot.
	D3D11_INPUT_CLASSIFICATION
	*/
	public enum InputClassification : uint32
	{
		/**
		 Input data is per-vertex data.
		D3D11_INPUT_PER_VERTEX_DATA
		*/
	    PerVertexData	= 0,
		/**
		Input data is per-instance data.
		D3D11_INPUT_PER_INSTANCE_DATA
		*/
	    PerInstanceData	= 1
	}
}
