using System;

namespace DirectX.DXGI
{
	[CRepr]
    //MIDL_INTERFACE("ae02eedb-c735-4690-8d52-5a8dc20213aa")
	public struct IDXGIOutput
	{
		public struct VTable : IDXGIObject.VTable
		{
			// Todo: finish functions
			public function DirectX.Common.HResult(IDXGIOutput* self, out OutputDescription outputDesc) GetDesc;
			private function void() Spacer0; 
			private function void() Spacer1;
			public function DirectX.Common.HResult(IDXGIOutput* self) WaitForVBlank; 
			public function DirectX.Common.HResult(IDXGIOutput* self, Windows.COM_IUnknown* pDevice, bool exclusive) TakeOwnership;
			public function DirectX.Common.HResult(IDXGIOutput* self, Windows.COM_IUnknown* pDevice) ReleaseOwnership;
			private function void() Spacer2;
			private function void() Spacer3;
			private function void() Spacer4;
			private function void() Spacer5;
			private function void() Spacer6;
			private function void() Spacer7;
		}

		protected VTable* mVT;
		public VTable* VT
		{
			get
			{
				return (.)mVT;
			}
		}

		// Todo: use inheritance instead of casting
		[Inline]
		public Windows.COM_IUnknown* ToComIUnknown() mut
		{
			return (Windows.COM_IUnknown*)&this;
		}

		[Inline]
		public IDXGIObject* ToIDXGIObject() mut
		{
			return (IDXGIObject*)&this;
		}
	}
	/*

	virtual HRESULT STDMETHODCALLTYPE GetDisplayModeList( 
	    /* [in] */ DXGI_FORMAT EnumFormat,
	    /* [in] */ UINT Flags,
	    /* [annotation][out][in] */ 
	    _Inout_  UINT *pNumModes,
	    /* [annotation][out] */ 
	    _Out_writes_to_opt_(*pNumModes,*pNumModes)  DXGI_MODE_DESC *pDesc) = 0;

	virtual HRESULT STDMETHODCALLTYPE FindClosestMatchingMode( 
	    /* [annotation][in] */ 
	    _In_  const DXGI_MODE_DESC *pModeToMatch,
	    /* [annotation][out] */ 
	    _Out_  DXGI_MODE_DESC *pClosestMatch,
	    /* [annotation][in] */ 
	    _In_opt_  IUnknown *pConcernedDevice) = 0;

	virtual HRESULT STDMETHODCALLTYPE GetGammaControlCapabilities( 
	    /* [annotation][out] */ 
	    _Out_  DXGI_GAMMA_CONTROL_CAPABILITIES *pGammaCaps) = 0;

	virtual HRESULT STDMETHODCALLTYPE SetGammaControl( 
	    /* [annotation][in] */ 
	    _In_  const DXGI_GAMMA_CONTROL *pArray) = 0;

	virtual HRESULT STDMETHODCALLTYPE GetGammaControl( 
	    /* [annotation][out] */ 
	    _Out_  DXGI_GAMMA_CONTROL *pArray) = 0;

	virtual HRESULT STDMETHODCALLTYPE SetDisplaySurface( 
	    /* [annotation][in] */ 
	    _In_  IDXGISurface *pScanoutSurface) = 0;

	virtual HRESULT STDMETHODCALLTYPE GetDisplaySurfaceData( 
	    /* [annotation][in] */ 
	    _In_  IDXGISurface *pDestination) = 0;

	virtual HRESULT STDMETHODCALLTYPE GetFrameStatistics( 
	    /* [annotation][out] */ 
	    _Out_  DXGI_FRAME_STATISTICS *pStats) = 0;
	*/
}
