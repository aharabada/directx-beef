using System;
using DirectX.Common;

namespace DirectX.XAudio2
{
	/**
	 * The IXAudio2VoiceCallback interface contains methods that notify the client when certain events happen in a given IXAudio2SourceVoice.
	 */
	[CRepr]
	public struct IXAudio2VoiceCallback
	{
		public struct VTable
		{
			/**
			 * Called during each processing pass for each voice, just before XAudio2 reads data from the voice's buffer queue.
			 */
			public function void(IXAudio2VoiceCallback* self, uint32 BytesRequired) OnVoiceProcessingPassStart;
			/**
			* Called just after the processing pass for the voice ends.
			*/
			public function void(IXAudio2VoiceCallback* self) OnVoiceProcessingPassEnd;
			/**
			* Called when the voice has just finished playing a contiguous audio stream.
			*/
			public function void(IXAudio2VoiceCallback* self) OnStreamEnd;
			/**
			* Called when the voice is about to start processing a new audio buffer.
			* @param bufferContext Context pointer that was assigned to the pContext member of the XAUDIO2_BUFFER structure when the buffer was submitted.
			*/
			public function void(IXAudio2VoiceCallback* self, void *pBufferContext) OnBufferStart;
			/**
			* Called when the voice finishes processing a buffer.
			* @param bufferContext Context pointer assigned to the pContext member of the XAUDIO2_BUFFER structure when the buffer was submitted.
			*/
			public function void(IXAudio2VoiceCallback* self, void *pBufferContext) OnBufferEnd;
			/**
			* Called when the voice reaches the end position of a loop.
			* @param bufferContext Context pointer that was assigned to the pContext member of the XAUDIO2_BUFFER structure when the buffer was submitted.
			*/
			public function void(IXAudio2VoiceCallback* self, void *pBufferContext) OnLoopEnd;
			/**
			* Called when a critical error occurs during voice processing.
			* @param bufferContext Context pointer that was assigned to the pContext member of the XAUDIO2_BUFFER structure when the buffer was submitted.
			* @param error The HRESULT code of the error encountered.
			*/
			public function void(IXAudio2VoiceCallback* self, void *pBufferContext, HResult Error) OnVoiceError;
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
			IXAudio2VoiceCallback* callback = ?;
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

		public static mixin CreateCallbackWithVTable<T>(bool scoped = false) where T : IXAudio2VoiceCallback
		{
			T* callback = ?;
			if(scoped)
			{
				callback = scope:mixin T();
				((IXAudio2VoiceCallback*)callback).mVT = scope:mixin .();
			}
			else
			{
				callback = new T();
				((IXAudio2VoiceCallback*)callback).mVT = new .();
			}

			callback.Init();

			callback
		}

		public static mixin DeleteCallbackAndVTable(IXAudio2VoiceCallback* callback)
		{
			delete callback.mVT;
			delete callback;
		}
	}
}
