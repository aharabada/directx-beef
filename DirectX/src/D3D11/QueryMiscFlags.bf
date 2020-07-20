namespace DirectX.D3D11
{
	/** Flags that describe miscellaneous query behavior. */
	public enum QueryMiscFlags : UINT
	{
		/**
		No query misc flags
		*/
		None = 0,
		/**
		* Tell the hardware that if it is not yet sure if something is hidden or not to draw it anyway.
		* This is only used with an occlusion predicate.
		* Predication data cannot be returned to your application via ID3D11DeviceContext::GetData when using this flag.
		* D3D11_QUERY_MISC_PREDICATEHINT
		*/
		PredicateHint = 1
	}
}
