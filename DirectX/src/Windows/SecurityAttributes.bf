using System;

namespace DirectX.Windows
{
	/**
	 * The SECURITY_ATTRIBUTES structure contains the security descriptor for an object and specifies whether the handle retrieved by specifying this structure is inheritable.
	*/
	[CRepr]
	public struct SecurityAttributes
	{
		/**
		 * The size, in bytes, of this structure.
		 * Set this value to the size of the SecurityAttributes structure.
		*/
		public DWORD Length;
		/**
		 * A pointer to a SECURITY_DESCRIPTOR structure that controls access to the object.
		*/
		public LPVOID SecurityDescriptor;
		/**
		 * A Boolean value that specifies whether the returned handle is inherited when a new process is created.
		 * If this member is TRUE, the new process inherits the handle.
		*/
		public BOOL InheritHandle;
	}
}
