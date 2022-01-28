using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * This interface encapsulates methods for measuring GPU performance.
	*/
	public struct ID3D11Counter : ID3D11Asynchronous, IComObject
	{
		public static new Guid IID => .("6e8c49fb-a371-4770-b440-29086022b741");

		public struct VTable : ID3D11Asynchronous.VTable
		{
			public function [CallingConvention(.Stdcall)] void(ID3D11Counter *self, CounterDescription *pDesc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Get a counter description.
		 *
		 * @param desc	Reference to a counter description.
		*/
		public void GetDescription(out CounterDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
