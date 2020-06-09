using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	public struct IDXGIKeyedMutex : IDXGIDeviceSubObject, IComObject
	{
		public static new Guid IID => .("9d8e1289-d7b3-465f-8126-250e349af85d");

		public struct VTable : IDXGIDeviceSubObject.VTable
		{
			public function HResult(IDXGIKeyedMutex *self, uint64 Key, uint32 dwMilliseconds)AcquireSync;
			public function HResult(IDXGIKeyedMutex *self, uint64 Key)ReleaseSync;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Using a key, acquires exclusive rendering access to a shared resource.
		 *
		 * @param key			A value that indicates which device to give access to.
		 *						This method will succeed when the device that currently owns the surface calls the IDXGIKeyedMutex::ReleaseSync method using the same value.
		 *						This value can be any UINT64 value.
		 * @param milliseconds	The time-out interval, in milliseconds.
		 *						This method will return if the interval elapses, and the keyed mutex has not been released using the specified Key.
		 *						If this value is set to zero, the AcquireSync method will test to see if the keyed mutex has been released and returns immediately.
		 *						If this value is set to INFINITE, the time-out interval will never elapse.
		 *
		 * @return 	Return S_OK if successful.
		 *			If the owning device attempted to create another keyed mutex on the same shared resource, AcquireSync returns E_FAIL.
		 *			Can also return WAIT_ABANDONED and WAIT_TIMEOUT.
		*/
		public HResult AcquireSync(uint64 key, uint32 milliseconds) mut
		{
			return VT.AcquireSync(&this, key, milliseconds);
		}

		/**
		 * Using a key, releases exclusive rendering access to a shared resource.
		 *
		 * @param key	A value that indicates which device to give access to.
		 *				This method succeeds when the device that currently owns the surface calls the ReleaseSync method using the same value.
		 *				This value can be any UINT64 value.
		*/
		public HResult ReleaseSync(uint64 key) mut
		{
			return VT.ReleaseSync(&this, key);
		}
	}
}
