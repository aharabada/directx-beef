using System;

namespace DirectX.Math
{
	/**
	Represents a four by four matrix column-major matrix.
	*/
	[CRepr]
	public struct Matrix
	{
		public static readonly Matrix Zero = .();
		public static readonly Matrix Identity = .(.UnitX, .UnitY, .UnitZ, .UnitW);

		private float[4][4] _m;

		public this()
		{
			this = default;
		}

		public this(float m00, float m01, float m02, float m03,
		         	float m10, float m11, float m12, float m13,
		         	float m20, float m21, float m22, float m23,
				 	float m30, float m31, float m32, float m33)
		{
			_m[0][0] = m00; _m[0][1] = m10; _m[0][2] = m20; _m[0][3] = m30;
			_m[1][0] = m01; _m[1][1] = m11; _m[1][2] = m21; _m[1][3] = m31;
			_m[2][0] = m02; _m[2][1] = m12; _m[2][2] = m22; _m[2][3] = m32;
			_m[3][0] = m03; _m[3][1] = m13; _m[3][2] = m23; _m[3][3] = m33;
		}

		public this(Vector4 a, Vector4 b, Vector4 c, Vector4 d)
		{
			_m[0][0] = a.X; _m[0][1] = a.Y; _m[0][2] = a.Z; _m[0][3] = a.W;
			_m[1][0] = b.X; _m[1][1] = b.Y; _m[1][2] = b.Z; _m[1][3] = b.W;
			_m[2][0] = c.X; _m[2][1] = c.Y; _m[2][2] = c.Z; _m[2][3] = c.W;
			_m[3][0] = d.X; _m[3][1] = d.Y; _m[3][2] = d.Z; _m[3][3] = d.W;
		}


		public ref float this[int row, int column]
		{
			[Inline]
			get mut
			{
				return ref _m[column][row];
			}
		}

		public ref Vector4 this[int column]
		{
			[Inline]
			get mut
			{
				return ref ((Vector4*)&_m)[column];
			}
		}

		
		[Unchecked]
		public static Matrix operator *(Matrix l, Matrix r)
		{
			Matrix L = l;
			Matrix R = r;

			return .(L[0, 0] * R[0, 0] + L[0, 1] * R[1, 0] + L[0, 2] * R[2, 0] + L[0, 3] * R[3, 0],
					 L[0, 0] * R[0, 1] + L[0, 1] * R[1, 1] + L[0, 2] * R[2, 1] + L[0, 3] * R[3, 1],
					 L[0, 0] * R[0, 2] + L[0, 1] * R[1, 2] + L[0, 2] * R[2, 2] + L[0, 3] * R[3, 2],
					 L[0, 0] * R[0, 3] + L[0, 1] * R[1, 3] + L[0, 2] * R[2, 3] + L[0, 3] * R[3, 3],

					 L[1, 0] * R[0, 0] + L[1, 1] * R[1, 0] + L[1, 2] * R[2, 0] + L[1, 3] * R[3, 0],
					 L[1, 0] * R[0, 1] + L[1, 1] * R[1, 1] + L[1, 2] * R[2, 1] + L[1, 3] * R[3, 1],
					 L[1, 0] * R[0, 2] + L[1, 1] * R[1, 2] + L[1, 2] * R[2, 2] + L[1, 3] * R[3, 2],
					 L[1, 0] * R[0, 3] + L[1, 1] * R[1, 3] + L[1, 2] * R[2, 3] + L[1, 3] * R[3, 3],

					 L[2, 0] * R[0, 0] + L[2, 1] * R[1, 0] + L[2, 2] * R[2, 0] + L[2, 3] * R[3, 0],
					 L[2, 0] * R[0, 1] + L[2, 1] * R[1, 1] + L[2, 2] * R[2, 1] + L[2, 3] * R[3, 1],
					 L[2, 0] * R[0, 2] + L[2, 1] * R[1, 2] + L[2, 2] * R[2, 2] + L[2, 3] * R[3, 2],
					 L[2, 0] * R[0, 3] + L[2, 1] * R[1, 3] + L[2, 2] * R[2, 3] + L[2, 3] * R[3, 3],

					 L[3, 0] * R[0, 0] + L[3, 1] * R[1, 0] + L[3, 2] * R[2, 0] + L[3, 3] * R[3, 0],
					 L[3, 0] * R[0, 1] + L[3, 1] * R[1, 1] + L[3, 2] * R[2, 1] + L[3, 3] * R[3, 1],
					 L[3, 0] * R[0, 2] + L[3, 1] * R[1, 2] + L[3, 2] * R[2, 2] + L[3, 3] * R[3, 2],
					 L[3, 0] * R[0, 3] + L[3, 1] * R[1, 3] + L[3, 2] * R[2, 3] + L[3, 3] * R[3, 3]);
		}
		
		[Unchecked]
		public void operator *=(float s) mut
		{	
			this[0] *= s;
			this[1] *= s;
			this[2] *= s;
			this[3] *= s;
		}
		
		[Unchecked]
		public static Matrix operator *(Matrix m, float s)
		{
			Matrix M = m;

			return .(M[0] * s, M[1] * s, M[2] * s, M[3] * s);
		}

		[Unchecked]
		public static Vector4 operator *(Matrix l, Vector4 r)
		{
			Matrix L = l;
			Vector4 R = r;

			return .(L[0, 0] * R[0] + L[0, 1] * R[1] + L[0, 2] * R[2] + L[0, 3] * R[3],
					 L[1, 0] * R[0] + L[1, 1] * R[1] + L[1, 2] * R[2] + L[1, 3] * R[3],
					 L[2, 0] * R[0] + L[2, 1] * R[1] + L[2, 2] * R[2] + L[2, 3] * R[3],
					 L[3, 0] * R[0] + L[3, 1] * R[1] + L[3, 2] * R[2] + L[3, 3] * R[3]);
		}
		
		[Unchecked]
		public void operator /=(float s) mut
		{
			float f = 1 / s;

			this[0] *= f;
			this[1] *= f;
			this[2] *= f;
			this[3] *= f;
		}

		[Unchecked]
		public static Matrix operator /(Matrix m, float s)
		{
			float f = 1 / s;
			Matrix M = m;

			return .(M[0] * f, M[1] * f, M[2] * f, M[3] * f);
		}

		public void operator +=(ref Matrix r) mut
		{	
			Matrix R = r;
			this[0] += R[0];
			this[1] += R[1];
			this[2] += R[2];
			this[3] += R[3];
		}

		public static Matrix operator +(Matrix l, Matrix r)
		{
			Matrix L = l;
			Matrix R = r;

			return .(L[0] + R[0], L[1] + R[1], L[2] + R[2], L[3] + R[3]);
		}
		
		public static Matrix operator -(Matrix m)
		{
			Matrix L = m;

			return .(-L[0], -L[1], -L[2], -L[3]);
		}

		public void operator -=(ref Matrix r) mut
		{	
			Matrix R = r;
			this[0] -= R[0];
			this[1] -= R[1];
			this[2] -= R[2];
			this[3] -= R[3];
		}

		public static Matrix operator -(Matrix l, Matrix r)
		{
			Matrix L = l;
			Matrix R = r;

			return .(L[0] - R[0], L[1] - R[1], L[2] - R[2], L[3] - R[3]);
		}

		public static Matrix Scaling(float scale)
		{
			return .(scale, 0, 0, 0,
					 0, scale, 0, 0,
					 0, 0, scale, 0,
					 0, 0, 0, 1);
		}

		public static Matrix Scaling(Vector3 scale)
		{
			return .(scale.X, 0, 0, 0,
					 0, scale.Y, 0, 0,
					 0, 0, scale.Z, 0,
					 0, 0, 0, 1);
		}

		public static Matrix Translation(float x, float y, float z)
		{
			return .(1, 0, 0, 0,
					 0, 1, 0, 0,
					 0, 0, 1, 0,
					 x, y, z, 1);
		}

		public static Matrix Translation(Vector3 translation)
		{
			return .(1, 0, 0, 0,
					 0, 1, 0, 0,
					 0, 0, 1, 0,
					 translation.X, translation.Y, translation.Z, 1);
		}

		public static Matrix RotationX(float rot)
		{
			float sin = Math.Sin(rot);
			float cos = Math.Cos(rot);

			return .(1, 0, 0, 0,
					 0, cos, -sin, 0,
					 0, sin, cos, 0,
					 0, 0, 0, 1);
		}

		public static Matrix RotationY(float rot)
		{
			float sin = Math.Sin(rot);
			float cos = Math.Cos(rot);

			return .(cos, 0, sin, 0,
					 0, 1, 0, 0,
					-sin, 0, cos, 0,
					 0, 0, 0, 1);
		}

		public static Matrix RotationZ(float rot)
		{
			float sin = Math.Sin(rot);
			float cos = Math.Cos(rot);

			return .(cos, -sin, 0, 0,
					 sin, cos, 0, 0,
					 0, 0, 1, 0,
					 0, 0, 0, 1);
		}

		/**
		Returns the transpose of this matrix
		*/
		public Matrix Transpose() mut
		{
			return .(this[0, 0], this[1, 0], this[2, 0], this[3, 0],
					 this[0, 1], this[1, 1], this[2, 1], this[3, 1],
					 this[0, 2], this[1, 2], this[2, 2], this[3, 2],
					 this[0, 3], this[1, 3], this[2, 3], this[3, 3]);
		}

		/**
		Calculates the inverse of the matrix.
		*/
		public float Determinant() mut
		{
			// From: Lengyel, Eric. Foundations of Game Engine Development, Volume 1: Mathematics (S.61). Kindle-Version. 

			Vector3 a = *(Vector3*)&this[0];
			Vector3 b = *(Vector3*)&this[1];
			Vector3 c = *(Vector3*)&this[2]; 
			Vector3 d = *(Vector3*)&this[3];  

			float x = this[3, 0];
			float y = this[3, 1];
			float z = this[3, 2];
			float w = this[3, 3];

			Vector3 s = Vector3.Cross(ref a, ref b);
			Vector3 t = Vector3.Cross(ref c, ref d);
			Vector3 u = y * a - x * b;
			Vector3 v = w * c - z * d;

			return Vector3.Dot(ref s, ref v) + Vector3.Dot(ref t, ref u);
		}

		/**
		Calculates the inverse of the matrix.
		*/
		public Matrix Invert() mut
		{
			// From: Lengyel, Eric. Foundations of Game Engine Development, Volume 1: Mathematics (S.61). Kindle-Version. 

			Vector3 a = *(Vector3*)&this[0];
			Vector3 b = *(Vector3*)&this[1];
			Vector3 c = *(Vector3*)&this[2]; 
			Vector3 d = *(Vector3*)&this[3];  

			float x = this[3, 0];
			float y = this[3, 1];
			float z = this[3, 2];
			float w = this[3, 3];

			Vector3 s = Vector3.Cross(ref a, ref b);
			Vector3 t = Vector3.Cross(ref c, ref d);
			Vector3 u = y * a - x * b;
			Vector3 v = w * c - z * d;

			float invDet = 1.0f / (Vector3.Dot(ref s, ref v) + Vector3.Dot(ref t, ref u));

			s *= invDet;
			t *= invDet;
			u *= invDet;
			v *= invDet;
 
			Vector3 r0 = Vector3.Cross(ref b, ref v) + t * y;
			Vector3 r1 = Vector3.Cross(ref v, ref a) - t * x;
			Vector3 r2 = Vector3.Cross(ref d, ref u) + s * w;
			Vector3 r3 = Vector3.Cross(ref u, ref c) - s * z;
			return .(r0.X, r0.Y, r0.Z, -Vector3.Dot(ref b, ref t),
					r1.X, r1.Y, r1.Z, Vector3.Dot(ref a, ref t),
					r2.X, r2.Y, r2.Z, -Vector3.Dot(ref d, ref s),
					r3.X, r3.Y, r3.Z, Vector3.Dot(ref c, ref s));
		}

		public static Matrix PerspectiveProjection(float fovY, float aspectRatio, float nearPlane, float farPlane)
		{
			// Lengyel, Eric. Foundations of Game Engine Development, Volume 2: Rendering (Seite82).  . Kindle-Version. 

			float g = 1.0f / Math.Tan(fovY * 0.5f);
			float k = farPlane / (farPlane - nearPlane);

			return .(g / aspectRatio, 0, 0, 0,
					0, g, 0, 0,
					0, 0, k, 1,
					0, 0, -nearPlane * k, 0);
		}

		public static Matrix ReversedPerspectiveProjection(float fovY, float aspectRatio, float nearPlane, float farPlane)
		{
			// Lengyel, Eric. Foundations of Game Engine Development, Volume 2: Rendering (Seite86).  . Kindle-Version. 

			float g = 1.0f / Math.Tan(fovY * 0.5f);
			float k = nearPlane / (nearPlane - farPlane);

			return .(g / aspectRatio, 0, 0, 0,
					0, g, 0, 0,
					0, 0, k, 1,
					0, 0, -farPlane * k, 0);
		}

		public static Matrix InfinitePerspectiveProjection(float fovY, float aspectRatio, float nearPlane, float ε)
		{
			// Lengyel, Eric. Foundations of Game Engine Development, Volume 2: Rendering (Seite83).  . Kindle-Version. 

			float g = 1.0f / Math.Tan(fovY * 0.5f);

			float f = 1 - ε;

			return .(g / aspectRatio, 0, 0, 0,
					0, g, 0, 0,
					0, 0, f, 1,
					0, 0, -nearPlane * f, 0);
		}

		public static Matrix ReversedInfinitePerspectiveProjection(float fovY, float aspectRatio, float nearPlane, float ε)
		{
			// Lengyel, Eric. Foundations of Game Engine Development, Volume 2: Rendering (Seite88).  . Kindle-Version. 

			float g = 1.0f / Math.Tan(fovY * 0.5f);

			return .(g / aspectRatio, 0, 0, 0,
					0, g, 0, 0,
					0, 0, ε, 1,
					0, 0, nearPlane * (1 - ε), 0);
		}
	}
}
