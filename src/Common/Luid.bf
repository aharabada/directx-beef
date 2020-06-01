using System;

namespace DirectX.Common
{
	[CRepr]
	/**
	Locally Unique Identifier
	*/
	public struct Luid
	{
		uint64 LowPart; // DWORD = unsigned long
		int32 HighPart; // LONG = long
	}
}
