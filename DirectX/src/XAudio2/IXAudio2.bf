using System;
using DirectX.Common;
using DirectX.Windows;

namespace DirectX.XAudio2
{
	// Todo: callbacks and sendlists don't work
	[CRepr]
	public struct IXAudio2 : IUnknown, IComObject
	{
		public static new Guid IID => .(0x2B02E3CF,0x2E0B,0x4ec3,0xBE,0x45,0x1B,0x2A,0x3F,0xE7,0x21,0x0D);

		public struct VTable : IUnknown.VTable
		{
			public function HResult(IXAudio2* self, IXAudio2EngineCallback *pCallback) RegisterForCallbacks;
			public function void(IXAudio2* self, IXAudio2EngineCallback *pCallback) UnregisterForCallbacks;

			public function HResult(IXAudio2* self, IXAudio2SourceVoice **ppSourceVoice,
				WAVEFORMATEX *pSourceFormat, VoiceFlags Flags, float MaxFrequencyRatio,
				IXAudio2VoiceCallback *pCallback, VoiceSends *pSendList, EffectChain *pEffectChain) CreateSourceVoice;

			public function HResult(IXAudio2* self, IXAudio2SubmixVoice **ppSubmixVoice, uint32 InputChannels, uint32 InputSampleRate,
				VoiceFlags Flags, uint32 ProcessingStage, VoiceSends *pSendList, EffectChain *pEffectChain) CreateSubmixVoice;

			public function HResult(IXAudio2* self, IXAudio2MasteringVoice **ppMasteringVoice, uint32 InputChannels, uint32 InputSampleRate, uint32 Flags,
				LPCWSTR szDeviceId, EffectChain *pEffectChain, AudioStreamCategory StreamCategory) CreateMasteringVoice;

			public function HResult(IXAudio2* self) StartEngine;
			public function void(IXAudio2* self) StopEngine;
			public function HResult(IXAudio2* self, uint32 operationSet) CommitChanges;
			public function void(IXAudio2* self, PerformaceData *pPerfData) GetPerformanceData;
			public function void(IXAudio2* self, DebugConfiguration *pDebugConfiguration, void *pReserved) SetDebugConfiguration;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Adds an IXAudio2EngineCallback pointer to the XAudio2 engine callback list.
		 * @param callback IXAudio2EngineCallback pointer to add to the XAudio2 engine callback list.
		 * @returns Returns S_OK if successful, an error code otherwise. See XAudio2 Error Codes for descriptions of XAudio2 specific error codes.
		 * @remarks This method can be called multiple times, allowing different components or layers of the same application to manage their own engine callback implementations separately.
		 * 			It is invalid to call RegisterForCallbacks from within a callback (that is, IXAudio2EngineCallback or IXAudio2VoiceCallback).
		 *			If RegisterForCallbacks is called within a callback, it returns XAUDIO2_E_INVALID_CALL.
		 */
		public HResult RegisterForCallbacks(IXAudio2EngineCallback *callback) mut
		{
			return VT.RegisterForCallbacks(&this, callback);
		}

		/**
		 * Removes an IXAudio2EngineCallback pointer from the XAudio2 engine callback list.
		 * @param callback IXAudio2EngineCallback pointer to remove from the XAudio2 engine callback list.
		 *				   If the given pointer is present more than once in the list, only the first instance in the list will be removed.
		 * @remarks It is invalid to call UnregisterForCallbacks from within a callback (that is, IXAudio2EngineCallback or IXAudio2VoiceCallback).
		 */
		public void UnregisterForCallbacks(IXAudio2EngineCallback *callback) mut
		{
			VT.UnregisterForCallbacks(&this, callback);
		}

		/**
		 * Creates and configures a source voice.
		 * @param sourceVoice If successful, returns a pointer to the new IXAudio2SourceVoice object.
		 * @param sourceFormat Pointer to a WAVEFORMATEX-Structure
		 * @param flags Flags that specify the behavior of the source voice.
		 * @param maxFrequencyRatio Highest allowable frequency ratio that can be set on this voice. The value for this argument must be between XAudio2.MinFrequencyRatio and XAudio2.MaxFrequencyRatio. 
		 * @param callback Pointer to a client-provided callback interface, IXAudio2VoiceCallback.
		 * @param sendList Pointer to a list of VoiceSends structures that describe the set of destination voices for the source voice. If pSendList is NULL, the send list defaults to a single output to the first mastering voice created.
		 * @param effectChain Pointer to a list of EffectChain structures that describe an effect chain to use in the source voice.
		 * @returns S_OK if successful; otherwise, an error code.
		 */
		public HResult CreateSourceVoice(out IXAudio2SourceVoice *sourceVoice,
				WAVEFORMATEX *sourceFormat, VoiceFlags flags = .None, float maxFrequencyRatio = XAudio2.DefaultFrequencyRatio,
				IXAudio2VoiceCallback *callback = null, VoiceSends *sendList = null, EffectChain *effectChain = null) mut
		{
			sourceVoice = ?;
			return VT.CreateSourceVoice(&this, &sourceVoice, sourceFormat, flags, maxFrequencyRatio, callback, sendList, effectChain);
		}

		/**
		 * Creates and configures a submix voice.
		 * @param submixVoice On success, returns a pointer to the new IXAudio2SubmixVoice object.
		 * @param inputChannels Number of channels in the input audio data of the submix voice. InputChannels must be less than or equal to XAudio2.MaxAudioChannels.
		 * @param inputSampleRate Sample rate of the input audio data of submix voice. This rate must be a multiple of XAudio2.QuantumDenominator. InputSampleRate must be between XAudio2.MinSampleRate and XAudio2.MaxSampleRate.
		 * @param flags Flags that specify the behavior of the submix voice.
		 * @param processingStage An arbitrary number that specifies when this voice is processed with respect to other submix voices, if the XAudio2 engine is running other submix voices.
		 * @param sendList Pointer to a list of VoiceSends structures that describe the set of destination voices for the submix voice. If pSendList is NULL, the send list will default to a single output to the first mastering voice created.
		 * @param effectChain Pointer to a list of XAUDIO2_EFFECT_CHAIN structures that describe an effect chain to use in the submix voice.
		 * @returns Returns S_OK if successful; otherwise, an error code.
		 */
		public HResult CreateSubmixVoice(out IXAudio2SubmixVoice *submixVoice, uint32 inputChannels, uint32 inputSampleRate,
				VoiceFlags flags = .None, uint32 processingStage = 0, VoiceSends *sendList = null, EffectChain *effectChain = null) mut
		{
			submixVoice = ?;
			return VT.CreateSubmixVoice(&this, &submixVoice, inputChannels, inputSampleRate, flags, processingStage, sendList, effectChain);
		}

		/**
		 * Creates and configures a mastering voice.
		 * @param masteringVoice If successful, returns a pointer to the new IXAudio2MasteringVoice object.
		 * @param inputChannels Number of channels the mastering voice expects in its input audio. InputChannels must be less than or equal to XAudio2.MaxAudioChannels.
		 * @param inputSampleRate Sample rate of the input audio data of the mastering voice. This rate must be a multiple of XAudio2.QuantumDenominator. InputSampleRate must be between XAudio2.MinSampleRate and XAudio2.MaxSampleRate.
		 * @param flags Flags that specify the behavior of the mastering voice. Must be 0.
		 * @param szDeviceId Identifier of the device to receive the output audio. Specifying the default value of NULL causes XAudio2 to select the global default audio device.
		 * @param effectChain Pointer to an EffectChain structure that describes an effect chain to use in the mastering voice, or NULL to use no effects.
		 * @param streamCategory The audio stream category to use for this mastering voice.
		 * @returns S_OK if successful; otherwise, an error code. Returns ERROR_NOT_FOUND if no default audio device exists and NULL is passed in as the szDeviceId parameter.
		*/
		public HResult CreateMasteringVoice(out IXAudio2MasteringVoice *masteringVoice, uint32 inputChannels = XAudio2.DefaultChannels, uint32 inputSampleRate = XAudio2.DefaultSamplerate, uint32 flags = 0,
				LPCWSTR szDeviceId = null, EffectChain *pEffectChain = null, AudioStreamCategory streamCategory = .GameEffects) mut
		{
			masteringVoice = ?;
			return VT.CreateMasteringVoice(&this, &masteringVoice, inputChannels, inputSampleRate, flags, szDeviceId, pEffectChain, streamCategory);
		}

		/**
		 * Starts the audio processing thread.
		 * @returns Returns S_OK if successful, an error code otherwise. See XAudio2 Error Codes for descriptions of XAudio2 specific error codes.
		*/
		public HResult StartEngine() mut
		{
			return VT.StartEngine(&this);
		}

		/**
		 * Stops the audio processing thread.
		*/
		public void StopEngine() mut
		{
			VT.StopEngine(&this);
		}

		/**
		 * Atomically applies a set of operations that are tagged with a given identifier.
		 * @param operationSet Identifier of the set of operations to be applied. To commit all pending operations, pass CommitFlags.All.
		 * @returns S_OK if successful; returns an error code otherwise. See XAudio2 Error Codes for descriptions of XAudio2 specific error codes.
		 */
		public HResult CommitChanges(uint32 operationSet) mut
		{
			return VT.CommitChanges(&this, operationSet);
		}

		/**
		 * Returns current resource usage details, such as available memory or CPU usage.
		 * @param performaceData The performace data.
		 */
		public void GetPerformanceData(out PerformaceData performaceData) mut
		{
			performaceData = ?;
			VT.GetPerformanceData(&this, &performaceData);
		}

		/**
		 * Changes global debug logging options for XAudio2.
		 * @param debugConfig Reference to a DebugConfiguration structure that contains the new debug configuration.
		 */
		public void SetDebugConfiguration(ref DebugConfiguration debugConfig) mut
		{
			// Don't expose the pReserved parameter
			VT.SetDebugConfiguration(&this, &debugConfig, null);
		}
	}
}
