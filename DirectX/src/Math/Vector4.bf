using System;

namespace DirectX.Math
{
	public struct Vector4
	{
		public const Vector4 Zero  = .(0f, 0f, 0f, 0f);
		public const Vector4 UnitX = .(1f, 0f, 0f, 0f);
		public const Vector4 UnitY = .(0f, 1f, 0f, 0f);
		public const Vector4 UnitZ = .(0f, 0f, 1f, 0f);
		public const Vector4 UnitW = .(0f, 0f, 0f, 1f);
		public const Vector4 One   = .(1f, 1f, 1f, 1f);

		public const int Components = 4;

		public float X, Y, Z, W;

		public this() => this = default;

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
			[Checked]
			get mut
			{
				if(index < 0 || index >= Components)
					Internal.ThrowIndexOutOfRange(1);
				
				return ref (&X)[index];
			}

			[Inline]
			get mut => ref (&X)[index];
		}

		public float this[int index]
		{
			get
			{
				switch(index)
				{
				case 0: return X;
				case 1: return Y;
				case 2: return Z;
				case 3: return W;
				default: Internal.ThrowIndexOutOfRange();
				}
			}

			set mut
			{
				switch(index)
				{
				case 0: X = value;
				case 1: Y = value;
				case 2: Z = value;
				case 3: W = value;
				default: Internal.ThrowIndexOutOfRange();
				}
			}
		}

		/**
		 * Calculates the magnitude (length) of this vector.
		 * @remarks MagnitudeSquared might be used if only the relative length is relevant.
		 */
		public float Magnitude()
		{
			return Math.Sqrt(X * X + Y * Y + Z * Z + W * W);
		}

		/**
		 * Calculates the squared magnitude (length) of this vector.
		 */
		public float MagnitudeSquared()
		{
			return X * X + Y * Y + Z * Z + W * W;
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
		
		public static Vector4 Normalize(Vector4 v)
		{
			if(v == .Zero)
				return .Zero;

			return v / v.Magnitude();
		}
		
		[Unchecked]
		public static Vector4 Normalize(Vector4 v)
		{
			return v / v.Magnitude();
		}

		public static float Dot(Vector4 l, Vector4 r)
		{
			return l.X * r.X + l.Y * r.Y + l.Z * r.Z + l.W * r.W;
		}

		/**
		 * Calculates the projection of a onto b.
		 * @returns The component of a that is parallel to b.
		 */
		public static Vector4 Project(Vector4 a, Vector4 b)
		{
			return (b * (Dot(a, b) / Dot(b, b)));
		}

		/**
		 * Calculates the rejection of a from b.
		 * @returns The component of a that is perpendicular to b.
		 */
		public static Vector4 Reject(Vector4 a, Vector4 b)
		{
			return (a - b * (Dot(a, b) / Dot(b, b)));
		}

		//
		// Assignment operators
		//

		// Addition
		
		public void operator +=(Vector4 value) mut
		{
			X += value.X;
			Y += value.Y;
			Z += value.Z;
			W += value.W;
		}
		
		public void operator +=(float scalar) mut
		{
			X += scalar;
			Y += scalar;
			Z += scalar;
			W += scalar;
		}

		// Subtraction

		public void operator -=(Vector4 value) mut
		{
			X -= value.X;
			Y -= value.Y;
			Z -= value.Z;
			W -= value.W;
		}

		public void operator -=(float scalar) mut
		{
			X -= scalar;
			Y -= scalar;
			Z -= scalar;
			W -= scalar;
		}

		// Multiplication
		
		public void operator *=(Vector4 value) mut
		{
			X *= value.X;
			Y *= value.Y;
			Z *= value.Z;
			W *= value.W;
		}

		public void operator *=(float scalar) mut
		{
			X *= scalar;
			Y *= scalar;
			Z *= scalar;
			W *= scalar;
		}

		// Division

		public void operator /=(float scalar) mut
		{
			float f = 1.0f / scalar;
			X *= f;
			Y *= f;
			Z *= f;
			W *= f;
		}

		public void operator /=(Vector4 value) mut
		{
			X /= value.X;
			Y /= value.Y;
			Z /= value.Z;
			W /= value.W;
		}

		//
		// operators
		//

		// Addition

		public static Vector4 operator +(Vector4 left, Vector4 right) => Vector4(left.X + right.X, left.Y + right.Y, left.Z + right.Z, left.W + right.W);

		public static Vector4 operator +(Vector4 value, float scalar) => Vector4(value.X + scalar, value.Y + scalar, value.Z + scalar, value.W + scalar);
		
		public static Vector4 operator +(float scalar, Vector4 value) => Vector4(scalar + value.X, scalar + value.Y, scalar + value.Z, scalar + value.W);

		public static Vector4 operator +(Vector4 value) => value;

		// Subtraction
		
		public static Vector4 operator -(Vector4 left, Vector4 right) => Vector4(left.X - right.X, left.Y - right.Y, left.Z - right.Z, left.W - right.W);

		public static Vector4 operator -(Vector4 value, float scalar) => Vector4(value.X - scalar, value.Y - scalar, value.Z - scalar, value.W - scalar);

		public static Vector4 operator -(float scalar, Vector4 value) => Vector4(scalar - value.X, scalar - value.Y, scalar - value.Z, scalar - value.W);

		public static Vector4 operator -(Vector4 value) => Vector4(-value.X, -value.Y, -value.Z, -value.W);

		// Multiplication

		public static Vector4 operator *(Vector4 left, Vector4 right) => Vector4(left.X * right.X, left.Y * right.Y, left.Z * right.Z, left.W * right.W);

		public static Vector4 operator *(Vector4 value, float scalar) => Vector4(value.X * scalar, value.Y * scalar, value.Z * scalar, value.W * scalar);

		public static Vector4 operator *(float scalar, Vector4 value) => Vector4(scalar * value.X, scalar * value.Y, scalar * value.Z, scalar * value.W);

		// Division
		
		public static Vector4 operator /(Vector4 left, Vector4 right) => Vector4(left.X / right.X, left.Y / right.Y, left.Z / right.Z, left.W / right.W);

		public static Vector4 operator /(Vector4 value, float scalar)
		{	
			float inv = 1.0f / scalar;
			return Vector4(value.X * inv, value.Y * inv, value.Z * inv, value.W * inv);
		}

		public static Vector4 operator /(float scalar, Vector4 value) => Vector4(scalar / value.X, scalar / value.Y, scalar / value.Z, scalar / value.W);

		// Equality

		public static bool operator ==(Vector4 left, Vector4 right) => left.X == right.X && left.Y == right.Y && left.Z == right.Z && left.W == right.W;

		public static bool operator !=(Vector4 left, Vector4 right) => left.X != right.X || left.Y != right.Y || left.Z != right.Z || left.W != right.W;

		//
		// Conversion
		//

		public static explicit operator Vector3(Vector4 value) => Vector3(value.X, value.Y, value.Z);

		public static explicit operator Vector2(Vector4 value) => Vector2(value.X, value.Y);

		public override void ToString(String strBuffer) => strBuffer.AppendF("X:{0} Y:{1} Z:{2} W:{3}", X, Y, Z, W);
	}
}
