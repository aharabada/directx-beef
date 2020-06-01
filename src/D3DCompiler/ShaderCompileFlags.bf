namespace DirectX.D3DCompiler
{
	/**
	The D3DCOMPILE constants specify how the compiler compiles the HLSL code.
	*/
	public enum ShaderCompileFlags : uint32
	{
		/**
		Directs the compiler to insert debug file/line/type/symbol information into the output code.
		D3DCOMPILE_DEBUG
		*/
		Debug = 1 << 0,
		/**
		Directs the compiler not to validate the generated code against known capabilities and constraints.
		We recommend that you use this constant only with shaders that have been successfully compiled in the past.
		DirectX always validates shaders before it sets them to a device.
		D3DCOMPILE_SKIP_VALIDATION
		*/
		SkipValidation = 1 << 1,
		/**
		Directs the compiler to skip optimization steps during code generation.
		We recommend that you set this constant for debug purposes only.
		D3DCOMPILE_SKIP_OPTIMIZATION
		*/
		SkipOptimization = 1 << 2,
		/**
		Directs the compiler to pack matrices in row-major order on input and output from the shader.
		*/
		PackMatrixRowMajor = 1 << 3,
		/**
		Directs the compiler to pack matrices in column-major order on input and output from the shader.
		This type of packing is generally more efficient because a series of dot-products can then perform vector-matrix multiplication.
		D3DCOMPILE_PACK_MATRIX_COLUMN_MAJOR
		*/
		PackMatrixColumnMajor = 1 << 4,
		/**
		Directs the compiler to perform all computations with partial precision.
		If you set this constant, the compiled code might run faster on some hardware.
		D3DCOMPILE_PARTIAL_PRECISION
		*/
		PartialPrecision = 1 << 5,
		/**
		Directs the compiler to compile a vertex shader for the next highest shader profile.
		This constant turns debugging on and optimizations off.
		D3DCOMPILE_FORCE_VS_SOFTWARE_NO_OPT
		*/
		ForceVsSoftwareNoOpt = 1 << 6,
		/**
		Directs the compiler to compile a pixel shader for the next highest shader profile.
		This constant also turns debugging on and optimizations off.
		D3DCOMPILE_FORCE_PS_SOFTWARE_NO_OPT
		*/
		ForcePsSoftwareNoOpt = 1 << 7,
		/**
		Directs the compiler to disable Preshaders.
		If you set this constant, the compiler does not pull out static expression for evaluation.
		D3DCOMPILE_NO_PRESHADER
		*/
		NoPreshader = 1 << 8,
		/**
		Directs the compiler to not use flow-control constructs where possible.
		D3DCOMPILE_AVOID_FLOW_CONTROL
		*/
		AvoidFlowControl = 1 << 9,
		/**
		Directs the compiler to use flow-control constructs where possible.
		D3DCOMPILE_PREFER_FLOW_CONTROL
		*/
		PreferFlowControl = 1 << 10,
		/**
		Forces strict compile, which might not allow for legacy syntax.
		By default, the compiler disables strictness on deprecated syntax.
		D3DCOMPILE_ENABLE_STRICTNESS
		*/
		EnableStrictness = 1 << 11,
		/**
		Directs the compiler to enable older shaders to compile to 5_0 targets.
		D3DCOMPILE_ENABLE_BACKWARDS_COMPATIBILITY
		*/
		EnableBackwardsCompatiblity = 1 << 12,
		/**
		Forces the IEEE strict compile.
		D3DCOMPILE_IEEE_STRICTNESS
		*/
		IeeeStrictness = 1 << 13,
		/**
		Directs the compiler to use the lowest optimization level.
		If you set this constant, the compiler might produce slower code but produces the code more quickly.
		Set this constant when you develop the shader iteratively.
		D3DCOMPILE_OPTIMIZATION_LEVEL0
		*/
		OptimizationLevel0 = 1 << 14,
		/**
		Directs the compiler to use the second lowest optimization level.
		D3DCOMPILE_OPTIMIZATION_LEVEL1
		*/
		OptimizationLevel1 = 0,
		/**
		Directs the compiler to use the second highest optimization level.
		D3DCOMPILE_OPTIMIZATION_LEVEL2
		*/
		OptimizationLevel2 = (1 << 14) | (1 << 15),
		/**
		Directs the compiler to use the highest optimization level.
		If you set this constant, the compiler produces the best possible code but might take significantly longer to do so.
		Set this constant for final builds of an application when performance is the most important factor.
		D3DCOMPILE_OPTIMIZATION_LEVEL3
		*/
		OptimizationLevel3 = 1 << 15,
		/**
		Directs the compiler to treat all warnings as errors when it compiles the shader code.
		We recommend that you use this constant for new shader code, so that you can resolve all warnings and lower the number of hard-to-find code defects
		D3DCOMPILE_WARNINGS_ARE_ERRORS
		*/
		WarningsAreErrors = 1 << 18,
		/**
		Directs the compiler to assume that unordered access views (UAVs) and shader resource views (SRVs) may alias for cs_5_0.
		D3DCOMPILE_RESOURCES_MAY_ALIAS
		*/
		ResourcesMayAlias = 1 << 19,
		/**
		Directs the compiler to enable unbounded descriptor tables.
		D3DCOMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES
		*/
		EnableUnboundedDescriptorTables = 1 << 20,
		/*
		Directs the compiler to ensure all resources are bound.
		D3DCOMPILE_ALL_RESOURCES_BOUND
		*/
		AllResourcesBound = 1 << 21,
		/**
		This enables a debug name to be generated based on source information.
		It requires D3DCOMPILE_DEBUG to be set, and is exclusive with
		D3DCOMPILE_DEBUG_NAME_FOR_BINARY.
		D3DCOMPILE_DEBUG_NAME_FOR_SOURCE
		*/
		DebugNameForSource = 1 << 22,
		/**
		This enables a debug name to be generated based on compiled information.
		It requires D3DCOMPILE_DEBUG to be set, and is exclusive with
		D3DCOMPILE_DEBUG_NAME_FOR_SOURCE.
		D3DCOMPILE_DEBUG_NAME_FOR_BINARY
		*/
		DebugNameForBinary
	}
}
