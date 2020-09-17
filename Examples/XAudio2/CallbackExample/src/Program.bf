using System;
using DirectX.Common;
using DirectX.Windows;
using DirectX.XAudio2;
using System.Threading;
using System.Diagnostics;

namespace CallbackExample
{
	/**
	 * A simple engine callback that demonstrates the use of IXAudio2EngineCallbacks.
	 *
	 * Prints the total number of finished processing passes every 100th pass.
	 */
	public struct MyEngineCallback : IXAudio2EngineCallback
	{
		private uint mProcessingPasses;

		public new void Init() mut
		{
			VT.OnProcessingPassStart = => OnProcessingPassStart;
			VT.OnProcessingPassEnd = => OnProcessingPassEnd;
			VT.OnCriticalError = => OnCriticalError;
		}

		private static void OnProcessingPassStart(IXAudio2EngineCallback* listener)
		{
			var self = (MyEngineCallback*)listener;
			self.OnProcessingPassStart();
		}

		private static void OnProcessingPassEnd(IXAudio2EngineCallback* listener)
		{
			var self = (MyEngineCallback*)listener;
			self.OnProcessingPassEnd();
		}

		private static void OnCriticalError(IXAudio2EngineCallback* self, HResult error)
		{
			Debug.WriteLine("Critial error occured: {}", error);
		}

		public void OnProcessingPassStart() mut
		{
			mProcessingPasses++;
		}
		
		public void OnProcessingPassEnd() mut
		{
			if((mProcessingPasses % 100) == 0)
			{
				Console.WriteLine("Processing pass {} ended.", mProcessingPasses);
			}
		}
	}
	
	/**
	 * A simple source voice callback that demonstrates the use of IXAudio2VoiceCallback.
	 *
	 * Prints when the voice starts or stops playing a buffer.
	 */
	public struct MyVoiceCallback : IXAudio2VoiceCallback
	{
		public new void Init()
		{
			VT.OnVoiceProcessingPassStart = => OnVoiceProcessingPassStart;
			VT.OnVoiceProcessingPassEnd = => OnVoiceProcessingPassEnd;
			VT.OnStreamEnd = => OnStreamEnd;
			VT.OnBufferStart = => OnBufferStart;
			VT.OnBufferEnd = => OnBufferEnd;
			VT.OnLoopEnd = => OnLoopEnd;
			VT.OnVoiceError = => OnVoiceError;
		}

		private static void OnVoiceProcessingPassStart(IXAudio2VoiceCallback* listener, uint32 bytesRequired) {}
		
		private static void OnVoiceProcessingPassEnd(IXAudio2VoiceCallback* listener) {}
		
		private static void OnStreamEnd(IXAudio2VoiceCallback* listener) {}
		
		private static void OnBufferStart(IXAudio2VoiceCallback* listener, void *pBufferContext)
		{
			Console.WriteLine("Start playing buffer.");
		}
		
		private static void OnBufferEnd(IXAudio2VoiceCallback* listener, void *pBufferContext)
		{
			Console.WriteLine("Stop playing buffer.");
		}
		
		private static void OnLoopEnd(IXAudio2VoiceCallback* listener, void *pBufferContext) {}
		
		private static void OnVoiceError(IXAudio2VoiceCallback* listener, void *pBufferContext, HResult error) {}
	}

	class Program
	{
		public static int Main(String[] args)
		{
			// Create an instance of the XAudio2 engine.
			IXAudio2* xAudio;
			HResult res = XAudio2.Create(out xAudio);

			if(res.Failed)
			{
				Debug.WriteLine("Failed to create XAudio2-instance: {}", res);
				Runtime.FatalError();
			}

			// Create the engine callback, its vTable and call its Init-function.
			var engineCallback = MyEngineCallback.CreateCallbackWithVTable!<MyEngineCallback>();

			// Register the engine callback
			res = xAudio.RegisterForCallbacks(engineCallback);

			// Create the voice callback, its vTable and call its Init-function.
			var voiceCallback = MyVoiceCallback.CreateCallbackWithVTable!<MyVoiceCallback>();
			
			if(res.Failed)
			{
				Debug.WriteLine("Failed to register engine callback: {}", res);
				Runtime.FatalError();
			}

			// Create a mastering voice.
			IXAudio2MasteringVoice* masterVoice;
			res = xAudio.CreateMasteringVoice(out masterVoice);

			if(res.Failed)
			{
				Debug.WriteLine("Failed to create mastering voice: {}", res);
				Runtime.FatalError();
			}

#if DEBUG
			// Create a config that prints all messages and break on warnings and errors
			DebugConfiguration debugConfig = .(TraceMask.All, BreakMask.All);
			xAudio.SetDebugConfiguration(ref debugConfig);
#else
			// Create a config that prints all messages and break on warnings and errors
			DebugConfiguration debugConfig = .(TraceMask.Info | TraceMask.Warnings | TraceMask.Errors, BreakMask.Errors);
			xAudio.SetDebugConfiguration(ref debugConfig);
#endif

			// Declare WAVEFORMATEXTENSIBLE and XAUDIO2_BUFFER structures.
			WAVEFORMATEXTENSIBLE wfx = .();
			XAudio2Buffer buffer = .();

			// Open the audio file with CreateFile.
			char16* strFileName = "content\\testSound.wav".ToScopedNativeWChar!();

			Windows.FileHandle hFile = Windows.CreateFileW(
				strFileName,
				Windows.GENERIC_READ,
				.Read,
				null,
				.Open,
				0,
				0);

			if(hFile == Windows.Handle.InvalidHandle)
			{
				Debug.WriteLine("Failed to open File: {}", HResult.FromWin32(Kernel32.GetLastError()));
				Runtime.FatalError();
			}

			if((Windows.Handle)Windows.SetFilePointer( hFile, 0, null, Windows.FILE_BEGIN ) == .InvalidHandle)
			{
				Debug.WriteLine("Failed to set file pointer: {}", HResult.FromWin32(Kernel32.GetLastError()));
				Runtime.FatalError();
			}

			// Locate the 'RIFF' chunk in the audio file, and check the file type.
			DWORD dwChunkSize = 0;
			DWORD dwChunkPosition = 0;
			//check the file type, should be fourccWAVE or 'XWMA'
			WavHelper.FindChunk(hFile,WavHelper.fourccRIFF, ref dwChunkSize, ref dwChunkPosition );
			DWORD filetype = ?;
			WavHelper.ReadChunkData(hFile,&filetype,sizeof(DWORD),dwChunkPosition);
			if (filetype != WavHelper.fourccWAVE)
			{
				Runtime.FatalError("The RIFF-data is not wave data.");
			}

			// Locate the 'fmt ' chunk, and copy its contents into a WAVEFORMATEXTENSIBLE structure.
			WavHelper.FindChunk(hFile,WavHelper.fourccFMT, ref dwChunkSize, ref dwChunkPosition );
			WavHelper.ReadChunkData(hFile, &wfx, dwChunkSize, dwChunkPosition );

			// Locate the 'data' chunk, and read its contents into a buffer.
			//fill out the audio data buffer with the contents of the fourccDATA chunk
			WavHelper.FindChunk(hFile,WavHelper.fourccDATA, ref dwChunkSize, ref dwChunkPosition );

			let dataBuffer = new:ScopedAlloc! uint8[dwChunkSize]*;
			uint8* pDataBuffer = dataBuffer;
			WavHelper.ReadChunkData(hFile, pDataBuffer, dwChunkSize, dwChunkPosition);
			
			// Populate an XAUDIO2_BUFFER structure.
			buffer.AudioBytes = dwChunkSize;  //size of the audio buffer in bytes
			buffer.pAudioData = pDataBuffer;  //buffer containing audio data
			buffer.Flags = .EndOfStream; // tell the source voice not to expect any data after this buffer

			//Create a source voice by calling the IXAudio2::CreateSourceVoice method on an instance of the XAudio2 engine.
			IXAudio2SourceVoice* sourceVoice;
			res = xAudio.CreateSourceVoice(out sourceVoice, (WAVEFORMATEX*)&wfx, .None, XAudio2.DefaultFrequencyRatio, voiceCallback);

			if(res.Failed)
			{
				Debug.WriteLine("Failed to create source voice: {}", res);
				Runtime.FatalError();
			}
			
			// Submit an XAUDIO2_BUFFER to the source voice using the function SubmitSourceBuffer.
			res = sourceVoice.SubmitSourceBuffer(ref buffer);

			if(res.Failed)
			{
				Debug.WriteLine("Failed to submit source buffer: {}", res);
				Runtime.FatalError();
			}
			
			// Use the Start function to start the source voice.
			res = sourceVoice.Start();
			
			if(res.Failed)
			{
				Debug.WriteLine("Failed to start voice: {}", res);
				Runtime.FatalError();
			}
			
			//Thread.Sleep(5000);

			Console.WriteLine("Press enter to deinitialize the engine...");
			Console.ReadLine(scope .());

			// Unregister the engine callback
			xAudio.UnregisterForCallbacks(engineCallback);
			// Deletes the engine callback and its vTable
			MyEngineCallback.DeleteCallbackAndVTable!(engineCallback);

			// Deletes the voice callback and its vTable
			MyVoiceCallback.DeleteCallbackAndVTable!(voiceCallback);

			xAudio.Release();


			return 0;
		}
	}
}