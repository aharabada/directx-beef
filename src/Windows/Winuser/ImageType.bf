namespace DirectX.Windows.Winuser
{
	/**
	 * The type of image to be loaded.
	*/
	public enum ImageType : UINT
	{
		/**
		 * Loads a bitmap.
		 * IMAGE_BITMAP
		*/
		Bitmap = 0,
		/**
		 * Loads an icon.
		 * IMAGE_ICON
		*/
		Icon = 1,
		/**
		 * Loads a cursor.
		 * IMAGE_CURSOR
		*/
		Cursor = 2
	}
}
