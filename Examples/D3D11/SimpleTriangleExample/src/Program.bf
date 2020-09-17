using System;
using DirectX.Math;
using DirectX.Windows;
using DirectX.Windows.Winuser;
using DirectX.Windows.Kernel32;
using DirectX.Windows.WindowMessages;

namespace SimpleTriangleExample
{
	class Program
	{
		public static int Main()
		{
			Game game = new Game();

			HINSTANCE hInstance = (.)GetModuleHandleW(null);

			WindowClassExW winClass = .();
			winClass.Style = .HorizontalRedrawOnChange | .VerticalRedrawOnChange;
			winClass.WindowProcedure = => MessageHandler;
			winClass.HInstance = hInstance;
			winClass.Icon = LoadImageW(0, "content\\directx.ico".ToScopedNativeWChar!(), .Icon, 0, 0, .LoadFromFile);
			winClass.Cursor = LoadCursorW(0, IDC_ARROW);
			winClass.BackgroundBrush = (HBRUSH)SystemColor.WindowFrame;
			winClass.ClassName = "DirectxBeefExample".ToScopedNativeWChar!();

			Window window = scope Window("DirectX Beef Example", winClass, CW_USEDEFAULT, CW_USEDEFAULT, (.)game.BackbufferWidth, (.)game.BackbufferHeight);

			Rectangle clientArea;
			GetClientRect(window.WindowHandle, out clientArea);

			game.Initialize(window, clientArea.Right, clientArea.Bottom);
			window.UserData = (void*)&game;

			Message message = .();
			while(message.message != WM_QUIT)
			{
				if (PeekMessageW(&message, 0, 0, 0, .Remove))
				{
					TranslateMessage(&message);
					DispatchMessageW(&message);
				}
				else
				{
					game.Tick();
				}
			}

			delete game;

			return (.)message.wParam;
		}

		static bool isResizing = false;
		static bool isMinimized = false;

		[CallingConvention(.Stdcall)]
		public static LRESULT MessageHandler(HWND hWnd, uint32 uMsg, WPARAM wParam, LPARAM lParam)
		{
			Game game = Window.GetUserData<Game>(hWnd);

			switch(uMsg)
			{
				case WM_PAINT:
				{
					if (isResizing)
					{
						game.Tick();
					}
					else
					{
						void* ps = ?;
						BeginPaint(hWnd, ps);
						EndPaint(hWnd, ps);
					}
				}
				case WM_GETMINMAXINFO:
				{
					// Define the minimum window size.
					MinMaxInfo *info = (.)(void*)lParam;
					info.MinimumTrackingSize.x = 300;
					info.MinimumTrackingSize.y = 250;
				}
				case WM_SIZE:
				{
					if(wParam == (.)ResizingType.Minimized)
					{
					    isMinimized = true;
					}
					else if (isMinimized)
					{
					    isMinimized = false;
					}
					else if(!isResizing)
					{
						int32 width, height;
						SplitHighAndLowOrder(lParam, out width, out height);
						game?.OnWindowSizeChanged(width, height);
					}
				}
				case WM_ENTERSIZEMOVE:
				{
					isResizing = true;
				}
				case WM_EXITSIZEMOVE:
				{
					isResizing = false;
					Rectangle rect;
					GetClientRect(hWnd, out rect);
					game?.OnWindowSizeChanged(rect.Right, rect.Bottom);
				}
				case WM_ACTIVATEAPP:
				{
					if(wParam != 0)
					{
						game?.OnActivated();
					}
					else
					{
						game?.OnDeactivated();
					}
				}
				case WM_SYSCOMMAND:
				{
					// Remove beeping sound when ALT + some key is pressed.
					if (wParam == SC_KEYMENU)
					{
					    return 0;
					}
				}
				case WM_CLOSE, WM_DESTROY:
				{
					PostQuitMessage(0);
				}
			}

			return DefWindowProcW(hWnd, uMsg, wParam, lParam);
		}
	}
}