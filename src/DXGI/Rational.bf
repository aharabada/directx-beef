using System;

namespace DirectX.DXGI
{
	// Todo: It is placed in dxgicommon -> Common-Namespace?
	/**
	Represents a rational number.
	Link: https://docs.microsoft.com/en-us/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_rational
	*/ 
	[CRepr]
	public struct Rational // DXGI_RATIONAL
	{
		/**
		An unsigned integer value representing the top of the rational number.
		*/
		public uint32 Numerator;
		/**
		An unsigned integer value representing the bottom of the rational number.
		*/
		public uint32 Denominator;

		public this()
		{
			this = default;

		}

		public this(uint32 numerator, uint32 denominator)
		{
			Numerator = numerator;
			Denominator = denominator;
		}
	}
}
