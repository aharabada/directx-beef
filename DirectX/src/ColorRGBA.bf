using System;

namespace DirectX
{
	/**
	Represents a four component floating point color
	*/
	[CRepr]
	public struct ColorRGBA
	{
		// from DirectXColors.h
		public static readonly ColorRGBA AliceBlue            = .( 0.941176534f, 0.972549081f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA AntiqueWhite         = .( 0.980392218f, 0.921568692f, 0.843137324f, 1.000000000f );
		public static readonly ColorRGBA Aqua                 = .( 0.000000000f, 1.000000000f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA Aquamarine           = .( 0.498039246f, 1.000000000f, 0.831372619f, 1.000000000f );
		public static readonly ColorRGBA Azure                = .( 0.941176534f, 1.000000000f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA Beige                = .( 0.960784376f, 0.960784376f, 0.862745166f, 1.000000000f );
		public static readonly ColorRGBA Bisque               = .( 1.000000000f, 0.894117713f, 0.768627524f, 1.000000000f );
		public static readonly ColorRGBA Black                = .( 0.000000000f, 0.000000000f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA BlanchedAlmond       = .( 1.000000000f, 0.921568692f, 0.803921640f, 1.000000000f );
		public static readonly ColorRGBA Blue                 = .( 0.000000000f, 0.000000000f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA BlueViolet           = .( 0.541176498f, 0.168627456f, 0.886274576f, 1.000000000f );
		public static readonly ColorRGBA Brown                = .( 0.647058845f, 0.164705887f, 0.164705887f, 1.000000000f );
		public static readonly ColorRGBA BurlyWood            = .( 0.870588303f, 0.721568644f, 0.529411793f, 1.000000000f );
		public static readonly ColorRGBA CadetBlue            = .( 0.372549027f, 0.619607866f, 0.627451003f, 1.000000000f );
		public static readonly ColorRGBA Chartreuse           = .( 0.498039246f, 1.000000000f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA Chocolate            = .( 0.823529482f, 0.411764741f, 0.117647067f, 1.000000000f );
		public static readonly ColorRGBA Coral                = .( 1.000000000f, 0.498039246f, 0.313725501f, 1.000000000f );
		public static readonly ColorRGBA CornflowerBlue       = .( 0.392156899f, 0.584313750f, 0.929411829f, 1.000000000f );
		public static readonly ColorRGBA Cornsilk             = .( 1.000000000f, 0.972549081f, 0.862745166f, 1.000000000f );
		public static readonly ColorRGBA Crimson              = .( 0.862745166f, 0.078431375f, 0.235294133f, 1.000000000f );
		public static readonly ColorRGBA Cyan                 = .( 0.000000000f, 1.000000000f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA DarkBlue             = .( 0.000000000f, 0.000000000f, 0.545098066f, 1.000000000f );
		public static readonly ColorRGBA DarkCyan             = .( 0.000000000f, 0.545098066f, 0.545098066f, 1.000000000f );
		public static readonly ColorRGBA DarkGoldenrod        = .( 0.721568644f, 0.525490224f, 0.043137256f, 1.000000000f );
		public static readonly ColorRGBA DarkGray             = .( 0.662745118f, 0.662745118f, 0.662745118f, 1.000000000f );
		public static readonly ColorRGBA DarkGreen            = .( 0.000000000f, 0.392156899f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA DarkKhaki            = .( 0.741176486f, 0.717647076f, 0.419607878f, 1.000000000f );
		public static readonly ColorRGBA DarkMagenta          = .( 0.545098066f, 0.000000000f, 0.545098066f, 1.000000000f );
		public static readonly ColorRGBA DarkOliveGreen       = .( 0.333333343f, 0.419607878f, 0.184313729f, 1.000000000f );
		public static readonly ColorRGBA DarkOrange           = .( 1.000000000f, 0.549019635f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA DarkOrchid           = .( 0.600000024f, 0.196078449f, 0.800000072f, 1.000000000f );
		public static readonly ColorRGBA DarkRed              = .( 0.545098066f, 0.000000000f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA DarkSalmon           = .( 0.913725555f, 0.588235319f, 0.478431404f, 1.000000000f );
		public static readonly ColorRGBA DarkSeaGreen         = .( 0.560784340f, 0.737254918f, 0.545098066f, 1.000000000f );
		public static readonly ColorRGBA DarkSlateBlue        = .( 0.282352954f, 0.239215702f, 0.545098066f, 1.000000000f );
		public static readonly ColorRGBA DarkSlateGray        = .( 0.184313729f, 0.309803933f, 0.309803933f, 1.000000000f );
		public static readonly ColorRGBA DarkTurquoise        = .( 0.000000000f, 0.807843208f, 0.819607913f, 1.000000000f );
		public static readonly ColorRGBA DarkViolet           = .( 0.580392182f, 0.000000000f, 0.827451050f, 1.000000000f );
		public static readonly ColorRGBA DeepPink             = .( 1.000000000f, 0.078431375f, 0.576470613f, 1.000000000f );
		public static readonly ColorRGBA DeepSkyBlue          = .( 0.000000000f, 0.749019623f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA DimGray              = .( 0.411764741f, 0.411764741f, 0.411764741f, 1.000000000f );
		public static readonly ColorRGBA DodgerBlue           = .( 0.117647067f, 0.564705908f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA Firebrick            = .( 0.698039234f, 0.133333340f, 0.133333340f, 1.000000000f );
		public static readonly ColorRGBA FloralWhite          = .( 1.000000000f, 0.980392218f, 0.941176534f, 1.000000000f );
		public static readonly ColorRGBA ForestGreen          = .( 0.133333340f, 0.545098066f, 0.133333340f, 1.000000000f );
		public static readonly ColorRGBA Fuchsia              = .( 1.000000000f, 0.000000000f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA Gainsboro            = .( 0.862745166f, 0.862745166f, 0.862745166f, 1.000000000f );
		public static readonly ColorRGBA GhostWhite           = .( 0.972549081f, 0.972549081f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA Gold                 = .( 1.000000000f, 0.843137324f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA Goldenrod            = .( 0.854902029f, 0.647058845f, 0.125490203f, 1.000000000f );
		public static readonly ColorRGBA Gray                 = .( 0.501960814f, 0.501960814f, 0.501960814f, 1.000000000f );
		public static readonly ColorRGBA Green                = .( 0.000000000f, 0.501960814f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA GreenYellow          = .( 0.678431392f, 1.000000000f, 0.184313729f, 1.000000000f );
		public static readonly ColorRGBA Honeydew             = .( 0.941176534f, 1.000000000f, 0.941176534f, 1.000000000f );
		public static readonly ColorRGBA HotPink              = .( 1.000000000f, 0.411764741f, 0.705882370f, 1.000000000f );
		public static readonly ColorRGBA IndianRed            = .( 0.803921640f, 0.360784322f, 0.360784322f, 1.000000000f );
		public static readonly ColorRGBA Indigo               = .( 0.294117659f, 0.000000000f, 0.509803951f, 1.000000000f );
		public static readonly ColorRGBA Ivory                = .( 1.000000000f, 1.000000000f, 0.941176534f, 1.000000000f );
		public static readonly ColorRGBA Khaki                = .( 0.941176534f, 0.901960850f, 0.549019635f, 1.000000000f );
		public static readonly ColorRGBA Lavender             = .( 0.901960850f, 0.901960850f, 0.980392218f, 1.000000000f );
		public static readonly ColorRGBA LavenderBlush        = .( 1.000000000f, 0.941176534f, 0.960784376f, 1.000000000f );
		public static readonly ColorRGBA LawnGreen            = .( 0.486274540f, 0.988235354f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA LemonChiffon         = .( 1.000000000f, 0.980392218f, 0.803921640f, 1.000000000f );
		public static readonly ColorRGBA LightBlue            = .( 0.678431392f, 0.847058892f, 0.901960850f, 1.000000000f );
		public static readonly ColorRGBA LightCoral           = .( 0.941176534f, 0.501960814f, 0.501960814f, 1.000000000f );
		public static readonly ColorRGBA LightCyan            = .( 0.878431439f, 1.000000000f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA LightGoldenrodYellow = .( 0.980392218f, 0.980392218f, 0.823529482f, 1.000000000f );
		public static readonly ColorRGBA LightGreen           = .( 0.564705908f, 0.933333397f, 0.564705908f, 1.000000000f );
		public static readonly ColorRGBA LightGray            = .( 0.827451050f, 0.827451050f, 0.827451050f, 1.000000000f );
		public static readonly ColorRGBA LightPink            = .( 1.000000000f, 0.713725507f, 0.756862819f, 1.000000000f );
		public static readonly ColorRGBA LightSalmon          = .( 1.000000000f, 0.627451003f, 0.478431404f, 1.000000000f );
		public static readonly ColorRGBA LightSeaGreen        = .( 0.125490203f, 0.698039234f, 0.666666687f, 1.000000000f );
		public static readonly ColorRGBA LightSkyBlue         = .( 0.529411793f, 0.807843208f, 0.980392218f, 1.000000000f );
		public static readonly ColorRGBA LightSlateGray       = .( 0.466666698f, 0.533333361f, 0.600000024f, 1.000000000f );
		public static readonly ColorRGBA LightSteelBlue       = .( 0.690196097f, 0.768627524f, 0.870588303f, 1.000000000f );
		public static readonly ColorRGBA LightYellow          = .( 1.000000000f, 1.000000000f, 0.878431439f, 1.000000000f );
		public static readonly ColorRGBA Lime                 = .( 0.000000000f, 1.000000000f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA LimeGreen            = .( 0.196078449f, 0.803921640f, 0.196078449f, 1.000000000f );
		public static readonly ColorRGBA Linen                = .( 0.980392218f, 0.941176534f, 0.901960850f, 1.000000000f );
		public static readonly ColorRGBA Magenta              = .( 1.000000000f, 0.000000000f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA Maroon               = .( 0.501960814f, 0.000000000f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA MediumAquamarine     = .( 0.400000036f, 0.803921640f, 0.666666687f, 1.000000000f );
		public static readonly ColorRGBA MediumBlue           = .( 0.000000000f, 0.000000000f, 0.803921640f, 1.000000000f );
		public static readonly ColorRGBA MediumOrchid         = .( 0.729411781f, 0.333333343f, 0.827451050f, 1.000000000f );
		public static readonly ColorRGBA MediumPurple         = .( 0.576470613f, 0.439215720f, 0.858823597f, 1.000000000f );
		public static readonly ColorRGBA MediumSeaGreen       = .( 0.235294133f, 0.701960802f, 0.443137288f, 1.000000000f );
		public static readonly ColorRGBA MediumSlateBlue      = .( 0.482352972f, 0.407843173f, 0.933333397f, 1.000000000f );
		public static readonly ColorRGBA MediumSpringGreen    = .( 0.000000000f, 0.980392218f, 0.603921592f, 1.000000000f );
		public static readonly ColorRGBA MediumTurquoise      = .( 0.282352954f, 0.819607913f, 0.800000072f, 1.000000000f );
		public static readonly ColorRGBA MediumVioletRed      = .( 0.780392230f, 0.082352944f, 0.521568656f, 1.000000000f );
		public static readonly ColorRGBA MidnightBlue         = .( 0.098039225f, 0.098039225f, 0.439215720f, 1.000000000f );
		public static readonly ColorRGBA MintCream            = .( 0.960784376f, 1.000000000f, 0.980392218f, 1.000000000f );
		public static readonly ColorRGBA MistyRose            = .( 1.000000000f, 0.894117713f, 0.882353008f, 1.000000000f );
		public static readonly ColorRGBA Moccasin             = .( 1.000000000f, 0.894117713f, 0.709803939f, 1.000000000f );
		public static readonly ColorRGBA NavajoWhite          = .( 1.000000000f, 0.870588303f, 0.678431392f, 1.000000000f );
		public static readonly ColorRGBA Navy                 = .( 0.000000000f, 0.000000000f, 0.501960814f, 1.000000000f );
		public static readonly ColorRGBA OldLace              = .( 0.992156923f, 0.960784376f, 0.901960850f, 1.000000000f );
		public static readonly ColorRGBA Olive                = .( 0.501960814f, 0.501960814f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA OliveDrab            = .( 0.419607878f, 0.556862772f, 0.137254909f, 1.000000000f );
		public static readonly ColorRGBA Orange               = .( 1.000000000f, 0.647058845f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA OrangeRed            = .( 1.000000000f, 0.270588249f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA Orchid               = .( 0.854902029f, 0.439215720f, 0.839215755f, 1.000000000f );
		public static readonly ColorRGBA PaleGoldenrod        = .( 0.933333397f, 0.909803987f, 0.666666687f, 1.000000000f );
		public static readonly ColorRGBA PaleGreen            = .( 0.596078455f, 0.984313786f, 0.596078455f, 1.000000000f );
		public static readonly ColorRGBA PaleTurquoise        = .( 0.686274529f, 0.933333397f, 0.933333397f, 1.000000000f );
		public static readonly ColorRGBA PaleVioletRed        = .( 0.858823597f, 0.439215720f, 0.576470613f, 1.000000000f );
		public static readonly ColorRGBA PapayaWhip           = .( 1.000000000f, 0.937254965f, 0.835294187f, 1.000000000f );
		public static readonly ColorRGBA PeachPuff            = .( 1.000000000f, 0.854902029f, 0.725490212f, 1.000000000f );
		public static readonly ColorRGBA Peru                 = .( 0.803921640f, 0.521568656f, 0.247058839f, 1.000000000f );
		public static readonly ColorRGBA Pink                 = .( 1.000000000f, 0.752941251f, 0.796078503f, 1.000000000f );
		public static readonly ColorRGBA Plum                 = .( 0.866666734f, 0.627451003f, 0.866666734f, 1.000000000f );
		public static readonly ColorRGBA PowderBlue           = .( 0.690196097f, 0.878431439f, 0.901960850f, 1.000000000f );
		public static readonly ColorRGBA Purple               = .( 0.501960814f, 0.000000000f, 0.501960814f, 1.000000000f );
		public static readonly ColorRGBA Red                  = .( 1.000000000f, 0.000000000f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA RosyBrown            = .( 0.737254918f, 0.560784340f, 0.560784340f, 1.000000000f );
		public static readonly ColorRGBA RoyalBlue            = .( 0.254901975f, 0.411764741f, 0.882353008f, 1.000000000f );
		public static readonly ColorRGBA SaddleBrown          = .( 0.545098066f, 0.270588249f, 0.074509807f, 1.000000000f );
		public static readonly ColorRGBA Salmon               = .( 0.980392218f, 0.501960814f, 0.447058856f, 1.000000000f );
		public static readonly ColorRGBA SandyBrown           = .( 0.956862807f, 0.643137276f, 0.376470625f, 1.000000000f );
		public static readonly ColorRGBA SeaGreen             = .( 0.180392161f, 0.545098066f, 0.341176480f, 1.000000000f );
		public static readonly ColorRGBA SeaShell             = .( 1.000000000f, 0.960784376f, 0.933333397f, 1.000000000f );
		public static readonly ColorRGBA Sienna               = .( 0.627451003f, 0.321568638f, 0.176470593f, 1.000000000f );
		public static readonly ColorRGBA Silver               = .( 0.752941251f, 0.752941251f, 0.752941251f, 1.000000000f );
		public static readonly ColorRGBA SkyBlue              = .( 0.529411793f, 0.807843208f, 0.921568692f, 1.000000000f );
		public static readonly ColorRGBA SlateBlue            = .( 0.415686309f, 0.352941185f, 0.803921640f, 1.000000000f );
		public static readonly ColorRGBA SlateGray            = .( 0.439215720f, 0.501960814f, 0.564705908f, 1.000000000f );
		public static readonly ColorRGBA Snow                 = .( 1.000000000f, 0.980392218f, 0.980392218f, 1.000000000f );
		public static readonly ColorRGBA SpringGreen          = .( 0.000000000f, 1.000000000f, 0.498039246f, 1.000000000f );
		public static readonly ColorRGBA SteelBlue            = .( 0.274509817f, 0.509803951f, 0.705882370f, 1.000000000f );
		public static readonly ColorRGBA Tan                  = .( 0.823529482f, 0.705882370f, 0.549019635f, 1.000000000f );
		public static readonly ColorRGBA Teal                 = .( 0.000000000f, 0.501960814f, 0.501960814f, 1.000000000f );
		public static readonly ColorRGBA Thistle              = .( 0.847058892f, 0.749019623f, 0.847058892f, 1.000000000f );
		public static readonly ColorRGBA Tomato               = .( 1.000000000f, 0.388235331f, 0.278431386f, 1.000000000f );
		public static readonly ColorRGBA Transparent          = .( 0.000000000f, 0.000000000f, 0.000000000f, 0.000000000f );
		public static readonly ColorRGBA Turquoise            = .( 0.250980407f, 0.878431439f, 0.815686345f, 1.000000000f );
		public static readonly ColorRGBA Violet               = .( 0.933333397f, 0.509803951f, 0.933333397f, 1.000000000f );
		public static readonly ColorRGBA Wheat                = .( 0.960784376f, 0.870588303f, 0.701960802f, 1.000000000f );
		public static readonly ColorRGBA White                = .( 1.000000000f, 1.000000000f, 1.000000000f, 1.000000000f );
		public static readonly ColorRGBA WhiteSmoke           = .( 0.960784376f, 0.960784376f, 0.960784376f, 1.000000000f );
		public static readonly ColorRGBA Yellow               = .( 1.000000000f, 1.000000000f, 0.000000000f, 1.000000000f );
		public static readonly ColorRGBA YellowGreen          = .( 0.603921592f, 0.803921640f, 0.196078449f, 1.000000000f );

		/**
		The red-component of the color
		*/
		public float R;
		/**
		The green-component of the color
		*/
		public float G;
		/**
		The blue-component of the color
		*/
		public float B;
		/**
		The alpha-component of the color
		*/
		public float A;

		/**
		Creates a new instance of ColorRGBA with all components set to 0.
		*/
		public this()
		{
			this = default;
		}
		
		/**
		Creates a new instance of ColorRGBA with the RGB-values set to the specified values and alpha set to 1.of.
		*/
		public this(float r, float g, float b)
		{
			R = r;
			G = g;
			B = b;
			A = 1.0f;
		}
		
		/**
		Creates a new instance of ColorRGBA with the specified values.
		*/
		public this(float r, float g, float b, float a)
		{
			R = r;
			G = g;
			B = b;
			A = a;
		}
		
		/**
		Creates a new instance of ColorRGBA with the specified values.
		*/
		public this(ColorRGB color, float a)
		{
			R = color.Red;
			G = color.Green;
			B = color.Blue;
			A = a;
		}

		public ref float this[int index]
		{
			[Unchecked]
			get mut
			{
				return ref (&R)[index];
			}

			[Checked]
			get mut
			{			 
				Runtime.Assert(index < 0 || index > 3);
				return ref (&R)[index];
			}
		}

		[Inline]
		public float* ToPtr() mut
		{
			return &R;
		}

		///
		/// Addition
		///

		public void operator +=(ColorRGBA value) mut
		{
			R += value.R;
			G += value.G;
			B += value.B;
			A += value.A;
		}

		public static ColorRGBA operator +(ColorRGBA left, ColorRGBA right)
		{
			return .(left.R + right.R, left.G + right.G, left.B + right.B, left.A + right.A);
		}
		
		///
		/// Subtraction
		///

		public void operator -=(ColorRGBA value) mut
		{
			R -= value.R;
			G -= value.G;
			B -= value.B;
			A -= value.A;
		}

		public static ColorRGBA operator -(ColorRGBA left, ColorRGBA right)
		{
			return .(left.R - right.R, left.G - right.G, left.B - right.B, left.A - right.A);
		}
 
		///
		/// Multiplication
		///

		public void operator *=(ColorRGBA value) mut
		{
			R *= value.R;
			G *= value.G;
			B *= value.B;
			A *= value.A;
		}

		public void operator *=(float value) mut
		{
			R *= value;
			G *= value;
			B *= value;
			A *= value;
		}

		public static ColorRGBA operator *(ColorRGBA left, ColorRGBA right)
		{
			return .(left.R * right.R, left.G * right.G, left.B * right.B, left.A * right.A);
		}

		public static ColorRGBA operator *(ColorRGBA left, float right)
		{
			return .(left.R * right, left.G * right, left.B * right, left.A * right);
		}

		public static ColorRGBA operator *(float left, ColorRGBA right)
		{
			return .(left * right.R, left * right.G, left * right.B, left * right.A);
		}

		///
		/// Division
		///

		public void operator /=(float value) mut
		{
			R /= value;
			G /= value;
			B /= value;
			A /= value;
		}

		public static ColorRGBA operator /(ColorRGBA left, float right)
		{
			return .(left.R / right, left.G / right, left.B / right, left.A / right);
		}

		public static ColorRGBA operator /(float left, ColorRGBA right)
		{
			return .(left / right.R, left / right.G, left / right.B, left / right.A);
		}

		public static implicit operator ColorRGB(ColorRGBA color)
		{
			return .(color.R, color.G, color.B);
		}
	}
}
