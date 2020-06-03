using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * A view interface specifies the parts of a resource the pipeline can access during rendering.
	*/
	public struct ID3D11UnorderedAccessView : ID3D11View, IComObject
	{
		public static new Guid IID => Guid("28acf509-7f5c-48f6-8611-f316010a6380");
		
		public struct VTable : ID3D11View.VTable
		{
			public function void(ID3D11UnorderedAccessView* self, UnorderedAccessViewDescription *pDesc) GetDesc;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		/**
		 * Get a description of the resource.
		 *
		 * @param desc	The structure describing the resource.
		*/
		public void GetDescription(out UnorderedAccessViewDescription desc) mut
		{
			desc = ?;
			VT.GetDesc(&this, &desc);
		}
	}
}
