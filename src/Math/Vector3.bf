using System;

namespace DirectX.Math
{
	[CRepr]
	public struct Vector3
	{
		public static readonly Vector3 Zero 	= .(0f, 0f, 0f);
		public static readonly Vector3 UnitX 	= .(1f, 0f, 0f);
		public static readonly Vector3 UnitY 	= .(0f, 1f, 0f);
		public static readonly Vector3 UnitZ 	= .(0f, 0f, 1f);
		public static readonly Vector3 One 		= .(1f, 1f, 1f);
		
		public static readonly Vector3 Forward 	= .(0f, 0f, 1f);	
		public static readonly Vector3 Backward = .(0f, 0f, -1f);	
		public static readonly Vector3 Left 	= .(-1f, 0f, 0f); 	
		public static readonly Vector3 Right 	= .(1f, 0f, 0f);  	
		public static readonly Vector3 Up 		= .(0f, 1f, 0f); 	
		public static readonly Vector3 Down 	= .(0f, -1f, 0f);

		public float X, Y, Z;

		public this()
		{
			this = default;
		}

		public this(float value)
		{
			X = value;
			Y = value;
			Z = value;
		}

		public this(Vector2 value, float z)
		{
			X = value.X;
			Y = value.Y;
			Z = z;
		}

		public this(float x, float y, float z)
		{
			X = x;
			Y = y;
			Z = z;
		}

		public ref float this[int index]
		{
			[Checked, Inline]
			get mut
			{
				if(index < 0 || index > 2)
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
		}

		public void operator /=(float s) mut
		{
			float f = 1.0f / s;
			X *= f;
			Y *= f;
			Z *= f;
		}

		public void operator +=(ref Vector3 v) mut
		{
			X += v.X;
			Y += v.Y;
			Z += v.Z;
		}

		public void operator -=(ref Vector3 v) mut
		{
			X -= v.X;
			Y -= v.Y;
			Z -= v.Z;
		}

		//
		// operators
		//

		[Inline]
		public static Vector3 operator *(Vector3 v, float s)
		{
			return .(v.X * s, v.Y * s, v.Z * s);
		}

		[Inline]
		public static Vector3 operator *(float s, Vector3 v)
		{
			return v * s;
		}

		[Inline]
		public static Vector3 operator /(Vector3 v, float s)
		{	
			float f = 1.0f / s;
			return .(v.X * f, v.Y * f, v.Z * f);
		}

		[Inline]
		public static Vector3 operator /(float s, Vector3 v)
		{
			return .(s / v.X, s / v.Y, s / v.Z);
		}

		[Inline]
		public static Vector3 operator +(Vector3 l, Vector3 r)
		{
			return .(l.X + r.X, l.Y + r.Y, l.Z + r.Z);
		}

		[Inline]
		public static Vector3 operator -(Vector3 v)
		{
			return .(-v.X, -v.Y, -v.Z);
		}

		[Inline]
		public static Vector3 operator -(Vector3 l, Vector3 r)
		{
			return .(l.X - r.X, l.Y - r.Y, l.Z - r.Z);
		}

		[Inline]
		public float Magnitude()
		{
			return Math.Sqrt(X * X + Y + Y + Z * Z);
		}

		[Inline]
		public void Normalize() mut
		{
			this /= Magnitude();
		}
		
		[Inline]
		public static Vector3 Normalize(ref Vector3 v)
		{
			return v / v.Magnitude();
		}

		[Inline]
		public static float Dot(ref Vector3 l, ref Vector3 r)
		{
			return l.X * r.X + l.Y * r.Y + l.Z * r.Z;
		}

		[Inline]
		public static Vector3 Cross(ref Vector3 l, ref Vector3 r)
		{
			return .(l.Y * r.Z - l.Z * r.Y,
					 l.Z * r.X - l.X * r.Z,
					 l.X * r.Y - l.Y * r.X);
		}

		/**
		* Calculates the projection of a onto b
		*/
		public static Vector3 Project(ref Vector3 a, ref Vector3 b)
		{
			return (b * (Dot(ref a, ref b) / Dot(ref b, ref b)));
		}

		
		/**
		* Calculates the rejection of a from b
		*/
		public static Vector3 Reject(ref Vector3 a, ref Vector3 b)
		{
			return (a - b * (Dot(ref a, ref b) / Dot(ref b, ref b)));
		}
	}
}
