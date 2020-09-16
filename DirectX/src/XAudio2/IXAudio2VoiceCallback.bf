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
			public function void(void* self, uint32 BytesRequired) OnVoiceProcessingPassStart;
			public function void(void* self) OnVoiceProcessingPassEnd;
			public function void(void* self) OnStreamEnd;
			public function void(void* self, void *pBufferContext) OnBufferStart;
			public function void(void* self, void *pBufferContext) OnBufferEnd;
			public function void(void* self, void *pBufferContext) OnLoopEnd;
			public function void(void* self, void *pBufferContext, HResult Error) OnVoiceError;
		}

		protected VTable* mVT;

		public VTable* VT
		{
			[Inline]
			get => mVT;
		}
		/*
		/**
		 * Called during each processing pass for each voice, just before XAudio2 reads data from the voice's buffer queue.
		 */
		public void OnVoiceProcessingPassStart(uint32 bytesRequired) mut
		{
			mVT.OnVoiceProcessingPassStart(&this, bytesRequired);
		}

		/**
		 * Called just after the processing pass for the voice ends.
		 */
		public void OnVoiceProcessingPassEnd() mut
		{
			mVT.OnVoiceProcessingPassEnd(&this);
		}

		/**
		 * Called when the voice has just finished playing a contiguous audio stream.
		 */
		public void OnStreamEnd() mut
		{
			mVT.OnStreamEnd(&this);
		}

		/**
		 * Called when the voice is about to start processing a new audio buffer.
		 * @param bufferContext Context pointer that was assigned to the pContext member of the XAUDIO2_BUFFER structure when the buffer was submitted.
		 */
		public void OnBufferStart(void* bufferContext) mut
		{
			mVT.OnBufferStart(&this, bufferContext);
		}

		/**
		 * Called when the voice finishes processing a buffer.
		 * @param bufferContext Context pointer assigned to the pContext member of the XAUDIO2_BUFFER structure when the buffer was submitted.
		 */
		public void OnBufferEnd(void* bufferContext) mut
		{
			mVT.OnBufferEnd(&this, bufferContext);
		}

		/**
		 * Called when the voice reaches the end position of a loop.
		 * @param bufferContext Context pointer that was assigned to the pContext member of the XAUDIO2_BUFFER structure when the buffer was submitted.
		 */
		public void OnLoopEnd(void* bufferContext) mut
		{
			mVT.OnLoopEnd(&this, bufferContext);
		}

		/**
		 * Called when a critical error occurs during voice processing.
		 * @param bufferContext Context pointer that was assigned to the pContext member of the XAUDIO2_BUFFER structure when the buffer was submitted.
		 * @param error The HRESULT code of the error encountered.
		 */
		public void OnVoiceError(void* bufferContext, HResult error) mut
		{
			mVT.OnVoiceError(&this, bufferContext, error);
		}
		*/
	}
}
