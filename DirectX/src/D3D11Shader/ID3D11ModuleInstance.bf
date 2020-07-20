using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * A module-instance interface is used for resource rebinding.
	*/
	public struct ID3D11ModuleInstance : IUnknown, IComObject
	{
		public static new Guid IID => .(0x469e07f7, 0x45a, 0x48d5, 0xaa, 0x12, 0x68, 0xa4, 0x78, 0xcd, 0xf7, 0x5d);

		public struct VTable : IUnknown.VTable
		{
			public function HResult(ID3D11ModuleInstance* self, uint32 srcSlot, uint32 dstSlot, uint32 dscOffset) BindConstantBuffer;
			public function HResult(ID3D11ModuleInstance* self, char8* pName, uint32 dstSlot, uint32 dscOffset) BindConstantBufferByName;
			
			public function HResult(ID3D11ModuleInstance* self, uint32 srcSlot, uint32 dstSlot, uint32 count) BindResource;
			public function HResult(ID3D11ModuleInstance* self, char8* pName, uint32 dstSlot, uint32 count) BindResourceByName;

			public function HResult(ID3D11ModuleInstance* self, uint32 srcSlot, uint32 dstSlot, uint32 count) BindSampler;
			public function HResult(ID3D11ModuleInstance* self, char8* pName, uint32 dstSlot, uint32 count) BindSamplerByName;
			
			public function HResult(ID3D11ModuleInstance* self, uint32 srcSlot, uint32 dstSlot, uint32 count) BindUnorderedAccessView;
			public function HResult(ID3D11ModuleInstance* self, char8* pName, uint32 dstSlot, uint32 count) BindUnorderedAccessViewByName;

			public function HResult(ID3D11ModuleInstance* self, uint32 srcSrvSlot, uint32 dstUavSlot, uint32 count) BindResourceAsUnorderedAccessView;
			public function HResult(ID3D11ModuleInstance* self, char8* pSrvName, uint32 dstUavSlot, uint32 count) BindResourceAsUnorderedAccessViewByName;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Rebinds a constant buffer from a source slot to a destination slot.
		 *
		 * @param srcSlot	The source slot number for rebinding.
		 * @param dstSlot	The destination slot number for rebinding.
		 * @param dstOffset	The offset in bytes of the destination slot for rebinding. The offset must have 16-byte alignment.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindConstantBuffer(uint32 srcSlot, uint32 dstSlot, uint32 dstOffset) mut
		{
			return VT.BindConstantBuffer(&this, srcSlot, dstSlot, dstOffset);
		}
		
		/**
		 * Rebinds a constant buffer by name to a destination slot.
		 *
		 * @param srcName	The name of the constant buffer for rebinding.
		 * @param dstSlot	The destination slot number for rebinding.
		 * @param dstOffset	The offset in bytes of the destination slot for rebinding. The offset must have 16-byte alignment.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindConstantBufferByName(char8* srcName, uint32 dstSlot, uint32 dstOffset) mut
		{
			return VT.BindConstantBufferByName(&this, srcName, dstSlot, dstOffset);
		}

		/**
		 * Rebinds a texture or buffer from source slot to destination slot.
		 *
		 * @param srcSlot	The first source slot number for rebinding.
		 * @param dstSlot	The first destination slot number for rebinding.
		 * @param count		The number of slots for rebinding.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindResource(uint32 srcSlot, uint32 dstSlot, uint32 count) mut
		{
			return VT.BindResource(&this, srcSlot, dstSlot, count);
		}
		
		/**
		 * Rebinds a texture or buffer by name to destination slots.
		 *
		 * @param name		The name of the texture or buffer for rebinding.
		 * @param dstSlot	The first destination slot number for rebinding.
		 * @param count		The number of slots for rebinding.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindResourceByName(char8* name, uint32 dstSlot, uint32 count) mut
		{
			return VT.BindResourceByName(&this, name, dstSlot, count);
		}

		/**
		 * Rebinds a sampler from source slot to destination slot.
		 *
		 * @param srcSlot	The first source slot number for rebinding.
		 * @param dstSlot	The first destination slot number for rebinding.
		 * @param count		The number of slots for rebinding.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindSampler(uint32 srcSlot, uint32 dstSlot, uint32 count) mut
		{
			return VT.BindSampler(&this, srcSlot, dstSlot, count);
		}
		
		/**
		 * Rebinds a texture or buffer by name to destination slots.
		 *
		 * @param name		The name of the sampler for rebinding.
		 * @param dstSlot	The first destination slot number for rebinding.
		 * @param count		The number of slots for rebinding.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindSamplerByName(char8* name, uint32 dstSlot, uint32 count) mut
		{
			return VT.BindSamplerByName(&this, name, dstSlot, count);
		}

		/**
		 * Rebinds an unordered access view (UAV) from source slot to destination slot.
		 *
		 * @param srcSlot	The first source slot number for rebinding.
		 * @param dstSlot	The first destination slot number for rebinding.
		 * @param count		The number of slots for rebinding.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindUnorderedAccessView(uint32 srcSlot, uint32 dstSlot, uint32 count) mut
		{
			return VT.BindUnorderedAccessView(&this, srcSlot, dstSlot, count);
		}
		
		/**
		 * Rebinds an unordered access view (UAV) by name to destination slots.
		 *
		 * @param name		The name of the UAV for rebinding.
		 * @param dstSlot	The first destination slot number for rebinding.
		 * @param count		The number of slots for rebinding.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindUnorderedAccessViewByName(char8* name, uint32 dstSlot, uint32 count) mut
		{
			return VT.BindUnorderedAccessViewByName(&this, name, dstSlot, count);
		}

		/**
		 * Rebinds a resource as an unordered access view (UAV) from source slot to destination slot.
		 *
		 * @param srcSlot	The first source slot number for rebinding.
		 * @param dstSlot	The first destination slot number for rebinding.
		 * @param count		The number of slots for rebinding.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindResourceAsUnorderedAccessView(uint32 srcSrvSlot, uint32 dstUavSlot, uint32 count) mut
		{
			return VT.BindResourceAsUnorderedAccessView(&this, srcSrvSlot, dstUavSlot, count);
		}
		
		/**
		 * Rebinds an unordered access view (UAV) by name to destination slots.
		 *
		 * @param name		The name of the resource for rebinding.
		 * @param dstSlot	The first destination slot number for rebinding.
		 * @param count		The number of slots for rebinding.
		 * @return	S_OK for a valid rebinding
		 *			S_FALSE for rebinding a nonexistent slot
		 *			E_FAIL for an invalid rebinding
		*/
		public HResult BindResourceAsUnorderedAccessViewByName(char8* srvName, uint32 dstUavSlot, uint32 count) mut
		{
			return VT.BindResourceAsUnorderedAccessViewByName(&this, srvName, dstUavSlot, count);
		}
	}
}

