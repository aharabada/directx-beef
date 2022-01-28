using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * A shader-reflection interface accesses shader information.
	*/
	public struct ID3D11ShaderReflection : IUnknown, IComObject
	{
		public static new Guid IID => .(0x8d536ca1, 0x0cca, 0x4956, 0xa8, 0x37, 0x78, 0x69, 0x63, 0x75, 0x55, 0x84);

		public struct VTable : IUnknown.VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflection* self, ShaderDescription *pDesc) GetDesc;

			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionConstantBuffer*(ID3D11ShaderReflection* self, uint32 index) GetConstantBufferByIndex;
			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionConstantBuffer*(ID3D11ShaderReflection* self, char8* name) GetConstantBufferByName;

			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflection* self, uint32 resourceIndex, ShaderInputBindDescription *pDesc) GetResourceBindingDesc;

			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflection* self, uint32 parameterIndex, SignatureParameterDescription *pDesc) GetInputParameterDesc;
			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflection* self, uint32 parameterIndex, SignatureParameterDescription *pDesc) GetOutputParameterDesc;
			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflection* self, uint32 parameterIndex, SignatureParameterDescription *pDesc) GetPatchConstantParameterDesc;

			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionVariable*(ID3D11ShaderReflection* self, char8* name) GetVariableByName;

			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflection* self, char8* name, ShaderInputBindDescription *pDesc) GetResourceBindingDescByName;

			public function [CallingConvention(.Stdcall)] uint32(ID3D11ShaderReflection* self) GetMovInstructionCount;
			public function [CallingConvention(.Stdcall)] uint32(ID3D11ShaderReflection* self) GetMovcInstructionCount;
			public function [CallingConvention(.Stdcall)] uint32(ID3D11ShaderReflection* self) GetConversionInstructionCount;
			public function [CallingConvention(.Stdcall)] uint32(ID3D11ShaderReflection* self) GetBitwiseInstructionCount;

			public function [CallingConvention(.Stdcall)] Primitive(ID3D11ShaderReflection* self) GetGSInputPrimitive;
			public function [CallingConvention(.Stdcall)] BOOL(ID3D11ShaderReflection* self) IsSampleFrequencyShader;

			public function [CallingConvention(.Stdcall)] uint32(ID3D11ShaderReflection* self) GetNumInterfaceSlots;
			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflection* self, FeatureLevel* pLevel) GetMinFeatureLevel;

			public function [CallingConvention(.Stdcall)] uint32(ID3D11ShaderReflection* self, uint32* pSizeX, uint32* pSizeY, uint32* pSizeZ) GetThreadGroupSize;

			public function [CallingConvention(.Stdcall)] uint64(ID3D11ShaderReflection* self) GetRequiresFlags;
		}

		public new VTable* VT
		{
			[Inline]
			get => (.)mVT;
		}

		/**
		 * Gets the number of bitwise instructions.
		 *
		 * @return The number of bitwise instructions.
		*/
		public uint32 GetBitwiseInstructionCount() mut
		{
			return VT.GetBitwiseInstructionCount(&this);
		}

		/**
		 * Get a constant buffer by index.
		 *
		 * @param index	Zero-based index.
		 * @return A pointer to a constant buffer.
		*/
		public ID3D11ShaderReflectionConstantBuffer* GetConstantBufferByIndex(uint32 index) mut
		{
			return VT.GetConstantBufferByIndex(&this, index);
		}
		
		/**
		 * Get a constant buffer by name.
		 *
		 * @param name	The constant-buffer name.
		 * @return A pointer to a constant buffer.
		*/
		public ID3D11ShaderReflectionConstantBuffer* GetConstantBufferByName(char8* name) mut
		{
			return VT.GetConstantBufferByName(&this, name);
		}

		/**
		 * Gets the number of conversion instructions.
		 *
		 * @return Returns the number of conversion instructions.
		*/
		public uint32 GetConversionInstructionCount() mut
		{
			return VT.GetConversionInstructionCount(&this);
		}

		/**
		 * Get a shader description.
		 * @param desc	A reference to a shader description.
		*/
		public HResult GetDescription(out ShaderDescription desc) mut
		{
			desc = ?;
			return VT.GetDesc(&this, &desc);
		}

		/**
		 * Gets the geometry-shader input-primitive description.
		 *
		 * @return The input-primitive description.
		*/
		public Primitive GetGSInputPrimitive() mut
		{
			return VT.GetGSInputPrimitive(&this);
		}

		/**
		 * Get an input-parameter description for a shader.
		 *
		 * @param parameterIndex	A zero-based parameter index.
		 * @param desc				A reference to a shader-input-signature description.
		*/
		public HResult GetInputParameterDescription(uint32 parameterIndex, out SignatureParameterDescription desc) mut
		{
			desc = ?;
			return VT.GetInputParameterDesc(&this, parameterIndex, &desc);
		}

		/**
		 * Gets the minimum feature level.
		 *
		 * @param featureLevel	A reference to one of the enumerated values in FeatureLevel, which represents the minimum feature level.
		*/
		public HResult GetMinFeatureLevel(out FeatureLevel featureLevel) mut
		{
			featureLevel = ?;
			return VT.GetMinFeatureLevel(&this, &featureLevel);
		}
		
		/**
		 * Gets the number of Movc instructions.
		 *
		 * @return Returns the number of Movc instructions.
		*/
		public uint32 GetMovcInstructionCount() mut
		{
			return VT.GetMovcInstructionCount(&this);
		}

		/**
		 * Gets the number of Mov instructions.
		 *
		 * @return Returns the number of Mov instructions.
		*/
		public uint32 GetMovInstructionCount() mut
		{
			return VT.GetMovInstructionCount(&this);
		}

		/**
		 * Gets the number of interface slots in a shader.
		 *
		 * @return The number of interface slots in the shader.
		*/
		public uint32 GetNumInterfaceSlots() mut
		{
			return VT.GetNumInterfaceSlots(&this);
		}

		/**
		 * Get an output-parameter description for a shader.
		 *
		 * @param parameterIndex	A zero-based parameter index.
		 * @param desc				A pointer to a shader-output-parameter description.
		*/
		public HResult GetOutputParameterDescription(uint32 parameterIndex, out SignatureParameterDescription desc) mut
		{
			desc = ?;
			return VT.GetOutputParameterDesc(&this, parameterIndex, &desc);
		}

		/**
		 * Get a patch-constant parameter description for a shader.
		 *
		 * @param parameterIndex	A zero-based parameter index.
		 * @param desc				A reference to a shader-input-signature description.
		*/
		public HResult GetPatchConstantParameterDescription(uint32 parameterIndex, out SignatureParameterDescription desc) mut
		{
			desc = ?;
			return VT.GetPatchConstantParameterDesc(&this, parameterIndex, &desc);
		}

		/**
		 * Get a description of how a resource is bound to a shader.
		 *
		 * @param resourceIndex	A zero-based resource index.
		 * @param desc			A reference to an input-binding description.
		*/
		public HResult GetResourceBindingDescription(uint32 resourceIndex, out ShaderInputBindDescription desc) mut
		{
			desc = ?;
			return VT.GetResourceBindingDesc(&this, resourceIndex, &desc);
		}

		/**
		 * Get a description of how a resource is bound to a shader.
		 *
		 * @param name	The constant-buffer name of the resource.
		 * @param desc	A reference to an input-binding description.
		*/
		public HResult GetResourceBindingDescriptionByName(char8* name, out ShaderInputBindDescription desc) mut
		{
			desc = ?;
			return VT.GetResourceBindingDescByName(&this, name, &desc);
		}

		/**
		 * Retrieves the sizes, in units of threads, of the X, Y, and Z dimensions of the shader's thread-group grid.
		 *
		 * @param sizeX	A pointer to the size, in threads, of the x-dimension of the thread-group grid.
		 *				The maximum size is 1024.
		 * @param sizeY	A pointer to the size, in threads, of the y-dimension of the thread-group grid.
		 *				The maximum size is 1024.
		 * @param sizeZ	A pointer to the size, in threads, of the z-dimension of the thread-group grid.
		 *				The maximum size is 64.
		 * @return	Returns the total size, in threads, of the thread-group grid by calculating the product of the size of each dimension.
		*/
		public uint32 GetThreadGroupSize(uint32* sizeX = null, uint32* sizeY = null, uint32* sizeZ = null) mut
		{
			return VT.GetThreadGroupSize(&this, sizeX, sizeY, sizeZ);
		}

		/**
		 * Gets a variable by name.
		 *
		 * @param name	A pointer to a string containing the variable name.
		 * return Returns a ID3D11ShaderReflectionVariable Interface interface.
		*/
		public ID3D11ShaderReflectionVariable* GetVariableByName(char8* name) mut
		{
			return VT.GetVariableByName(&this, name);
		}

		/**
		 * Indicates whether a shader is a sample frequency shader.
		 *
		 * @return Returns true if the shader is a sample frequency shader; otherwise returns false.
		*/
		public BOOL IsSampleFrequencyShader() mut
		{
			return VT.IsSampleFrequencyShader(&this);
		}
	}
}
