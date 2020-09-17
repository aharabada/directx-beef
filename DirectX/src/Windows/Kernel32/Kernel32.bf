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
		
		[Import("Kernel32.lib"), CLink]
		public static extern uint32 FormatMessageW(uint32 dwFlags, void* lpSouce, uint32 dwMessageId, uint32 dwLangugageId, char16* lpBuffer, uint32 nSize, char8* arguments);

		public const uint32 FORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100;
		public const uint32 FORMAT_MESSAGE_ARGUMENT_ARRAY = 0x00002000;
		public const uint32 FORMAT_MESSAGE_FROM_HMODULE = 0x00000800;
		public const uint32 FORMAT_MESSAGE_FROM_STRING = 0x00000400;
		public const uint32 FORMAT_MESSAGE_FROM_SYSTEM = 0x00001000;
		public const uint32 FORMAT_MESSAGE_IGNORE_INSERTS = 0x00000200;

		/**
		 * A slightly more convenient variant of FormatMessageW
		*/
		[Import("Kernel32.lib"), LinkName("FormatMessageW")]
		public static extern uint32 FormatMessage(MessageFormatFlags dwFlags, void* lpSouce, uint32 dwMessageId, uint32 dwLangugageId, char16* lpBuffer, uint32 nSize, char8* arguments);

		public static mixin MakeLangId(uint16 primarylanguage, uint16 sublanguage)
		{
			//Deprecated? MAKELANGID(p, s)       ((((WORD  )(s)) << 10) | (WORD  )(p))
			((((uint16)(sublanguage)) << 10) | (uint16)(primarylanguage))
		}

		public const uint16 LANG_NEUTRAL = 0x00;
		public const uint16 SUBLANG_DEFAULT = 0x01;
	}

	/**
	 * Formatting options for FormatMessage.
	 */
	public enum MessageFormatFlags : uint32
	{
		/**
		 * The function allocates a buffer large enough to hold the formatted message, and places a pointer to the allocated buffer at the address specified by lpBuffer.
		 * @native FORMAT_MESSAGE_ALLOCATE_BUFFER
		 */
		AllocateBuffer = 0x00000100,
		/**
		 * The Arguments parameter is not a va_list structure, but is a pointer to an array of values that represent the arguments.
		 * @native FORMAT_MESSAGE_ARGUMENT_ARRAY
		 */
		ArgumentArray = 0x00002000,
		/**
		 * The lpSource parameter is a module handle containing the message-table resource(s) to search.
		 * @native FORMAT_MESSAGE_FROM_HMODULE
		 */
		FromHModule = 0x00000800,
		/**
		 * The lpSource parameter is a pointer to a null-terminated string that contains a message definition.
		 * @native FORMAT_MESSAGE_FROM_STRING
		 */
		FromString = 0x00000400,
		/**
		 * The function should search the system message-table resource(s) for the requested message.
		 * @native FORMAT_MESSAGE_FROM_SYSTEM
		 */
		FromSystem = 0x00001000,
		/**
		 * Insert sequences in the message definition are to be ignored and passed through to the output buffer unchanged.
		 * @native FORMAT_MESSAGE_IGNORE_INSERTS
		 */
		IgnoreInserts = 0x00000200,
	}
}
