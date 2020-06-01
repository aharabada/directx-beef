namespace DirectX.D3D11
{
	/**
	* Optional flags that control the behavior of ID3D11DeviceContext::GetData.
	* D3D11_ASYNC_GETDATA_FLAG
	*/
	public enum AsyncGetDataFlags : UINT
	{
		/**  No flags specified */
		None = 0x00,
		/**
		* Do not flush the command buffer.
		* This can potentially cause an infinite loop if GetData is continually
		* called until it returns S_OK as there may still be commands in the
		* command buffer that need to be processed in order for GetData to return S_OK.
		* Since the commands in the command buffer are not flushed they will not be
		* processed and therefore GetData will never return S_OK.
		* D3D11_ASYNC_GETDATA_DONOTFLUSH
		*/
		DoNotFlush = 0x01
	}
}
