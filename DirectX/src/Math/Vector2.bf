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

		public this() => this = default;

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
			get
			{
				if(index < 0 || index > 2)
					Internal.ThrowIndexOutOfRange();

				return ref (&X)[index];
			}

			[Inline]
			get => ref (&X)[index];
		}
		
		/**
		 * Calculates the magnitude (length) of this vector.
		 * @remarks MagnitudeSquared might be used if only the relative length is relevant.
		 */
		public float Magnitude()
		{
			return Math.Sqrt(X * X + Y * Y);
		}
		
		/**
		 * Calculates the squared magnitude (length) of this vector.
		 */
		public float MagnitudeSquared()
		{
			return X * X + Y * Y;
		}
		
		[Checked]
		public void Normalize() mut
		{
			if(this == .Zero)
				return;

			this /= Magnitude();
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
		
		//
		// Assignment operators
		//

		// Addition

		public void operator +=(Vector2 value) mut
		{
			X += value.X;
			Y += value.Y;
		}

		public void operator +=(float scalar) mut
		{
			X += scalar;
			Y += scalar;
		}

		// Subtraction

		public void operator -=(Vector2 value) mut
		{
			X -= value.X;
			Y -= value.Y;
		}

		public void operator -=(float scalar) mut
		{
			X -= scalar;
			Y -= scalar;
		}

		// Multiplication

		public void operator *=(Vector2 value) mut
		{
			X *= value.X;
			Y *= value.Y;
		}

		public void operator *=(float scalar) mut
		{
			X *= scalar;
			Y *= scalar;
		}

		// Division

		public void operator /=(float scalar) mut
		{
			float f = 1.0f / scalar;
			X *= f;
			Y *= f;
		}

		public void operator /=(Vector2 value) mut
		{
			X /= value.X;
			Y /= value.Y;
		}

		//
		// operators
		//

		// Addition

		public static Vector2 operator +(Vector2 left, Vector2 right) => Vector2(left.X + right.X, left.Y + right.Y);

		public static Vector2 operator +(Vector2 value, float scalar) => Vector2(value.X + scalar, value.Y + scalar);

		public static Vector2 operator +(float scalar, Vector2 value) => Vector2(scalar + value.X, scalar + value.Y);

		public static Vector2 operator +(Vector2 value) => value;

		// Subtraction

		public static Vector2 operator -(Vector2 left, Vector2 right) => Vector2(left.X - right.X, left.Y - right.Y);

		public static Vector2 operator -(Vector2 value, float scalar) => Vector2(value.X - scalar, value.Y - scalar);

		public static Vector2 operator -(float scalar, Vector2 value) => Vector2(scalar - value.X, scalar - value.Y);

		public static Vector2 operator -(Vector2 value) => Vector2(-value.X, -value.Y);

		// Multiplication

		public static Vector2 operator *(Vector2 left, Vector2 right) => Vector2(left.X * right.X, left.Y * right.Y);

		public static Vector2 operator *(Vector2 value, float scalar) => Vector2(value.X * scalar, value.Y * scalar);

		public static Vector2 operator *(float scalar, Vector2 value) => Vector2(scalar * value.X, scalar * value.Y);

		// Division

		public static Vector2 operator /(Vector2 left, Vector2 right) => Vector2(left.X / right.X, left.Y / right.Y);

		public static Vector2 operator /(Vector2 value, float scalar)
		{	
			float inv = 1.0f / scalar;
			return Vector2(value.X * inv, value.Y * inv);
		}

		public static Vector2 operator /(float scalar, Vector2 value) => Vector2(scalar / value.X, scalar / value.Y);

		// Equality

		public static bool operator ==(Vector2 left, Vector2 right) => left.X == right.X && left.Y == right.Y;

		public static bool operator !=(Vector2 left, Vector2 right) => left.X != right.X || left.Y != right.Y;

		//
		// Conversion
		//

		public static explicit operator Vector4(Vector2 value) => Vector4(value.X, value.Y, 0.0f, 0.0f);

		public static explicit operator Vector3(Vector2 value) => Vector3(value.X, value.Y, 0.0f);

		public override void ToString(String strBuffer) => strBuffer.AppendF("X:{0} Y:{1}", X, Y);
	}
}
