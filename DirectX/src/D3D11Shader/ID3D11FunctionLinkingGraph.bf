using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * A function-linking-graph interface is used for constructing shaders that consist of a sequence of precompiled function calls that pass values to each other. 
	*/
	public struct ID3D11FunctionLinkingGraph : IUnknown, IComObject
	{
		public static new Guid IID => .(0x54133220, 0x1ce8, 0x43d3, 0x82, 0x36, 0x98, 0x55, 0xc5, 0xce, 0xec, 0xff);

		public struct VTable : IUnknown.VTable
		{
			public function HResult(ID3D11FunctionLinkingGraph* self, ID3D11ModuleInstance** ppModuleInstance, ID3DBlob** ppErrorBuffer) CreateModuleInstance;

			public function HResult(ID3D11FunctionLinkingGraph* self, ParameterDescription* pInputParameters, uint32 inputParameterCount, ID3D11LinkingNode** ppInputNode) SetInputSignature;

			public function HResult(ID3D11FunctionLinkingGraph* self, ParameterDescription* poutputParameters, uint32 outputParameterCount, ID3D11LinkingNode** ppOutputNode) SetOutputSignature;

			public function HResult(ID3D11FunctionLinkingGraph* self, char8* pModuleInstanceNamespace, ID3D11Module* pModuleWithFunctionPrototype, char8* pFunctionName, ID3D11LinkingNode** ppCallNode) CallFunction;

			public function HResult(ID3D11FunctionLinkingGraph* self, ID3D11LinkingNode* srcNode, int32 srcParameterIndex, ID3D11LinkingNode* dstNode, int32 dstParameterIndex) PassValue;

			public function HResult(ID3D11FunctionLinkingGraph* self, ID3D11LinkingNode* srcNode, int32 srcParameterIndex, ID3D11LinkingNode* dstNode, int32 dstParameterIndex, char8* dstSwizzle) PassValueWithSwizzle;

			public function HResult(ID3D11FunctionLinkingGraph* self, ID3DBlob** ppErrorBuffer) GetLastError;

			public function HResult(ID3D11FunctionLinkingGraph* self, uint32 flags, ID3DBlob** ppBuffer) GenerateHlsl;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Creates a call-function linking node to use in the function-linking-graph.
		 *
		 * @param moduleInstanceNamespace		The optional namespace for the function, or NULL if no namespace is needed.
		 * @param moduleWithFunctionPrototype	A pointer to the ID3D11ModuleInstance interface for the library module that contains the function prototype.
		 * @param functionName					The name of the function.
		 * @param callNode						A pointer to a variable that receives a pointer to the ID3D11LinkingNode interface that represents the function in the function-linking-graph.
		*/
		public HResult CallFunction(char8* moduleInstanceNamespace, ID3D11Module* moduleWithFunctionPrototype, char8* functionName, ID3D11LinkingNode** callNode) mut
		{
			return VT.CallFunction(&this, moduleInstanceNamespace, moduleWithFunctionPrototype, functionName, callNode);
		}

		/**
		 * Initializes a shader module from the function-linking-graph object.
		 *
		 * @param moduleInstance	The address of a pointer to an ID3D11ModuleInstance interface for the shader module to initialize.
		 * @param errorBuffer		An optional pointer to a variable that receives a pointer to the ID3DBlob interface that you can use to access compiler error messages, or NULL if there are no errors.
		*/
		public HResult CreateModuleInstance(ID3D11ModuleInstance** moduleInstance, ID3DBlob** errorBuffer) mut
		{
			return VT.CreateModuleInstance(&this, moduleInstance, errorBuffer);
		}

		/**
		 * Generates Microsoft High Level Shader Language (HLSL) shader code that represents the function-linking-graph.
		 *
		 * @param flags		Reserved
		 * @param buffer	An pointer to a variable that receives a pointer to the ID3DBlob interface that you can use to access the HLSL shader source code that represents the function-linking-graph.
		 *					You can compile this HLSL code, but first you must add code or include statements for the functions called in the function-linking-graph.
		*/
		public HResult GenerateHlsl(uint32 flags, ID3DBlob** buffer) mut
		{
			return VT.GenerateHlsl(&this, flags, buffer);
		}

		/**
		 * Gets the error from the last function call of the function-linking-graph.
		 *
		 * @param errorBuffer	errorBuffer
		*/
		public HResult GetLastError(ID3DBlob **errorBuffer) mut
		{
			return VT.GetLastError(&this, errorBuffer);
		}

		/**
		 * Passes a value from a source linking node to a destination linking node.
		 *
		 * @param srcNode			A pointer to the ID3D11LinkingNode interface for the source linking node.
		 * @param srcParameterIndex	The zero-based index of the source parameter.
		 * @param dstNode			A pointer to the ID3D11LinkingNode interface for the destination linking node.
		 * @param dstParameterIndex	The zero-based index of the destination parameter.
		*/
		public HResult PassValue(ID3D11LinkingNode* srcNode, int32 srcParameterIndex, ID3D11LinkingNode* dstNode, int32 dstParameterIndex) mut
		{
			return VT.PassValue(&this, srcNode, srcParameterIndex, dstNode, dstParameterIndex);
		}

		/**
		 * Passes a value with swizzle from a source linking node to a destination linking node.
		 *
		 * @param srcNode			A pointer to the ID3D11LinkingNode interface for the source linking node.
		 * @param srcParameterIndex	The zero-based index of the source parameter.
		 * @param dstNode			A pointer to the ID3D11LinkingNode interface for the destination linking node.
		 * @param dstParameterIndex	The zero-based index of the destination parameter.
		 * @param dstSwizzle		The name of the destination swizzle.
		*/
		public HResult PassValueWithSwizzle(ID3D11LinkingNode *srcNode, int32 srcParameterIndex, char8* srcSwizzle,
			ID3D11LinkingNode* dstNode, int32 dstParameterIndex, char8* dstSwizzle) mut
		{
			return VT.PassValueWithSwizzle(&this, srcNode, srcParameterIndex, dstNode, dstParameterIndex, dstSwizzle);
		}

		/**
		 * Sets the input signature of the function-linking-graph.
		 *
		 * @param inputParameters		An array of ParameterDescription structures for the parameters of the input signature.
		 * @param inputParameterCount	The number of input parameters in the pInputParameters array.
		 * @param inputNode				A pointer to a variable that receives a pointer to the ID3D11LinkingNode interface that represents the input signature of the function-linking-graph.
		*/
		public HResult SetInputSignature(ParameterDescription* inputParameters, uint32 inputParameterCount, ID3D11LinkingNode** inputNode) mut
		{
			return VT.SetInputSignature(&this, inputParameters, inputParameterCount, inputNode);
		}

		/**
		 * Sets the output signature of the function-linking-graph.
		 *
		 * @param outputParameters		An array of ParameterDescription structures for the parameters of the output signature.
		 * @param outputParameterCount	The number of output parameters in the pOutputParameters array.
		 * @param outputNode			A pointer to a variable that receives a pointer to the ID3D11LinkingNode interface that represents the output signature of the function-linking-graph.
		*/
		public HResult SetOutputSignature(ParameterDescription* outputParameters, uint32 outputParameterCount, ID3D11LinkingNode** outputNode) mut
		{
			return VT.SetOutputSignature(&this, outputParameters, outputParameterCount, outputNode);
		}
	}
}

