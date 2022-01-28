using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * The ID3D11CommandList interface encapsulates a list of graphics commands for play back.
	*/
	public struct ID3D11CommandList : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => .("4f5b196e-c2bd-495e-bd01-1fded38e4969");
		
		public struct VTable : ID3D11DeviceChild
		{
			public function [CallingConvention(.Stdcall)] UINT(ID3D11CommandList *self) GetContextFlags;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the initialization flags associated with the deferred context that created the command list.
		 *
		 * @return The context flag is reserved for future use and is always 0.
		*/
		public UINT GetContextFlags() mut
		{
			return VT.GetContextFlags(&this);
		}
	}
}
