using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * An IDXGIObject interface is a base interface for all DXGI objects;
	 * IDXGIObject supports associating caller-defined (private data) with an object and retrieval of an interface to the parent object.
	*/
	public struct IDXGIObject : IUnknown, IComObject
	{
		public static new Guid IID => .("aec22fb8-76f3-4639-9be0-28eb43a67a2e");

		public struct VTable : IUnknown.VTable
		{
			public function HResult(IDXGIObject* self, ref Guid Name, uint32 DataSize, void* pData) SetPrivateData;
			public function HResult(IDXGIObject* self, ref Guid Name, IUnknown* pUnknown) SetPrivateDataInterface;
			public function HResult(IDXGIObject* self, ref Guid Name, UINT *pDataSize, void* pData) GetPrivateData;
			public function HResult(IDXGIObject* self, ref Guid riid, void** ppParent) GetParent;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the parent of the object.
		 *
		 * @param name		The ID of the requested interface.
		 * @param ppParent	The address of a pointer to the parent object.
		*/
		public HResult GetParent(Guid iid, void** ppParent) mut
		{
			Guid riid = iid;
			return VT.GetParent(&this, ref riid, ppParent);
		}

		/**
		 * Get a pointer to the object's data.
		 *
		 * @param name		A GUID identifying the data.
		 * @param dataSize	The size of the data.
		 * @param pData		Pointer to the data.
		*/
		public HResult GetPrivateData(Guid name, out UINT dataSize, void *pData) mut
		{
			dataSize = ?;
			Guid rname = name;
			return VT.GetPrivateData(&this, ref rname, &dataSize, pData);
		}
		
		/**
		 * Sets application-defined data to the object and associates that data with a GUID.
		 *
		 * @param name		A GUID that identifies the data. Use this GUID in a call to GetPrivateData to get the data.
		 * @param dataSize	The size of the object's data.
		 * @param pData		A pointer to the object's data.
		*/
		public HResult SetPrivateData(Guid name, UINT dataSize, void *pData) mut
		{
			Guid rname = name;
			return VT.SetPrivateData(&this, ref rname, dataSize, pData);
		}
		
		/**
		 * Set an interface in the object's private data.
		 *
		 * @param name		A GUID identifying the interface.
		 * @param pUnknown	The interface to set.
		*/
		public HResult SetPrivateDataInterface(Guid name, IUnknown *pUnknown) mut
		{
			Guid rname = name;
			return VT.SetPrivateDataInterface(&this, ref rname, pUnknown);
		}

		/**
		 * Gets the parent of the object.
		 *
		 * @param ppParent	The reference to a pointer to the parent object.
		*/
		public HResult GetParent<T>(out T* parent) mut where T : IUnknown, IComObject
		{
			parent = ?;
			return GetParent(T.IID, (.)&parent);
		}
	}
}
