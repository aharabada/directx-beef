using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * A module interface creates an instance of a module that is used for resource rebinding. 
	*/
	public struct ID3D11Module : IUnknown, IComObject
	{
		public static new Guid IID => .(0xcac701ee, 0x80fc, 0x4122, 0x82, 0x42, 0x10, 0xb3, 0x9c, 0x8c, 0xec, 0x34);

		public struct VTable : IUnknown.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(ID3D11Module* self, char8* pNamespace, ID3D11ModuleInstance** ppModuleInstance) CreateInstance;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Initializes an instance of a shader module that is used for resource rebinding.
		 *
		 * @param pNamespace		The name of a shader module to initialize.
		 *							This can be NULL if you don't want to specify a name for the module.
		 * @param moduleInstance	The address of a pointer to an ID3D11ModuleInstance interface to initialize.
		*/
		public HResult CreateInstance(char8* pNamespace, ID3D11ModuleInstance** moduleInstance) mut
		{
			return VT.CreateInstance(&this, pNamespace, moduleInstance);
		}
	}
}
