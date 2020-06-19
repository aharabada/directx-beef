using System;
using DirectX.Common;
using DirectX.D3DCompiler;

namespace DirectX.D3D11Shader
{
	/**
	 * Describes a shader.
	 * D3D11_SHADER_DESC
	*/
	[CRepr]
	public struct ShaderDescription
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
		 * The number of parameters in the input signature.
		*/            
		public uint32 InputParameters;   
		/**
		 * The number of parameters in the output signature.
		*/         
		public uint32 OutputParameters;           
		
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
		 * Number of cut instructions used.
		*/
		public uint32 CutInstructionCount;        
		/**
		 * Number of emit instructions used.
		*/
		public uint32 EmitInstructionCount;       
		/**
		 * The PrimitiveTopology-typed value that represents the geometry shader output topology.
		*/
		public PrimitiveTopology GSOutputTopology;  
		/**
		 * Geometry shader maximum output vertex count.
		*/         
		public uint32 GSMaxOutputVertexCount;     
		/**
		 * The Primitive-typed value that represents the input primitive for a geometry shader or hull shader.
		*/
		public Primitive InputPrimitive;         
		/**
		 * Number of parameters in the patch-constant signature.
		*/    
		public uint32 PatchConstantParameters;    
		/**
		 * Number of geometry shader instances.
		*/
		public uint32 GSInstanceCount;      
		/**
		 * Number of control points in the hull shader and domain shader.
		*/     
		public uint32 ControlPoints;             
		/**
		 * The TessellatorOutputPrimitive-typed value that represents the tessellator output-primitive type.
		*/
		public TessellatorOutputPrimitive HSOutputPrimitive; 
		/**
		 * The TessellatorPartitioning-typed value that represents the tessellator partitioning mode.
		*/
		public TessellatorPartitioning HSPartitioning;  
		/**
		 * The TessellatorDomain-typed value that represents the tessellator domain.
		*/      
		public TessellatorDomain  TessellatorDomain;

		// instruction counts
		/**
		 * Number of barrier instructions in a compute shader.
		*/
		public uint32 BarrierInstructions;   
		/**
		 * Number of interlocked instructions in a compute shader.
		*/    
		public uint32 InterlockedInstructions; 
		/**
		 * Number of texture writes in a compute shader.
		*/  
		public uint32 TextureStoreInstructions;  
	}
}
