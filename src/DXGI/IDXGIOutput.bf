using System;
using DirectX.Common;

namespace DirectX.DXGI
{
	/**
	 * An IDXGIOutput interface represents an adapter output (such as a monitor).
	*/
	[CRepr]
	public struct IDXGIOutput : IDXGIObject, IComObject
	{
		public static new Guid IID => .("ae02eedb-c735-4690-8d52-5a8dc20213aa");

		public struct VTable : IDXGIObject.VTable
		{
			// Todo: finish functions
			public function HResult(IDXGIOutput* self, out OutputDescription outputDesc) GetDesc;
			public function HResult(IDXGIOutput* self, Format enumFormat, EnumerationModes flags, UINT *pNumModes, ModeDescription *pDesc) GetDisplayModeList;
			public function HResult(IDXGIOutput* self, ModeDescription *pModeToMatch, ModeDescription *pClosestMatch, IUnknown *pConcernedDevice) FindClosestMatchingMode; 
			public function HResult(IDXGIOutput* self) WaitForVBlank; 
			public function HResult(IDXGIOutput* self, IUnknown* pDevice, bool exclusive) TakeOwnership;
			public function void(IDXGIOutput* self) ReleaseOwnership;
			public function HResult (IDXGIOutput* self, GammaControlCapabilities *pGammaCaps) GetGammaControlCapabilities;
			public function HResult(IDXGIOutput* self, GammaControl *pArray) SetGammaControl;
			public function HResult(IDXGIOutput* self, GammaControl *pArray) GetGammaControl;
			public function HResult(IDXGIOutput* self, IDXGISurface *pScanoutSurface) SetDisplaySurface;
			public function HResult(IDXGIOutput* self, IDXGISurface *pDestination) GetDisplaySurfaceData;
			public function HResult(IDXGIOutput* self, FrameStatistics *pStats) GetFrameStatistics;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Finds the display mode that most closely matches the requested display mode.
		 *
		 * @param modeToMatch		The desired display mode.
		 * @param closestMatch		The mode that most closely matches pModeToMatch.
		 * @param pConcernedDevice	A pointer to the Direct3D device interface.
		 *							If this parameter is NULL, only modes whose format matches that of pModeToMatch will be returned;
		 *							otherwise, only those formats that are supported for scan-out by the device are returned.
		*/
		public HResult FindClosestMatchingMode(ref ModeDescription modeToMatch, out ModeDescription closestMatch, IUnknown *pConcernedDevice) mut
		{
			closestMatch = ?;
			return VT.FindClosestMatchingMode(&this, &modeToMatch, &closestMatch, pConcernedDevice);
		}

		/**
		 * Get a description of the output.
		 *
		 * @param desc	A reference to the output description.
		*/
		public HResult GetDescription(out OutputDescription desc) mut
		{
			return VT.GetDesc(&this, out desc);
		}

		/**
		 * Gets the display modes that match the requested format and other input options.
		 *
		 * @param enumFormat	The color format.
		 * @param flags			Options for modes to include.
		 * @param pNumModes		Set pDesc to NULL so that pNumModes returns the number of display modes that match the format and the options.
		 *						Otherwise, pNumModes returns the number of display modes returned in pDesc.
		 * @param pDesc			A pointer to a list of display modes;
		 *						set to NULL to get the number of display modes.
		*/
		public HResult GetDisplayModeList(Format enumFormat, EnumerationModes flags, out UINT pNumModes, ModeDescription *pDesc) mut
		{
			pNumModes = ?;
			return VT.GetDisplayModeList(&this, enumFormat, flags, &pNumModes, pDesc);
		}

		/**
		 * Gets a copy of the current display surface.
		 *
		 * @param pDestination	A pointer to a destination surface.
		*/
		public HResult GetDisplaySurfaceData(IDXGISurface *pDestination) mut
		{
			return VT.GetDisplaySurfaceData(&this, pDestination);
		}

		/**
		 * Gets statistics about recently rendered frames.
		 *
		 * @param stats	A reference to frame statistics.
		*/
		public HResult GetFrameStatistics(out FrameStatistics stats) mut
		{
			stats = ?;
			return VT.GetFrameStatistics(&this, &stats);
		}

		/**
		 * Gets the gamma control settings.
		 *
		 * @param pArray An array of gamma control settings.
		*/
		public HResult GetGammaControl(GammaControl *pArray) mut
		{
			return VT.GetGammaControl(&this, pArray);
		}

		/**
		 * Gets a description of the gamma-control capabilities.
		 *
		 * @param gammaCaps A reference to a description of the gamma-control capabilities.
		*/
		public HResult GetGammaControlCapabilities(out GammaControlCapabilities gammaCaps) mut
		{
			gammaCaps = ?;
			return VT.GetGammaControlCapabilities(&this, &gammaCaps);
		}

		/**
		 * Releases ownership of the output.
		*/
		public void ReleaseOwnership() mut
		{
			VT.ReleaseOwnership(&this);
		}

		/**
		 * Changes the display mode.
		 *
		 * @param pScanoutSurface	A pointer to a surface used for rendering an image to the screen.
		 *							The surface must have been created as a back buffer.
		*/
		public HResult SetDisplaySurface(IDXGISurface *pScanoutSurface) mut
		{
			return VT.SetDisplaySurface(&this, pScanoutSurface);
		}

		/**
		 * Sets the gamma controls.
		 *
		 * @param pArray A pointer to a GammaControl structure that describes the gamma curve to set.
		*/
		public HResult SetGammaControl(GammaControl *pArray) mut
		{
			return VT.SetGammaControl(&this, pArray);
		}

		/**
		 * Takes ownership of an output.
		 *
		 * @param pDevice	A pointer to the IUnknown interface of a device (such as an ID3D10Device).
		 * @param exclusive Set to TRUE to enable other threads or applications to take ownership of the device; otherwise, set to FALSE.
		*/
		public HResult TakeOwnership(IUnknown *pDevice, BOOL exclusive) mut
		{
			return VT.TakeOwnership(&this, pDevice, exclusive);
		}

		/**
		 * Halt a thread until the next vertical blank occurs.
		*/
		public HResult WaitForVBlank() mut
		{
			return VT.WaitForVBlank(&this);
		}
	}
}
