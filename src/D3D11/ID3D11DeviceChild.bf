using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	A device-child interface accesses data used by a device.
	*/
	public struct ID3D11DeviceChild : IUnknown, IComObject
	{
		public static new Guid IID => Guid("1841e5c8-16b0-489b-bcc8-44cfb0d5deae");
		
		public struct VTable : IUnknown.VTable
		{
			public function void(ID3D11DeviceChild* self, ID3D11Device** ppDevice) GetDevice;
			public function void(ID3D11DeviceChild* self, Guid* guid, uint32* pDataSize, void* pData) GetPrivateData;
			public function void(ID3D11DeviceChild* self, Guid* guid, uint32 pDataSize, void* pData) SetPrivateData;
			public function void(ID3D11DeviceChild* self, Guid* guid, Windows.COM_IUnknown* pData) SetPrivateDataInterface;
		};

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		/**
		 * Get a pointer to the device that created this interface.
		 * @return Address of a pointer to a device.
		*/
		public ID3D11Device* GetDevice() mut
		{
			ID3D11Device* device = ?;		 
			VT.GetDevice(&this, &device);
			return device;
		}

		// Todo: implement GetPrivateData, SetPrivataData, SetPrivataDataInterface
	}
}
