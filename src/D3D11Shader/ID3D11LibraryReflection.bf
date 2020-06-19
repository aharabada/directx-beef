using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * A library-reflection interface accesses library info. 
	*/
	public struct ID3D11LibraryReflection : IUnknown, IComObject
	{
		public static new Guid IID => .(0x54384f1b, 0x5b3e, 0x4bb7, 0xae, 0x1, 0x60, 0xba, 0x30, 0x97, 0xcb, 0xb6);

		public struct VTable : IUnknown.VTable
		{
			public function HResult(ID3D11LibraryReflection* self, LibraryDescription *pDesc) GetDesc;

			public function ID3D11FunctionReflection*(ID3D11LibraryReflection* self, int32 functionIndex) GetFunctionByIndex;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Fills the library descriptor structure for the library reflection.
		 *
		 * @param desc	A reference to a LibraryDescription structure that receives a description of the library reflection.
		*/
		public HResult GetDescription(out LibraryDescription desc) mut
		{
			desc = ?;
			return VT.GetDesc(&this, &desc);
		}

		/**
		 * Gets the function reflector.
		 *
		 * @param index	The zero-based index of the function reflector to retrieve.
		 * @return A pointer to a ID3D11FunctionReflection interface that represents the function reflector.
		*/
		public ID3D11FunctionReflection* GetFunctionByIndex(int32 index) mut
		{
			return VT.GetFunctionByIndex(&this, index);
		}
	}
}
