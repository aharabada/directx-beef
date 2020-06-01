using System;

namespace DirectX.Math
{
	[CRepr]
	public struct Vector2
	{
		public static readonly Vector2 Zero 	= .(0f, 0f);
		public static readonly Vector2 UnitX 	= .(1f, 0f);
		public static readonly Vector2 UnitY 	= .(0f, 1f);
		public static readonly Vector2 One 		= .(1f, 1f);

		public float X, Y;

		public this()
		{
			this = default;
		}

		public this(float value)
		{
			X = value;
			Y = value;
		}

		public this(float x, float y)
		{
			X = x;
			Y = y;
		}

		public ref float this[int index]
		{
			[Checked, Inline]
			get mut
			{
				if(index < 0 || index > 1)
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
		}

		public void operator /=(float s) mut
		{
			float f = 1.0f / s;
			X *= f;
			Y *= f;
		}

		public void operator +=(ref Vector2 v) mut
		{
			X += v.X;
			Y += v.Y;
		}

		public void operator -=(ref Vector2 v) mut
		{
			X -= v.X;
			Y -= v.Y;
		}

		//
		// operators
		//

		[Inline]
		public static Vector2 operator *(Vector2 v, float s)
		{
			return .(v.X * s, v.Y * s);
		}

		[Inline]
		public static Vector2 operator *(float s, Vector2 v)
		{
			return v * s;
		}

		[Inline]
		public static Vector2 operator /(Vector2 v, float s)
		{	
			float f = 1.0f / s;
			return .(v.X * f, v.Y * f);
		}

		[Inline]
		public static Vector2 operator /(float s, Vector2 v)
		{
			return .(s / v.X, s / v.Y);
		}

		[Inline]
		public static Vector2 operator +(Vector2 l, Vector2 r)
		{
			return .(l.X + r.X, l.Y + r.Y);
		}

		[Inline]
		public static Vector2 operator -(Vector2 v)
		{
			return .(-v.X, -v.Y);
		}

		[Inline]
		public static Vector2 operator -(Vector2 l, Vector2 r)
		{
			return .(l.X - r.X, l.Y - r.Y);
		}

		[Inline]
		public float Magnitude()
		{
			return Math.Sqrt(X * X + Y + Y);
		}


		[Inline]
		public void Normalize() mut
		{
			this /= Magnitude();
		}
		
		[Inline]
		public static Vector2 Normalize(ref Vector2 v)
		{
			return v / v.Magnitude();
		}

		[Inline]
		public float Dot(ref Vector2 l, ref Vector2 r)
		{
			return l.X * r.X + l.Y * r.Y;
		}

		/**
		* Calculates the projection of a onto b
		*/
		public Vector2 Project(ref Vector2 a, ref Vector2 b)
		{
			return (b * (Dot(ref a, ref b) / Dot(ref b, ref b)));
		}

		/**
		* Calculates the rejection of a from b
		*/
		public Vector2 Reject(ref Vector2 a, ref Vector2 b)
		{
			return (a - b * (Dot(ref a, ref b) / Dot(ref b, ref b)));
		}
	}
}
