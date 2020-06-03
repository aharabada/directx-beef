namespace DirectX.D3D11
{
	/**
	Values that specify minimum precision levels at shader stages.
	*/
	public enum ShaderMinimumPrecision : uint32
	{
		/**
		 * Indicates that the device only supports 32-bit precision.
		*/
		Precision32BitOny = 0x0,
		/**
		 * Minimum precision level is 10-bit.
		 * D3D11_SHADER_MIN_PRECISION_10_BIT
		*/
        Precision10Bit = 0x1,
		/**
		 * Minimum precision level is 16-bit.
		 * D3D11_SHADER_MIN_PRECISION_16_BIT
		*/
        Precision16Bit = 0x2
	}
}
