namespace DirectX.Windows.Winuser
{
	/**
	The message box button that has been pressed.
	*/
	public enum MessageBoxResult : UINT
	{
		/**
		The OK button was selected.
		*/
		Ok = 1,
		/**
		The Cancel button was selected.
		*/
		Cancel = 2,
		/**
		The Abort button was selected.
		*/
		Abort = 3,
		/**
		The Retry button was selected.
		*/
		Retry = 4,
		/**
		The Ignore button was selected.
		*/
		Ignore = 5,
		/**
		The Yes button was selected.
		*/
		Yes = 6,
		/**
		The No button was selected.
		*/
		No = 7,
		/**
		The Try Again button was selected.
		*/
		TryAgain = 10,
		/**
		The Continue button was selected.
		*/
		Continue = 11,
	}
}
