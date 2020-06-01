using System;

namespace DirectX.Windows
{
	typealias word = uint16;
	typealias atom = word;

	static
	{
		[Import("WinUser"), LinkName("RegisterClassExW"), CallingConvention(.Stdcall), CLink]
		public static extern atom RegisterClassExW(WindowClassExtended* windowClass);
	}
}
