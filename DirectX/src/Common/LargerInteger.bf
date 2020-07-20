using System;

namespace DirectX.Common
{
	// Todo: das wird niemals funktionieren!
	[Union]
	public struct LargerInteger
	{
		struct DUMMYSTRUCTNAME
		{
			uint32 LowPart;
			int32 HighPart;
		}struct u
		{
			uint32 LowPart;
			int32 HighPart;
		}
	    int64 QuadPart;
	}

	/*
	typedef union _LARGE_INTEGER {
	    struct {
	        DWORD LowPart;
	        LONG HighPart;
	    } DUMMYSTRUCTNAME;
	    struct {
	        DWORD LowPart;
	        LONG HighPart;
	    } u;
	    LONGLONG QuadPart;
	} LARGE_INTEGER;
	*/
}
