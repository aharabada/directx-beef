using System;

namespace DirectX.D3D11
{	
	/**
	Specifies the elements in a buffer resource to use in a render-target view.
	*/
	[CRepr]
	public struct D3D11_BUFFER_RTV
	{
		uint32 ElementOffset;
		uint32 ElementWidth;
		/*
		union 
		    {
		    UINT FirstElement;
		    UINT ElementOffset;
		    } 	;
		union 
		    {
		    UINT NumElements;
		    UINT ElementWidth;
		    } 	;
		*/
	}
}
