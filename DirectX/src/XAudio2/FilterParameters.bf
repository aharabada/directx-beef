using System;

namespace DirectX.XAudio2
{
	/**
	 * Defines filter parameters for a source voice.
	 */
	[CRepr]
	public struct FilterParameters
	{
		/**
		 * The FilterType.
		 */
		public FilterType Type;
		/**
		 * Filter radian frequency calculated as (2 * sin(pi * (desired filter cutoff frequency) / sampleRate)).
		 * The frequency must be greater than or equal to 0 and less than or equal to XAudio2.MaxFilterFrequency.
		 */
		public float Frequency;
		/**
		 * Reciprocal of Q factor.
		 * Must be greater than 0 and less than or equal to XAudio2.MaxOneOverQ.
		 */
		public float OneOverQ;
	}
}
