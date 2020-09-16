using System;
using DirectX.Common;

using static System.Windows;

namespace DirectX.XAudio2
{
	public static class WavHelper
	{
		typealias DWORD = uint32;

		public static int32 INVALID_SET_FILE_POINTER = -1;

		public static int32 FACILITY_WIN32 = 7;

		public static DWORD fourccRIFF = ((DWORD)'F'<<24) | ((DWORD)'F'<<16) | ((DWORD)'I'<<8) | ((DWORD)'R');//'FFIR';
		public static DWORD fourccDATA = ((DWORD)'a'<<24) | ((DWORD)'t'<<16) | ((DWORD)'a'<<8) | ((DWORD)'d');//'atad'
		public static DWORD fourccFMT = ((DWORD)' '<<24) | ((DWORD)'t'<<16) | ((DWORD)'m'<<8) | ((DWORD)'f');//' tmf'
		public static DWORD fourccWAVE = ((DWORD)'E'<<24) | ((DWORD)'V'<<16) | ((DWORD)'A'<<8) | ((DWORD)'W');//'EVAW'
		public static DWORD fourccXWMA = ((DWORD)'A'<<24) | ((DWORD)'M'<<16) | ((DWORD)'W'<<8) | ((DWORD)'X');//'AMWX'
		public static DWORD fourccDPDS = ((DWORD)'s'<<24) | ((DWORD)'d'<<16) | ((DWORD)'p'<<8) | ((DWORD)'d');//'sdpd'

		/*
		[Inline]
		public static HResult HRESULT_FROM_WIN32(uint32 x)
		{
			return (HResult)(x) <= 0 ? (HResult)(x) : (HResult) (((x) & 0x0000FFFF) | (FACILITY_WIN32 << 16) | 0x80000000);
		}
		*/

		[Inline]
		public static HResult HRESULT_FROM_WIN32(int32 x) // x actually unsigned
		{
			return (HResult)(x) <= 0 ? (HResult)(x) : (HResult) (((x) & 0x0000FFFF) | (FACILITY_WIN32 << 16) | 0x80000000);
		}

		public static HResult FindChunk(FileHandle hFile, DWORD fourcc, ref DWORD dwChunkSize, ref DWORD dwChunkDataPosition)
		{
			HResult hr = .S_OK;

			if(INVALID_SET_FILE_POINTER == SetFilePointer(hFile, 0, null, FILE_BEGIN))
				return HRESULT_FROM_WIN32(GetLastError());

			DWORD dwChunkType = ?;
			DWORD dwChunkDataSize = ?;
			DWORD dwRIFFDataSize = 0;
			DWORD dwFileType;
			DWORD bytesRead = 0;
			DWORD dwOffset = 0;

			while (hr == S_OK)
			{
			    int32 dwRead = ?; // DWORD
			    if( 0 == ReadFile( hFile, (.)&dwChunkType, sizeof(DWORD), out dwRead, null ) )
			        hr = HRESULT_FROM_WIN32( GetLastError() );

			    if( 0 == ReadFile( hFile, (.)&dwChunkDataSize, sizeof(DWORD), out dwRead, null ) )
			        hr = HRESULT_FROM_WIN32( GetLastError() );

			    switch (dwChunkType)
			    {
			    case fourccRIFF:
			        dwRIFFDataSize = dwChunkDataSize;
			        dwChunkDataSize = 4;
			        if( 0 == ReadFile( hFile, (.)&dwFileType, sizeof(DWORD), out dwRead, null ) )
			            hr = HRESULT_FROM_WIN32( GetLastError() );
			        break;

			    default:
			        if( INVALID_SET_FILE_POINTER == SetFilePointer( hFile, (.)dwChunkDataSize, null, FILE_CURRENT ) )
			        return HRESULT_FROM_WIN32( GetLastError() );            
			    }

			    dwOffset += sizeof(DWORD) * 2;

			    if (dwChunkType == (.)fourcc)
			    {
			        dwChunkSize = dwChunkDataSize;
			        dwChunkDataPosition = dwOffset;
			        return S_OK;
			    }

			    dwOffset += dwChunkDataSize;

			    if (bytesRead >= dwRIFFDataSize) return .S_FALSE;

			}

			return S_OK;
		}

		public static HResult ReadChunkData<T>(FileHandle hFile, T* buffer, DWORD buffersize, DWORD bufferoffset)
		{
		    HResult hr = S_OK;
		    if( INVALID_SET_FILE_POINTER == SetFilePointer( hFile, (.)bufferoffset, null, FILE_BEGIN ) )
		        return HRESULT_FROM_WIN32( GetLastError() );
		    int32 dwRead; // DWORD
		    if( 0 == ReadFile( hFile, (uint8*)buffer, (.)buffersize, out dwRead, null ) )
		        hr = HRESULT_FROM_WIN32( GetLastError() );
		    return hr;
		}
	}
	
	[CRepr]
	public struct WAVEFORMATEX
	{
		typealias DWORD = uint32;
		typealias WORD = uint16;

		public WORD    wFormatTag;        /* format type */
		public WORD    nChannels;         /* number of channels (i.e. mono, stereo...) */
		public DWORD   nSamplesPerSec;    /* sample rate */
		public DWORD   nAvgBytesPerSec;   /* for buffer estimation */
		public WORD    nBlockAlign;       /* block size of data */
		public WORD    wBitsPerSample;    /* Number of bits per sample of mono data */
		public WORD    cbSize;            /* The count in bytes of the size of
		                                extra information (after cbSize) */
	}

	[CRepr]
	public struct WAVEFORMATEXTENSIBLE
	{
		public WAVEFORMATEX Format;

		[Union]
		public struct Settings
		{
			public uint16 wValidBitsPerSample;
			public uint16 wSamplesPerBlock;
			public uint16 wReserved;
		}

		public Settings Settings;

		public uint32 dwChannelMask;

		public Guid SubFormat;
	}
}
