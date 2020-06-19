namespace DirectX.Common
{
	/**
	 * Specifies interpolation mode, which affects how values are calculated during rasterization.
	 * D3D_INTERPOLATION_MODE
	*/
	public enum InterpolationMode : uint32
	{
		/**
		 * The interpolation mode is undefined.
		 * D3D_INTERPOLATION_UNDEFINED
		*/
		Undefined = 0,
		/**
		 * Don't interpolate between register values.
		 * D3D_INTERPOLATION_CONSTANT
		*/
		Constant = 1,
		/**
		 * Interpolate linearly between register values.
		 * D3D_INTERPOLATION_LINEAR
		*/
		Linear = 2,
		/**
		 * Interpolate linearly between register values but centroid clamped when multisampling.
		 * D3D_INTERPOLATION_LINEAR_CENTROID
		*/
		LinearCentroid = 3,
		/**
		 * Interpolate linearly between register values but with no perspective correction.
		 * D3D_INTERPOLATION_LINEAR_NOPERSPECTIVE
		*/
		LinearNoPerspective = 4,
		/**
		 * Interpolate linearly between register values but with no perspective correction and centroid clamped when multisampling.
		 * D3D_INTERPOLATION_LINEAR_NOPERSPECTIVE_CENTROID
		*/
		LinearNoPerspectiveCentroid = 5,
		/**
		 * Interpolate linearly between register values but sample clamped when multisampling.
		 * D3D_INTERPOLATION_LINEAR_SAMPLE
		*/
		LinearSample = 6,
		/**
		 * Interpolate linearly between register values but with no perspective correction and sample clamped when multisampling.
		 * D3D_INTERPOLATION_LINEAR_NOPERSPECTIVE_SAMPLE
		*/
		LinearNoPerspectiveSample = 7
	}
}
