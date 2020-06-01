using System;

namespace DirectX.D3D11
{
	[CRepr]
	// https://docs.microsoft.com/en-us/windows/win32/api/d3d11/ns-d3d11-d3d11_buffer_desc
	public struct BufferDescription	// D3D11_BUFFER_DESC
	{
		/**
		Size of the buffer in bytes.
		*/
		public uint32 ByteWidth;
		/**
		Identify how the buffer is expected to be read from and written to. Frequency of update is a key factor.
		The most common value is typically Default.
		*/
		public Usage Usage;
		/**
		Identify how the buffer will be bound to the pipeline. Flags (see BindFlags) can be combined with a logical OR.
		*/
		public BindFlags BindFlags;
		/**
		CPU access flags (see CPUAccessFlags) or None(0) if no CPU access is necessary. Flags can be combined with a logical OR.
		*/
		public CpuAccessFlags CpuAccessFlags;
		/**
		Miscellaneous flags (see ResourceMiscFlags) or None(0) if unused. Flags can be combined with a logical OR.
		*/
		public ResourceMiscFlags MiscFlags;
		/**
		The size of each element in the buffer structure (in bytes) when the buffer represents a structured buffer.

		The size value in StructureByteStride must match the size of the format that you use for views of the buffer.
		For example, if you use a shader resource view (SRV) to read a buffer in a pixel shader, the SRV format size must match the size value in StructureByteStride.
		*/
		public uint32 StructureByteStride;
	}
}
