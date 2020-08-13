using System;

namespace DirectX.D3D11
{
	/** Describes a query. */
	[CRepr]
	public struct QueryDescription
	{
		/// Type of query.
		public Query Query;
		/// Miscellaneous flags.
		public QueryMiscFlags MiscFlags;

		/**
		 * Instantiates a new instance of an uninitialized QueryDescription structure.
		 */
		public this()
		{
			this =default;
		}

		/**
		 * Instantiates a new instance of a QueryDescription structure that is initialized with info for a query.
		 * @param query A Query-typed value that specifies the type of query.
		 * @param miscFlags A combination of QueryMiscFlags-typed values that are combined by using a bitwise OR operation.
		 * 					The resulting value specifies miscellaneous query behavior.
		*/
		public this(Query query, QueryMiscFlags miscFlags = .None)
		{
			Query = query;
			MiscFlags = miscFlags;
		}
	}
}
