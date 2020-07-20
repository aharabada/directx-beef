using System;

namespace DirectX.D3D11
{
	/**
	Provides access to subresource data.
	D3D11_MAPPED_SUBRESOURCE
	*/
	[CRepr]
	public struct MappedSubresource
	{
		/**
		Pointer to the data.
		*/
		public void* Data;
		/**
		The row pitch, or width, or physical size (in bytes) of the data.
		*/
		public uint32 RowPitch;
		/**
		The depth pitch, or width, or physical size (in bytes)of the data.
		*/
		public uint32 DepthPitch;
	}

	/*
	Todo: Generic MappedSubresource
	/**
	Provides access to subresource data.
	D3D11_MAPPED_SUBRESOURCE
	*/
	[CRepr]
	public struct MappedSubresource<T> where T: struct
	{
		/**
		Pointer to the data.
		*/
		public T* Data;
		/**
		The row pitch, or width, or physical size (in bytes) of the data.
		*/
		public uint32 RowPitch;
		/**
		The depth pitch, or width, or physical size (in bytes)of the data.
		*/
		public uint32 DepthPitch;
	}*/
}
