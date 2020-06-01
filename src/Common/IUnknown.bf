using System;

namespace DirectX.Common
{
	// Todo: little brittle IComObject deserves its own file
	public interface IComObject
	{
		// Return the interface identifier of the com interface.
		static Guid IID { get; }
	}

	public struct IUnknown : IComObject
	{
		public static Guid IID => .("00000000-0000-0000-C000-000000000046");

		public struct VTable
		{
			public function HResult(IUnknown* self, ref Guid riid, void** result) QueryInterface;
			public function uint32(IUnknown* self) AddRef;
			public function uint32(IUnknown* self) Release;
		}

		protected VTable* mVT;

		public VTable* VT
		{
			get
			{
				return mVT;
			}
		}

		/**
		 * Queries a COM object for a pointer to one of its interface; identifying the interface by a reference to its interface identifier (IID).
		 * If the COM object implements the interface, then it returns a pointer to that interface after calling IUnknown::AddRef on it.
		 *
		 * @param riid 		A reference to the interface identifier (IID) of the interface being queried for.
		 * @param ppvObject The address of a pointer to an interface with the IID specified in the riid parameter.
		 *					Because you pass the address of an interface pointer, the method can overwrite that
		 *					address with the pointer to the inteface being queried for. Upon successful return,
		 *					*ppvObject (the dereferenced address) contains a pointer to the requested interface.
		 *					If the object doesn't support the interface, the method sets *ppvObject (the dereferenced address) to null.
		*/
		public HResult QueryInterface(ref Guid riid, void** ppvObject) mut
		{
			return mVT.QueryInterface(&this, ref riid, ppvObject);
		}

		/**
		 * Queries a COM object for a pointer to one of its interface.
		 *
		 * @param <T>		The type of the interface being queried for.
		 * @param result 	The address of a pointer to an interface with the IID specified in the riid parameter.
		 *					If the object doesn't support the interface, the method sets *result (the dereferenced address) to null.
		*/
		public HResult QueryInterface<T>(T** result) mut where T : IUnknown, IComObject
		{
			Guid riid = T.IID;
			return mVT.QueryInterface(&this, ref riid, (.)result);
		}

		/**
		 * Increments the reference count for an interface pointer to a COM object.
		 * You should call this method whenever you make a copy of an interface pointer.
		 *
		 * @return The new reference count. This value is intended to be used only for test purposes.
		*/
		public uint32 AddRef() mut
		{
			return mVT.AddRef(&this);
		}

		/**
		 * Decrements the reference count for an interface on a COM object.
		 *
		 * @return The new reference count. This value is intended to be used only for test purposes.
		*/
		public uint32 Release() mut
		{
			return mVT.Release(&this);
		}
	}
}
