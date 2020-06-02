using System;
using DirectX.Common;

namespace DirectX.D3D11.SDKLayers
{
	public struct ID3D11InfoQueue : IUnknown, IComObject
	{
		public static new Guid IID => .("6543dbb6-1b48-42f5-ab82-e97ec74326f6");
		
		public struct VTable : IUnknown.VTable
		{
			public function HResult(ID3D11InfoQueue* self, uint64 messageCountLimit)SetMessageCountLimit;
			public function void(ID3D11InfoQueue* self)ClearStoredMessages;
			public function HResult(ID3D11InfoQueue* self, uint64 messageIndex, Message* pMessage, /*SIZE_T*/uint32 *pMessageByteLength)GetMessage;
			public function uint64(ID3D11InfoQueue* self)GetNumMessagesAllowedByStorageFilter;
			public function uint64(ID3D11InfoQueue* self)GetNumMessagesDeniedByStorageFilter;
			public function uint64(ID3D11InfoQueue* self)GetNumStoredMessages;
			public function uint64(ID3D11InfoQueue* self)GetNumStoredMessagesAllowedByRetrievalFilter;
			public function uint64(ID3D11InfoQueue* self)GetNumMessagesDiscardedByMessageCountLimit;
			public function uint64(ID3D11InfoQueue* self)GetMessageCountLimit;
			public function HResult(ID3D11InfoQueue* self, InfoQueueFilter* pFilter)AddStorageFilterEntries;
			public function HResult(ID3D11InfoQueue* self, InfoQueueFilter* pFilter, /*SIZE_T*/uint32* pFilterByteLength)GetStorageFilter;
			public function void(ID3D11InfoQueue* self)ClearStorageFilter;
			public function HResult(ID3D11InfoQueue* self)PushEmptyStorageFilter;
			public function HResult(ID3D11InfoQueue* self)PushCopyOfStorageFilter;
			public function HResult(ID3D11InfoQueue* self, InfoQueueFilter* pFilter)PushStorageFilter;
			public function void(ID3D11InfoQueue* self)PopStorageFilter;
			public function uint32(ID3D11InfoQueue* self)GetStorageFilterStackSize;
			public function HResult(ID3D11InfoQueue* self, InfoQueueFilter* pFilter)AddRetrievalFilterEntries;
			public function HResult(ID3D11InfoQueue* self, InfoQueueFilter* pFilter, /*SIZE_T*/uint32* pFilterByteLength)GetRetrievalFilter;
			public function void(ID3D11InfoQueue* self)ClearRetrievalFilter;
			public function HResult(ID3D11InfoQueue* self)PushEmptyRetrievalFilter;
			public function HResult(ID3D11InfoQueue* self)PushCopyOfRetrievalFilter;
			public function HResult(ID3D11InfoQueue* self, InfoQueueFilter* pFilter) PushRetrievalFilter;
			public function void(ID3D11InfoQueue* self) PopRetrievalFilter;
			public function uint32(ID3D11InfoQueue* self) GetRetrievalFilterStackSize;
			public function HResult(ID3D11InfoQueue* self, MessageCategory category, MessageSeverity severity, MessageID id, /*LPCSTR*/char8* pDescription) AddMessage;
			public function HResult(ID3D11InfoQueue* self, MessageSeverity severity, /*LPCSTR*/char8* pDescription)AddApplicationMessage;
			public function HResult(ID3D11InfoQueue* self, MessageCategory category, bool bEnable)SetBreakOnCategory; 
			public function HResult(ID3D11InfoQueue* self, MessageSeverity severity, bool bEnable)SetBreakOnSeverity;
			public function HResult(ID3D11InfoQueue* self, MessageID id, bool bEnable)SetBreakOnID;
			public function bool(ID3D11InfoQueue* self, MessageCategory category)GetBreakOnCategory;
			public function bool(ID3D11InfoQueue* self, MessageSeverity severity)GetBreakOnSeverity;
			public function bool(ID3D11InfoQueue* self, MessageID id)GetBreakOnID;
			public function void(ID3D11InfoQueue* self, bool bMute)SetMuteDebugOutput;
			public function bool(ID3D11InfoQueue* self)GetMuteDebugOutput;
		}

		public new VTable* VT
		{
			[Inline]
			get
			{
				return (.)mVT;
			}
		}

		/**
		* Set the maximum number of messages that can be added to the message queue.
		* Remarks: When the number of messages in the message queue has reached the maximum limit, new messages coming in will push old messages out.
		@param Maximum number of messages that can be added to the message queue. -1 means no limit.
		@return This method returns one of the Direct3D 11 Return Codes.
		*/
		public HResult SetMessageCountLimit(uint64 messageCountLimit) mut
		{
			return VT.SetMessageCountLimit(&this, messageCountLimit);
		}

		/**
		* Clear all messages from the message queue.
		*/
		public void ClearStoredMessages() mut
		{
			VT.ClearStoredMessages(&this);
		}

		/**
		* Get a message from the message queue.
		@remarks This method does not remove any messages from the message queue.
				This method gets messages from the message queue after an optional retrieval filter has been applied.
				Applications should call this method twice to retrieve a message - first to obtain the size of the message and second to get the message. 
		@param messageIndex Index into message queue after an optional retrieval filter has been applied.
				This can be between 0 and the number of messages in the message queue that pass through the retrieval filter
				(which can be obtained with ID3D11InfoQueue.GetNumStoredMessagesAllowedByRetrievalFilter).
				0 is the message at the front of the message queue.
		@param message Returned message.
		@param messageByteLength Size of message in bytes, including the size of the message string that the message points to.
		@return This method returns one of the Direct3D 11 Return Codes.
		*/
		public HResult GetMessage(uint64 messageIndex, out Message message, out uint32 messageByteLength) mut
 		{
			 message = ?;
			 messageByteLength = ?;
			 // Todo: Message needs an constructor!
			 return VT.GetMessage(&this, messageIndex, &message, &messageByteLength);
		}

		/**
		* Set a message category to break on when a message with that category passes through the storage filter.
		@param category Message category to break on.
		@param enable Turns this breaking condition on or off (true for on, false for off).
		@return This method returns one of the Direct3D 11 Return Codes.
		*/
		public HResult SetBreakOnCategory(MessageCategory category, bool enable) mut
		{
			return VT.SetBreakOnCategory(&this, category, enable);
		}

		/**
		* Set a message severity level to break on when a message with that severity level passes through the storage filter.
		@param severity A MessageSeverity, which represents a message severity level to break on.
		@param enable Turns this breaking condition on or off (true for on, false for off).
		@return This method returns one of the Direct3D 11 Return Codes.
		*/
		public HResult SetBreakOnSeverity(MessageSeverity severity, bool enable) mut
		{
			return VT.SetBreakOnSeverity(&this, severity, enable);
		}

		/**
		* Set a message identifier to break on when a message with that identifier passes through the storage filter.
		@param id Message identifier to break on.
		@param enable Turns this breaking condition on or off (true for on, false for off).
		@return This method returns one of the Direct3D 11 Return Codes.
		*/
		public HResult SetBreakOnID(MessageID id, bool enable) mut
		{
			return VT.SetBreakOnID(&this, id, enable);
		}

		/**
		* Get a message category to break on when a message with that category passes through the storage filter.
		@param category Message category to break on.
		@return Whether this breaking condition is turned on or off (true for on, false for off).
		*/
		public bool GetBreakOnCategory(MessageCategory category) mut
		{
			return VT.GetBreakOnCategory(&this, category);
		}

		/**
		* Get a message severity level to break on when a message with that severity level passes through the storage filter.
		@param severity Message severity level to break on.
		@return Whether this breaking condition is turned on or off (true for on, false for off).
		*/
		public bool GetBreakOnSeverity(MessageSeverity severity) mut
		{
			return VT.GetBreakOnSeverity(&this, severity);
		}

		/**
		* Get a message identifier to break on when a message with that identifier passes through the storage filter.
		@param id Message identifier to break on.
		@return Whether this breaking condition is turned on or off (true for on, false for off).
		*/
		public bool GetBreakOnID(MessageID id) mut
		{
			return VT.GetBreakOnID(&this, id);
		}

		// Todo: Add functions and Documentation
	}
}
