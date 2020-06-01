using System;

namespace DirectX.D3D11.SDKLayers
{
	[CRepr]
	public struct Message
	{
		public MessageCategory Category;
		public MessageSeverity Severity;
		public MessageID ID;
		public char8* pDescription;
		public uint32 DescriptionByteLength; // SIZE_T
	}
}
