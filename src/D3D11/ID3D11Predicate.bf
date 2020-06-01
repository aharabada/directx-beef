using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	* This interface encapsulates methods for retrieving data from the GPU asynchronously.
	*/
	public struct ID3D11Predicate : ID3D11Query, IComObject
	{
		public static new Guid IID => Guid("9eb576dd-9f77-4d86-81aa-8bab5fe490e2");

		// This interface doesn't implement any new methods.
	}
}
