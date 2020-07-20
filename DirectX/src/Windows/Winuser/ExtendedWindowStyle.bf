using System;

namespace DirectX.Windows
{
	// Todo: C#ify the names
	/**
	 * The following are the extended window styles.
	*/
	[AllowDuplicates]
	public enum ExtendedWindowStyle : uint32
	{
		/**
		 * The window has a double border;
		 * the window can, optionally, be created with a title bar by specifying the WS_CAPTION style in the dwStyle parameter.
		*/
		WS_EX_DLGMODALFRAME = 0x00000001L,
		/**
		 * The child window created with this style does not send the WM_PARENTNOTIFY message to its parent window when it is created or destroyed.
		*/
		WS_EX_NOPARENTNOTIFY = 0x00000004L,
		/**
		 * The window should be placed above all non-topmost windows and should stay above them, even when the window is deactivated.
		 * To add or remove this style, use the SetWindowPos function.
		*/
		WS_EX_TOPMOST = 0x00000008L,
		/**
		 * The window accepts drag-drop files.
		*/
		WS_EX_ACCEPTFILES = 0x00000010L,
		/**
		 * The window should not be painted until siblings beneath the window (that were created by the same thread) have been painted.
		 * The window appears transparent because the bits of underlying sibling windows have already been painted.
		 * To achieve transparency without these restrictions, use the SetWindowRgn function.
		*/
		WS_EX_TRANSPARENT = 0x00000020L,
		/**
		 * The window is a MDI child window.
		*/
		WS_EX_MDICHILD = 0x00000040L,
		/**
		 * The window is intended to be used as a floating toolbar.
		 * A tool window has a title bar that is shorter than a normal title bar, and the window title is drawn using a smaller font.
		 * A tool window does not appear in the taskbar or in the dialog that appears when the user presses ALT+TAB.
		 * If a tool window has a system menu, its icon is not displayed on the title bar.
		 * However, you can display the system menu by right-clicking or by typing ALT+SPACE. 
		*/
		WS_EX_TOOLWINDOW = 0x00000080L,
		/**
		 * The window has a border with a raised edge.
		*/
		WS_EX_WINDOWEDGE = 0x00000100L,
		/**
		 * The window has a border with a sunken edge.
		*/
		WS_EX_CLIENTEDGE = 0x00000200L,
		/**
		 * The title bar of the window includes a question mark.
		 * When the user clicks the question mark, the cursor changes to a question mark with a pointer.
		 * If the user then clicks a child window, the child receives a WM_HELP message.
		 * The child window should pass the message to the parent window procedure, which should call the WinHelp function using the HELP_WM_HELP command.
		 * The Help application displays a pop-up window that typically contains help for the child window.
		 * WS_EX_CONTEXTHELP cannot be used with the WS_MAXIMIZEBOX or WS_MINIMIZEBOX styles.
		*/
		WS_EX_CONTEXTHELP = 0x00000400L,
		/**
		 * The window has generic "right-aligned" properties.
		 * This depends on the window class.
		 * This style has an effect only if the shell language is Hebrew, Arabic, or another language that supports reading-order alignment; otherwise, the style is ignored.
		 * Using the WS_EX_RIGHT style for static or edit controls has the same effect as using the SS_RIGHT or ES_RIGHT style, respectively.
		 * Using this style with button controls has the same effect as using BS_RIGHT and BS_RIGHTBUTTON styles. 
		*/
		WS_EX_RIGHT = 0x00001000L,
		/**
		 * The window has generic left-aligned properties.
		 * This is the default.
		*/
		WS_EX_LEFT = 0x00000000L,
		/**
		 * If the shell language is Hebrew, Arabic, or another language that supports reading-order alignment, the window text is displayed using right-to-left reading-order properties.
		 * For other languages, the style is ignored.
		*/
		WS_EX_RTLREADING = 0x00002000L,
		/**
		 * The window text is displayed using left-to-right reading-order properties.
		 * This is the default.
		*/
		WS_EX_LTRREADING = 0x00000000L,
		/**
		 * If the shell language is Hebrew, Arabic, or another language that supports reading order alignment, the vertical scroll bar (if present) is to the left of the client area.
		 * For other languages, the style is ignored.
		*/
		WS_EX_LEFTSCROLLBAR = 0x00004000L,
		/**
		 * The vertical scroll bar (if present) is to the right of the client area.
		 * This is the default.
		*/
		WS_EX_RIGHTSCROLLBAR = 0x00000000L,
		/**
		 * The window itself contains child windows that should take part in dialog box navigation.
		 * If this style is specified, the dialog manager recurses into children of this window when performing navigation operations such as handling the TAB key, an arrow key, or a keyboard mnemonic.
		*/
		WS_EX_CONTROLPARENT = 0x00010000L,
		/**
		 * The window has a three-dimensional border style intended to be used for items that do not accept user input.
		*/
		WS_EX_STATICEDGE = 0x00020000L,
		/**
		 * Forces a top-level window onto the taskbar when the window is visible. 
		*/
		WS_EX_APPWINDOW  = 0x00040000L,
		/**
		 * The window is an overlapped window.
		*/
		WS_EX_OVERLAPPEDWINDOW = (WS_EX_WINDOWEDGE | WS_EX_CLIENTEDGE),
		/**
		 * The window is palette window, which is a modeless dialog box that presents an array of commands.
		*/
		WS_EX_PALETTEWINDOW = (WS_EX_WINDOWEDGE | WS_EX_TOOLWINDOW | WS_EX_TOPMOST),
		/**
		 * The window is a layered window.
		 * This style cannot be used if the window has a class style of either CS_OWNDC or CS_CLASSDC.
		 * Windows 8: The WS_EX_LAYERED style is supported for top-level windows and child windows.
		 * Previous Windows versions support WS_EX_LAYERED only for top-level windows.
		*/
		WS_EX_LAYERED = 0x00080000,
		/**
		 * The window does not pass its window layout to its child windows.
		*/
		WS_EX_NOINHERITLAYOUT = 0x00100000L,
		/**
		 * The window does not render to a redirection surface.
		 * This is for windows that do not have visible content or that use mechanisms other than surfaces to provide their visual.
		*/
		WS_EX_NOREDIRECTIONBITMAP = 0x00200000L,
		/**
		 * If the shell language is Hebrew, Arabic, or another language that supports reading order alignment, the horizontal origin of the window is on the right edge.
		 * Increasing horizontal values advance to the left. 
		*/
		WS_EX_LAYOUTRTL = 0x00400000L,
		/**
		 * Paints all descendants of a window in bottom-to-top painting order using double-buffering.
		 * Bottom-to-top painting order allows a descendent window to have translucency (alpha) and transparency (color-key) effects,
		 * but only if the descendent window also has the WS_EX_TRANSPARENT bit set.
		 * Double-buffering allows the window and its descendents to be painted without flicker.
		 * This cannot be used if the window has a class style of either CS_OWNDC or CS_CLASSDC.
		*/
		WS_EX_COMPOSITED = 0x02000000L,
		/**
		 * A top-level window created with this style does not become the foreground window when the user clicks it.
		 * The system does not bring this window to the foreground when the user minimizes or closes the foreground window.
		 * The window should not be activated through programmatic access or via keyboard navigation by accessible technology, such as Narrator.
		 * To activate the window, use the SetActiveWindow or SetForegroundWindow function.
		 * The window does not appear on the taskbar by default. To force the window to appear on the taskbar, use the WS_EX_APPWINDOW style.
		*/
		WS_EX_NOACTIVATE = 0x08000000L,

		/**
		 * The default value. No extended styles defined.
		*/
		None = 0
	}
}
