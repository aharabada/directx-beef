namespace DirectX.D3DCompiler
{
	/**
	 * Flags affecting the behavior of D3DDisassemble.
	*/
	public enum DisassembleFlags : uint32
	{
		/**
		 * No flags specified.
		*/
		None = 0,
		/**
		 * Enable the output of color codes.
		 * D3D_DISASM_ENABLE_COLOR_CODE
		*/
		EnableColorCode = 0x00000001,
		/**
		 * Enable the output of default values.
		 * D3D_DISASM_ENABLE_DEFAULT_VALUE_PRINTS
		*/
		DefaultValuePrints  = 0x00000002,
		/**
		 * Enable instruction numbering.
		 * D3D_DISASM_ENABLE_INSTRUCTION_NUMBERING
		*/
		EnableInstructionNumbering = 0x00000004,
		/**
		 * No effect.
		 * D3D_DISASM_ENABLE_INSTRUCTION_CYCLE
		*/
		EnableInstructionCycle = 0x00000008,
		/**
		 * Disable debug information.
		 * D3D_DISASM_DISABLE_DEBUG_INFO
		*/
		DisableDebugInfo = 0x00000010,
		/**
		 * Enable instruction offsets.
		 * D3D_DISASM_ENABLE_INSTRUCTION_OFFSET
		*/
		EnableInstructionOffset = 0x00000020,
		/**
		 * Disassemble instructions only.
		 * D3D_DISASM_INSTRUCTION_ONLY
		*/
		InstructionOnly = 0x00000040,
		/**
		 * Use hex symbols in disassemblies.
		 * D3D_DISASM_PRINT_HEX_LITERALS
		*/
		PrintHexLiterals = 0x00000080
	}
}
