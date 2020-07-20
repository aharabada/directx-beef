namespace DirectX.D3D11
{
	/**
	Comparison options.
	D3D11_COMPARISON_FUNC
	*/
	public enum ComparisonFunction : uint32
	{
		/**
		Never pass the comparison.
		D3D11_COMPARISON_NEVER
		*/
	    Never = 1,
		/**
		If the source data is less than the destination data, the comparison passes. 
		D3D11_COMPARISON_LESS
		*/
	    Less = 2,
		/**
		If the source data is equal to the destination data, the comparison passes. 
		D3D11_COMPARISON_EQUAL
		*/
	    Equal = 3,
		/**
		If the source data is less than or equal to the destination data, the comparison passes. 
		D3D11_COMPARISON_LESS_EQUAL
		*/
	    LessOrEqual = 4,
		/**
		If the source data is greater than the destination data, the comparison passes. 
		D3D11_COMPARISON_GREATER
		*/
	    Greater = 5,
		/**
		If the source data is not equal to the destination data, the comparison passes. 
		D3D11_COMPARISON_NOT_EQUAL
		*/
	    NotEqual = 6,
		/**
		If the source data is greater than or equal to the destination data, the comparison passes. 
		D3D11_COMPARISON_GREATER_EQUAL
		*/
	    GreaterOrEqual = 7,
		/**
		Always pass the comparison. 
		D3D11_COMPARISON_ALWAYS
		*/
	    Always = 8
	}
}
