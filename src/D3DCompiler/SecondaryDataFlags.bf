namespace DirectX.D3DCompiler
{
	public enum SecondaryDataFlags : uint32
	{
		/**
		 * No flags specified.
		*/
		None = 0,
		/**
		 * Merge unordered access view (UAV) slots in the secondary data that the pSecondaryData parameter points to.
		 * D3DCOMPILE_SECDATA_MERGE_UAV_SLOTS
		*/
		MergeUavSlots = 0x00000001,
		/**
		 * Preserve template slots in the secondary data that the pSecondaryData parameter points to.
		 * D3DCOMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS
		*/
		PreserveTemplateSlots = 0x00000002,
		/**
		 * Require that templates in the secondary data that the pSecondaryData parameter points to match when the compiler compiles the HLSL code.
		 * D3DCOMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH 
		*/
		RequireTemplateMatch = 0x00000004,
	}
}
