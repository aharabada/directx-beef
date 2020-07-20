using System;
using DirectX.Windows;
using DirectX.Windows.Winuser;
using DirectX.Windows.Kernel32;
using DirectX.Math;

namespace Example
{
	public struct WindowRectangle
	{
		public int32 X;
		public int32 Y;
		public int32 Width;
		public int32 Height;

		public this()
		{
			this = default;
		}

		public this(int32 x, int32 y, int32 width, int32 height)
		{
			X = x;
			Y = y;
			Width = width;
			Height = height;
		}
	}

	public class Window
	{
		private Windows.HInstance _instanceHandle;
		private Windows.HWnd _windowHandle;

		private WindowClassExW _windowClass;

		private WindowRectangle _rectangle;

		public Windows.HInstance InstanceHandle => _instanceHandle;

		public Windows.HWnd WindowHandle => _windowHandle;

		/**
		 * Gets or Sets the text in the window's titlebar.
		 * Note: Get returns a new string that the user has to free.
		*/
		public String Text
		{
			get
			{
				int32 length = GetWindowTextLengthW(_windowHandle) + 1;

				char16[] chars = scope char16[length];

				GetWindowTextW(_windowHandle, chars.CArray(), length);

				return new String(chars);
			}
			set
			{
				SetWindowTextW(_windowHandle, value.ToScopedNativeWChar!());
			}
		}

		/**
		 * Gets or Sets the user data pointer associated with the window.
		*/
		public void* UserData
		{
			get
			{
				return (void*)GetWindowLongPtrW(_windowHandle, GWL_USERDATA);
			}
			set
			{
				SetWindowLongPtrW(_windowHandle, GWL_USERDATA, (.)value);
			}
		}

		// Todo: report bug, Compiler doesn't find Global constants
		public this(String windowTitle, WindowClassExW windowClass, int32 x = Winuser.CW_USEDEFAULT, int32 y = Winuser.CW_USEDEFAULT, int32 width = Winuser.CW_USEDEFAULT, int32 height = Winuser.CW_USEDEFAULT)
		{
			_instanceHandle = (.)GetModuleHandleW(null);

			_windowClass = windowClass;

			Runtime.Assert(RegisterClassExW(ref _windowClass) != 0, "Failed to register window class.");
			
			_rectangle.X = x;
			_rectangle.Y = y;
			_rectangle.Width = width;
			_rectangle.Height = height;

			_windowHandle = CreateWindowExW(.None, _windowClass.ClassName, windowTitle.ToScopedNativeWChar!(), WindowStyles.WS_OVERLAPPEDWINDOW | WindowStyles.WS_VISIBLE,
				_rectangle.X, _rectangle.Y, _rectangle.Width, _rectangle.Height, 0, 0, _instanceHandle, null);

			UpdateWindowRectangle();
		}

		private void UpdateWindowRectangle()
		{
			Rectangle rect;
			GetWindowRect(_windowHandle, out rect);

			_rectangle.X = rect.Left;
			_rectangle.Y = rect.Right;
			_rectangle.Width = rect.Right - rect.Left;
			_rectangle.Height = rect.Bottom - rect.Top;
		}

		public static T* GetUserDataPointer<T>(Windows.HWnd windowHandle)
		{
			return (T*)(void*)GetWindowLongPtrW(windowHandle, GWL_USERDATA);
		}

		public static T GetUserData<T>(Windows.HWnd windowHandle) where T : class
		{
			T* data = GetUserDataPointer<T>(windowHandle);

			return data != null ? *data : null;
		}
	}
}
