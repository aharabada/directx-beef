namespace DirectX.D3D11
{
	/**
	Indicates triangles facing a particular direction are not drawn.
	D3D11_CULL_MODE
	*/
	public enum CullMode : uint32
	{
		/**
		Always draw all triangles.
		D3D11_CULL_NONE
		*/
		None = 1,
		/**
		Do not draw triangles that are front-facing.
		D3D11_CULL_FRONT
		*/
        Front = 2,
		/**
		Do not draw triangles that are back-facing.
		D3D11_CULL_BACK
		*/
        Back = 3
	}
}
