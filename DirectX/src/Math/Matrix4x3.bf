using System;

namespace DirectX.Math
{
	/**
	* Represents a 4 by 3 column-major matrix.
	*/
	[Union]
	public struct Matrix4x3
	{
		public struct Values
		{
			public float _11, _21, _31, _41,
						_12, _22, _32, _42,
						_13, _23, _33, _43;
		}

		public static readonly Matrix4x3 Zero = .();

		public Values V;
		public float[3][4] Values;
		public Vector4[3] Columns; 

		public this()
		{
			this = default;
		}

		public this(float m00, float m01, float m02,
					float m10, float m11, float m12,
					float m20, float m21, float m22,
					float m30, float m31, float m32)
		{
			this = ?;

			V._11 = m00; V._12 = m01; V._13 = m02;
			V._21 = m10; V._22 = m11; V._23 = m12;
			V._31 = m20; V._32 = m21; V._33 = m22;
			V._41 = m30; V._42 = m31; V._43 = m32;
		}

		public this(Matrix3x3 m)
		{
			this = ?;
#unwarn
			var v = &m.V;

			*(float[3]*)&V._11 = *(float[3]*)&v._11;
			*(float[3]*)&V._12 = *(float[3]*)&v._12;
			*(float[3]*)&V._13 = *(float[3]*)&v._13;

			V._41 = V._42 = V._43 = 0;
		}

		public this(Matrix m)
		{
			Columns[0] = m.Columns[0];
			Columns[1] = m.Columns[1];
			Columns[2] = m.Columns[2];
		}

		public this(Vector4 c0, Vector4 c1, Vector4 c2)
		{
			Columns[0] = c0;
			Columns[1] = c1;
			Columns[2] = c2;
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

		public ref Vector4 this[int column]
		{
			get
			{
#unwarn
				return ref *(Vector4*)&Columns[column];
			}

			
			[Checked]
			get
			{
				if(column < 0 || column > 2)
					Internal.ThrowIndexOutOfRange();
				
#unwarn
				return ref *(Vector4*)&Columns[column];
			}
		}
	}
}
