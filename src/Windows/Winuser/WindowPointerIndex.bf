namespace DirectX.Windows.Winuser
{
	/**
	 * The zero-based offset to a value in a window.
	 * Used for GetWindowLongPtr and SetWindowLongPtr
	*/
	public enum WindowPointerIndex : int32
	{
		/**
		 * Retrieves the extended window styles.
		 * GWL_EXSTYLE
		*/
		ExStyle = -20,
		/**
		 * Retrieves a handle to the application instance. 
		 * GWLP_HINSTANCE
		*/
		HInstance = -6,
		/**
		 * Retrieves a handle to the parent window, if there is one. 
		 * GWLP_HWNDPARENT
		*/
		Parent = -8,
		/**
		 * Retrieves the identifier of the window.
		 * GWLP_ID
		*/
		ID = -12,
		/**
		 * Retrieves the window styles. 
		 * GWL_STYLE
		*/
		Style = -16,
		/**
		 * Retrieves the user data associated with the window.
		 * This data is intended for use by the application that created the window.
		 * Its value is initially zero. 
		 * GWLP_USERDATA 
		*/
		UserData = -21,
		/**
		 * Retrieves the pointer to the window procedure, or a handle representing the pointer to the window procedure.
		 * You must use the CallWindowProc function to call the window procedure. 
		 * GWLP_WNDPROC
		*/
		WindowProcedure = -4,
	}
}
