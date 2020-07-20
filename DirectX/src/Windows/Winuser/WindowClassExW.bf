using System;

namespace DirectX.Windows
{
	/**
	 * Contains window class information.
	*/
	[CRepr]
	public struct WindowClassExW
	{
		/**
		 * The size, in bytes, of this structure.
		 * Set this member to sizeof(WindowClassExW).
		 * Be sure to set this member before calling the GetClassInfoEx function.
		*/
		public UINT StructureSize;
		/**
		 * The class style(s).
		 * This member can be any combination of the Class Styles.
		*/
		public WindowClassStyles Style;
		/**
		 * A pointer to the window procedure.
		 * You must use the CallWindowProc function to call the window procedure.
		*/
		public WNDPROC WindowProcedure;
		/**
		 * The number of extra bytes to allocate following the window-class structure.
		 * The system initializes the bytes to zero.
		*/
		public INT ClassExtra;
		/**
		 * The number of extra bytes to allocate following the window instance.
		 * The system initializes the bytes to zero.
		*/
		public INT WindowExtra;
		/**
		 * A handle to the instance that contains the window procedure for the class.
		*/
		public HINSTANCE HInstance;
		/**
		 * A handle to the class icon.
		 * This member must be a handle to an icon resource.
		 * If this member is NULL, the system provides a default icon.
		*/
		public HICON Icon;
		/**
		 * A handle to the class cursor.
		 * This member must be a handle to a cursor resource.
		 * If this member is NULL, an application must explicitly set the cursor shape whenever the mouse moves into the application's window.
		*/
		public HCURSOR Cursor;
		/**
		 * A handle to the class background brush.
		 * This member can be a handle to the brush to be used for painting the background, or it can be a color value.
		*/
		public HBRUSH BackgroundBrush;
		/**
		 * Pointer to a null-terminated character string that specifies the resource name of the class menu, as the name appears in the resource file.
		 * If you use an integer to identify the menu, use the MAKEINTRESOURCE macro.
		 * If this member is NULL, windows belonging to this class have no default menu.
		*/
		public LPCWSTR MenuName;
		/**
		 * A pointer to a null-terminated string or is an atom..
		*/
		public LPCWSTR ClassName;
		/**
		 * A handle to a small icon that is associated with the window class.
		 * If this member is NULL, the system searches the icon resource specified by the Icon member for an icon of the appropriate size to use as the small icon.
		*/
		public HICON SmallIcon;

		public this()
		{
			this = default;
			StructureSize = sizeof(Self);
		}
	}
}
