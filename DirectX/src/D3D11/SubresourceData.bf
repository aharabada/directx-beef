using System;

namespace DirectX.D3D11
{
	/**
	 * Specifies data for initializing a subresource.
	 * D3D11_SUBRESOURCE_DATA
	*/
	[CRepr]
	public struct SubresourceData
	{
		/**
		 * Pointer to the initialization data.
		*/
		public void* Data;
		/**
		 * The distance (in bytes) from the beginning of one line of a texture to the next line.
		 * System-memory pitch is used only for 2D and 3D texture data as it is has no meaning for the other resource types.
		*/
		public uint32 LinePitch;
		/**
		 * The distance (in bytes) from the beginning of one depth level to the next.
		 * System-memory-slice pitch is only used for 3D texture data as it has no meaning for the other resource types.
		*/
		public uint32 SlicePitch;

		public this()
		{
			this = default;
		}

		public this(void* data) : this(data, 0, 0) {}

		public this(void* data, uint32 linePitch, uint32 slicePitch)
		{
			Data = data;
			LinePitch = linePitch;
			SlicePitch = slicePitch;
		}
	}

	/**
	 * Specifies data for initializing a subresource.
	 * D3D11_SUBRESOURCE_DATA
	*/
	[CRepr]
	public struct SubresourceData<T> where T : struct
	{
		/**
		 * Pointer to the initialization data.
		*/
		public T* Data;
		/**
		 * The distance (in bytes) from the beginning of one line of a texture to the next line.
		 * System-memory pitch is used only for 2D and 3D texture data as it is has no meaning for the other resource types.
		*/
		public uint32 LinePitch;
		/**
		 * The distance (in bytes) from the beginning of one depth level to the next.
		 * System-memory-slice pitch is only used for 3D texture data as it has no meaning for the other resource types.
		*/
		public uint32 SlicePitch;

		public this()
		{
			this = default;
		}

		public this(T* data, uint32 linePitch, uint32 slicePitch)
		{
			Data = data;
			LinePitch = linePitch;
			SlicePitch = slicePitch;
		}
	}
}
