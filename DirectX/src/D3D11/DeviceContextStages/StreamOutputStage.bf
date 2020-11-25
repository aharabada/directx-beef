using System;
using DirectX.DXGI;
using DirectX.Math; 
using DirectX.Common;

namespace DirectX.D3D11.DeviceContextStages
{
	/**
	 * Provides access to the device contexts methods for the stream output stage.
	*/
	public struct StreamOutputStage
	{
		ID3D11DeviceContext.VTable* mVT;
		
		[Inline]
		public ID3D11DeviceContext.VTable* VT => mVT;

		/**
		* Get the target output buffers for the stream-output stage of the pipeline.
		* A maximum of four output buffers can be retrieved.
		*
		@param numBuffers	Number of buffers to get.
		@param ppSOTargets	An array of output buffers (see ID3D11Buffer) to be retrieved from the device.
		*/
		public void GetTargets(UINT numBuffers, ID3D11Buffer **ppSOTargets) mut
		{
			VT.SOGetTargets((.)&this, numBuffers, ppSOTargets);
		}

		/**
		* Set the target output buffers for the stream-output stage of the pipeline.
		*
		@param numBuffers	The number of buffer to bind to the device. A maximum of four output buffers can be set.
							If less than four are defined by the call, the remaining buffer slots are set to NULL.
		@param ppSOTargets	The array of output buffers (see ID3D11Buffer) to bind to the device.
							The buffers must have been created with the D3D11_BIND_STREAM_OUTPUT flag.
		@param pOffsets		Array of offsets to the output buffers from ppSOTargets, one offset for each buffer. T
							he offset values must be in bytes.
		*/
		public void SetTargets(UINT numBuffers, ID3D11Buffer **ppSOTargets, UINT *pOffsets) mut
		{
			VT.SOSetTargets((.)&this, numBuffers, ppSOTargets, pOffsets);
		}
	}
}
