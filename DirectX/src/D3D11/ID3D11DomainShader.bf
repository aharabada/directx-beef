using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	* A domain-shader interface manages an executable program (a domain shader) that controls the domain-shader stage.
	*/
	public struct ID3D11DomainShader : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => Guid("f582c508-0f36-490c-9977-31eece268cfa");
		
		// This interface doesn't implement any new methods.
	}
}