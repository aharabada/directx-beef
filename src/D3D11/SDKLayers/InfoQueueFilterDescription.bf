using System;

namespace DirectX.D3D11.SDKLayers
{
	[CRepr]
	public struct InfoQueueFilterDescription
	{
		public uint32 NumCategories;
		public MessageCategory* CategoryList;
		public uint32 NumSeverities;
		public MessageSeverity* SeverityList; 
		public uint32 NumIDs;
		public MessageID* IDList;
	}
}
