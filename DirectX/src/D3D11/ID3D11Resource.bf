using System;
using DirectX.DXGI;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A resource interface provides common actions on all resources.
	*/
	public struct ID3D11Resource : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("dc8e63f3-d12b-4952-b47b-5e45026a862d");

		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function void(ID3D11Resource* self, ResourceDimension* pResourceDimension) GetResourceType;
			public function void(ID3D11Resource* self, ResourcePriority evictionPriority) SetEvictionPriority; 
			public function ResourcePriority(ID3D11Resource* self) GetEvictionPriority;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get the type of the resource.
		 *
		 * @return The resource dimension
		*/
		public ResourceDimension GetResourceType() mut
		{
			ResourceDimension dim = ?;
			VT.GetResourceType(&this, &dim);
			return dim;
		}

		/**
		 * Set the eviction priority of a resource.
		 *
		 * @param evictionPriority The eviction priority for this resource.
		*/
		public void SetEvictionPriority(ResourcePriority evictionPriority) mut
		{
			VT.SetEvictionPriority(&this, evictionPriority);
		}

		/**
		 * Get the eviction priority of a resource.
		 *
		 * @return The eviction priority of this resource.
		*/
		public ResourcePriority GetEvictionPriority() mut
		{
			return VT.GetEvictionPriority(&this);
		}
	}
}
