namespace DirectX.D3D11
{
	/**
	Identify which components of each pixel of a render target are writable during blending.
	These flags can be combined with a bitwise OR.
	D3D11_COLOR_WRITE_ENABLE
	*/
	public enum ColorWriteEnable : uint8
	{
		/**
		Allow data to be stored in the red component.
		*/
		Red = 1,
		/**
		Allow data to be stored in the green component.
		*/
		Green = 2,
		/**
		Allow data to be stored in the blue component.
		*/
		Blue = 4,
		/**
		Allow data to be stored in the alpha component.
		*/
		Alpha = 8,
		/**
		Allow data to be stored in all components.
		*/
		All = .Red | .Green | .Blue | .Alpha
	}
}
