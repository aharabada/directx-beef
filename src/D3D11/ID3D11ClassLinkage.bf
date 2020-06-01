using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	public struct ID3D11ClassLinkage : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => .("ddf57cba-9543-46e4-a12b-f207a0fe7fed");

		public struct VTable : ID3D11DeviceChild.VTable
		{
			// Todo:
			//public function HResult(ID3D11ClassLinkage* self, char8* pClassInstanceName, uint32 InstanceIndex, ID3D11ClassInstance** ppInstance) GetClassInstance;  
			//public function HResult(ID3D11ClassLinkage* self, char8* pClassTypeName, uint32 ConstantBufferOffset,
			//	uint32 ConstantVectorOffset, uint32 TextureOffset, uint32 SamplerOffset, ID3D11ClassInstance **ppInstance) CreateClassInstance;
		};

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}
	}
}
