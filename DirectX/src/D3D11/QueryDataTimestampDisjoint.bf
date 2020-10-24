namespace DirectX.D3D11
{
	/**
	 * Query information about the reliability of a timestamp query.
	 * @native D3D11_QUERY_DATA_TIMESTAMP_DISJOINT
	 */
	public struct QueryDataTimestampDisjoint
	{
		/**
		 * How frequently the GPU counter increments in Hz.
		 */
		public uint64 Frequency;
		/**
		 * If this is TRUE, something occurred in between the query's ID3D11DeviceContext::Begin and ID3D11DeviceContext::End calls that caused the timestamp counter to become discontinuous or disjoint.
		 */
		public BOOL Disjoint;
	}
}
