using System;

namespace DirectX.Math
{
	/**
	Represents a four by four matrix column-major matrix.
	*/
	[CRepr]
	public struct Matrix3x3
	{
		public static readonly Matrix3x3 Zero = .();
		public static readonly Matrix3x3 Identity = .(.UnitX, .UnitY, .UnitZ);

		private float[3][3] _m;

		public this()
		{
			this = default;
		}

		public this(float m00, float m01, float m02,
		         	float m10, float m11, float m12,
		         	float m20, float m21, float m22)
		{
			_m[0][0] = m00; _m[0][1] = m10; _m[0][2] = m20;
			_m[1][0] = m01; _m[1][1] = m11; _m[1][2] = m21;
			_m[2][0] = m02; _m[2][1] = m12; _m[2][2] = m22;
		}

		public this(Vector3 a, Vector3 b, Vector3 c)
		{
			_m[0][0] = a.X; _m[0][1] = a.Y; _m[0][2] = a.Z;
			_m[1][0] = b.X; _m[1][1] = b.Y; _m[1][2] = b.Z;
			_m[2][0] = c.X; _m[2][1] = c.Y; _m[2][2] = c.Z;
		}


		public ref float this[int row, int column]
		{
			[Inline]
			get mut
			{
				return ref _m[column][row];
			}
		}

		public ref Vector3 this[int column]
		{
			[Inline]
			get mut
			{
				return ref ((Vector3*)&_m)[column];
			}
		}

		
		[Unchecked]
		public static Matrix3x3 operator *(Matrix3x3 l, Matrix3x3 r)
		{
			Matrix3x3 L = l;
			Matrix3x3 R = r;

			return .(L[0, 0] * R[0, 0] + L[0, 1] * R[1, 0] + L[0, 2] * R[2, 0],
					 L[0, 0] * R[0, 1] + L[0, 1] * R[1, 1] + L[0, 2] * R[2, 1],
					 L[0, 0] * R[0, 2] + L[0, 1] * R[1, 2] + L[0, 2] * R[2, 2],

					 L[1, 0] * R[0, 0] + L[1, 1] * R[1, 0] + L[1, 2] * R[2, 0],
					 L[1, 0] * R[0, 1] + L[1, 1] * R[1, 1] + L[1, 2] * R[2, 1],
					 L[1, 0] * R[0, 2] + L[1, 1] * R[1, 2] + L[1, 2] * R[2, 2],

					 L[2, 0] * R[0, 0] + L[2, 1] * R[1, 0] + L[2, 2] * R[2, 0],
					 L[2, 0] * R[0, 1] + L[2, 1] * R[1, 1] + L[2, 2] * R[2, 1],
					 L[2, 0] * R[0, 2] + L[2, 1] * R[1, 2] + L[2, 2] * R[2, 2]);
		}
		
		[Unchecked]
		public void operator *=(float s) mut
		{	
			this[0] *= s;
			this[1] *= s;
			this[2] *= s;
		}
		
		[Unchecked]
		public static Matrix3x3 operator *(Matrix3x3 m, float s)
		{
			Matrix3x3 M = m;

			return .(M[0] * s, M[1] * s, M[2] * s);
		}

		[Unchecked]
		public static Vector3 operator *(Matrix3x3 l, Vector3 r)
		{
			Matrix3x3 L = l;
			Vector3 R = r;

			return .(L[0, 0] * R[0] + L[0, 1] * R[1] + L[0, 2] * R[2],
					 L[1, 0] * R[0] + L[1, 1] * R[1] + L[1, 2] * R[2],
					 L[2, 0] * R[0] + L[2, 1] * R[1] + L[2, 2] * R[2]);
		}
		
		[Unchecked]
		public void operator /=(float s) mut
		{
			float f = 1 / s;

			this[0] *= f;
			this[1] *= f;
			this[2] *= f;
		}

		[Unchecked]
		public static Matrix3x3 operator /(Matrix3x3 m, float s)
		{
			float f = 1 / s;
			Matrix3x3 M = m;

			return .(M[0] * f, M[1] * f, M[2] * f);
		}

		public void operator +=(ref Matrix3x3 r) mut
		{	
			Matrix3x3 R = r;
			this[0] += R[0];
			this[1] += R[1];
			this[2] += R[2];
		}

		public static Matrix3x3 operator +(Matrix3x3 l, Matrix3x3 r)
		{
			Matrix3x3 L = l;
			Matrix3x3 R = r;

			return .(L[0] + R[0], L[1] + R[1], L[2] + R[2]);
		}
		
		public static Matrix3x3 operator -(Matrix3x3 m)
		{
			Matrix3x3 L = m;

			return .(-L[0], -L[1], -L[2]);
		}

		public void operator -=(ref Matrix3x3 r) mut
		{	
			Matrix3x3 R = r;
			this[0] -= R[0];
			this[1] -= R[1];
			this[2] -= R[2];
		}

		public static Matrix3x3 operator -(Matrix3x3 l, Matrix3x3 r)
		{
			Matrix3x3 L = l;
			Matrix3x3 R = r;

			return .(L[0] - R[0], L[1] - R[1], L[2] - R[2]);
		}

		public static Matrix3x3 Scaling(float scale)
		{
			return .(scale, 0, 0,
					 0, scale, 0,
					 0, 0, scale);
		}

		public static Matrix3x3 Scaling(Vector3 scale)
		{
			return .(scale.X, 0, 0,
					 0, scale.Y, 0,
					 0, 0, scale.Z);
		}

		public static Matrix3x3 RotationX(float rot)
		{
			float sin = Math.Sin(rot);
			float cos = Math.Cos(rot);

			return .(1, 0, 0,
					 0, cos, -sin,
					 0, sin, cos);
		}

		public static Matrix3x3 RotationY(float rot)
		{
			float sin = Math.Sin(rot);
			float cos = Math.Cos(rot);

			return .(cos, 0, sin,
					 0, 1, 0,
					-sin, 0, cos);
		}

		public static Matrix3x3 RotationZ(float rot)
		{
			float sin = Math.Sin(rot);
			float cos = Math.Cos(rot);

			return .(cos, -sin, 0,
					 sin, cos, 0,
					 0, 0, 1);
		}

		/**
		Returns the transpose of this matrix
		*/
		public Matrix3x3 Transpose() mut
		{
			return .(this[0, 0], this[1, 0], this[2, 0],
					 this[0, 1], this[1, 1], this[2, 1],
					 this[0, 2], this[1, 2], this[2, 2]);
		}

		// Todo: invert, determinant
	}
}
