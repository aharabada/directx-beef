using System;
using DirectX.Common;
using System.Diagnostics;

namespace SimpleTriangleExample
{
	public struct ComError
	{

	}

	/// Provides convenient functions for printing error.
	public static class ErrorPrinter
	{
		/**
		 * Prints the error message contained by a Blob.
		 * @param blob The ID3DBlob containing the error message.
		*/
		public static void PrintErrorBlob(ID3DBlob* blob)
		{
			if(blob == null)
				return;

			Debug.WriteLine(scope String((char8*)blob.GetBufferPointer(), blob.GetBufferSize()));
		}

		[CallingConvention(.Cdecl), LinkName("FormatMessageW")]
		public static extern uint32 FormatMessageW(uint32 dwFlags, void* lpSouce, uint32 dwMessageId, uint32 dwLangugageId, char16* lpBuffer, uint32 nSize, char8* arguments);

		public static uint32 FORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100;
		public static uint32 FORMAT_MESSAGE_ARGUMENT_ARRAY = 0x00002000;
		public static uint32 FORMAT_MESSAGE_FROM_HMODULE = 0x00000800;
		public static uint32 FORMAT_MESSAGE_FROM_STRING = 0x00000400;
		public static uint32 FORMAT_MESSAGE_FROM_SYSTEM = 0x00001000;
		public static uint32 FORMAT_MESSAGE_IGNORE_INSERTS = 0x00000200;

		public static mixin MakeLangId(uint16 primarylanguage, uint16 sublanguage)
		{
			//Deprecated? MAKELANGID(p, s)       ((((WORD  )(s)) << 10) | (WORD  )(p))
			((((uint16)(sublanguage)) << 10) | (uint16)(primarylanguage))
		}

		public static uint16 LANG_NEUTRAL = 0x00;
		public static uint16 SUBLANG_DEFAULT = 0x01;

		/**
		 * Prints the message associated with the given HResult.
		 */
		public static void PrintHResult(HResult hResult)
		{
			char16* wCharMsg = ?;

			FormatMessageW(FORMAT_MESSAGE_ALLOCATE_BUFFER|
			    FORMAT_MESSAGE_FROM_SYSTEM |
			    FORMAT_MESSAGE_IGNORE_INSERTS,
				null,
				(uint32)hResult,
				MakeLangId!(LANG_NEUTRAL, SUBLANG_DEFAULT),
				(char16*)&wCharMsg,
				0,
				null);

			if(wCharMsg != null)
			{
				Debug.WriteLine(scope String(wCharMsg));
			}
			else
			{
				String msg = scope .("Unknown Error: ");
				hResult.ToString(msg);
				Debug.Write(msg);
			}
		}
	}
}
