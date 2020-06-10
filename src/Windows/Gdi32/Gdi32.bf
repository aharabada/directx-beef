using System;

namespace DirectX.Windows.Gdi32
{
	static
	{
		/**
		 * The GetStockObject function retrieves a handle to one of the stock pens, brushes, fonts, or palettes.
		 *
		 * @param i	The type of stock object.
		 *
		 * @return 	If the function succeeds, the return value is a handle to the requested logical object.
		 * 			If the function fails, the return value is NULL.
		*/
		[Import("Gdi32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern int GetStockObject(int32 i);

		/**
		 * The CreateSolidBrush function creates a logical brush that has the specified solid color.
		 * @param color	The color of the brush.
		 * @return	If the function succeeds, the return value identifies a logical brush.
		 * 			If the function fails, the return value is NULL.
		*/
		[Import("Gdi32.lib"), CallingConvention(.Stdcall), CLink]
		public static extern HBRUSH CreateSolidBrush(DWORD color);

		/**
		 * The CreateSolidBrush function creates a logical brush that has the specified solid color.
		 * @param r	The red value of the color of the brush.
		 * @param g	The green value of the color of the brush.
		 * @param b	The blue value of the color of the brush.
		 * @return	If the function succeeds, the return value identifies a logical brush.
		 * 			If the function fails, the return value is NULL.
		*/
		public static HBRUSH CreateSolidBrush(uint8 r, uint8 g, uint8 b)
		{
			uint32 dword = ((.)b << 16) | ((.)g << 8) | r;
			return CreateSolidBrush(dword);
		}
	}
}
