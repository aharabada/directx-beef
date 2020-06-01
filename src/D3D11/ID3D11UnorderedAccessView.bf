using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	A view interface specifies the parts of a resource the pipeline can access during rendering.
	*/
	public struct ID3D11UnorderedAccessView : IComObject
	{
		public static Guid IID => Guid("28acf509-7f5c-48f6-8611-f316010a6380");
		
		

		public struct VTable : ID3D11View.VTable
		{
			public function void(ID3D11RenderTargetView* self, RenderTargetViewDescription *pDesc) GetDesc;
		}

		protected VTable* mVT;
		public VTable* VT
		{
			get
			{
				return mVT;
			}
		}

		// Todo: use inheritance instead of casting
		[Inline]
		public IUnknown* ToIUnknown() mut
		{
			return (.)&this;
		}

		[Inline]
		public ID3D11DeviceChild* ToDeviceChild() mut
		{
			return (.)&this;
		}

		[Inline]
		public ID3D11View* ToView() mut
		{
			return (.)&this;
		}

		public void Dispose() mut
		{
			mVT.Release((.)&this);
		}
	}
}
