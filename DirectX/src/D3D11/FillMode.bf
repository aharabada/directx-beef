namespace DirectX.D3D11
{
	/**
	Determines the fill mode to use when rendering triangles.
	D3D11_FILL_MODE
	*/
	public enum FillMode : uint32
	{
		/**
		Draw lines connecting the vertices. Adjacent vertices are not drawn.
		D3D11_FILL_WIREFRAME
		*/
		Wireframe = 2,
		/**
		Fill the triangles formed by the vertices. Adjacent vertices are not drawn.
		D3D11_FILL_SOLID
		*/
		Solid = 3
	}
}
