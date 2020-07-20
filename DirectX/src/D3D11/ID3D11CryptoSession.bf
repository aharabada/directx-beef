using System;
using DirectX.Common;

namespace DirectX.D3D11
{
	/**
	 * Represents a cryptographic session.
	*/
	public struct ID3D11CryptoSession : ID3D11DeviceChild, IComObject
	{
		public static new Guid IID => .("9B32F9AD-BDCC-40a6-A39D-D5C865845720");

		public struct VTable : ID3D11DeviceChild.VTable
		{
			public function void(ID3D11CryptoSession *self, Guid *pCryptoType)GetCryptoType;
			public function void(ID3D11CryptoSession *self, Guid *pDecoderProfile)GetDecoderProfile;
			public function void(ID3D11CryptoSession *self, UINT *pCertificateSize)GetCertificateSize;
			public function void(ID3D11CryptoSession *self, UINT certificateSize, uint8 *pCertificate)GetCertificate;
			public function void(ID3D11CryptoSession *self, Windows.Handle *pCryptoSessionHandle)GetCryptoSessionHandle;
		}

		public new VTable *VT
		{
			[Inline]
			get => (.)mVT;
		}
		
		/**
		 * Gets the decoding profile of the session.
		 *
		 * @param certificateSize	The size of the pCertificate array, in bytes. To get the size of the certificate chain, call ID3D11CryptoSession::GetCertificateSize.
		 * @param certificateData	A pointer to a byte array that receives the driver's certificate chain. The caller must allocate the array.
		*/
		public void GetCertificate(UINT certificateSize, uint8 *certificateData) mut
		{
			VT.GetCertificate(&this, certificateSize, certificateData);
		}

		/**
		 * Gets the size of the driver's certificate chain.
		 *
		 * @param certificateSize	Receives the size of the certificate chain, in bytes.
		*/
		public void GetCertificateSize(out UINT certificateSize) mut
		{
			certificateSize = ?;
			VT.GetCertificateSize(&this, &certificateSize);
		}

		/**
		 * Gets the type of encryption that is supported by this session.
		 *
		 * @param cryptoType	Receives a GUID that specifies the encryption type.
		*/
		public void GetCryptoType(out Guid cryptoType) mut
		{
			cryptoType = ?;
			VT.GetCryptoType(&this, &cryptoType);
		}

		/**
		 * Gets the decoding profile of the session.
		 *
		 * @param decoderProfile	Receives the decoding profile.
		*/
		public void GetDecoderProfile(out Guid decoderProfile) mut
		{
			decoderProfile = ?;
			VT.GetCryptoType(&this, &decoderProfile);
		}

		/**
		 * Gets a handle to the cryptographic session.
		 *
		 * @param cryptoSessionHandle	Receives a handle to the session.
		*/
		public void GetCryptoSessionHandle(out Windows.Handle cryptoSessionHandle) mut
		{
			cryptoSessionHandle = ?;
			VT.GetCryptoSessionHandle(&this, &cryptoSessionHandle);
		}
	}
}
