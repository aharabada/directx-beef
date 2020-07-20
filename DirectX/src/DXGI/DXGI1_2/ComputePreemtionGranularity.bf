namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * Identifies the granularity at which the graphics processing unit (GPU) can be preempted from performing its current compute task.
	*/
	public enum ComputePreemtionGranularity : uint32
	{
		/**
		 * Indicates the preemption granularity as a compute packet.
		 * DXGI_COMPUTE_PREEMPTION_DMA_BUFFER_BOUNDARY
		*/
		DmaBufferBoundary = 0,
		/**
		 * Indicates the preemption granularity as a dispatch (for example, a call to the ID3D11DeviceContext::Dispatch method).
		 * A dispatch is a part of a compute packet.
		 * DXGI_COMPUTE_PREEMPTION_DISPATCH_BOUNDARY
		*/
		DispatchBoundardy = 1,
		/**
		 * Indicates the preemption granularity as a thread group.
		 * A thread group is a part of a dispatch.
		 * DXGI_COMPUTE_PREEMPTION_THREAD_GROUP_BOUNDARY
		*/
		ThreadGroupBoundary = 2,
		/**
		 * Indicates the preemption granularity as a thread in a thread group.
		 * A thread is a part of a thread group.
		 * DXGI_COMPUTE_PREEMPTION_THREAD_BOUNDARY
		*/
		ThreadBoundary = 3,
		/**
		 * Indicates the preemption granularity as a compute instruction in a thread.
		 * DXGI_COMPUTE_PREEMPTION_INSTRUCTION_BOUNDARY
		*/
		InstructionBoundary = 4
	}
}
