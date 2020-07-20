using System;
using DirectX.Common;

/**
 * A linking-node interface is used for shader linking.
*/
public struct ID3D11LinkingNode : IUnknown, IComObject
{
	public static new Guid IID => .(0xd80dd70c, 0x8d2f, 0x4751, 0x94, 0xa1, 0x3, 0xc7, 0x9b, 0x35, 0x56, 0xdb);

	// This interface adds no new methods.
}