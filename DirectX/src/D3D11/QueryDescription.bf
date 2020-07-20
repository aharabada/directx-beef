using System;

namespace DirectX.D3D11
{
	/** Describes a query. */
	[CRepr]
	public struct QueryDescription
	{
		/**	Type of query. */
		public Query Query;
		/** Miscellaneous flags. */
		public QueryMiscFlags MiscFlags;
	}
}
