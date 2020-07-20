using System;
using DirectX.Windows;

namespace DirectX.Common
{
	[CRepr]
	/**
	 * Locally Unique Identifier
	*/
	public struct Luid
	{
		DWORD LowPart;
		LONG HighPart;
	}
}
