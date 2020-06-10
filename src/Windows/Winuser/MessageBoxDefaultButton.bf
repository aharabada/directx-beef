namespace DirectX.Windows.Winuser
{
	/**
	Indicates the default button of the message box.
	*/
	public enum MessageBoxDefaultButton : UINT
	{
		/**
		The first button is the default button.

		(Button1) MB_DEFBUTTON1 is the default unless (Button2)MB_DEFBUTTON2, (Button3)MB_DEFBUTTON3, or (Button4)MB_DEFBUTTON4 is specified.
		MB_DEFBUTTON1
		*/
		Button1 = 0x00000000L,
		/**
		The second button is the default button.
		MB_DEFBUTTON2
		*/
		Button2 = 0x00000100L,
		/**
		The third button is the default button.
		MB_DEFBUTTON3
		*/
		Button3 = 0x00000200L,
		/**
		The fourth button is the default button.
		MB_DEFBUTTON4
		*/
		Button4 = 0x00000300L,
	}
}
