using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	Describes an HLSL class instance.
	*/
	[CRepr]
	public struct ClassInstanceDescription
	{
		/**
		The instance ID of an HLSL class; the default value is 0.
		*/
		public UINT InstanceId;
		/**
		The instance index of an HLSL class; the default value is 0.
		*/
		public UINT InstanceIndex;
		/**
		The type ID of an HLSL class; the default value is 0.
		*/
		public UINT TypeId;
		/**
		Describes the constant buffer associated with an HLSL class; the default value is 0.
		*/
		public UINT ConstantBuffer;
		/**
		The base constant buffer offset associated with an HLSL class; the default value is 0.
		*/
		public UINT BaseConstantBufferOffset;
		/**
		The base texture associated with an HLSL class; the default value is 127.
		*/
		public UINT BaseTexture;
		/**
		The base sampler associated with an HLSL class; the default value is 15.
		*/
		public UINT BaseSampler;
		/**
		True if the class was created; the default value is false.
		*/
		public BOOL Created;
	}
}
