using System;

namespace DirectX.Math
{
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
			[Checked]
			get mut
			{
				if(index < 0 || index > 1)
					Internal.ThrowIndexOutOfRange();

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

		public void operator *=(Vector2 v) mut
		{
			X *= v.X;
			Y *= v.Y;
		}

		public void operator /=(Vector2 v) mut
		{
			X /= v.X;
			Y /= v.Y;
		}

		public void operator +=(Vector2 v) mut
		{
			X += v.X;
			Y += v.Y;
		}

		public void operator -=(Vector2 v) mut
		{
			X -= v.X;
			Y -= v.Y;
		}

		//
		// operators
		//

		public static Vector2 operator *(Vector2 v, float s)
		{
			return .(v.X * s, v.Y * s);
		}

		public static Vector2 operator *(float s, Vector2 v)
		{
			return v * s;
		}

		public static Vector2 operator /(Vector2 v, float s)
		{	
			float f = 1.0f / s;
			return .(v.X * f, v.Y * f);
		}

		public static Vector2 operator /(float s, Vector2 v)
		{
			return .(s / v.X, s / v.Y);
		}

		public static Vector2 operator +(Vector2 l, Vector2 r)
		{
			return .(l.X + r.X, l.Y + r.Y);
		}

		public static Vector2 operator -(Vector2 v)
		{
			return .(-v.X, -v.Y);
		}

		public static Vector2 operator -(Vector2 l, Vector2 r)
		{
			return .(l.X - r.X, l.Y - r.Y);
		}

		public float Magnitude()
		{
			return Math.Sqrt(X * X + Y * Y);
		}

		public float MagnitudeSquared()
		{
			return X * X + Y * Y;
		}

		public void Normalize() mut
		{
			this /= Magnitude();
		}
		
		public static Vector2 Normalize(Vector2 v)
		{
			return v / v.Magnitude();
		}

		public float Dot(Vector2 l, Vector2 r)
		{
			return l.X * r.X + l.Y * r.Y;
		}

		/**
		* Calculates the projection of a onto b
		*/
		public Vector2 Project(Vector2 a, Vector2 b)
		{
			return (b * (Dot(a, b) / Dot(b, b)));
		}

		/**
		* Calculates the rejection of a from b
		*/
		public Vector2 Reject(Vector2 a, Vector2 b)
		{
			return (a - b * (Dot(a, b) / Dot(b, b)));
		}
	}
}
