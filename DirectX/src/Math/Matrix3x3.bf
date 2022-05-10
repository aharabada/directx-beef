using System;

namespace DirectX.Math
{
	/**
	 * Represents a 3 by 3 column-major matrix.
	 */
	[Union]
	public struct Matrix3x3
	{
		public struct Values
		{
			public float _11, _21, _31,
						_12, _22, _32,
						_13, _23, _33;
		}

		public static readonly Matrix3x3 Zero = .();
		public static readonly Matrix3x3 Identity = .(.UnitX, .UnitY, .UnitZ);

		public Values V;
		public float[3][3] Values;
		public Vector3[3] Columns;

		public this() => this = default;

		public this(float value)
		{
			this = ?;
			V._11 = V._12 = V._13 =
			V._21 = V._22 = V._23 =
			V._31 = V._32 = V._33 = value;
		}

		public this(float m00, float m01, float m02,
		         	float m10, float m11, float m12,
		         	float m20, float m21, float m22)
		{
			this = ?;
			V._11 = m00; V._12 = m01; V._13 = m02;
			V._21 = m10; V._22 = m11; V._23 = m12;
			V._31 = m20; V._32 = m21; V._33 = m22;
		}

		public this(Vector3 c0, Vector3 c1, Vector3 c2)
		{
			Columns[0] = c0;
			Columns[1] = c1;
			Columns[2] = c2;
		}

		public ref Vector3 Right
		{
			[Inline]
			get
			{
#unwarn
				return ref *(Vector3*)&Columns[0];
			}
		}

		public ref Vector3 Up
		{
			[Inline]
			get
			{
#unwarn
				return ref *(Vector3*)&Columns[1];
			}
		}
		
		public ref Vector3 Forward
		{
			[Inline]
			get
			{
#unwarn
				return ref *(Vector3*)&Columns[2];
			}
		}

		public Vector3 Scale
		{
			[Inline]
			get => .(V._11, V._22, V._33);

			[Inline]
			set mut
			{
				V._11 = value.X;
				V._22 = value.Y;
				V._33 = value.Z;
			}
		}

		public ref float this[int row, int column]
		{
			get
			{
#unwarn
				return ref *(float*)&Values[column][row];
			}

			[Checked]
			get
			{
				if(column < 0 || column > 3 || row < 0 || row > 3)
					Internal.ThrowIndexOutOfRange();
				
#unwarn
				return ref *(float*)&Values[column][row];
			}
		}

		public ref Vector3 this[int column]
		{
			get
			{
#unwarn
				return ref *(Vector3*)&Columns[column];
			}

			
			[Checked]
			get
			{
				if(column < 0 || column > 2)
					Internal.ThrowIndexOutOfRange();
				
#unwarn
				return ref *(Vector3*)&Columns[column];
			}
		}

		//
		// Assignment Operators
		//

		// Addition

		public void operator +=(Matrix3x3 value) mut
		{	
			Columns[0] += value.Columns[0];
			Columns[1] += value.Columns[1];
			Columns[2] += value.Columns[2];
		}

		// Matrix + Scalar : Matrix + Scalar * Identity
		public void operator +=(float scalar) mut
		{
			V._11 += scalar;
			V._22 += scalar;
			V._33 += scalar;
		}

		// Subtraction

		public void operator -=(Matrix3x3 value) mut
		{	
			Columns[0] -= value.Columns[0];
			Columns[1] -= value.Columns[1];
			Columns[2] -= value.Columns[2];
		}

		// Matrix - Scalar : Matrix - Scalar * Identity
		public void operator -=(float scalar) mut
		{
			V._11 -= scalar;
			V._22 -= scalar;
			V._33 -= scalar;
		}

		// Multiplication

		public void operator *=(float scalar) mut
		{	
			Columns[0] *= scalar;
			Columns[1] *= scalar;
			Columns[2] *= scalar;
		}

		public void operator *=(Matrix3x3 value) mut
		{
			this = this * value;
		}

		// Divide

		public void operator /=(float scalar) mut
		{
			float inv = 1.0f / scalar;
			Columns[0] *= inv;
			Columns[1] *= inv;
			Columns[2] *= inv;
		}

		//
		// Operators
		//

		// Addition

		public static Matrix3x3 operator +(Matrix3x3 left, Matrix3x3 right)
		{
			return .(left.Columns[0] + right.Columns[0],
					left.Columns[1] + right.Columns[1],
					left.Columns[2] + right.Columns[2]);
		}

		public static Matrix3x3 operator +(Matrix3x3 left, float right)
		{
			Matrix3x3 result = left;
			result.V._11 += right;
			result.V._22 += right;
			result.V._33 += right;

			return result;
		}

		public static Matrix3x3 operator +(float left, Matrix3x3 right)
		{
			Matrix3x3 result = right;
			result.V._11 += left;
			result.V._22 += left;
			result.V._33 += left;

			return result;
		}

		// Subtraction

		public static Matrix3x3 operator -(Matrix3x3 left, Matrix3x3 right)
		{
			return .(left.Columns[0] - right.Columns[0],
					left.Columns[1] - right.Columns[1],
					left.Columns[2] - right.Columns[2]);
		}

		public static Matrix3x3 operator -(Matrix3x3 value, float scalar)
		{
			Matrix3x3 result = value;
			result.V._11 -= scalar;
			result.V._22 -= scalar;
			result.V._33 -= scalar;

			return result;
		}

		public static Matrix3x3 operator -(float scalar, Matrix3x3 value)
		{
			Matrix3x3 result = value;
			result.V._11 -= scalar;
			result.V._22 -= scalar;
			result.V._33 -= scalar;

			return result;
		}

		public static Matrix3x3 operator -(Matrix3x3 value)
		{
			return .(-value.Columns[0],
					-value.Columns[1],
					-value.Columns[2]);
		}

		// Multiplication

		public static Matrix3x3 operator *(Matrix3x3 left, Matrix3x3 right)
		{
#unwarn
			var l = &left.V;
#unwarn
			var r = &right.V;
			
			Matrix3x3 result = ?;

			result.V._11 = (l._11 * r._11) + (l._12 * r._21) + (l._13 * r._31);
			result.V._12 = (l._11 * r._12) + (l._12 * r._22) + (l._13 * r._32);
			result.V._13 = (l._11 * r._13) + (l._12 * r._23) + (l._13 * r._33);
			
			result.V._21 = (l._21 * r._11) + (l._22 * r._21) + (l._23 * r._31);
			result.V._22 = (l._21 * r._12) + (l._22 * r._22) + (l._23 * r._32);
			result.V._23 = (l._21 * r._13) + (l._22 * r._23) + (l._23 * r._33);

			result.V._31 = (l._31 * r._11) + (l._32 * r._21) + (l._33 * r._31);
			result.V._32 = (l._31 * r._12) + (l._32 * r._22) + (l._33 * r._32);
			result.V._33 = (l._31 * r._13) + (l._32 * r._23) + (l._33 * r._33);

			return result;
		}

		public static Matrix3x3 operator *(Matrix3x3 value, float scalar)
		{
			return .(value.Columns[0] * scalar,
					value.Columns[1] * scalar,
					value.Columns[2] * scalar);
		}

		public static Matrix3x3 operator *(float scalar, Matrix3x3 value)
		{
			return .(value.Columns[0] * scalar,
					value.Columns[1] * scalar,
					value.Columns[2] * scalar);
		}

		/**
		 * Multiplies a matrix and a column-vector resulting in a column vector.
		 */
		public static Vector3 operator *(Matrix3x3 matrix, Vector3 columnVector)
		{
#unwarn
			var m = &matrix.V;

			Vector3 result = ?;
			result.X = (m._11 * columnVector.X) + (m._12 * columnVector.Y) + (m._13 * columnVector.Z);
			result.Y = (m._21 * columnVector.X) + (m._22 * columnVector.Y) + (m._23 * columnVector.Z);
			result.Z = (m._31 * columnVector.X) + (m._32 * columnVector.Y) + (m._33 * columnVector.Z);
			return result;
		}

		/**
		 * Multiplies a row-vector and a matrix resulting in a row vector.
		 */
		public static Vector3 operator *(Vector3 rowVector, Matrix3x3 matrix)
		{
#unwarn
			var m = &matrix.V;

			Vector3 result = ?;
			result.X = (rowVector.X * m._11) + (rowVector.Y * m._21) + (rowVector.Z * m._31);
			result.Y = (rowVector.X * m._12) + (rowVector.Y * m._22) + (rowVector.Z * m._32);
			result.Z = (rowVector.X * m._13) + (rowVector.Y * m._23) + (rowVector.Z * m._33);
			return result;
		}

		// Divison

		public static Matrix3x3 operator /(Matrix3x3 m, float s)
		{
			float f = 1 / s;
			Matrix3x3 M = m;

			return .(M.Columns[0] * f, M.Columns[1] * f, M.Columns[2] * f);
		}

		public static Matrix3x3 Scaling(float scale)
		{
			return .(scale, 0, 0,
					 0, scale, 0,
					 0, 0, scale);
		}

		public static Matrix3x3 Scaling(float x, float y, float z)
		{
			return .(x, 0, 0,
					 0, y, 0,
					 0, 0, z);
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

			return .(1,  0,   0,
					 0, cos, -sin,
					 0, sin,  cos);
		}

		public static Matrix3x3 RotationY(float rot)
		{
			float sin = Math.Sin(rot);
			float cos = Math.Cos(rot);

			return .(cos, 0, sin,
					  0,  1,  0,
					-sin, 0, cos);
		}

		public static Matrix3x3 RotationZ(float rot)
		{
			float sin = Math.Sin(rot);
			float cos = Math.Cos(rot);

			return .(cos, -sin, 0,
					 sin,  cos, 0,
					  0,    0,  1);
		}

		/**
		Returns the transpose of this matrix
		*/
		public Matrix3x3 Transpose()
		{
			return .(V._11, V._21, V._31,
					V._12, V._22, V._32,
					V._13, V._23, V._33);
		}

		public float Determinant()
		{
			return Vector3.Dot(Vector3.Cross(Columns[0], Columns[1]), Columns[2]);
		}

		// Todo: invert

		public Matrix3x3 Inverse()
		{
#unwarn
			var a = ref *&this.Columns[0];
#unwarn
			var b = ref *&this.Columns[1];
#unwarn
			var c = ref *&this.Columns[2];

			Vector3 r0 = .Cross(b, c);
			Vector3 r1 = .Cross(c, a);
			Vector3 r2 = .Cross(a, b);

			float invDet = 1.0F / Vector3.Dot(r2, c);

			return .(r0.X, r0.Y, r0.Z,
					r1.X, r1.Y, r1.Z,
					r2.X, r2.Y, r2.Z) * invDet;
		}
		
		/**
		 * Orthogonalizes the matrix.
		*/
		public void Orthogonalize() mut
		{
			Columns[1] -= .Project(Columns[1], Columns[0]);
			Columns[2] -= .Project(Columns[2], Columns[0]) + .Project(Columns[2], Columns[1]);
		}

		/**
		 * Orthonormalizes the matrix.
		*/
		public void Orthonormalize() mut
		{
			Columns[0].Normalize();
			Columns[1] = .Normalize(.Reject(Columns[1], Columns[0]));
			Columns[2] = .Normalize(.Reject(.Reject(Columns[2], Columns[0]), Columns[1]));
		}
	}
}
