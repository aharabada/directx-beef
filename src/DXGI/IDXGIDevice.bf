using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	//[CRepr]
	public struct IDXGIDevice : IUnknown, IComObject
	{
		public static new Guid IID => .("54ec77fa-1377-44e6-8c32-88fd5f44c84c");

		public struct VTable : IDXGIObject.VTable
		{
			public function DirectX.Common.HResult(IDXGIDevice* self, out IDXGIAdapter* pAdapter) GetAdapter;
		}

		// Todo: add missing functions

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		public HResult GetAdapter(out IDXGIAdapter* pAdapter) mut
		{
			return VT.GetAdapter(&this, out pAdapter);
		}

		/*
		IDXGIDevice : public IDXGIObject
		{
		public:
		    virtual HRESULT STDMETHODCALLTYPE GetAdapter( 
		        /* [annotation][out] */ 
		        _COM_Outptr_  IDXGIAdapter **pAdapter) = 0;
		    
		    virtual HRESULT STDMETHODCALLTYPE CreateSurface( 
		        /* [annotation][in] */ 
		        _In_  const DXGI_SURFACE_DESC *pDesc,
		        /* [in] */ UINT NumSurfaces,
		        /* [in] */ DXGI_USAGE Usage,
		        /* [annotation][in] */ 
		        _In_opt_  const DXGI_SHARED_RESOURCE *pSharedResource,
		        /* [annotation][out] */ 
		        _COM_Outptr_  IDXGISurface **ppSurface) = 0;
		    
		    virtual HRESULT STDMETHODCALLTYPE QueryResourceResidency( 
		        /* [annotation][size_is][in] */ 
		        _In_reads_(NumResources)  IUnknown *const *ppResources,
		        /* [annotation][size_is][out] */ 
		        _Out_writes_(NumResources)  DXGI_RESIDENCY *pResidencyStatus,
		        /* [in] */ UINT NumResources) = 0;
		    
		    virtual HRESULT STDMETHODCALLTYPE SetGPUThreadPriority( 
		        /* [in] */ INT Priority) = 0;
		    
		    virtual HRESULT STDMETHODCALLTYPE GetGPUThreadPriority( 
		        /* [annotation][retval][out] */ 
		        _Out_  INT *pPriority) = 0;
		    
		};

		*/
	}
}


/*
IDXGIDevice1 : public IDXGIDevice
{
public:
    virtual HRESULT STDMETHODCALLTYPE SetMaximumFrameLatency( 
        /* [in] */ UINT MaxLatency) = 0;
    
    virtual HRESULT STDMETHODCALLTYPE GetMaximumFrameLatency( 
        /* [annotation][out] */ 
        _Out_  UINT *pMaxLatency) = 0;
    
};
*/