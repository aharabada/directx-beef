using System;

namespace DirectX.Math
{
	/**
	* Represents a 4 by 3 column-major matrix.
	*/
	public struct Matrix4x3
	{
		public static readonly Matrix4x3 Zero = .();

		private float[3][4] _m;

		public this()
		{
			this = default;
		}

		public this(float m00, float m01, float m02,
					float m10, float m11, float m12,
					float m20, float m21, float m22,
					float m30, float m31, float m32)
		{
			_m[0][0] = m00; _m[1][0] = m01; _m[2][0] = m02;
			_m[0][1] = m10; _m[1][1] = m11; _m[2][1] = m12;
			_m[0][2] = m20; _m[1][2] = m21; _m[2][2] = m22;
			_m[0][3] = m30; _m[1][3] = m31; _m[2][3] = m32;
		}

		public this(Matrix3x3 m)
		{
			Matrix3x3 M = m;

			_m[0][0] = M[0, 0]; _m[1][0] = M[0, 1]; _m[2][0] = M[0, 2];
			_m[0][1] = M[1, 0]; _m[1][1] = M[1, 1]; _m[2][1] = M[1, 2];
			_m[0][2] = M[2, 0]; _m[1][2] = M[2, 1]; _m[2][2] = M[2, 2];
			_m[0][3] = 0;       _m[1][3] = 0;       _m[2][3] = 0;
		}

		public ref float this[int row, int column]
		{
			[Checked]
			get mut
			{
				if(column < 0 || column > 2 || row < 0 || row > 3)
					Internal.ThrowIndexOutOfRange();

				return ref _m[column][row];
			}

			[Unchecked, Inline]
			get mut
			{
				return ref _m[column][row];
			}
		}
	}
}
