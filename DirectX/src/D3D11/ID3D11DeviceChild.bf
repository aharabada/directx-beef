using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A device-child interface accesses data used by a device.
	*/
	public struct ID3D11DeviceChild : IUnknown, IComObject
	{
		public static new Guid IID => Guid("1841e5c8-16b0-489b-bcc8-44cfb0d5deae");
		
		public struct VTable : IUnknown.VTable
		{
			public function void(ID3D11DeviceChild* self, ID3D11Device** ppDevice) GetDevice;
			public function HResult(ID3D11DeviceChild* self, Guid* guid, uint32* pDataSize, void* pData) GetPrivateData;
			public function HResult(ID3D11DeviceChild* self, Guid* guid, uint32 pDataSize, void* pData) SetPrivateData;
			public function HResult(ID3D11DeviceChild* self, Guid* guid, IUnknown* pData) SetPrivateDataInterface;
		};

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get a pointer to the device that created this interface.
		 *
		 * @param device	Address of a pointer to a device.
		*/
		public void GetDevice(ID3D11Device **device) mut
		{ 
			VT.GetDevice(&this, device);
		}

		/**
		 * Get application-defined data from a device child.
		 *
		 * @param guid		Guid associated with the data.
		 * @param dataSize	A pointer to a variable that on input contains the size, in bytes, of the buffer that pData points to, and on output contains the size, in bytes, of the amount of data that GetPrivateDataretrieved.
		 * @param data		A pointer to a buffer that GetPrivateData fills with data from the device child if pDataSize points to a value that specifies a buffer large enough to hold the data.
		*/
		public HResult GetPrivateData(Guid guid, UINT *dataSize, void *data) mut
		{
			Guid ruid = guid;
			return VT.GetPrivateData(&this, &ruid, dataSize, data);
		}

		/**
		 * Set application-defined data to a device child and associate that data with an application-defined guid.
		 *
		 * @param guid		Guid associated with the data.
		 * @param dataSize	Size of the data.
		 * @param data		Pointer to the data to be stored with this device child.
		 *					If pData is NULL, DataSize must also be 0, and any data previously associated with the specified guid will be destroyed.
		*/
		public HResult SetPrivateData(Guid guid, UINT dataSize, void *data) mut
		{
			Guid ruid = guid;
			return VT.SetPrivateData(&this, &ruid, dataSize, data);
		}

		/**
		 * Associate an IUnknown-derived interface with this device child and associate that interface with an application-defined guid.
		 *
		 * @param guid	Guid associated with the interface.
		 * @param data	Pointer to an IUnknown-derived interface to be associated with the device child.
		*/
		public HResult SetPrivateDataInterface(Guid guid, IUnknown *data) mut
		{
			Guid ruid = guid;
			return VT.SetPrivateDataInterface(&this, &ruid, data);
		}
	}
}
