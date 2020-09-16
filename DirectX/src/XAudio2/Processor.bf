using System;

namespace DirectX.XAudio2
{
	/**
	 * Specifies which CPU to use.
	 * @note If multiple processors bits are set when calling XAudio2Create, the system will create a separate worker thread for each processor.
	 * @native Processor1,...,Processor32,XAUDIO2_ANY_PROCESSOR,XAUDIO2_DEFAULT_PROCESSOR
	 */
	[AllowDuplicates]
	enum Processor : uint32
	{
		Processor1  = 0x00000001,
		Processor2  = 0x00000002,
		Processor3  = 0x00000004,
		Processor4  = 0x00000008,
		Processor5  = 0x00000010,
		Processor6  = 0x00000020,
		Processor7  = 0x00000040,
		Processor8  = 0x00000080,
		Processor9  = 0x00000100,
		Processor10 = 0x00000200,
		Processor11 = 0x00000400,
		Processor12 = 0x00000800,
		Processor13 = 0x00001000,
		Processor14 = 0x00002000,
		Processor15 = 0x00004000,
		Processor16 = 0x00008000,
		Processor17 = 0x00010000,
		Processor18 = 0x00020000,
		Processor19 = 0x00040000,
		Processor20 = 0x00080000,
		Processor21 = 0x00100000,
		Processor22 = 0x00200000,
		Processor23 = 0x00400000,
		Processor24 = 0x00800000,
		Processor25 = 0x01000000,
		Processor26 = 0x02000000,
		Processor27 = 0x04000000,
		Processor28 = 0x08000000,
		Processor29 = 0x10000000,
		Processor30 = 0x20000000,
		Processor31 = 0x40000000,
		Processor32 = 0x80000000,
		/**
		 * All processors.
		 * @Note If you specify XAUDIO2_ANY_PROCESSOR, the system will use all of the device's processors and, as stated in the Remarks section below, create a worker thread for each processor.
		 * @native XAUDIO2_ANY_PROCESSOR
		 */
		AnyProcessor = 0xffffffff,
		//#if (NTDDI_VERSION >= NTDDI_WIN10_19H1) // Todo: version check?
		/**
		 * This value indicates that XAudio2 will choose the default processor by itself.
		 * The actual value chosen may vary depending on the hardware platform.
		 * @native XAUDIO2_USE_DEFAULT_PROCESSOR
		 */
		UseDefaultProcessor = 0,
		//#endif
		/**
		 * Default processor, which is defined as processor 1.
		 * @native XAUDIO2_DEFAULT_PROCESSOR
		 */
		DefaultProcessor = Processor1
	}
}
