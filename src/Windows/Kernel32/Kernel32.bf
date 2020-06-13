using System;

namespace DirectX.Windows.Kernel32
{
	static
	{
		/**
		 * Retrieves the calling thread's last-error code value.
		 * The last-error code is maintained on a per-thread basis.
		 * Multiple threads do not overwrite each other's last-error code.
		 *
		 * @return The return value is the calling thread's last-error code.
		*/
		[Import("Kernel32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern DWORD GetLastError();

		/**
		 * Retrieves a module handle for the specified module.
		 * The module must have been loaded by the calling process.
		 *
		 * @param moduleName	The name of the loaded module (either a .dll or .exe file).
		 *						If this parameter is NULL, GetModuleHandle returns a handle to the file used to create the calling process (.exe file).
		 *
		 * @return 	If the function succeeds, the return value is a handle to the specified module.
		 *			If the function fails, the return value is NULL.
		*/
		[Import("Kernel32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HMODULE GetModuleHandleW(LPCWSTR moduleName);
	}
}
