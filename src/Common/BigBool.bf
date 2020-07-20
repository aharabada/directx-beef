namespace DirectX.Common
{
	/**
	A boolean-value with a size of 32 bits
	*/
	public enum BigBool : int32
	{
		case TRUE = 1;
		case FALSE = 0;

		public static implicit operator bool(BigBool b)
		{
			return b != FALSE;
		}

		public static implicit operator BigBool(bool b)
		{
			return b ? TRUE : FALSE;
		}
	}
}
