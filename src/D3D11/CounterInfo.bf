using System;

namespace DirectX.D3D11
{
	/**
	 * Information about the video card's performance counter capabilities.
	*/
	[CRepr]
	public struct CounterInfo
	{
		/**
		 * Largest device-dependent counter ID that the device supports.
		 * If none are supported, this value will be 0.
		 * Otherwise it will be greater than or equal to Counter.DeviceDependent0.
		*/
		public Counter LastDeviceDependentCounter;
		/**
		 * Number of counters that can be simultaneously supported.
		*/
		public uint32 NumSimultaneousCounters;
		/**
		 * Number of detectable parallel units that the counter is able to discern.
		 * Values are 1 ~ 4.
		 * Use NumDetectableParallelUnits to interpret the values of the VERTEX_PROCESSING, GEOMETRY_PROCESSING, PIXEL_PROCESSING, and OTHER_GPU_PROCESSING counters.
		*/
		public uint8 NumDetectableParallelUnits;
	}
}
