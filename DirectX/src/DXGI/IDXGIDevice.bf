using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * An IDXGIDevice interface implements a derived class for DXGI objects that produce image data.
	*/
	public struct IDXGIDevice : IDXGIObject, IComObject
	{
		public static new Guid IID => .("54ec77fa-1377-44e6-8c32-88fd5f44c84c");

		public struct VTable : IDXGIObject.VTable
		{
			public function DirectX.Common.HResult(IDXGIDevice* self, out IDXGIAdapter* adapter) GetAdapter;
			public function DirectX.Common.HResult(IDXGIDevice* self, SurfaceDescription *desc, UINT numSurface, Usage usage, SharedResource *sharedResource, IDXGISurface **surface) CreateSurface;
			public function DirectX.Common.HResult(IDXGIDevice* self, IUnknown **ppResources, Residency *pResidencyStatus, UINT numResources) QueryResourceResidency;
			public function DirectX.Common.HResult(IDXGIDevice* self, INT priority) SetGPUThreadPriority;
			public function DirectX.Common.HResult(IDXGIDevice* self, out INT priority) GetGPUThreadPriority;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Returns a surface.
		 * This method is used internally and you should not call it directly in your application.
		 *
		 * @param desc				A pointer to a SurfaceDescription structure that describes the surface.
		 * @param numSurface		The number of surfaces to create.
		 * @param usage				A Usage-flag that specifies how the surface is expected to be used.
		 * @param sharedResource	An optional pointer to a SharedResource structure that contains shared resource information for opening views of such resources.
		 * @param surface			The address of an IDXGISurface interface pointer to the first created surface.
		*/
		public HResult CreateSurface(SurfaceDescription *desc, UINT numSurface, Usage usage, SharedResource *sharedResource, IDXGISurface **surface) mut
		{
			return VT.CreateSurface(&this, desc, numSurface, usage, sharedResource, surface);
		}

		/**
		 * Returns the adapter for the specified device.
		 *
		 * @param adapter	The address of an IDXGIAdapter interface pointer to the adapter.
		*/
		public HResult GetAdapter(out IDXGIAdapter* adapter) mut
		{
			return VT.GetAdapter(&this, out adapter);
		}

		/**
		 * Gets the GPU thread priority.
		 *
		 * @param priority	A reference to a variable that receives a value that indicates the current GPU thread priority.
		 *					The value will be between -7 and 7, inclusive, where 0 represents normal priority.
		*/
		public HResult GetGPUThreadPriority(out INT priority) mut
		{
			return VT.GetGPUThreadPriority(&this, out priority);
		}

		/**
		 * Gets the residency status of an array of resources.
		 *
		 * @param resources			An array of IDXGIResource interfaces. //Todo: If this is an array of IDXGIResources, why is it IUnknown?
		 * @param residencyStatus	An array of Residency flags.
		 *							Each element describes the residency status for corresponding element in the resources argument array.
		 * @param numResources		The number of resources in the resources argument array and residencyStatus argument array.
		*/
		public HResult QueryResourceResidency(IUnknown **resources, Residency *residencyStatus, UINT numResources) mut
		{
			return VT.QueryResourceResidency(&this, resources, residencyStatus, numResources);
		}

		/**
		 * Sets the GPU thread priority.
		 *
		 * @param priority	A value that specifies the required GPU thread priority.
		 *					This value must be between -7 and 7, inclusive, where 0 represents normal priority.
		*/
		public HResult SetGPUThreadPriority(INT priority) mut
		{
			return VT.SetGPUThreadPriority(&this, priority);
		}
	}
}
