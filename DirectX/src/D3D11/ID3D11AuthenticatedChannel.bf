using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	* Provides a communication channel with the graphics driver or the Microsoft Direct3D runtime.
	*/
	public struct ID3D11AuthenticatedChannel : IUnknown, IComObject
	{
		public static new Guid IID => Guid("3015A308-DCBD-47aa-A747-192486D14D4A");
		
		public struct VTable : IUnknown.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(ID3D11AuthenticatedChannel *self, UINT certificateSize, uint8 *pCertificate) GetCertificate;
			public function [CallingConvention(.Stdcall)] HResult(ID3D11AuthenticatedChannel *self, UINT *pCertificateSize) GetCertificateSize;
			public function [CallingConvention(.Stdcall)] void(ID3D11AuthenticatedChannel *self, Windows.Handle *pChannelHandle) GetChannelHandle;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the driver's certificate chain.
		 *
		 * @param certificateSize	The size of the pCertificate array, in bytes.
		 *							To get the size of the certificate chain, call ID3D11CryptoSession::GetCertificateSize.
		 * @param pCertificate		A pointer to a byte array that receives the driver's certificate chain.
		 *							The caller must allocate the array.
		*/
		public HResult GetCertificate(UINT certificateSize, uint8 *pCertificate) mut
		{
			return VT.GetCertificate(&this, certificateSize, pCertificate);
		}

		/**
		 * Gets the size of the driver's certificate chain.
		 *
		 * @param certificateSize	Receives the size of the certificate chain, in bytes.
		*/
		public HResult GetCertificateSize(out UINT certificateSize) mut
		{
			certificateSize = ?;
			return VT.GetCertificateSize(&this, &certificateSize);
		}

		/**
		 * Gets a handle to the authenticated channel.
		 *
		 * @param channelHandle	Receives a handle to the channel.
		*/
		public void GetChannelHandle(out Windows.Handle channelHandle) mut
		{
			channelHandle = ?;
			VT.GetChannelHandle(&this, &channelHandle);
		}	
	}
}
