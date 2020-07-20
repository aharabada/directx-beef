namespace DirectX.DXGI.DXGI1_2
{
	/**
	 * Identifies the granularity at which the graphics processing unit (GPU) can be preempted from performing its current graphics rendering task.
	*/
	public enum GraphicsPreemtionGranularity : uint32
	{
		/**
		 * Indicates the preemption granularity as a DMA buffer.
		 * DXGI_GRAPHICS_PREEMPTION_DMA_BUFFER_BOUNDARY
		*/
		DmaBufferBoundary = 0,
		/**
		 * Indicates the preemption granularity as a graphics primitive.
		 * A primitive is a section in a DMA buffer and can be a group of triangles.
		 * DXGI_GRAPHICS_PREEMPTION_PRIMITIVE_BOUNDARY
		*/
		PrimitiveBoundary = 1,
		/**
		 * Indicates the preemption granularity as a triangle.
		 * A triangle is a part of a primitive.
		 * DXGI_GRAPHICS_PREEMPTION_TRIANGLE_BOUNDARY
		*/
		TriangleBoundary = 2,
		/**
		 * Indicates the preemption granularity as a pixel.
		 * A pixel is a part of a triangle.
		 * DXGI_GRAPHICS_PREEMPTION_PIXEL_BOUNDARY
		*/
		PixelBoundary = 3,
		/**
		 * Indicates the preemption granularity as a graphics instruction.
		 * A graphics instruction operates on a pixel.
		 * DXGI_GRAPHICS_PREEMPTION_INSTRUCTION_BOUNDARY
		*/
		InstructionBoundardy = 4
	}
}
