using System;
using DirectX.Common;

namespace DirectX.XAudio2
{
	/**
	 * The IXAudio2EngineCallback interface contains methods that notify the client when certain events happen in the IXAudio2 engine.
	 */
	[CRepr]
	public struct IXAudio2EngineCallback
	{
		public struct VTable
		{
			public function void(IXAudio2EngineCallback* self) OnProcessingPassStart;
			public function void(IXAudio2EngineCallback* self) OnProcessingPassEnd;
			public function void(IXAudio2EngineCallback* self, HResult Error) OnCriticalError;
		}

		protected VTable mVT;

		public VTable VT
		{
			[Inline]
			get => mVT;
		}

		/**
		 * Called by XAudio2 just before an audio processing pass begins.
		 */
		public void OnProcessingPassStart() mut
		{
			mVT.OnProcessingPassStart(&this);
		}

		/**
		 * Called by XAudio2 just after an audio processing pass ends.
		 */
		public void OnProcessingPassEnd() mut
		{
			mVT.OnProcessingPassEnd(&this);
		}
		
		/**
		 * Called if a critical system error occurs that requires XAudio2 to be closed down and restarted.
		 * @param error Error code returned by XAudio2.
		 */
		public void OnCriticalError(HResult error) mut
		{
			mVT.OnCriticalError(&this, error);
		}
	}
}
