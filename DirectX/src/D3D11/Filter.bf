namespace DirectX.D3D11
{
	/**
	Filtering options during texture sampling. 
	D3D11_FILTER
	*/
	public enum Filter : uint32
	{
		/**
		Use point sampling for minification, magnification, and mip-level sampling.
		D3D11_FILTER_MIN_MAG_MIP_POINT
		*/
		Min_Mag_Mip_Point= 0,
		/**
		Use point sampling for minification and magnification; use linear interpolation for mip-level sampling.
		D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR
		*/
		Min_Mag_Point_Mip_Linear 	= 0x1,	 
		/**
		Use point sampling for minification; use linear interpolation for magnification; use point sampling for mip-level sampling.
		 D3D11_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT
		*/
		Min_Point_Mag_Linear_Mip_Point 	= 0x4, 
		/**
		 	Use point sampling for minification; use linear interpolation for magnification and mip-level sampling.
		D3D11_FILTER_MIN_POINT_MAG_MIP_LINEAR
		*/
		Min_Point_Mag_Mip_Linear 	= 0x5,  
		/**
		Use linear interpolation for minification; use point sampling for magnification and mip-level sampling.
		D3D11_FILTER_MIN_LINEAR_MAG_MIP_POINT
		*/
		Min_Linear_Mag_Mip_Point 	= 0x10,
		/**
		 	Use linear interpolation for minification; use point sampling for magnification; use linear interpolation for mip-level sampling.
		D3D11_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR
		*/	
		Min_Linear_Mag_Point_Mip_Linear 	= 0x11,	   
		/**
		Use linear interpolation for minification and magnification; use point sampling for mip-level sampling.
		D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT
		*/
		Min_Mag_Linear_Mip_Point 	= 0x14,		
		/**
		 	Use linear interpolation for minification, magnification, and mip-level sampling.
		D3D11_FILTER_MIN_MAG_MIP_LINEAR
		*/
		Min_Mag_Mip_Linear 	= 0x15,	  
		/**
		 	Use anisotropic interpolation for minification, magnification, and mip-level sampling.
	   	D3D11_FILTER_ANISOTROPIC
		*/	  
		Anisotropic 	= 0x55,
		/**
		Use point sampling for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
		D3D11_FILTER_COMPARISON_MIN_MAG_MIP_POINT
		*/
		Comparison_Min_Mag_Mip_Point 	= 0x80,		
		/**
		Use point sampling for minification and magnification; use linear interpolation for mip-level sampling. Compare the result to the comparison value.
		D3D11_FILTER_COMPARISON_MIN_MAG_POINT_MIP_LINEAR
		*/
		Comparison_Min_Mag_Point_Mip_Linear 	= 0x81,	 
		/**
		Use point sampling for minification; use linear interpolation for magnification; use point sampling for mip-level sampling. Compare the result to the comparison value.
		D3D11_FILTER_COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT
		*/
		Comparison_Min_Point_Mag_Linear_Mip_Point 	= 0x84,	  
		/**
		Use point sampling for minification; use linear interpolation for magnification and mip-level sampling. Compare the result to the comparison value.
		D3D11_FILTER_COMPARISON_MIN_POINT_MAG_MIP_LINEAR
		*/
		Comparison_Min_Point_Mag_Mip_Linear 	= 0x85,	
		/**
		Use linear interpolation for minification; use point sampling for magnification and mip-level sampling. Compare the result to the comparison value.
		D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_MIP_POINT
		*/
		Comparison_Min_Linear_Mag_Mip_Point 	= 0x90,	
		/**
		Use linear interpolation for minification; use point sampling for magnification; use linear interpolation for mip-level sampling. Compare the result to the comparison value.
		D3D11_FILTER_COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR
		*/
		Comparison_Min_Linear_Mag_Point_Mip_Linear 	= 0x91,	 
		/**
		 	Use linear interpolation for minification and magnification; use point sampling for mip-level sampling. Compare the result to the comparison value.
		D3D11_FILTER_COMPARISON_MIN_MAG_LINEAR_MIP_POINT
		*/
		Comparison_Min_Mag_Linear_Mip_Point 	= 0x94,	
		/**
		Use linear interpolation for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
		D3D11_FILTER_COMPARISON_MIN_MAG_MIP_LINEAR
		*/
		Comparison_Min_Mag_Mip_Linear 	= 0x95,	 
		/**
		 	Use anisotropic interpolation for minification, magnification, and mip-level sampling. Compare the result to the comparison value.
		D3D11_FILTER_COMPARISON_ANISOTROPIC
		*/
		Comparison_Anisotropic 	= 0xd5,		  
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_MAG_MIP_POINT and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MINIMUM_MIN_MAG_MIP_POINT
		*/
		Minimum_Min_Mag_Mip_Point 	= 0x100,   
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MINIMUM_MIN_MAG_POINT_MIP_LINEAR
		*/
		Minimum_Min_Mag_Point_Mip_Linear 	= 0x101,  
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT
		*/
		Minimum_Min_Point_Mag_Linear_Mip_Point 	= 0x104,  
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_POINT_MAG_MIP_LINEAR and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MINIMUM_MIN_POINT_MAG_MIP_LINEAR
		*/
		Minimum_Min_Point_Mag_Mip_Linear 	= 0x105,	 
		/**
		Fetch the same set of texels as D3D11_FILTER_MIN_LINEAR_MAG_MIP_POINT and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_MIP_POINT
		*/
		Minimum_Min_Linear_Mag_Mip_Point 	= 0x110,	
		/**
		Fetch the same set of texels as D3D11_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR
		*/
		Minimum_Min_Linear_Mag_Point_Mip_Linear 	= 0x111,  
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MINIMUM_MIN_MAG_LINEAR_MIP_POINT
		*/
		Minimum_Min_Mag_Linear_Mip_Point 	= 0x114,		 
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_MAG_MIP_LINEAR and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MINIMUM_MIN_MAG_MIP_LINEAR
		*/
		Minimum_Min_Mag_Mip_Linear 	= 0x115,				 
		/**
		 	Fetch the same set of texels as D3D11_FILTER_ANISOTROPIC and instead of filtering them return the minimum of the texels. Texels that are weighted 0 during filtering aren't counted towards the minimum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MINIMUM_ANISOTROPIC
		*/
		Minimum_Anisotropic 	= 0x155,				  
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_MAG_MIP_POINT and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_POINT
		*/
		Maximum_Min_Mag_Mip_Point 	= 0x180,			   
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_MAG_POINT_MIP_LINEAR and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MAXIMUM_MIN_MAG_POINT_MIP_LINEAR
		*/
		Maximum_Min_Mag_Point_Mip_Linear 	= 0x181,	   
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT
		*/
		Maximum_Min_Point_Mag_Linear_Mip_Point 	= 0x184,	 
		/**
		Fetch the same set of texels as D3D11_FILTER_MIN_POINT_MAG_MIP_LINEAR and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MAXIMUM_MIN_POINT_MAG_MIP_LINEAR
		*/
		Maximum_Min_Point_Mag_Mip_Linear 	= 0x185,		
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_LINEAR_MAG_MIP_POINT and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_MIP_POINT
		*/
		Maximum_Min_Linear_Mag_Mip_Point 	= 0x190,	 
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR
		*/
		Maximum_Min_Linear_Mag_Point_Mip_Linear 	= 0x191,
		/**
		Fetch the same set of texels as D3D11_FILTER_MIN_MAG_LINEAR_MIP_POINT and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MAXIMUM_MIN_MAG_LINEAR_MIP_POINT
		*/
		Maximum_Min_Mag_Linear_Mip_Point 	= 0x194,
		/**
		 	Fetch the same set of texels as D3D11_FILTER_MIN_MAG_MIP_LINEAR and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MAXIMUM_MIN_MAG_MIP_LINEAR
		*/
		Maximum_Min_Mag_Mip_Linear 	= 0x195,
		/**
		 	Fetch the same set of texels as D3D11_FILTER_ANISOTROPIC and instead of filtering them return the maximum of the texels. Texels that are weighted 0 during filtering aren't counted towards the maximum. You can query support for this filter type from the MinMaxFiltering member in the D3D11_FEATURE_DATA_D3D11_OPTIONS1 structure.
		D3D11_FILTER_MAXIMUM_ANISOTROPIC
		*/
		Maximum_Anisotropic 	= 0x1d5
	}
}
