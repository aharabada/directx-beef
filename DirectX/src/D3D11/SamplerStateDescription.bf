using System;

namespace DirectX.D3D11
{
	/**
	Describes a sampler state.
	D3D11_SAMPLER_DESC
	*/
	[CRepr]
	public struct SamplerStateDescription
	{
		/**
		Filtering method to use when sampling a texture.
		*/
		public  Filter Filter;
		/**
	   	Method to use for resolving a u texture coordinate that is outside the 0 to 1 range.
		*/
		public  TextureAddressMode AddressU;
		/**
	   	Method to use for resolving a v texture coordinate that is outside the 0 to 1 range.
		*/
		public  TextureAddressMode AddressV;
		/**
	   	Method to use for resolving a w texture coordinate that is outside the 0 to 1 range.
		*/
		public  TextureAddressMode AddressW;
		/**
		Offset from the calculated mipmap level.
		For example, if Direct3D calculates that a texture should be sampled at mipmap level 3 and MipLODBias is 2, then the texture will be sampled at mipmap level 5.
		*/
		public  float MipLODBias;
		/**
		Clamping value used if Filter.Anisotropic or Filter.Comparison_Anisotropic is specified in Filter.
		Valid values are between 1 and 16.
		*/
		public  uint32 MaxAnisotropy;
		/**
		A function that compares sampled data against existing sampled data.
		*/
		public  ComparisonFunction ComparisonFunc;
		/**
		Border color to use if TextureAddressMode.Border is specified for AddressU, AddressV, or AddressW. Range must be between 0.0 and 1.0 inclusive.
		*/
		public  ColorRGBA BorderColor;
		/**
		Lower end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed.
		*/
		public  float MinLOD;
		/**
		Upper end of the mipmap range to clamp access to, where 0 is the largest and most detailed mipmap level and any level higher than that is less detailed.
		This value must be greater than or equal to MinLOD. To have no upper limit on LOD set this to a large value such as float.MaxValue.
		*/
		public  float MaxLOD;

		public this()
		{
			this = default;
		}

		public this(Filter filter, TextureAddressMode addressU,	TextureAddressMode addressV, TextureAddressMode addressW, float mipLODBias,
			uint32 maxAnisotropy, ComparisonFunction comparisonFunc, ColorRGBA borderColor, float minLOD, float maxLOD)
		{
			Filter = filter;
			AddressU = addressU;
			AddressV = addressV;
			AddressW = addressW;
			MipLODBias = mipLODBias;
			MaxAnisotropy = maxAnisotropy;
			ComparisonFunc = comparisonFunc;
			BorderColor = borderColor;
			MinLOD = minLOD;
			MaxLOD = maxLOD;
		}

		public static readonly Self Default = .(.Min_Mag_Mip_Linear, .Clamp, .Clamp, .Clamp, 0, 1, .Never, .White, float.MinValue, float.MaxValue);
	}
}
