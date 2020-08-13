using System;

namespace DirectX.D3D11
{
	// Todo: doc
	// Todo: original has union
	[CRepr]
	public struct BufferShaderResourceView
	{
		public UINT FirstElement;
		public UINT NumElements;
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
