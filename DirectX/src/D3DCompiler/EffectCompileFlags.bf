namespace DirectX.D3DCompiler
{
	/**
	These flags are passed in when creating an effect, and affect
	either compilation behavior or runtime effect behavior.
	*/
	public enum EffectCompileFlags : uint32
	{
		/**
		No effect compile flags
		*/
		None = 0,
		/**
		Compile this .fx file to a child effect. Child effects have no
		initializers for any shared values as these are initialied in the
		master effect (pool).
		D3DCOMPILE_EFFECT_CHILD_EFFECT
		*/
		ChildEffect = 1 << 0,
		/**
		By default, performance mode is enabled.  Performance mode
		disallows mutable state objects by preventing non-literal
		expressions from appearing in state object definitions.
		Specifying this flag will disable the mode and allow for mutable
		state objects.
		D3DCOMPILE_EFFECT_ALLOW_SLOW_OPS
		*/
		AllowSlowOps = 1 << 1
	}
}
