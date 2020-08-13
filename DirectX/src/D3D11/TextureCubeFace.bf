namespace DirectX.D3D11
{
	/**
	 * The different faces of a cube texture.
	 * D3D11_TEXTURECUBE_FACE
	*/
	public enum TextureCubeFace : uint32
	{
		/// Positive X face.
		PositiveX = 0,
		/// Negative X face.
		NegativeX = 1,
		/// Positive Y face.
		PositiveY = 2,
		/// Negative Y face.
		NegativeY = 3,
		/// Positive Z face.
		PositiveZ = 4,
		/// Negative Z face.
		NegativeZ = 5,
	}
}
