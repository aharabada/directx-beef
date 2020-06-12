using System;
using DirectX.Common;

namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * An IDXGIOutput interface represents an adapter output (such as a monitor).
	*/
	[CRepr]
	public struct IDXGIOutput1 : IDXGIOutput, IComObject
	{
		public static new Guid IID => .("00cddea8-939b-4b83-a340-a685226666cc");

		public struct VTable : IDXGIOutput.VTable
		{
			public function HResult(IDXGIOutput* self, Format enumFormat, EnumerationMode flags, UINT *pNumModes, ModeDescription1 *pDescs) GetDisplayModeList1;
			public function HResult(IDXGIOutput* self, ModeDescription1 *modeToMatch, ModeDescription1 *clostestMatch, IUnknown *concernedDevice) FindClosestMatchingMode1;
			public function HResult(IDXGIOutput* self, IDXGIResource *pDestination) GetDisplaySurfaceData1;
			public function HResult(IDXGIOutput* self, IUnknown *pDevice, IDXGIOutputDuplication **pOutputDuplication) DuplicateOutput;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Creates a desktop duplication interface from the IDXGIOutput1 interface that represents an adapter output.
		 *
		 * @param device			A pointer to the Direct3D device interface that you can use to process the desktop image.
		 *							This device must be created from the adapter to which the output is connected.
		 * @param outputDuplication	A pointer to a variable that receives the new IDXGIOutputDuplication interface.
		*/
		public HResult DuplicateOutput(IUnknown* device, out IDXGIOutputDuplication* outputDuplication) mut
		{
			outputDuplication = ?;
			return VT.DuplicateOutput(&this, device, &outputDuplication);
		}

		/**
		 * Finds the display mode that most closely matches the requested display mode.
		 *
		 * @param modeToMatch		A reference to the ModeDescription1 structure that describes the display mode to match.
		 * @param clostestMatch		A reference to the ModeDescription1 structure that receives a description of the display mode that most closely matches the display mode described at modeToMatch.
		 * @param concernedDevice	A pointer to the Direct3D device interface.
		 *							If this parameter is NULL, FindClosestMatchingMode1 returns only modes whose format matches that of pModeToMatch;
		 *							otherwise, FindClosestMatchingMode1 returns only those formats that are supported for scan-out by the device.
		*/
		public HResult FindClosestMatchingMode1(ref ModeDescription1 modeToMatch, out ModeDescription1 clostestMatch, IUnknown* concernedDevice) mut
		{
			clostestMatch = ?;
			return VT.FindClosestMatchingMode1(&this, &modeToMatch, &clostestMatch, concernedDevice);
		}

		/**
		 * Gets the display modes that match the requested format and other input options.
		 *
		 * @param enumFormat	A Format value for the color format.
		 * @param flags			A combination of EnumerationModes that are combined by using a bitwise OR operation.
		 * @param numModes		A reference to a variable that receives the number of display modes that GetDisplayModeList1 returns in the memory block to which "descs" points.
		 * @param descs			A pointer to a list of display modes;
		 *						set to NULL to get the number of display modes.
		*/
		public HResult GetDisplayModeList1(Format enumFormat, EnumerationMode flags, out UINT numModes, ModeDescription1 *descs) mut
		{
			numModes = ?;
			return VT.GetDisplayModeList1(&this, enumFormat, flags, &numModes, descs);
		}

		/**
		 * Copies the display surface (front buffer) to a user-provided resource.
		 *
		 * @param destination	A pointer to a resource interface that represents the resource to which GetDisplaySurfaceData1 copies the display surface.
		*/
		public HResult GetDisplaySurfaceData1(IDXGIResource *destination) mut
		{
			return VT.GetDisplaySurfaceData1(&this, destination);
		}
	}
}
