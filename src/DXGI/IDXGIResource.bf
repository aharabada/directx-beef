using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * An IDXGIResource interface allows resource sharing and identifies the memory that a resource resides in.
	*/
	public struct IDXGIResource : IDXGIDeviceSubObject, IComObject
	{
		public static new Guid IID => .("035f3ab4-482e-4e50-b41f-8a7f8bd8960b");

		public struct VTable : IDXGIDeviceSubObject.VTable
		{
			public function HResult(IDXGIResource *self, Windows.Handle *sharedHandle) GetSharedHandle;
			public function HResult(IDXGIResource *self, Usage *usage) GetUsage;
			public function HResult(IDXGIResource *self, ResourcePriority evictionPriority) SetEvictionPriority;
			public function HResult(IDXGIResource *self, ResourcePriority *pEvictionPriority) GetEvictionPriority;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get the eviction priority.
		 *
		 * @param evictionPriority	A reference to the eviction priority, which determines when a resource can be evicted from memory.
		*/
		public HResult GetEvictionPriority(out ResourcePriority evictionPriority) mut
		{
			evictionPriority = ?;
			return VT.GetEvictionPriority(&this, &evictionPriority);
		}

		/**
		 * Gets the handle to a shared resource.
		 *
		 * @param sharedHandle	A reference to a handle.
		*/
		public HResult GetSharedHandle(out Windows.Handle sharedHandle) mut
		{
			sharedHandle = ?;
			return VT.GetSharedHandle(&this, &sharedHandle);
		}
		
		/**
		 * Gets the handle to a shared resource.
		 *
		 * @param usage	A reference to a usage flag.
		 *				For Direct3D 10, a surface can be used as a shader input or a render-target output.
		*/
		public HResult GetUsage(out Usage usage) mut
		{
			usage = ?;
			return VT.GetUsage(&this, &usage);
		}

		/**
		 * Set the priority for evicting the resource from memory.
		 *
		 * @param evictionPriority	The eviction priority, which determines when a resource can be evicted from memory.
		*/
		public HResult SetEvictionPriority(ResourcePriority evictionPriority) mut
		{
			return VT.SetEvictionPriority(&this, evictionPriority);
		}
	}
}
