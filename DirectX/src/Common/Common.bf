using System;

namespace DirectX.Common
{
	static
	{
		public static readonly Guid WKPDID_D3DDebugObjectName = .(0x429b8c22,0x9188,0x4b0c,0x87,0x42,0xac,0xb0,0xbf,0x85,0xc2,0x00);
		public static readonly Guid WKPDID_D3DDebugObjectNameW = .(0x4cca5fd8,0x921f,0x42c8,0x85,0x66,0x70,0xca,0xf2,0xa9,0xb7,0x41);
		public static readonly Guid WKPDID_CommentStringW = .(0xd0149dc0,0x90e8,0x4ec8,0x81, 0x44, 0xe9, 0x00, 0xad, 0x26, 0x6b, 0xb2);

		/** @brief Releases the reference of the given Com-Object and sets the pointer to null.
		 * @param val The com object-pointer to release and nullify.
		 */
		public static mixin ReleaseAndNullify<T>(T* val) where T: IUnknown
		{
			((IUnknown*)val)?.Release();
			val = null;
		}
	}
}
