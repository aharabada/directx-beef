using System;

namespace DirectX.D3DCompiler
{
	/**
	 * Strip flag options.
	 * D3DCOMPILER_STRIP_FLAGS
	*/
	public enum StripFlags : uint32
	{
		/**
		 * No flags specified.
		*/
		None = 0,
		/**
		 * Remove reflection data.
		 * D3DCOMPILER_STRIP_REFLECTION_DATA
		*/
	    ReflectionData = 0x00000001,
		/**
		 * Remove debug information.
		 * D3DCOMPILER_STRIP_DEBUG_INFO
		*/
	    DebugInfo = 0x00000002,
		/**
		 * Remove test blob data.
		 * D3DCOMPILER_STRIP_TEST_BLOBS
		*/
	    TestBlobs = 0x00000004,
		/**
		 * Remove private data.
		 * D3DCOMPILER_STRIP_PRIVATE_DATA
		*/
	    PrivateData = 0x00000008,
		/**
		 * Remove the root signature.
		 * D3DCOMPILER_STRIP_ROOT_SIGNATURE
		*/
	    RootSignature = 0x00000010,
		/**
		 * Forces this enumeration to compile to 32 bits in size.
		 * Without this value, some compilers would allow this enumeration to compile to a size other than 32 bits.
		 * This value is not used.
		 * D3DCOMPILER_STRIP_FORCE_DWORD
		*/
	    ForceDword = 0x7fffffff,
	}
}
