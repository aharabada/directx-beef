using System;
using DirectX.Common;

namespace DirectX.XAudio2
{
	/**
	 * IXAudio2Voice represents the base interface from which IXAudio2SourceVoice, IXAudio2SubmixVoice and IXAudio2MasteringVoice are derived.
	*/
	public struct IXAudio2Voice // Todo: rename to IVoice?
	{
		public struct VTable
		{
			public function void(IXAudio2Voice* self, VoiceDetails *pVoiceDetails)GetVoiceDetails;
			public function HResult(IXAudio2Voice* self, VoiceSends *pSendList)SetOutputVoices;
			public function HResult(IXAudio2Voice* self, EffectChain *pEffectChain)SetEffectChain;
			public function HResult(IXAudio2Voice* self, uint32 EffectIndex, uint32 OperationSet)EnableEffect;
			public function HResult(IXAudio2Voice* self, uint32 EffectIndex, uint32 OperationSet)DisableEffect;
			public function void(IXAudio2Voice* self, uint32 EffectIndex, BOOL *pEnabled)GetEffectState;
			public function HResult(IXAudio2Voice* self, uint32 EffectIndex, void *pParameters, uint32 ParametersByteSize, uint32 OperationSet)SetEffectParameters;
			public function HResult(IXAudio2Voice* self, uint32 EffectIndex, void *pParameters, uint32 ParametersByteSize)GetEffectParameters;
			public function HResult(IXAudio2Voice* self, FilterParameters *pParameters, uint32 OperationSet)SetFilterParameters;
			public function void(IXAudio2Voice* self, FilterParameters *pParameters)GetFilterParameters;
			public function HResult(IXAudio2Voice* self, IXAudio2Voice *pDestinationVoice, FilterParameters *pParameters, uint32 OperationSet)SetOutputFilterParameters;
			public function void(IXAudio2Voice* self, IXAudio2Voice *pDestinationVoice, FilterParameters *pParameters)GetOutputFilterParameters;
			public function HResult(IXAudio2Voice* self, float Volume, uint32 OperationSet)SetVolume;
			public function void(IXAudio2Voice* self, float *pVolume)GetVolume;
			public function HResult(IXAudio2Voice* self, uint32 channels, float *pVolumes, uint32 OperationSet)SetChannelVolumes;
			public function void(IXAudio2Voice* self, uint32 Channels, float *pVolumes)GetChannelVolumes;
			public function HResult(IXAudio2Voice* self, IXAudio2Voice *pDestinationVoice, uint32 SourceChannels, uint32 DestinationChannels, float *pLevelMatrix, uint32 OperationSet)SetOutputMatrix;
			public function void(IXAudio2Voice* self, IXAudio2Voice *pDestinationVoice, uint32 SourceChannels, uint32 DestinationChannels, float *pLevelMatrix)GetOutputMatrix;
			public function void(IXAudio2Voice* self)DestroyVoice;
		}

		protected VTable* mVT;

		public VTable* VT
		{
			[Inline]
			get => mVT;
		}

		/**
		 * Returns information about the creation flags, input channels, and sample rate of a voice.
		 * @param voiceDetails Structure containing information about the voice.
		 */
		public void GetVoiceDetails(out VoiceDetails voiceDetails) mut
		{
			voiceDetails = ?;
			VT.GetVoiceDetails(&this, &voiceDetails);
		}

		/**
		 * Designates a new set of submix or mastering voices to receive the output of the voice.
		 * @params sendList Array of SendDescriptor structure pointers to destination voices.
		 * 					If sendList is NULL, the voice will send its output to the current mastering voice.
		 * 					To set the voice to not send its output anywhere set the OutputCount member of VoiceSends to 0.
		 *					All of the voices in a send list must have the same input sample rate, see XAudio2 Sample Rate Conversions for additional information.
		 * @returns S_OK if successful, an error code otherwise.
		 */
		public HResult SetOutputVoices(VoiceSends* sendList) mut
		{
			return VT.SetOutputVoices(&this, sendList);
		}

		/**
		 * Replaces the effect chain of the voice.
		 * @param effectChain Pointer to an EffectChain structure that describes the new effect chain to use. If NULL is passed, the current effect chain is removed.
		 * @returns S_OK if successful; otherwise, an error code.
		 */
		public HResult SetEffectChain(EffectChain* effectChain) mut
		{
			return VT.SetEffectChain(&this, effectChain);
		}
		
		/**
		 *Enables the effect at a given position in the effect chain of the voice.
		 * @param effectIntex Zero-based index of an effect in the effect chain of the voice.
		 * @param operationSet Identifies this call as part of a deferred batch.
		 * @returns S_OK if successful; otherwise, an error code.
		 */
		public HResult EnableEffect(uint32 effectIndex, uint32 operationSet = XAudio2.CommitNow) mut
		{
			return VT.EnableEffect(&this, effectIndex, operationSet);
		}

		/**
		 * Disables the effect at a given position in the effect chain of the voice.
		 * @param effectIntex Zero-based index of an effect in the effect chain of the voice.
		 * @param operationSet Identifies this call as part of a deferred batch.
		 * @returns S_OK if successful; otherwise, an error code.
		 */
		public HResult DisableEffect(uint32 effectIndex, uint32 operationSet = XAudio2.CommitNow) mut
		{
			return VT.DisableEffect(&this, effectIndex, operationSet);
		}

		/**
		 * Returns the running state of the effect at a specified position in the effect chain of the voice.
		 * @param effectIndex Zero-based index of an effect in the effect chain of the voice.
		 * @param enabled Returns TRUE if the effect is enabled. If the effect is disabled, returns FALSE.
		 */
		public void GetEffectState(uint32 effectIndex, out BOOL enabled) mut
		{
			enabled = ?;
			VT.GetEffectState(&this, effectIndex, &enabled);
		}

		/**
		 * Sets parameters for a given effect in the voice's effect chain.
		 * @param effectIndex Zero-based index of an effect within the voice's effect chain.
		 * @param parameters Returns the current values of the effect-specific parameters.
		 * @param parametersByteSize Size of the parameters array in bytes.
		 * @param operationSet Identifies this call as part of a deferred batch.
		 * @returns S_OK if successful; otherwise, an error code.
		*/
		public HResult SetEffectParameters(uint32 effectIndex, void* parameters, uint32 parametersByteSize, uint32 operationSet = XAudio2.CommitNow) mut
		{
			return VT.SetEffectParameters(&this, effectIndex, parameters, parametersByteSize, operationSet);
		}

		/**
		 * Returns the current effect-specific parameters of a given effect in the voice's effect chain.
		 * @param effectIndex Zero-based index of an effect within the voice's effect chain.
		 * @param parameters Returns the current values of the effect-specific parameters.
		 * @param parametersByteSize Size, in bytes, of the pParameters array.
		 * @returns S_OK if successful, an error code otherwise.
		*/
		public HResult GetEffectParameters(uint32 effectIndex, void* parameters, uint32 parametersByteSize) mut
		{
			return VT.GetEffectParameters(&this, effectIndex, parameters, parametersByteSize);
		}

		/**
		 * Sets the voice's filter parameters.
		 * @param parameters Pointer to an FilterParameters structure containing the filter information.
		 * @param operationSet Identifies this call as part of a deferred batch.
		 * @returns S_OK if successful, an error code otherwise.
		*/
		public HResult SetFilterParameters(FilterParameters *parameters, uint32 operationSet = XAudio2.CommitNow) mut // Check of nullability
		{
			return VT.SetFilterParameters(&this, parameters, operationSet);
		}

		/**
		 * Gets the voice's filter parameters.
		 * @param parameters Reference to an FilterParameters structure containing the filter information.
		 */
		public void GetFilterParameters(out FilterParameters parameters) mut
		{
			parameters = ?;
			VT.GetFilterParameters(&this, &parameters);
		}

		/**
		 * Sets the filter parameters on one of this voice's sends.
		 * @param destinationVoice IXAudio2Voice pointer to the destination voice of the send whose filter parameters will be set.
		 * @param parameters Pointer to an FilterParameters structure containing the filter information.
		 * @param operationSet Identifies this call as part of a deferred batch.
		 */
		public HResult SetOutputFilterParameters(IXAudio2Voice* destinationVoice, FilterParameters *parameters, uint32 operationSet = XAudio2.CommitNow) mut // Check nullability (parameters)
		{
			return VT.SetOutputFilterParameters(&this, destinationVoice, parameters, operationSet);
		}

		/**
		 * Returns the filter parameters from one of this voice's sends.
		 * @param IXAudio2Voice pointer to the destination voice of the send whose filter parameters will be read.
		 * @param parameters Reference to an FilterParameters structure containing the filter information.
		 */
		public void GetOutputFilterParameters(IXAudio2Voice* destinationVoice, out FilterParameters parameters) mut
		{
			parameters = ?;
			VT.GetOutputFilterParameters(&this, destinationVoice, &parameters);
		}

		/**
		 * Sets the overall volume level for the voice.
		 * @param volume Overall volume level to use. See Remarks for more information on volume levels.
		 * @param operaionSet Identifies this call as part of a deferred batch.
		 * @returns S_OK if successful, an error code otherwise.
		 */
		public void SetVolume(float volume, uint32 operationSet = XAudio2.CommitNow) mut
		{
			VT.SetVolume(&this, volume, operationSet);
		}

		/**
		 * Gets the current overall volume level of the voice.
		 * @param volume Returns the current overall volume level of the voice.
		*/
		public void GetVolume(out float volume) mut
		{
			volume = ?;
			VT.GetVolume(&this, &volume);
		}

		/**
		 * Sets the volume levels for the voice, per channel.
		 * @param channels Number of channels in the voice.
		 * @param volumes Array containing the new volumes of each channel in the voice. The array must have channels elements.
		 * @param operationSet Identifies this call as part of a deferred batch.
		 * @returns S_OK if successful, an error code otherwise.
		 */
		public HResult SetChannelVolumes(uint32 channels, float* volumes, uint32 operationSet = XAudio2.CommitNow) mut
		{
			return VT.SetChannelVolumes(&this, channels, volumes, operationSet);
		}

		struct S<T> where T : const int
		{

		}

		/**
		 * Returns the volume levels for the voice, per channel.
		 * @param channels Confirms the channel count of the voice.
		 * @param volumes Returns the current volume level of each channel in the voice. The array must have at least Channels elements.
		*/
		public void GetChannelVolumes(uint32 channels, float* volumes) mut
		{
			VT.GetChannelVolumes(&this, channels, volumes);
		}
		
		/**
		 * Sets the volume level of each channel of the final output for the voice. These channels are mapped to the input channels of a specified destination voice.
		 * @param destinationVoice Pointer to a destination IXAudio2Voice for which to set volume levels.
		 * @param sourceChannels Confirms the output channel count of the voice. This is the number of channels that are produced by the last effect in the chain.
		 * @param destinationChannels Confirms the input channel count of the destination voice.
		 * @param levelMatrix Array of [sourceChannels × destinationChannels] volume levels sent to the destination voice.
		 * @param operationSet Identifies this call as part of a deferred batch.
		 * @returns Returns S_OK if successful, an error code otherwise.
		 */
		public void SetOutputMatrix(IXAudio2Voice *destinationVoice, uint32 sourceChannels, uint32 destinationChannels, float *levelMatrix, uint32 operationSet = XAudio2.CommitNow) mut
		{
			VT.SetOutputMatrix(&this, destinationVoice, sourceChannels, destinationChannels, levelMatrix, operationSet);
		}

		/**
		 * Gets the volume level of each channel of the final output for the voice. These channels are mapped to the input channels of a specified destination voice.
		 * @param destinationVoice Pointer specifying the destination IXAudio2Voice to retrieve the output matrix for.
		 * @param sourceChannels Confirms the output channel count of the voice. This is the number of channels that are produced by the last effect in the chain.
		 * @param destinationChannels Confirms the input channel count of the destination voice.
		 * @param levelMatrix Array of [sourceChannels × destinationChannels] volume levels sent to the destination voice.
		 */
		public void GetOutputMatrix(IXAudio2Voice *destinationVoice, uint32 sourceChannels, uint32 destinationChannels, float *levelMatrix) mut
		{
			VT.GetOutputMatrix(&this, destinationVoice, sourceChannels, destinationChannels, levelMatrix);
		}

		/**
		 * Destroys the voice. If necessary, stops the voice and removes it from the XAudio2 graph.
		 */
		public void DestroyVoid() mut
		{
			VT.DestroyVoice(&this);
		}
	}
}
