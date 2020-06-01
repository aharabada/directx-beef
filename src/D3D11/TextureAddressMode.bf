namespace DirectX.D3D11
{
	/**
	Identify a technique for resolving texture coordinates that are outside of the boundaries of a texture.
	D3D11_TEXTURE_ADDRESS_MODE
	*/
	public enum TextureAddressMode : uint32
	{
		/**
		Tile the texture at every (u,v) integer junction. For example, for u values between 0 and 3, the texture is repeated three times.
		D3D11_TEXTURE_ADDRESS_WRAP
		*/
		Wrap = 1,
		/**
		Flip the texture at every (u,v) integer junction. For u values between 0 and 1, for example, the texture is addressed normally;
		between 1 and 2, the texture is flipped (mirrored); between 2 and 3, the texture is normal again; and so on.
		D3D11_TEXTURE_ADDRESS_MIRROR
		*/
		Mirror = 2,
		/**
		Texture coordinates outside the range [0.0, 1.0] are set to the texture color at 0.0 or 1.0, respectively.
		D3D11_TEXTURE_ADDRESS_CLAMP
		*/
		Clamp = 3,
		/**
		Texture coordinates outside the range [0.0, 1.0] are set to the border color specified in D3D11_SAMPLER_DESC or HLSL code.
		D3D11_TEXTURE_ADDRESS_BORDER
		*/
		Border = 4,
		/**
		Similar to D3D11_TEXTURE_ADDRESS_MIRROR and D3D11_TEXTURE_ADDRESS_CLAMP.
		Takes the absolute value of the texture coordinate (thus, mirroring around 0), and then clamps to the maximum value.
		D3D11_TEXTURE_ADDRESS_MIRROR_ONCE
		*/
		MirrorOnce = 5
	}
}
