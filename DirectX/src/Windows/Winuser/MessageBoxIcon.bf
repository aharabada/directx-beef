using System;

namespace DirectX.Windows
{
	/// Indicates the icon displayed in the message box.
	[AllowDuplicates]
	public enum MessageBoxIcon : UINT
	{
		None = 0,
		/**
		A stop-sign icon appears in the message box.
		MB_ICONHAND
		*/
		Hand = 0x00000010L,
		/**
		A question-mark icon appears in the message box.
		The question-mark message icon is no longer recommended because it does not clearly represent a specific type of message and because the phrasing of a message as a question could apply to any message type.
		In addition, users can confuse the message symbol question mark with Help information.
		Therefore, do not use this question mark message symbol in your message boxes.
		The system continues to support its inclusion only for backward compatibility. 
		MB_ICONQUESTION
		*/
		Question = 0x00000020L,
		/**
		An exclamation-point icon appears in the message box.
		MB_ICONEXCLAMATION
		*/
		Exclamation = 0x00000030L,
		/**
		An icon consisting of a lowercase letter i in a circle appears in the message box.
		MB_ICONASTERISK
		*/
		Asterisk = 0x00000040L,
		/**
		An exclamation-point icon appears in the message box. 
		MB_ICONWARNING
		*/
		Warning = Exclamation,
		/**
		An icon consisting of a lowercase letter i in a circle appears in the message box. 
		MB_ICONINFORMATION
		*/
		Information = Asterisk,
		/**
		A stop-sign icon appears in the message box.
		MB_ICONSTOP
		*/
		Stop = Hand,
		/**
		MB_USERICON
		*/
		UserIcon = 0x00000080L,
	}
}
