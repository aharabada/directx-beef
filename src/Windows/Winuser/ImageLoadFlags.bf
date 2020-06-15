namespace DirectX.Windows
{
	public enum ImageLoadFlags : UINT
	{
		/**
		 * The default flag; it does nothing. All it means is "not LR_MONOCHROME". 
		 * LR_DEFAULTCOLOR
		*/
		DefaultColor = 0x00000000,
		/**
		 * When the uType parameter specifies IMAGE_BITMAP, causes the function to return a DIB section bitmap rather than a compatible bitmap.
		 * This flag is useful for loading a bitmap without mapping it to the colors of the display device.
		 * LR_CREATEDIBSECTION
		*/
		CreadeDIBSection = 0x00002000,
		/**
		 * Uses the width or height specified by the system metric values for cursors or icons, if the cxDesired or cyDesired values are set to zero.
		 * If this flag is not specified and cxDesired and cyDesired are set to zero, the function uses the actual resource size.
		 * If the resource contains multiple images, the function uses the size of the first image. 
		 * LR_DEFAULTSIZE
		*/
		DefaultSize = 0x00000040,
		/**
		 * Loads the stand-alone image from the file specified by lpszName (icon, cursor, or bitmap file). 
		 * LR_LOADFROMFILE
		*/
		LoadFromFile = 0x00000010,
		/**
		 * Searches the color table for the image and replaces the following shades of gray with the corresponding 3-D color.
    	 *		- Dk Gray, RGB(128,128,128) with COLOR_3DSHADOW
    	 *		- Gray, RGB(192,192,192) with COLOR_3DFACE
    	 *		- Lt Gray, RGB(223,223,223) with COLOR_3DLIGHT
		 * Do not use this option if you are loading a bitmap with a color depth greater than 8bpp. 
		 * LR_LOADMAP3DCOLORS
		*/
		LoadMap3DColors = 0x00001000,
		/**
		 * Retrieves the color value of the first pixel in the image and replaces the corresponding entry in the color table with the default window color (COLOR_WINDOW).
		 * Do not use this option if you are loading a bitmap with a color depth greater than 8bpp.
		 * LR_LOADTRANSPARENT
		*/
		LoadTransparent = 0x00000020,
		/**
		 * Loads the image in black and white. 
		 * LR_MONOCHROME
		*/
		Monochrome = 0x00000001,
		/**
		 * Shares the image handle if the image is loaded multiple times.
		 * LR_SHARED
		*/
		Shared = 0x00008000,
		/**
		 * Uses true VGA colors.
		 * LR_VGACOLOR
		*/
		VGAColor = 0x00000080
	}
}
