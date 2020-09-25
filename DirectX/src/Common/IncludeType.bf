namespace DirectX.Common
{
	/**
	 * Values that indicate the location of a shader #include file.
	 * @native D3D_INCLUDE_TYPE
	 */
	public enum IncludeType : uint32
	{
		/**
		 * The local directory.
		 * @native D3D_INCLUDE_LOCAL and D3D10_INCLUDE_LOCAL
		 */
		Local = 0,
		/**
		 * The system directory.
		 * @native D3D_INCLUDE_SYSTEM and D3D10_INCLUDE_SYSTEM
		 */
		System = (Local + 1)
	}
}
