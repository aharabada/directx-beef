using System;

namespace DirectX.Common
{
	static
	{
		//[Import("msvcrt.dll"), LinkName("memcpy"), CLink]
		[Intrinsic("memcpy")]
		public static extern void* MemCpy(void* dest, void* src, uint64 count);
	}
}
