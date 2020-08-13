using System;

namespace DirectX.D3D11
{
	/**
	Defines the dimensions of a viewport.
	*/
	[CRepr]
	public struct Viewport
	{												   
		public static readonly float BoundsMax = 32768.0f;
		public static readonly float BoundsMin = -32768.0f;

		/**
		X position of the left hand side of the viewport. Ranges between BoundsMin and BoundsMax.
		TopLeftX
		*/
		public float Left;
		/**
		Y position of the top of the viewport. Ranges between BoundsMin and BoundsMax.
		TopLeftY
		*/
		public float Top;
		/**
		Width of the viewport.
		*/
		public float Width;
		/**
		Height of the viewport.
		*/
		public float Height;
		/**
		Minimum depth of the viewport. Ranges between 0 and 1.
		*/
		public float MinDepth;
		/**
		Maximum depth of the viewport. Ranges between 0 and 1.
		*/
		public float MaxDepth;

		public this()
		{
			this = default;
		}

		public this(float left, float top, float width, float height, float minDepth = DirectX.D3D11.D3D11_MIN_DEPTH, float maxDepth = DirectX.D3D11.D3D11_MAX_DEPTH)
		{
			Left = left;
			Top = top;
			Width = width;
			Height = height;
			MinDepth = minDepth;
			MaxDepth = maxDepth;
		}

		public this(ID3D11Buffer* buffer,
	        ID3D11RenderTargetView* rtView,
	        float left = 0.0f,
	        float minDepth = DirectX.D3D11.D3D11_MIN_DEPTH,
	        float maxDepth = DirectX.D3D11.D3D11_MAX_DEPTH)
		{
			rtView.GetDescription(let RTVDesc);
			UINT NumElements = 0;
			switch (RTVDesc.ViewDimension)
			{
			case .Buffer:
			    NumElements = RTVDesc.Description.Buffer.NumElements;
			    break;
			default: break;
			}
			Left = left;
			Top = 0.0f;
			Width = NumElements - left;
			Height = 1.0f;
			MinDepth = minDepth;
			MaxDepth = maxDepth;
		}

		public this(ID3D11Texture1D* tex1D,
	        ID3D11RenderTargetView* rtView,
	        float left = 0.0f,
	        float minDepth = DirectX.D3D11.D3D11_MIN_DEPTH,
	        float maxDepth = DirectX.D3D11.D3D11_MAX_DEPTH)
	    {
	        tex1D.GetDescription(let texDesc);
	        rtView.GetDescription(let rtVDesc);
	        UINT MipSlice = 0;
	        switch (rtVDesc.ViewDimension)
	        {
	        case .Texture1D:
	            MipSlice = rtVDesc.Description.Texture1D.MipSlice;
	            break;
	        case .Texture1DArray:
	            MipSlice = rtVDesc.Description.Texture1DArray.MipSlice;
	            break;
	        default: break;
	        }
	        UINT SubResourceWidth = texDesc.Width / (UINT(1) << MipSlice);
	        Left = left;
	        Top = 0.0f;
	        Width = (SubResourceWidth > 0 ? SubResourceWidth : 1) - left;
	        Height = 1.0f;
	        MinDepth = minDepth;
	        MaxDepth = maxDepth;
	    }

		public this(ID3D11Texture2D* tex2D,
	        ID3D11RenderTargetView* rtView,
	        float left = 0.0f,
	        float top = 0.0f,
	        float minDepth = DirectX.D3D11.D3D11_MIN_DEPTH,
	        float maxDepth = DirectX.D3D11.D3D11_MAX_DEPTH )
	    {
	        
	        tex2D.GetDescription(let texDesc);
	        rtView.GetDescription(let rtvDesc);
	        UINT MipSlice = 0;
	        switch (rtvDesc.ViewDimension)
	        {
	        case .Texture2D:
	            MipSlice = rtvDesc.Description.Texture2D.MipSlice;
	            break;
	        case .Texture2DArray:
	            MipSlice = rtvDesc.Description.Texture2DArray.MipSlice;
	            break;
	        case .Texture2DMultisample:
	        case .Texture2DArrayMultisample:
	            break;
	        default: break;
	        }
	        UINT SubResourceWidth = texDesc.Width / (UINT(1) << MipSlice);
	        UINT SubResourceHeight = texDesc.Height / (UINT(1) << MipSlice);
	        Left = left;
	        Top = top;
	        Width = (SubResourceWidth > 0 ? SubResourceWidth : 1) - left;
	        Height = (SubResourceHeight > 0? SubResourceHeight : 1) - top;
	        MinDepth = minDepth;
	        MaxDepth = maxDepth;
	    }

		public this(
			ID3D11Texture3D* tex3D,
	        ID3D11RenderTargetView* rtView,
	        float left = 0.0f,
	        float top = 0.0f,
	        float minDepth = DirectX.D3D11.D3D11_MIN_DEPTH,
	        float maxDepth = DirectX.D3D11.D3D11_MAX_DEPTH )
	    {
	        tex3D.GetDescription(let texDesc);
	        rtView.GetDescription(let rtvDesc);
	        UINT MipSlice = 0;
	        switch (rtvDesc.ViewDimension)
	        {
	        case .Texture3D:
	            MipSlice = rtvDesc.Description.Texture3D.MipSlice;
	            break;
	        default: break;
	        }
	        UINT SubResourceWidth = texDesc.Width / (UINT(1) << MipSlice);
	        UINT SubResourceHeight = texDesc.Height / (UINT(1) << MipSlice);
	        Left = left;
	        Top = top;
	        Width = (SubResourceWidth > 0 ? SubResourceWidth : 1) - left;
	        Height = (SubResourceHeight > 0 ? SubResourceHeight : 1) - top;
	        MinDepth = minDepth;
	        MaxDepth = maxDepth;
	    }

		[Inline]
		public static bool operator ==(Viewport l, Viewport r)
		{
			return l.Left == r.Left && l.Top == r.Top && l.Width == r.Width &&
				l.Height == r.Height && l.MinDepth == r.MinDepth && l.MaxDepth == r.MaxDepth;
		}
		
		[Inline]
		public static bool operator !=(Viewport l, Viewport r)
		{
			return !(l == r);
		}
	}
}
