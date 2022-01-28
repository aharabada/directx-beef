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
			public function [CallingConvention(.Stdcall)] void(ID3D11DeviceChild* self, ID3D11Device** ppDevice) GetDevice;
			public function [CallingConvention(.Stdcall)] HResult(ID3D11DeviceChild* self, Guid* guid, uint32* pDataSize, void* pData) GetPrivateData;
			public function [CallingConvention(.Stdcall)] HResult(ID3D11DeviceChild* self, Guid* guid, uint32 pDataSize, void* pData) SetPrivateData;
			public function [CallingConvention(.Stdcall)] HResult(ID3D11DeviceChild* self, Guid* guid, IUnknown* pData) SetPrivateDataInterface;
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

		/**
		 * Sets the debug object name (ansi char set).
		 * @returns one of the Direct3D 11 Return Codes.
		 * @remarks To get the name set via this function you must call "GetDebugNameAnsi"
		 */
		public HResult SetDebugNameAnsi(StringView debugName) mut
		{
			return SetPrivateData(DirectX.Common.WKPDID_D3DDebugObjectName, (uint32)debugName.Length, debugName.Ptr);
		}
		
		/**
		 * Sets the debug object name (unicode (wide) char set).
		 * @returns one of the Direct3D 11 Return Codes.
		 * @remarks To get the name set via this function you must call "GetDebugName"
		 */
		public HResult SetDebugName(StringView debugName) mut
		{
			char16* str = debugName.ToScopedNativeWChar!();

			uint32 length = 0;
			char16* strWalker = str;
			while(*strWalker != '\0')
			{
				length++;
				strWalker++;
			}

			return SetPrivateData(DirectX.Common.WKPDID_D3DDebugObjectNameW, length * 2, str);
		}
		
		/**
		 * Gets the ansi debug object name.
		 * @param buffer The string buffer that will contain the name
		 * @returns one of the Direct3D 11 Return Codes.
		 * @remarks To set the name you get via this function you must call "SetDebugNameAnsi"
		 */
		public HResult GetDebugNameAnsi(String buffer) mut
		{
			uint32 length = 0;
			HResult result = GetPrivateData(DirectX.Common.WKPDID_D3DDebugObjectName, &length, null);

			if(result.Failed || length == 0)
				return result;

			char8[] data = new:ScopedAlloc! char8[length];

			result = GetPrivateData(DirectX.Common.WKPDID_D3DDebugObjectName, &length, data.CArray());
			
			if(result.Failed)
				return result;

			buffer.Append(data, 0, data.Count);

			return result;
		}
		
		/**
		 * Gets the unicode debug object name.
		 * @param buffer The string buffer that will contain the name
		 * @returns one of the Direct3D 11 Return Codes.
		 * @remarks To set the name you get via this function you must call "SetDebugName"
		 */
		public HResult GetDebugName(String buffer) mut
		{
			uint32 length = 0;
			HResult result = GetPrivateData(DirectX.Common.WKPDID_D3DDebugObjectNameW, &length, null);

			if(result.Failed || length == 0)
				return result;

			char16[] data = new:ScopedAlloc! char16[length / 2];

			result = GetPrivateData(DirectX.Common.WKPDID_D3DDebugObjectNameW, &length, data.CArray());
			
			if(result.Failed)
				return result;

			buffer.Append(data);

			return result;
		}
	}
}
