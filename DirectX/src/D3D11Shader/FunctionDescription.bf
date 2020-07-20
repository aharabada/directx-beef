using System;
using DirectX.D3DCompiler;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * Describes a function.
	 * D3D11_FUNCTION_DESC
	*/
	[CRepr]
	public struct FunctionDescription
	{
		/**
		 * Shader version.
		*/
		public uint32 Version;
		/**
		 * The name of the originator of the shader.
		*/
		public char8* Creator;
		/**
		 * Shader compilation/parse flags.
		*/
		public ShaderCompileFlags Flags;

		/**
		 * The number of shader-constant buffers.
		*/
		public uint32 ConstantBuffers;   
		/**
		 * The number of resource (textures and buffers) bound to a shader.
		*/         
		public uint32 BoundResources;         

		/**
		 * The number of intermediate-language instructions in the compiled shader.
		*/
		public uint32 InstructionCount;   
		/**
		 * The number of temporary registers in the compiled shader.
		*/        
		public uint32 TempRegisterCount;       
		/**
		 * Number of temporary arrays used.
		*/   
		public uint32 TempArrayCount;   
		/**
		 * Number of constant defines.
		*/          
		public uint32 DefCount;           
		/**
		 * Number of declarations (input + output).
		*/        
		public uint32 DclCount;                
		/**
		 * Number of non-categorized texture instructions.
		*/   
		public uint32 TextureNormalInstructions;  
		/**
		 * Number of texture load instructions.
		*/
		public uint32 TextureLoadInstructions;    
		/**
		 * Number of texture comparison instructions.
		*/
		public uint32 TextureCompInstructions;    
		/**
		 * Number of texture bias instructions.
		*/
		public uint32 TextureBiasInstructions;    
		/**
		 * Number of texture gradient instructions.
		*/
		public uint32 TextureGradientInstructions;
		/**
		 * Number of floating point arithmetic instructions used.
		*/
		public uint32 FloatInstructionCount;      
		/**
		 * Number of signed integer arithmetic instructions used.
		*/
		public uint32 IntInstructionCount;    
		/**
		 * Number of unsigned integer arithmetic instructions used.
		*/    
		public uint32 UintInstructionCount;    
		/**
		 * Number of static flow control instructions used.
		*/   
		public uint32 StaticFlowControlCount;   
		/**
		 * Number of dynamic flow control instructions used.
		*/  
		public uint32 DynamicFlowControlCount;    
		/**
		 * Number of macro instructions used.
		*/
		public uint32 MacroInstructionCount;      
		/**
		 * Number of array instructions used.
		*/
		public uint32 ArrayInstructionCount;
    	/**
		 * The number of mov instructions used by the function.
		*/
		public uint32 MovInstructionCount;
		/**
		 * The number of movc instructions used by the function.
		*/
		public uint32 MovcInstructionCount;
		/**
		 * The number of type conversion instructions used by the function.
		*/
		public uint32 ConversionInstructionCount;
		/**
		 * The number of bitwise arithmetic instructions used by the function.
		*/
		public uint32 BitwiseInstructionCount;
		/**
		 * A FeatureLevel-typed value that specifies the minimum Direct3D feature level target of the function byte code.
		*/
		public FeatureLevel MinFeatureLevel;
		/**
		 * A value that contains a combination of one or more shader requirements flags;
		 * each flag specifies a requirement of the shader.
		 * A default value of 0 means there are no requirements.
		 * For a list of values, see ID3D11ShaderReflection::GetRequiresFlags.
		*/
		public uint64 RequiredFeatureFlags; // Todo: flags: D3D_SHADER_REQUIRES_*
		/**
		 * The name of the function.
		*/
		public char8* Name;
		/**
		 * The number of logical parameters in the function signature, not including the return value.
		*/
		public int32 FunctionParameterCount;
		/**
		 * Indicates whether the function returns a value.
		 * TRUE indicates it returns a value; otherwise, FALSE (it is a subroutine).
		*/
		public BOOL HasReturn;
		/**
		 * Indicates whether there is a Direct3D 10Level9 vertex shader blob.
		 * TRUE indicates there is a 10Level9 vertex shader blob; otherwise, FALSE.
		*/
		public BOOL Has10Level9VertexShader;
		/**
		 * Indicates whether there is a Direct3D 10Level9 pixel shader blob.
		 * TRUE indicates there is a 10Level9 pixel shader blob; otherwise, FALSE.
		*/
		public BOOL Has10Level9PixelShader;
	}
}
