using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * A linker interface is used to link a shader module. 
	*/
	public struct ID3D11Linker : IUnknown, IComObject
	{
		public static new Guid IID => .(0x59a6cd0e, 0xe10d, 0x4c1f, 0x88, 0xc0, 0x63, 0xab, 0xa1, 0xda, 0xf3, 0xe);

		public struct VTable : IUnknown.VTable
		{
			// Link the shader and produce a shader blob suitable to D3D runtime.
			public function HResult(ID3D11Linker* self, ID3D11ModuleInstance* entry, char8* entryName, char8* targetName, uint32 flags, ID3DBlob** ppShaderBlob, ID3DBlob** ppErrorBuffer) Link;
			// Add an instance of a library module to be used for linking.
			public function HResult(ID3D11Linker* self, ID3D11ModuleInstance* pLibraryMI) UseLibrary;
			// Add a clip plane with the plane coefficients taken from a cbuffer entry for 10L9 shaders.
			public function HResult(ID3D11Linker* self, uint32 cBufferSlot, uint32 cBufferEntry) AddClipPlaneFromCBuffer;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Adds a clip plane with the plane coefficients taken from a cbuffer entry for 10Level9 shaders.
		 *
		 * @param cBufferSlot	The cbuffer slot number.
		 * @param cBufferEntry	The cbuffer entry number.
		*/
		public HResult AddClipPlaneFromCBuffer(uint32 cBufferSlot, uint32 cBufferEntry) mut
		{
			return VT.AddClipPlaneFromCBuffer(&this, cBufferSlot, cBufferEntry);
		}

		/**
		 * Links the shader and produces a shader blob that the Direct3D runtime can use.
		 *
		 * @param entry			A pointer to the ID3D11ModuleInstance interface for the shader module instance to link from.
		 * @param entryName		The name of the shader module instance to link from.
		 * @param targetName	The name for the shader blob that is produced.
		 * @param flags			Reserved.
		 * @param shaderBlob	A pointer to a variable that receives a pointer to the ID3DBlob interface that you can use to access the compiled shader code.
		 * @param errorBuffer	A pointer to a variable that receives a pointer to the ID3DBlob interface that you can use to access compiler error messages.
		*/
		public HResult Link(ID3D11ModuleInstance* entry, char8* entryName, char8* targetName, uint32 flags, ID3DBlob** shaderBlob, ID3DBlob** errorBuffer) mut
		{
			return VT.Link(&this, entry, entryName, targetName, flags, shaderBlob, errorBuffer);
		}

		/**
		 * Adds an instance of a library module to be used for linking.
		 *
		 * @param libraryMI	A pointer to the ID3D11ModuleInstance interface for the library module instance.
		*/
		public HResult UseLibrary(ID3D11ModuleInstance *libraryMI) mut
		{
			return VT.UseLibrary(&this, libraryMI);
		}
	}
}
