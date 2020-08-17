using System;
namespace DirectX.Math
{
	public static class MathUtil
	{
		/// An optimal representation of π.
		public const float Pi = 3.141592654f;
		/// An optimal representation of 2*π.
		public const float TwoPi = 6.283185307f;
		/// An optimal representation of 1/π.
		public const float OneOverPi = 0.318309886f;
		/// An optimal representation of 2/π.
		public const float OneOverTwoPi = 0.159154943f;
		/// An optimal representation of π/2.
		public const float PiOverTwo = 1.570796327f;
		/// An optimal representation of π/4.
		public const float PiOverFour = 0.785398163f;

		/**
		 * Converts radians to degrees.
		 * @param radians The value to convert.
		 * @return The converted value.
		 */
		[Inline]
		public static float RadiansToDegrees(float radians) => radians * (180.0f / Pi);
		
		/**
		 * Converts degrees to radians.
		 * @param radians The value to convert.
		 * @return The converted value.
		 */
		[Inline]
		public static float DegreesToRadians(float degrees) => degrees * (Pi / 180f);

		/**
		 * Converts radians to revolutions.
		 * @param radians The value to convert.
		 * @return The converted value.
		 */
		[Inline]
		public static float RadiansToRevolutions(float radians) => radians * OneOverTwoPi;

		/**
		 * Converts revolutions to radians.
		 * @param radians The value to convert.
		 * @return The converted value.
		 */
		[Inline]
		public static float RevolutionsToRadians(float revolutions) => revolutions * TwoPi;

		/**
		 * Converts degrees to revolutions.
		 * @param radians The value to convert.
		 * @return The converted value.
		 */
		[Inline]
		public static float DegreesToRevolutions(float degrees) => degrees * (1.0f / 360f);

		/**
		 * Converts revolutions to degrees.
		 * @param radians The value to convert.
		 * @return The converted value.
		 */
		[Inline]
		public static float RevolutionsToDegrees(float revolutions) => revolutions * 360f;
	}
}
