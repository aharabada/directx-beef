namespace DirectX.Common
{
	/**
	A boolean-value with a size of 32 bits
	*/
	public struct BigBool : int32
	{
		public static implicit operator bool(BigBool b)
		{
			return b != 0;
		}

		public static implicit operator BigBool(bool b)
		{
			return b ? 1 : 0;
		}
	}
}
