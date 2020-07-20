using System;

namespace DirectX.Windows
{

	[AllowDuplicates]
	public enum SystemColor : uint32
	{
		/**
		 * Scroll bar gray area.
		 * COLOR_SCROLLBAR
		*/
		ScrollBar = 0,
		/**
		 * Desktop.
		 * COLOR_BACKGROUND
		*/
		Background = 1,
		/**
		 * Active window title bar.
		 * The associated foreground color is CaptionText (COLOR_CAPTIONTEXT).
		 * COLOR_ACTIVECAPTION
		*/
		ActiveCaption= 2,
		/**
		 * nactive window caption.
		 * The associated foreground color is InactiveCaptionText (COLOR_INACTIVECAPTIONTEXT).
		 * COLOR_INACTIVECAPTION
		*/
		InactiveCaption = 3,
		/**
		 * Menu background.
		 * The associated foreground color is MenuText (COLOR_MENUTEXT).
		 * COLOR_MENU
		*/
		Menu = 4,
		/**
		 * Window background.
		 * The associated foreground colors are WindowText (COLOR_WINDOWTEXT) and HotLite (COLOR_HOTLITE). 
		 * COLOR_WINDOW
		*/
		Window = 5,
		/**
		 * Window frame. 
		 * COLOR_WINDOWFRAME
		*/
		WindowFrame = 6,
		/**
		 * Text in menus.
		 * The associated background color is Menu (COLOR_MENU). 
		 * COLOR_MENUTEXT
		*/
		MenuText = 7,
		/**
		 * Text in windows.
		 * The associated background color is Window (COLOR_WINDOW).
		 * COLOR_WINDOWTEXT
		*/
		WindowText = 8,
		/**
		 * Text in caption, size box, and scroll bar arrow box.
		 * The associated background color is ActiveCaption (COLOR_ACTIVECAPTION). 
		 * COLOR_CAPTIONTEXT
		*/
		CaptionText = 9,
		/**
		 * Active window border.
		 * COLOR_ACTIVEBORDER
		*/
		ActiveBorder = 10,
		/**
		 * Inactive window border.
		 * COLOR_INACTIVEBORDER
		*/
		InactiveBorder   = 11,
		/**
		 * Background color of multiple document interface (MDI) applications.
		 * COLOR_APPWORKSPACE
		*/
		AppWorkspace     = 12,
		/**
		 * Item(s) selected in a control.
		 * The associated foreground color is HighlightText (COLOR_HIGHLIGHTTEXT). 
		 * COLOR_HIGHLIGHT
		*/
		Highlight = 13,
		/**
		 * Text of item(s) selected in a control.
		 * The associated background color is Highlight (COLOR_HIGHLIGHT). 
		 * COLOR_HIGHLIGHTTEXT
		*/
		HighlightText = 14,
		/**
		 * Face color for three-dimensional display elements and for dialog box backgrounds.
		 * The associated foreground color is ButtonText (COLOR_BTNTEXT). 
		 * COLOR_BTNFACE
		*/
		ButtonFace = 15,
		/**
		 * Shadow color for three-dimensional display elements (for edges facing away from the light source). 
		 * COLOR_BTNSHADOW
		*/
		ButtonShadow = 16,
		/**
		 * Grayed (disabled) text.
		 * This color is set to 0 if the current display driver does not support a solid gray color.
		 * COLOR_GRAYTEXT
		*/
		GrayText = 17,
		/**
		 * Text on push buttons.
		 * The associated background color is ButtonFace (COLOR_BTNFACE). 
		 * COLOR_BTNTEXT
		*/
		ButtonText = 18,
		/**
		 * Color of text in an inactive caption.
		 * The associated background color is InactiveCaption (COLOR_INACTIVECAPTION).
		 * COLOR_INACTIVECAPTIONTEXT
		*/
		InactiveCaptionText = 19,
		/**
		 * Highlight color for three-dimensional display elements (for edges facing the light source.) 
		 * COLOR_BTNHIGHLIGHT
		*/
		ButtonHighlight = 20,
		/**
		 * Dark shadow for three-dimensional display elements.
		 * COLOR_3DDKSHADOW
		*/
		DarkShadow3D = 21,
		/**
		 * Light color for three-dimensional display elements (for edges facing the light source.)
		 * COLOR_3DLIGHT
		*/
		Light3D = 22,
		/**
		 * Text color for tooltip controls.
		 * The associated background color is InfoBackground (COLOR_INFOBK). 
		 * COLOR_INFOTEXT
		*/
		InfoText = 23,
		/**
		 * Background color for tooltip controls. The associated foreground color is InfoText (COLOR_INFOTEXT).
		 * COLOR_INFOBK
		*/
		InfoBackground = 24,
		/**
		 * Color for a hyperlink or hot-tracked item.
		 * The associated background color is Window (COLOR_WINDOW).
		 * COLOR_HOTLIGHT
		*/
		HotLight = 26,
		/**
		 * Right side color in the color gradient of an active window's title bar.
		 * ActiveCaption (COLOR_ACTIVECAPTION) specifies the left side color.
		 * COLOR_GRADIENTACTIVECAPTION
		*/
		GradientActiveCaption = 27,
		/**
		 * Right side color in the color gradient of an inactive window's title bar.
		 * InactiveCaption (COLOR_INACTIVECAPTION) specifies the left side color. 
		 * COLOR_GRADIENTINACTIVECAPTION
		*/
		GradientInactiveCaption = 28,
		/**
		 * The color used to highlight menu items when the menu appears as a flat menu (see SystemParametersInfo).
		 * The highlighted menu item is outlined with Highlight (COLOR_HIGHLIGHT). 
		 * COLOR_MENUHILIGHT
		*/
		MenuHighlight = 29,
		/**
		 * The background color for the menu bar when menus appear as flat menus (see SystemParametersInfo).
		 * However, Menu (COLOR_MENU) continues to specify the background color of the menu popup.
		 * COLOR_MENUBAR
		*/
		Menubar = 30,
		/**
		 * Desktop.
		 * COLOR_DESKTOP
		*/
		Desktop = Background,
		/**
		 * Face color for three-dimensional display elements and for dialog box backgrounds. 
		 * COLOR_3DFACE
		*/
		Face = ButtonFace,
		/**
		 * Shadow color for three-dimensional display elements (for edges facing away from the light source). 
		 * COLOR_3DSHADOW
		*/
		Shadow3D = ButtonShadow,
		/**
		 * Highlight color for three-dimensional display elements (for edges facing the light source.) 
		 * COLOR_3DHIGHLIGHT
		*/
		Highlight3D = ButtonHighlight
	}
}
