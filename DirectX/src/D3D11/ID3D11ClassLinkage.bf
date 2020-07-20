using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * This interface encapsulates an HLSL dynamic linkage.
	*/
	public struct ID3D11ClassLinkage : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => .("ddf57cba-9543-46e4-a12b-f207a0fe7fed");

		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function HResult(ID3D11ClassLinkage *self, char8 *pClassInstanceName, UINT instanceIndex, ID3D11ClassInstance **ppInstance) GetClassInstance;
			public function HResult(ID3D11ClassLinkage *self, char8 *pClassTypeName, UINT constantBufferOffset, UINT constantVectorOffset, UINT textureOffset, UINT samplerOffset, ID3D11ClassInstance **ppInstance) CreateClassInstance;
		};

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the class-instance object that represents the specified HLSL class.
		 *
		 * @param pClassInstanceName	The name of a class for which to get the class instance.
		 * @param instanceIndex			The index of the class instance.
		 * @param ppInstace				The address of a pointer to an ID3D11ClassInstance interface to initialize.
		*/
		public HResult GetClassInstance(char8 *pClassInstanceName, UINT instanceIndex, ID3D11ClassInstance **ppInstance) mut
		{
			return VT.GetClassInstance(&this, pClassInstanceName, instanceIndex, ppInstance);
		}

		/**
		 * Initializes a class-instance object that represents an HLSL class instance.
		 *
		 * @param pClassTypeName		The type name of a class to initialize.
		 * @param constantBufferOffset	Identifies the constant buffer that contains the class data.
		 * @param constantVectorOffset	The four-component vector offset from the start of the constant buffer where the class data will begin.
		 *								Consequently, this is not a byte offset.
		 * @param textureOffset			The texture slot for the first texture; there may be multiple textures following the offset.
		 * @param samplerOffset			The sampler slot for the first sampler; there may be multiple samplers following the offset.
		 * @param ppInstance			The address of a pointer to an ID3D11ClassInstance interface to initialize.
		*/
		public HResult CreateClassInstance(char8 *pClassTypeName, UINT constantBufferOffset, UINT constantVectorOffset, UINT textureOffset, UINT samplerOffset, ID3D11ClassInstance **ppInstance) mut
		{
			return VT.CreateClassInstance(&this, pClassTypeName, constantBufferOffset, constantVectorOffset, textureOffset, samplerOffset, ppInstance);
		}
	}
}
