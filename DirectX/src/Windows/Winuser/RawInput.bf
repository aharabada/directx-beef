using System;

namespace DirectX.Windows.Winuser.RawInput
{
	/**
	 * Contains the raw input from a device.
	*/
	[CRepr]
	public struct RAWINPUT
	{
		/**
		 * The raw input data.
		*/
		public RAWINPUTHEADER Header;

		[Union]
		public struct RAWINPUTDATA
		{
			public RAWMOUSE Mouse;
		}

		public RAWINPUTDATA Data;
	}

	/**
	 * Contains information about the state of the mouse.
	*/
	[CRepr]
	public struct RAWMOUSE
	{
		public const uint16 MOUSE_MOVE_RELATIVE = 0;
		public const uint16 MOUSE_MOVE_ABSOLUTE = 1;
		public const uint16 MOUSE_VIRTUAL_DESKTOP = 2;
		public const uint16 MOUSE_ATTRIBUTES_CHANGED = 4;
		public const uint16 MOUSE_MOVE_NOCOALESCE = 8;

		[Union]
		public struct DUMMYUNIONNAME
		{
			/// Reserved.
			public uint32 ulButtons;
			
			[CRepr]
			public struct DUMMYSTRUCTNAME
			{
				/// The transition state of the mouse buttons.
				public uint16 usButtonFlags;
				public uint16 usButtonData;
			};

			public DUMMYSTRUCTNAME DUMMYSTRUCTNAME;
		}

		public uint16 usFlags;
		public DUMMYUNIONNAME DUMMYUNIONNAME;
		public uint32  ulRawButtons;
		public int32   lLastX;
		public int32   lLastY;
		public uint32  ulExtraInformation;
	}

	static
	{
		/// Get the raw data from the RAWINPUT structure.
		public const uint32 RID_INPUT = 0x10000003;

		/// Get the header information from the RAWINPUT structure.
		public const uint32 RID_HEADER = 0x10000005;

		/// Retrieves the raw input from the specified device.
		[Import("user32.lib"), CLink]
		public static extern uint32 GetRawInputData(Windows.Handle hRawInput, uint32 uiCommand, void* pData, uint32* pcbSize, uint32 cbSizeHeader);

		/**
		 * Sent to the window that is getting raw input.
		*/
		public const uint32 WM_INPUT = 0x00FF;

		/**
		 * Input occurred while the application was in the foreground.
		*/
		public const uint32 RIM_INPUT = 0;
		/**
		 * Input occurred while the application was not in the foreground.
		*/
		public const uint32 RIM_INPUTSINK = 1;

		/// Raw input comes from the mouse.
		public const uint32 RIM_TYPEMOUSE = 0;
		/// Raw input comes from the keyboard.
		public const uint32 RIM_TYPEKEYBOARD = 1;
		/// Raw input comes from some device that is not a keyboard or a mouse.
		public const uint32 RIM_TYPEHID = 2;

		public const uint32 RIDEV_REMOVE         =   0x00000001;
		public const uint32 RIDEV_EXCLUDE        =   0x00000010;
		public const uint32 RIDEV_PAGEONLY       =   0x00000020;
		public const uint32 RIDEV_NOLEGACY       =   0x00000030;
		public const uint32 RIDEV_INPUTSINK      =   0x00000100;
		public const uint32 RIDEV_CAPTUREMOUSE   =   0x00000200;
		public const uint32 RIDEV_NOHOTKEYS      =   0x00000200;
		public const uint32 RIDEV_APPKEYS        =   0x00000400;
		public const uint32 RIDEV_EXINPUTSINK    =   0x00001000;
		public const uint32 RIDEV_DEVNOTIFY      =   0x00002000;
		public const uint32 RIDEV_EXMODEMASK     =   0x000000F0;

		public const uint32 RI_MOUSE_LEFT_BUTTON_DOWN  = 0x0001;  // Left Button changed to down.
		public const uint32 RI_MOUSE_LEFT_BUTTON_UP    = 0x0002;  // Left Button changed to up.
		public const uint32 RI_MOUSE_RIGHT_BUTTON_DOWN = 0x0004;  // Right Button changed to down.
		public const uint32 RI_MOUSE_RIGHT_BUTTON_UP   = 0x0008;  // Right Button changed to up.
		public const uint32 RI_MOUSE_MIDDLE_BUTTON_DOWN= 0x0010;  // Middle Button changed to down.
		public const uint32 RI_MOUSE_MIDDLE_BUTTON_UP  = 0x0020;  // Middle Button changed to up.
		
		public const uint32 RI_MOUSE_BUTTON_1_DOWN   =   RI_MOUSE_LEFT_BUTTON_DOWN;
		public const uint32 RI_MOUSE_BUTTON_1_UP     =   RI_MOUSE_LEFT_BUTTON_UP;
		public const uint32 RI_MOUSE_BUTTON_2_DOWN   =   RI_MOUSE_RIGHT_BUTTON_DOWN;
		public const uint32 RI_MOUSE_BUTTON_2_UP     =   RI_MOUSE_RIGHT_BUTTON_UP;
		public const uint32 RI_MOUSE_BUTTON_3_DOWN   =   RI_MOUSE_MIDDLE_BUTTON_DOWN;
		public const uint32 RI_MOUSE_BUTTON_3_UP     =   RI_MOUSE_MIDDLE_BUTTON_UP;
		
		public const uint32 RI_MOUSE_BUTTON_4_DOWN   =   0x0040;
		public const uint32 RI_MOUSE_BUTTON_4_UP     =   0x0080;
		public const uint32 RI_MOUSE_BUTTON_5_DOWN   =   0x0100;
		public const uint32 RI_MOUSE_BUTTON_5_UP     =   0x0200;
		
				/*
				 * If usButtonFlags has RI_MOUSE_WHEEL, the wheel delta is stored in usButtonData.
				 * Take it as a signed value.
				 */
		public const uint32 RI_MOUSE_WHEEL          =    0x0400;
		public const uint32 RI_MOUSE_HWHEEL         =    0x0800;
	}
}
