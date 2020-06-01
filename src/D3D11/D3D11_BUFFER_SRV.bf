using System;

namespace DirectX.D3D11
{	
	[CRepr]
	public struct D3D11_BUFFER_SRV
	{
		uint32 ElementOffset;
		uint32 ElementWidth;
		/*union 
		    {
		    UINT FirstElement;
		    UINT ElementOffset;
		    } 	;
		union 
		    {
		    UINT NumElements;
		    UINT ElementWidth;
		    } 	;*/
	}
}
