using System;

namespace DirectX.D3D11
{
	/**
	 * Describes a buffer resource.
	 * D3D11_BUFFER_DESC
	*/
	[CRepr]
	public struct BufferDescription
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

		/**
		 * Instantiates a new instance of an zero-initialized BufferDescription structure.
		*/
		public this()
		{
			this = default;
		}

		/**
		 * Instantiates a new instance of a BufferDescription structure that is initialized with BufferDescription values.
		*/
		public this(uint32 byteWidth, BindFlags bindFlags, Usage usage = .Default, CpuAccessFlags cpuAccessFlags = .None,
			ResourceMiscFlags miscFlags = .None, uint32 structureByteStride = 0)
		{
			ByteWidth = byteWidth;
			BindFlags = bindFlags;
			Usage = usage;
			CpuAccessFlags = cpuAccessFlags;
			MiscFlags = miscFlags;
			StructureByteStride = structureByteStride;
		}
	}
}
