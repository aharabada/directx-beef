namespace DirectX.XAudio2
{
	/**
	 * Indicates the filter type.
	 */
	public enum FilterType : uint32
	{
		/**
		 * Attenuates (reduces) frequencies above the cutoff frequency.
		 */
		LowPassFilter,
		/**
		 * Attenuates frequencies outside a given range.
		 */
		BandPassFilter,
		/**
		 * Attenuates frequencies below the cutoff frequency.
		 */
		HighPassFilter,
		/**
		 * Attenuates frequencies inside a given range.
		 */
		NotchFilter,
		/**
		 * Attenuates frequencies above the cutoff frequency. This is a one-pole filter, and FilterParameters.OneOverQ has no effect.
		 */
		LowPassOnePoleFilter,
		/**
		 * Attenuates frequencies below the cutoff frequency. This is a one-pole filter, and FilterParameters.OneOverQ has no effect.
		 */
		HighPassOnePoleFilter
	}
}
