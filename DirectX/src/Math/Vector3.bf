using System;

namespace DirectX.Math
{
	public struct Vector3
	{
		public const Vector3 Zero  = .(0f, 0f, 0f);
		public const Vector3 UnitX = .(1f, 0f, 0f);
		public const Vector3 UnitY = .(0f, 1f, 0f);
		public const Vector3 UnitZ = .(0f, 0f, 1f);
		public const Vector3 One   = .(1f, 1f, 1f);
		
		public const Vector3 Forward  = .( 0f, 0f, 1f);	
		public const Vector3 Backward = .( 0f, 0f,-1f);	
		public const Vector3 Left     = .(-1f, 0f, 0f); 	
		public const Vector3 Right    = .( 1f, 0f, 0f);  	
		public const Vector3 Up       = .( 0f, 1f, 0f); 	
		public const Vector3 Down     = .( 0f,-1f, 0f);
		
		public const int Components = 3;

		public float X, Y, Z;

		public this() => this = default;

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
			return Math.Sqrt(X * X + Y * Y + Z * Z);
		}

		public static float Magnitude(Vector3 v)
		{
			return Math.Sqrt(v.X * v.X + v.Y * v.Y + v.Z * v.Z);
		}
		
		/**
		 * Calculates the squared magnitude (length) of this vector.
		 */
		public float MagnitudeSquared()
		{
			return X * X + Y * Y + Z * Z;
		}
		
		public static float MagnitudeSquared(Vector3 v)
		{
			return v.X * v.X + v.Y * v.Y + v.Z * v.Z;
		}

		public static float Distance(Vector3 left, Vector3 right)
		{
			float x = left.X - right.X;
			float y = left.Y - right.Y;
			float z = left.Z - right.Z;
			return Math.Sqrt(x * x + y * y + z * z);
		}
		
		public static float DistanceSquared(Vector3 left, Vector3 right)
		{
			float x = left.X - right.X;
			float y = left.Y - right.Y;
			float z = left.Z - right.Z;
			return x * x + y * y + z * z;
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

		public static Vector3 Normalize(Vector3 v)
		{
			return v / v.Magnitude();
		}

		public static float Dot(Vector3 l, Vector3 r)
		{
			return l.X * r.X + l.Y * r.Y + l.Z * r.Z;
		}

		public static Vector3 Cross(Vector3 l, Vector3 r)
		{
			return .(l.Y * r.Z - l.Z * r.Y,
					 l.Z * r.X - l.X * r.Z,
					 l.X * r.Y - l.Y * r.X);
		}

		/**
		 * Calculates the projection of a onto b.
		 * @returns The component of a that is parallel to b.
		 */
		public static Vector3 Project(Vector3 a, Vector3 b)
		{
			return (b * (Dot(a, b) / Dot(b, b)));
		}

		/**
		 * Calculates the rejection of a from b.
		 * @returns The component of a that is perpendicular to b.
		 */
		public static Vector3 Reject(Vector3 a, Vector3 b)
		{
			return (a - b * (Dot(a, b) / Dot(b, b)));
		}

		public static Vector3 Min(Vector3 left, Vector3 right)
		{
			return Vector3(left.X < right.X ? left.X : right.X,
							left.Y < right.Y ? left.Y : right.Y,
							left.Z < right.Z ? left.Z : right.Z);
		}
		
		public static Vector3 Max(Vector3 left, Vector3 right)
		{
			return Vector3(left.X > right.X ? left.X : right.X,
							left.Y > right.Y ? left.Y : right.Y,
							left.Z > right.Z ? left.Z : right.Z);
		}

		//
		// Assignment operators
		//
		
		// Addition

		public void operator +=(Vector3 value) mut
		{
			X += value.X;
			Y += value.Y;
			Z += value.Z;
		}

		public void operator +=(float scalar) mut
		{
			X += scalar;
			Y += scalar;
			Z += scalar;
		}

		// Subtraction


		public void operator -=(Vector3 value) mut
		{
			X -= value.X;
			Y -= value.Y;
			Z -= value.Z;
		}

		public void operator -=(float scalar) mut
		{
			X -= scalar;
			Y -= scalar;
			Z -= scalar;
		}

		// Multiplication

		public void operator *=(Vector3 value) mut
		{
			X *= value.X;
			Y *= value.Y;
			Z *= value.Z;
		}

		public void operator *=(float scalar) mut
		{
			X *= scalar;
			Y *= scalar;
			Z *= scalar;
		}

		// Division

		public void operator /=(Vector3 value) mut
		{
			X /= value.X;
			Y /= value.Y;
			Z /= value.Z;
		}

		public void operator /=(float scalar) mut
		{
			float inv = 1.0f / scalar;
			X *= inv;
			Y *= inv;
			Z *= inv;
		}

		//
		// operators
		//

		// Addition

		public static Vector3 operator +(Vector3 left, Vector3 right) => Vector3(left.X + right.X, left.Y + right.Y, left.Z + right.Z);

		public static Vector3 operator +(Vector3 value, float scalar) => Vector3(value.X + scalar, value.Y + scalar, value.Z + scalar);
		
		public static Vector3 operator +(float scalar, Vector3 value) => Vector3(scalar + value.X, scalar + value.Y, scalar + value.Z);

		public static Vector3 operator +(Vector3 value) => value;
		
		// Subtraction

		public static Vector3 operator -(Vector3 left, Vector3 right) => Vector3(left.X - right.X, left.Y - right.Y, left.Z - right.Z);

		public static Vector3 operator -(Vector3 value, float scalar) => Vector3(value.X - scalar, value.Y - scalar, value.Z - scalar);

		public static Vector3 operator -(float scalar, Vector3 value) => Vector3(scalar - value.X, scalar - value.Y, scalar - value.Z);

		public static Vector3 operator -(Vector3 value) => Vector3(-value.X, -value.Y, -value.Z);

		// Multiplication

		public static Vector3 operator *(Vector3 left, Vector3 right) => Vector3(left.X * right.X, left.Y * right.Y, left.Z * right.Z);

		public static Vector3 operator *(Vector3 value, float scalar) => Vector3(value.X * scalar, value.Y * scalar, value.Z * scalar);

		public static Vector3 operator *(float scalar, Vector3 value) => Vector3(scalar * value.X, scalar * value.Y, scalar * value.Z);

		// Division

		public static Vector3 operator /(Vector3 left, Vector3 right) => Vector3(left.X / right.X, left.Y / right.Y, left.Z / right.Z);

		public static Vector3 operator /(Vector3 value, float scalar)
		{	
			float inv = 1.0f / scalar;
			return Vector3(value.X * inv, value.Y * inv, value.Z * inv);
		}

		public static Vector3 operator /(float scalar, Vector3 value) => Vector3(scalar / value.X, scalar / value.Y, scalar / value.Z);

		// Equality

		public static bool operator ==(Vector3 left, Vector3 right) => left.X == right.X && left.Y == right.Y && left.Z == right.Z;

		public static bool operator !=(Vector3 left, Vector3 right) => left.X != right.X || left.Y != right.Y || left.Z != right.Z;

		//
		// Conversion
		//

		public static explicit operator Vector4(Vector3 value) => Vector4(value.X, value.Y, value.Z, 0.0f);

		public static explicit operator Vector2(Vector3 value) => Vector2(value.X, value.Y);

		public override void ToString(String strBuffer) => strBuffer.AppendF("X:{0} Y:{1} Z:{2}", X, Y, Z);

		public static Vector3 Transform(Matrix matrix, Vector3 value)
		{
			Vector4 v = matrix * Vector4(value, 1.0f);
			return (Vector3)v / v.W;
		}

		public static Vector3 Transform(Vector3 value, Matrix matrix)
		{
			return (Vector3)(Vector4(value, 1.0f) * matrix);
		}
		
		public static Vector3 TransformNormal(Matrix matrix, Vector3 value)
		{
			return (Vector3)(matrix * Vector4(value, 0.0f));
		}

		public static Vector3 TransformNormal(Vector3 value, Matrix matrix)
		{
			return (Vector3)(Vector4(value, 0.0f) * matrix);
		}
	}
}
