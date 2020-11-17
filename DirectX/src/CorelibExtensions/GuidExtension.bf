namespace System
{
	public extension Guid
	{
		public enum ParsingError
		{
			NullInput,
			InputTooShort,
			InvalidChar,
			UnknownFormat
		}

		public this(String string)
		{
			this = Parse(string);
		}
		
		// Todo: Catch invalid formats
		/// Appends a string representing the Guid to a given string buffer.
		public void ToString(String strBuf, String format = "D") mut
		{
			if(format == "P")
				strBuf.Append('(');
			else if(format == "B" || format == "X")
				strBuf.Append('{');

			switch(format)
			{
				case "N", String.Empty, null:
				{
					mA.ToString(strBuf, "X8", null);
					mB.ToString(strBuf, "X4", null); 
					mC.ToString(strBuf, "X4", null);
					
					uint8* bytes = &mD;
					for(int i = 0; i < 8; i++)
					{
						uint8 byte = *(bytes + i);
						byte.ToString(strBuf, "X2", null);
					}

					return;
				}
				case "D", "B", "P":
				{
					mA.ToString(strBuf, "X8", null);
					strBuf.Append('-');
					mB.ToString(strBuf, "X4", null);
					strBuf.Append('-'); 
					mC.ToString(strBuf, "X4", null);
					strBuf.Append('-');

					uint8* bytes = &mD;
					for(int i = 0; i < 8; i++)
					{
						uint8 byte = *(bytes + i);
						byte.ToString(strBuf, "X2", null);

						if(i == 1)
							strBuf.Append('-');
					}
				}
				case "X":
				{	
					strBuf.Append("0x");
					mA.ToString(strBuf, "X8", null);
					strBuf.Append(", 0x");
					mB.ToString(strBuf, "X4", null);
					strBuf.Append(", 0x");
					mC.ToString(strBuf, "X4", null);
					strBuf.Append(", {0x");

					uint8* bytes = &mD;
					for(int i = 0; i < 8; i++)
					{
						uint8 byte = *(bytes + i);
						byte.ToString(strBuf, "X2", null);
						if(i < 7)
						{
							strBuf.Append(", 0x");
						}
						else
						{
							strBuf.Append("}");
						}
					}
				}
				default:
			}

			if(format == "P")
				strBuf.Append(')');
			else if(format == "B" || format == "X")
				strBuf.Append('}');
		}
		
		// Todo: implementation gets the job done but is kinda dirty
		public static new Result<Guid, ParsingError> Parse(String s)
		{
			if(s == null)
				return .Err(.NullInput);
			s.Trim();
			if(s == String.Empty)
				return Guid.Empty;

			// Skip the first brace
			int position = (s[0] == '{' || s[0] == '(') ? 1 : 0;

			Guid result = ?;

			// First Block (uint32)
			do
			{
				if(s[position] == '-')
					break;

				// String is to short
				if(s.Length < position + 8)
					return .Err(.InputTooShort);

				result.mA = (uint32)int64.Parse(StringView(s, position, 8), .HexNumber);

				position += 8;
			}

			if(s[position] == '-')
				position++;

			// Second Block (uint16)
			do
			{
				if(s[position] == '-')
					break;

				// String is to short
				if(s.Length < position + 4)
					return .Err(.InputTooShort);

				result.mB = (uint16)int32.Parse(StringView(s, position, 4), .HexNumber);

				position += 4;
			}

			if(s[position] == '-')
				position++;

			// Third Block (uint16)
			do
			{
				if(s[position] == '-')
					break;

				// String is to short
				if(s.Length < position + 4)
					return .Err(.InputTooShort);

				result.mC = (uint16)int32.Parse(StringView(s, position, 4), .HexNumber);

				position += 4;
			}

			// eight uint8-blocks
			do
			{
				uint8* bytes = &result.mD;

				for(int i = 0; i < 8; i++)
				{	
					if(s[position] == '-')
						position++;

					// String is to short -> remaining blocks are 0
					if(s.Length < position + 2)
						break;

					bytes[i] = (uint8)int32.Parse(StringView(s, position, 2), .HexNumber);
	
					position += 2;
				}
			}

			return result;
		}
	}
}