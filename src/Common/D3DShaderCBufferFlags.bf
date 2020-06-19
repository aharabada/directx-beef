using System;

namespace DirectX.Common
{
	/**
	 * D3D_SHADER_CBUFFER_FLAGS
	*/
	//Todo:
	[AllowDuplicates]
	public enum D3DShaderCBufferFlags : uint32
	{
		D3D_CBF_USERPACKED	= 1,
        D3D10_CBF_USERPACKED	= D3D_CBF_USERPACKED,
        D3D_CBF_FORCE_DWORD	= 0x7fffffff
	}
}
