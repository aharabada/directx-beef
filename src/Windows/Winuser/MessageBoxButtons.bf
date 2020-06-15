using System;

namespace DirectX.Windows
{
	/// Indicates the buttons displayed in the message box.
	public enum MessageBoxButtons : UINT
	{
		/**
		The message box contains one push button: OK. This is the default. 
		MB_OK
		*/
		Ok = 0x00000000L,
		/**
		The message box contains two push buttons: OK and Cancel. 
		MB_OKCANCEL
		*/
		OkCancel = 0x00000001L,
		/**
		The message box contains three push buttons: Abort, Retry, and Ignore.
		MB_ABORTRETRYIGNORE
		*/
		AbortRetryIgnore = 0x00000002L,
		/**
		The message box contains three push buttons: Yes, No, and Cancel.
		MB_YESNOCANCEL
		*/
		YesNoCancel = 0x00000003L,
		/**
		The message box contains two push buttons: Yes and No. 
		MB_YESNO
		*/
		YesNo = 0x00000004L,
		/**
		The message box contains two push buttons: Retry and Cancel.
		MB_RETRYCANCEL
		*/
		RetryCancel = 0x00000005L,
		/**
		The message box contains three push buttons: Cancel, Try Again, Continue.
		Use this message box type instead of AbortRetryIgnore (MB_ABORTRETRYIGNORE).
		MB_CANCELTRYCONTINUE
		*/
		CancelTryContinue = 0x00000006L,
		/**
		Adds a Help button to the message box.
		When the user clicks the Help button or presses F1, the system sends a WM_HELP message to the owner. 
		MB_HELP
		*/
		Help = 0x00004000L,
	}
}