using System;

namespace DirectX.Math
{
	[CRepr]
	public struct Vector4
	{
		public static readonly Vector4 Zero 	= .(0f, 0f, 0f, 0f);
		public static readonly Vector4 UnitX 	= .(1f, 0f, 0f, 0f);
		public static readonly Vector4 UnitY 	= .(0f, 1f, 0f, 0f);
		public static readonly Vector4 UnitZ 	= .(0f, 0f, 1f, 0f);
		public static readonly Vector4 UnitW 	= .(0f, 0f, 0f, 1f);
		public static readonly Vector4 One 		= .(1f, 1f, 1f, 1f);

		public float X, Y, Z, W;

		public this()
		{
			this = default;
		}

		public this(float value)
		{
			X = value;
			Y = value;
			Z = value;
			W = value;
		}
		
		public this(Vector2 value, float z, float w)
		{
			X = value.X;
			Y = value.Y;
			Z = z;
			W = w;
		}
		
		public this(Vector2 value1, Vector2 value2)
		{
			X = value1.X;
			Y = value1.Y;
			Z = value2.X;
			W = value2.Y;
		}

		public this(Vector3 value, float w)
		{
			X = value.X;
			Y = value.Y;
			Z = value.Z;
			W = w;
		}

		public this(float x, float y, float z, float w)
		{
			X = x;
			Y = y;
			Z = z;
			W = w;
		}

		public ref float this[int index]
		{
			[Checked, Inline]
			get mut
			{
				if(index < 0 || index > 3)
					Internal.ThrowIndexOutOfRange(1);

				return ref (&X)[index];
			}

			[Unchecked, Inline]
			get mut
			{
				return ref (&X)[index];
			}
		}

		//
		// Assignment operators
		//

		public void operator *=(float s) mut
		{
			X *= s;
			Y *= s;
			Z *= s;
			W *= s;
		}

		public void operator /=(float s) mut
		{
			float f = 1.0f / s;
			X *= f;
			Y *= f;
			Z *= f;
			W *= f;
		}

		public void operator +=(ref Vector4 v) mut
		{
			X += v.X;
			Y += v.Y;
			Z += v.Z;
			W += v.W;
		}

		public void operator -=(ref Vector4 v) mut
		{
			X -= v.X;
			Y -= v.Y;
			Z -= v.Z;
			W -= v.W;
		}

		//
		// operators
		//

		[Inline]
		public static Vector4 operator *(Vector4 v, float s)
		{
			return .(v.X * s, v.Y * s, v.Z * s, v.W * s);
		}

		[Inline]
		public static Vector4 operator *(float s, Vector4 v)
		{
			return v * s;
		}

		[Inline]
		public static Vector4 operator /(Vector4 v, float s)
		{	
			float f = 1.0f / s;
			return .(v.X * f, v.Y * f, v.Z * f, v.W * f);
		}

		[Inline]
		public static Vector4 operator /(float s, Vector4 v)
		{
			return .(s / v.X, s / v.Y, s / v.Z, s / v.W);
		}

		[Inline]
		public static Vector4 operator +(Vector4 l, Vector4 r)
		{
			return .(l.X + r.X, l.Y + r.Y, l.Z + r.Z, l.W + r.W);
		}

		[Inline]
		public static Vector4 operator -(Vector4 v)
		{
			return .(-v.X, -v.Y, -v.Z, -v.W);
		}

		[Inline]
		public static Vector4 operator -(Vector4 l, Vector4 r)
		{
			return .(l.X - r.X, l.Y - r.Y, l.Z - r.Z, l.W - r.W);
		}

		[Inline]
		public float Magnitude()
		{
			return Math.Sqrt(X * X + Y + Y + Z * Z + W * W);
		}

		[Inline]
		public void Normalize() mut
		{
			this /= Magnitude();
		}

		[Inline]
		public static Vector4 Normalize(ref Vector4 v)
		{
			return v / v.Magnitude();
		}

		[Inline]
		public float Dot(ref Vector4 l, ref Vector4 r)
		{
			return l.X * r.X + l.Y * r.Y + l.Z * r.Z + l.W * r.W;
		}

		/**
		* Calculates the projection of a onto b
		*/
		public Vector4 Project(ref Vector4 a, ref Vector4 b)
		{
			return (b * (Dot(ref a, ref b) / Dot(ref b, ref b)));
		}

		/**
		* Calculates the rejection of a from b
		*/
		public Vector4 Reject(ref Vector4 a, ref Vector4 b)
		{
			return (a - b * (Dot(ref a, ref b) / Dot(ref b, ref b)));
		}
	}
}
