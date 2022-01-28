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
			/**
			 * Called by XAudio2 just before an audio processing pass begins.
			 */
			public function [CallingConvention(.Stdcall)] void(IXAudio2EngineCallback* self) OnProcessingPassStart;
			/**
			 * Called by XAudio2 just after an audio processing pass ends.
			 */
			public function [CallingConvention(.Stdcall)] void(IXAudio2EngineCallback* self) OnProcessingPassEnd;
			/**
			 * Called if a critical system error occurs that requires XAudio2 to be closed down and restarted.
			 * @param error Error code returned by XAudio2.
			 */
			public function [CallingConvention(.Stdcall)] void(IXAudio2EngineCallback* self, HResult Error) OnCriticalError;
		}

		protected VTable* mVT;

		public VTable* VT
		{
			[Inline]
			get => mVT;
		}
		
		public void Init()
		{

		}
		
		public static mixin CreateCallbackWithVTable(bool scoped = false)
		{
			IXAudio2EngineCallback* callback = ?;
			if(scoped)
			{
				callback = scope:mixin .();
				callback.mVT = scope:mixin .();
			}
			else
			{
				callback = new .();
				callback.mVT = new .();
			}

			callback.Init();

			callback
		}

		public static mixin CreateCallbackWithVTable<T>(bool scoped = false) where T : IXAudio2EngineCallback
		{
			T* callback = ?;
			if(scoped)
			{
				callback = scope:mixin T();
				((IXAudio2EngineCallback*)callback).mVT = scope:mixin .();
			}
			else
			{
				callback = new T();
				((IXAudio2EngineCallback*)callback).mVT = new .();
			}

			callback.Init();

			callback
		}

		public static mixin DeleteCallbackAndVTable(IXAudio2EngineCallback* callback)
		{
			delete callback.mVT;
			delete callback;
		}
	}
}
