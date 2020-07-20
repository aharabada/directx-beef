namespace DirectX.DXGI
{
	public enum MapFlags : uint32
	{
		/**
		 * Allow CPU read access.
		*/
		Read = 1,
		/**
		 * Allow CPU write access.
		*/
		Write = 2,
		/**
		 * Discard the previous contents of a resource when it is mapped.
		*/
		Discard = 4
	}
}
