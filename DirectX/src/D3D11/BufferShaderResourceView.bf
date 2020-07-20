using System;

namespace DirectX.D3D11
{
	// Todo: doc
	// Todo: original has union
	[CRepr]
	public struct BufferShaderResourceView
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
