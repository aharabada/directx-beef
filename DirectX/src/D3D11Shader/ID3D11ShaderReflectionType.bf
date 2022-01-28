using System;
using DirectX.Common;

namespace DirectX.D3D11Shader
{
	/**
	 * This shader-reflection interface provides access to variable type.
	*/
	public struct ID3D11ShaderReflectionType : IInterfaceID
	{
		public static Guid IID => .(0x6e6ffa6a, 0x9bae, 0x4613, 0xa5, 0x1e, 0x91, 0x65, 0x2d, 0x50, 0x8c, 0x21);

		public struct VTable
		{
			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflectionType* self, ShaderTypeDescription *pDesc) GetDesc;

			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionType*(ID3D11ShaderReflectionType* self, uint32 index) GetMemberTypeByIndex;
			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionType*(ID3D11ShaderReflectionType* self, char8* name) GetMemberTypeByName;
			public function [CallingConvention(.Stdcall)] char8*(ID3D11ShaderReflectionType* self, uint32 index) GetMemberTypeName;
			
			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflectionType* self, ID3D11ShaderReflectionType* pType) IsEqual;
			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionType*(ID3D11ShaderReflectionType* self) GetSubType;
			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionType*(ID3D11ShaderReflectionType* self) GetBaseClass;
			public function [CallingConvention(.Stdcall)] uint32(ID3D11ShaderReflectionType* self) GetNumInterfaces;
			public function [CallingConvention(.Stdcall)] ID3D11ShaderReflectionType*(ID3D11ShaderReflectionType* self, uint32 index) GetInterfaceByIndex;
			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflectionType* self, ID3D11ShaderReflectionType* pType) IsOfType;
			public function [CallingConvention(.Stdcall)] HResult(ID3D11ShaderReflectionType* self, ID3D11ShaderReflectionType* pBase) ImplementsInterface;
		}

		protected VTable* _vt;

		public VTable* VT => _vt;

		/**
		 * Gets an ID3D11ShaderReflectionType Interface interface containing the variable base class type.
		 *
		 * @return Returns A pointer to a ID3D11ShaderReflectionType Interface.
		*/
		public ID3D11ShaderReflectionType* GetBaseClass() mut
		{
			return _vt.GetBaseClass(&this);
		}

		/**
		 * Get the description of a shader-reflection-variable type.
		 *
		 * @param desc	A reference to a shader-type description.
		*/
		public HResult GetDescription(out ShaderTypeDescription desc) mut
		{
			desc = ?;
			return _vt.GetDesc(&this, &desc);
		}

		/**
		 * Get an interface by index.
		 *
		 * @param index	Zero-based index.
		 * @return A pointer to a ID3D11ShaderReflectionType interface.
		*/
		public ID3D11ShaderReflectionType* GetInterfaceByIndex(uint32 index) mut
		{
			return _vt.GetInterfaceByIndex(&this, index);
		}

		/**
		 * Get a shader-reflection-variable type by index.
		 *
		 * @param index	Zero-based index.
		 * @return A pointer to a ID3D11ShaderReflectionType interface.
		*/
		public ID3D11ShaderReflectionType* GetMemberTypeByIndex(uint32 index) mut
		{
			return _vt.GetMemberTypeByIndex(&this, index);
		}

		/**
		 * Get a shader-reflection-variable type by name.
		 *
		 * @param name	Member name.
		 * @return A pointer to a ID3D11ShaderReflectionType interface.
		*/
		public ID3D11ShaderReflectionType* GetMemberTypeByName(char8* name) mut
		{
			return _vt.GetMemberTypeByName(&this, name);
		}

		/**
		 * Get a shader-reflection-variable type.
		 *
		 * @param index	Zero-based index.
		 * @return The variable type.
		*/
		public char8* GetMemberTypeName(uint32 index) mut
		{
			return _vt.GetMemberTypeName(&this, index);
		}

		/**
		 * Gets the number of interfaces.
		 *
		 * @return Returns the number of interfaces.
		*/
		public uint32 GetNumInterfaces() mut
		{
			return _vt.GetNumInterfaces(&this);
		}

		/**
		 * Gets the base class of a class.
		 *
		 * @return 	Returns a pointer to a ID3D11ShaderReflectionType Interface containing the base class type.
		 *			Returns NULL if the class does not have a base class.
		*/
		public ID3D11ShaderReflectionType* GetSubType() mut
		{
			return _vt.GetSubType(&this);
		}

		/**
		 * Indicates whether a class type implements an interface.
		 *
		 * @param pBase	A pointer to a ID3D11ShaderReflectionType Interface.
		 * @return Returns S_OK if the interface is implemented; otherwise return S_FALSE.
		*/
		public HResult ImplementsInterface(ID3D11ShaderReflectionType* pBase) mut
		{
			return _vt.ImplementsInterface(&this, pBase);
		}

		/**
		 * Indicates whether two ID3D11ShaderReflectionType Interface pointers have the same underlying type.
		 *
		 * @param type pointer to a ID3D11ShaderReflectionType Interface.
		 * @return Returns Returns S_OK if the pointers have the same underlying type; otherwise returns S_FALSE.
		*/
		public HResult IsEqual(ID3D11ShaderReflectionType *type) mut
		{
			return _vt.IsEqual(&this, type);
		}

		/**
		 * Indicates whether a variable is of the specified type.
		 *
		 * @param type A pointer to a ID3D11ShaderReflectionType Interface.
		 * @return 	Returns Returns S_OK if object being queried is equal to or inherits from the type in the pType parameter;
		 *			otherwise returns S_FALSE.
		*/
		public HResult IsOfType(ID3D11ShaderReflectionType *type) mut
		{
			return _vt.IsOfType(&this, type);
		}
	}
}
