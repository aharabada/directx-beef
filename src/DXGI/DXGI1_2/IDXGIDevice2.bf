using System;
using DirectX.Common;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * The IDXGIDevice2 interface implements a derived class for DXGI objects that produce image data.
	 * The interface exposes methods to block CPU processing until the GPU completes processing, and to offer resources to the operating system.
	*/
	public struct IDXGIDevice2 : IDXGIDevice1, IComObject
	{
		public static new Guid IID => .("05008617-fbfd-4051-a790-144884b4f6a9");

		public struct VTable : IDXGIDevice1.VTable
		{
			public function HResult(IDXGIDevice2* self, UINT numResources, IDXGIResource **ppResources, OfferResourcePriority priority) OfferResources;
			public function HResult(IDXGIDevice2* self,  UINT numResources, IDXGIResource **ppResources, BOOL *pDiscarded) ReclaimResources;
			public function HResult(IDXGIDevice2* self, Windows.Handle hEvent) EnqueueSetEvent;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		// Todo: Add CreateEvent and OpenEvent functions to Kernel32 wrapper
		/**
		 * Flushes any outstanding rendering commands and sets the specified event object to the signaled state after all previously submitted rendering commands complete.
		 *
		 * @param hEvent	A handle to the event object.
		 *					The CreateEvent or OpenEvent function returns this handle.
		 *					All types of event objects (manual-reset, auto-reset, and so on) are supported.
		*/
		public HResult EnqueueSetEvent(Windows.Handle hEvent) mut
		{
			return VT.EnqueueSetEvent(&this, hEvent);
		}

		/**
		 * Allows the operating system to free the video memory of resources by discarding their content.
		 *
		 * @param numResources	The number of resources in the ppResources argument array.
		 * @param ppResources	An array of pointers to IDXGIResource interfaces for the resources to offer.
		 * @param priority		A OfferResourcePriority value that indicates how valuable data is.
		*/
		public HResult OfferResources(UINT numResources, IDXGIResource **ppResources, OfferResourcePriority priority) mut
		{
			return VT.OfferResources(&this, numResources, ppResources, priority);
		}

		/**
		 * Restores access to resources that were previously offered by calling IDXGIDevice2::OfferResources.
		 *
		 * @param numResources	The number of resources in the ppResources argument and pDiscarded argument arrays.
		 * @param ppResources	An array of pointers to IDXGIResource interfaces for the resources to reclaim.
		 * @param pDiscarded	A pointer to an array that receives Boolean values.
		 *						Each value in the array corresponds to a resource at the same index that the ppResources parameter specifies.
		 * 						The runtime sets each Boolean value to TRUE if the corresponding resource’s content was discarded and is now undefined,
		 *						or to FALSE if the corresponding resource’s old content is still intact.
		 *						The caller can pass in NULL, if the caller intends to fill the resources with new content regardless of whether the old content was discarded.
		*/
		public HResult ReclaimResources(UINT numResources, IDXGIResource **ppResources, BOOL *discarded) mut
		{
			return VT.ReclaimResources(&this, numResources, ppResources, discarded);
		}
	}
}
