namespace DirectX.Windows.Winuser
{
	/**
	 * Specifies how messages are to be handled.
	*/
	public enum HandleMessageFlags : UINT
	{
		/**
		 * Messages are not removed from the queue after processing by PeekMessage. 
		 * PM_NOREMOVE
		*/
		NoRemove = 0,
		/**
		 * Messages are removed from the queue after processing by PeekMessage. 
		 * PM_REMOVE
		*/
		Remove = 1,
		/**
		 * Prevents the system from releasing any thread that is waiting for the caller to go idle (see WaitForInputIdle).
		 * Combine this value with either NoRemove or Remove.
		 * PM_NOYIELD
		*/
		NoYield = 2
	}
}
