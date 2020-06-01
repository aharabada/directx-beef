namespace DirectX.D3D11
{
	// Todo: Implement queryable struct
	/**	Query types. */
	public enum Query : UINT
	{
		/**
		Determines whether or not the GPU is finished processing commands. When the GPU is finished processing commands ID3D11DeviceContext::GetData will return S_OK, and pData will point to a BOOL with a value of TRUE. When using this type of query, ID3D11DeviceContext::Begin is disabled.
		D3D11_QUERY_EVENT
		*/
		Event = 0,
		/**
		Get the number of samples that passed the depth and stencil tests in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData returns a UINT64. If a depth or stencil test is disabled, then each of those tests will be counted as a pass.
		D3D11_QUERY_OCCLUSION
		*/
		Occlusion = ( Event + 1 ),
		/**
		Get a timestamp value where ID3D11DeviceContext::GetData returns a UINT64.
		This kind of query is only useful if two timestamp queries are done in the middle of a D3D11_QUERY_TIMESTAMP_DISJOINT query.
		The difference of two timestamps can be used to determine how many ticks have elapsed, and the D3D11_QUERY_TIMESTAMP_DISJOINT
		query will determine if that difference is a reliable value and also has a value that shows how to convert the number of ticks into seconds.
		See D3D11_QUERY_DATA_TIMESTAMP_DISJOINT. When using this type of query, ID3D11DeviceContext::Begin is disabled.
		D3D11_QUERY_TIMESTAMP
		*/
		Timestamp = ( Occlusion + 1 ),
		/**
		Determines whether or not a D3D11_QUERY_TIMESTAMP is returning reliable values, and also gives the frequency of the processor enabling you to convert the number of elapsed ticks into seconds.
		ID3D11DeviceContext::GetData will return a D3D11_QUERY_DATA_TIMESTAMP_DISJOINT. This type of query should only be invoked once per frame or less.
		D3D11_QUERY_TIMESTAMP_DISJOINT
		*/
		TimestampDisjoint = ( Timestamp + 1 ),
		/**
		Get pipeline statistics, such as the number of pixel shader invocations in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData will return a D3D11_QUERY_DATA_PIPELINE_STATISTICS.
		D3D11_QUERY_PIPELINE_STATISTICS
		*/
		PipelineStatistics = ( TimestampDisjoint + 1 ),
		/**
		Similar to D3D11_QUERY_OCCLUSION, except ID3D11DeviceContext::GetData returns a BOOL indicating whether or not any samples passed the depth and stencil tests - TRUE meaning at least one passed, FALSE meaning none passed.
		D3D11_QUERY_OCCLUSION_PREDICATE
		*/
		OcclusionPredicate	= ( PipelineStatistics + 1 ),
		/**
		Get streaming output statistics, such as the number of primitives streamed out in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData will return a D3D11_QUERY_DATA_SO_STATISTICS structure.
		D3D11_QUERY_SO_STATISTICS
		*/
		StreamingOutputStatistics	= ( OcclusionPredicate + 1 ),
		/**
		Determines whether or not any of the streaming output buffers overflowed in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End.
		ID3D11DeviceContext::GetData returns a BOOL - TRUE meaning there was an overflow, FALSE meaning there was not an overflow.
		If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers.
		When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted.
		This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
		D3D11_QUERY_SO_OVERFLOW_PREDICATE	
		*/
		StreamingOutputOverflowPredicate = ( StreamingOutputStatistics + 1 ),
		/**
		Get streaming output statistics for stream 0,
		such as the number of primitives streamed out in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End.
		ID3D11DeviceContext::GetData will return a D3D11_QUERY_DATA_SO_STATISTICS structure.
		D3D11_QUERY_SO_STATISTICS_STREAM0
		*/
		StreamingOutputStatisticsStream0	= ( StreamingOutputOverflowPredicate + 1 ),
		/**
		Determines whether or not the stream 0 output buffers overflowed in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData returns a BOOL - TRUE meaning there was an overflow, FALSE meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
		D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM0
		*/
		StreamingOutputOverflowPredicateStream0	= ( StreamingOutputStatisticsStream0 + 1 ),
		/**
		Get streaming output statistics for stream 1, such as the number of primitives streamed out in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData will return a D3D11_QUERY_DATA_SO_STATISTICS structure.
		D3D11_QUERY_SO_STATISTICS_STREAM1
		*/
		StreamingOutputStatisticsStream1	= ( StreamingOutputOverflowPredicateStream0 + 1 ),
		/**
		Determines whether or not the stream 1 output buffers overflowed in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData returns a BOOL - TRUE meaning there was an overflow, FALSE meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
		D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM1
		*/
		StreamingOutputOverflowPredicateStream1 = ( StreamingOutputStatisticsStream1 + 1 ),
		/**
		Get streaming output statistics for stream 2, such as the number of primitives streamed out in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData will return a D3D11_QUERY_DATA_SO_STATISTICS structure.
		D3D11_QUERY_SO_STATISTICS_STREAM2
		*/
		StreamingOutputStatisticsStream2 = ( StreamingOutputOverflowPredicateStream1 + 1 ),
		/**
		Determines whether or not the stream 2 output buffers overflowed in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData returns a BOOL - TRUE meaning there was an overflow, FALSE meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
		D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM2
		*/
		StreamingOutputOverflowPredicateStream2 = ( StreamingOutputStatisticsStream2 + 1 ),
		/**
		Get streaming output statistics for stream 3, such as the number of primitives streamed out in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData will return a D3D11_QUERY_DATA_SO_STATISTICS structure.
		D3D11_QUERY_SO_STATISTICS_STREAM3
		*/
		StreamingOutputStatisticsStream3	= ( StreamingOutputOverflowPredicateStream2 + 1 ),
		/**
		Determines whether or not the stream 3 output buffers overflowed in between ID3D11DeviceContext::Begin and ID3D11DeviceContext::End. ID3D11DeviceContext::GetData returns a BOOL - TRUE meaning there was an overflow, FALSE meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
		D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM3
		*/
		StreamingOutputOverflowPredicateStream3	= ( StreamingOutputStatisticsStream3 + 1 ) 
	}
}
