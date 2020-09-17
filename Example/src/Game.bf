using System;
using DirectX;
using DirectX.DXGI;
using DirectX.DXGI.DXGI1_2;
using DirectX.D3D11;
using DirectX.Common;
using DirectX.D3D11.SDKLayers;
using DirectX.Math;
using System.Diagnostics;

namespace Example
{
	class Game
	{
		private Window _window;
		private GameTime _gameTime;

		// Todo: Modify these values to change the initial size of the window.
		private uint32 _backbufferWidth = 1280;
		private uint32 _backbufferHeight = 720;

		private Viewport _backbufferViewport;

		public uint32 BackbufferWidth => _backbufferWidth;
		public uint32 BackbufferHeight => _backbufferHeight;

		private ID3D11Device* _graphicsDevice;
#if DEBUG
		private ID3D11Debug* _debugDevice;
#endif
		private ID3D11DeviceContext* _immediateContext;

		private ID3D11RasterizerState* _rasterizerState;

		private IDXGIDevice2* _dxgiDevice;
		private IDXGISwapChain1* _swapChain;

		private ID3D11RenderTargetView* _backBufferView;

		private ID3D11VertexShader* _vertexShader;
		private ID3D11PixelShader* _pixelShader;
		private ID3D11InputLayout* _inputLayout;

		private ID3D11Buffer* _vertexBuffer;

		public this() {  }

		public ~this()
		{
			_vertexBuffer.Release();

			_pixelShader.Release();
			_inputLayout.Release();
			_vertexShader.Release();

			_backBufferView.Release();

			_swapChain.Release();
			_dxgiDevice.Release();

			_rasterizerState.Release();

			_immediateContext.Release();
			_graphicsDevice.Release();

#if DEBUG
			_debugDevice.ReportLiveDeviceObjects(.Detail);
			_debugDevice.Release();
#endif

			delete _gameTime;
		}

		public void Initialize(Window window, int32 width, int32 height)
		{
			_window = window;

			_backbufferWidth = (.)width;
			_backbufferHeight = (.)height;

			_gameTime = new GameTime(true);

			CreateDevice();
			UpdateSwapchain();
			CreateContent();
		}

		/**
		 * Create resolution independent objects here.
		 */
		public void CreateDevice()
		{
			DeviceCreationFlags deviceFlags = .None;

#if DEBUG
			deviceFlags |= .Debug;
#endif

			FeatureLevel[] levels = scope .(
				.Level_11_0
			);

			HResult result = D3D11CreateDevice(null, .Hardware, 0, deviceFlags, levels, &_graphicsDevice, null, &_immediateContext);
			if(result.Failed)
			{
				Debug.Write("ERROR: Failed to create graphics device: {}", result);
				Runtime.FatalError("Failed to create graphics device");
			}

#if DEBUG		
			if(_graphicsDevice.QueryInterface<ID3D11Debug>(out _debugDevice).Succeeded)
			{
				ID3D11InfoQueue* infoQueue;
				if(_graphicsDevice.QueryInterface<ID3D11InfoQueue>(out infoQueue).Succeeded)
				{
					infoQueue.SetBreakOnSeverity(.Corruption, true);
					infoQueue.SetBreakOnSeverity(.Error, true);

					infoQueue.Release();
				}
			}
#endif
			
			// Create rasterizer state
			RasterizerStateDescription rsDesc = .();
			rsDesc.CullMode = .Back;
			rsDesc.FillMode = .Solid;
			rsDesc.FrontCounterClockwise = true;

			result = _graphicsDevice.CreateRasterizerState(ref rsDesc, &_rasterizerState);
			if(result.Failed)
			{
				Debug.Write("ERROR: Failed to create Rasterizer State: {}", result);
				Runtime.FatalError("Failed to create Rasterizer State");
			}
		}

		/**
		 * Create and update resolution dependent objects here.
		 */
		public void UpdateSwapchain()
		{
			uint32 backBufferCount = 2;
			Format backBufferFormat = .R8G8B8A8_UNorm;

			if(_swapChain != null)
			{
				// Todo: destroy resolution dependent objects here.
				_backBufferView.Release();

				_swapChain.ResizeBuffers(backBufferCount, _backbufferWidth, _backbufferHeight, backBufferFormat, .None);
			}
			else
			{
				_graphicsDevice.QueryInterface(out _dxgiDevice);

				IDXGIAdapter* dxgiAdapter;
				_dxgiDevice.GetAdapter(out dxgiAdapter);

				IDXGIFactory2* dxgiFactory = ?;
				dxgiAdapter.GetParent(out dxgiFactory);

				dxgiAdapter.Release();

				SwapChainDescription1 swapChainDesc = .();
				swapChainDesc.Width = _backbufferWidth;
				swapChainDesc.Height = _backbufferHeight;
				swapChainDesc.Format = backBufferFormat;
				swapChainDesc.SampleDescription = .(1, 0);
				swapChainDesc.BufferUsage = .RenderTargetOutput;
				swapChainDesc.BufferCount = backBufferCount;
				swapChainDesc.SwapEffect = .FlipDiscard;

				SwapChainFullscreenDescription fsSwapChainDesc = .();
				fsSwapChainDesc.Windowed = true;

				dxgiFactory.CreateSwapChainForHwnd((.)_graphicsDevice, _window.WindowHandle, ref swapChainDesc, &fsSwapChainDesc, null, &_swapChain);

				dxgiFactory.Release();
			}

			ID3D11Texture2D* backBuffer;
			_swapChain.GetBuffer(0, out backBuffer);

			RenderTargetViewDescription rtvDesc = .();
			rtvDesc.Format = backBufferFormat;
			rtvDesc.ViewDimension = .Texture2D;
			rtvDesc.Description.Texture2D.MipSlice = 0;

			_graphicsDevice.CreateRenderTargetView(backBuffer, &rtvDesc, &_backBufferView);

			backBuffer.Release();

			_backbufferViewport = Viewport(0, 0, _backbufferWidth, _backbufferHeight, 0.0f, 1.0f);
			
			// Todo: create resolution dependent objects here.
		}

		public void CreateContent()
		{
			// Compile vertex shader
			ID3DBlob* vsCode = null;
			ID3DBlob* errorBlob = null;
			var result = D3DCompiler.D3DCompileFromFile("content\\basicShader.hlsl".ToScopedNativeWChar!(), null, D3DCompiler.D3D_COMPILE_STANDARD_FILE_INCLUDE, "VS", "vs_5_0", .Debug, .None, &vsCode, &errorBlob);

			if(result.Failed || errorBlob != null)
			{
				Debug.Write("ERROR: Failed to compile Vertex Shader: {}", result);
				ErrorPrinter.PrintErrorBlob(errorBlob);
				Runtime.FatalError("Failed to compile Vertex Shader");
			}

			result = _graphicsDevice.CreateVertexShader(vsCode.GetBufferPointer(), vsCode.GetBufferSize(), null, &_vertexShader);

			if(result.Failed)
			{
				Debug.Write("ERROR: Failed to create Vertex Shader: {}", result);
				Runtime.FatalError("Failed to create Vertex Shader");
			}

			// Create Input Layout

			InputElementDescription[2] elementDescs = .(
				InputElementDescription("POSITION", 0, .R32G32B32_Float, 0),
				InputElementDescription("COLOR",    0, .R8G8B8A8_UNorm,  0)
			);

			result = _graphicsDevice.CreateInputLayout(&elementDescs, (.)elementDescs.Count, vsCode.GetBufferPointer(), vsCode.GetBufferSize(), &_inputLayout);
			
			vsCode.Release();

			if(result.Failed)
			{
				Debug.Write("ERROR: Failed to create input layout: {}", result);
				Runtime.FatalError("Failed to create input layout");
			}

			//
			// Load pixel shader
			//

			ID3DBlob* psCode = null;

			result = D3DCompiler.D3DCompileFromFile("content\\basicShader.hlsl".ToScopedNativeWChar!(), null, D3DCompiler.D3D_COMPILE_STANDARD_FILE_INCLUDE, "PS", "ps_5_0", .Debug, .None, &psCode, &errorBlob);

			if(result.Failed || errorBlob != null)
			{
				Debug.Write("ERROR: Failed to compile Pixel Shader: {}", result);
				ErrorPrinter.PrintErrorBlob(errorBlob);
				Runtime.FatalError("Failed to compile Pixel Shader");
			}

			result = _graphicsDevice.CreatePixelShader(psCode.GetBufferPointer(), psCode.GetBufferSize(), null, &_pixelShader);

			psCode.Release();

			if(result.Failed)
			{
				Debug.Write("ERROR: Failed to create Pixel Shader: {}", result);
				Runtime.FatalError("Failed to create Pixel Shader");
			}

			//
			// Create Triangle
			//

			VertexColor[] vertices = new:ScopedAlloc! VertexColor[](
				VertexColor(Vector3(-0.5f, -0.5f, 0), Color(255, 0, 0)),
				VertexColor(Vector3( 0.5f, -0.5f, 0), Color(0, 255, 0)),
				VertexColor(Vector3( 0.0f,  0.5f, 0), Color(0, 0, 255))
			);

			BufferDescription bufferDesc = .((uint32)(sizeof(VertexColor) * vertices.Count), BindFlags.VertexBuffer);

			SubresourceData data = .(&vertices[0]);

			result = _graphicsDevice.CreateBuffer(ref bufferDesc, &data, &_vertexBuffer);

			if(result.Failed)
			{
				Debug.Write("ERROR: Failed to create Vertex Buffer: {}", result);
				Runtime.FatalError();
			}
		}

		/**
		 * Will be executed when the window is being activated.
		 */
		public void OnActivated() {  }
		
		/**
		 * Will be executed when the window is being deactivated.
		 */
		public void OnDeactivated() {  }
		
		/**
		 * Will be executed when the window's size changed.
		 */
		public void OnWindowSizeChanged(int32 width, int32 height)
		{
			_backbufferWidth = (.)width;
			_backbufferHeight = (.)height;

			UpdateSwapchain();
		}

		public void Update(GameTime gameTime)
		{

		}

		public void Draw()
		{
			_immediateContext.ClearRenderTargetView(_backBufferView, ColorRGBA.CornflowerBlue);

			uint32 stride = sizeof(VertexColor);
			uint32 offset = 0;
			_immediateContext.InputAssembler.SetVertexBuffers(0, 1, &_vertexBuffer, &stride, &offset);

			_immediateContext.InputAssembler.SetInputLayout(_inputLayout);
			_immediateContext.InputAssembler.SetPrimitiveTopology(.D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST);

			_immediateContext.VertexShader.SetShader(_vertexShader, null, 0);

			_immediateContext.Rasterizer.SetState(_rasterizerState);
			_immediateContext.Rasterizer.SetViewports(1, &_backbufferViewport);

			_immediateContext.PixelShader.SetShader(_pixelShader, null, 0);

			_immediateContext.OutputMerger.SetRenderTargets(1, &_backBufferView, null);

			_immediateContext.Draw(3, 0);

			_swapChain.Present(0, .None);
		}

		/**
		 * Updates and draws a frame.
		 */
		public void Tick()
		{
			_gameTime.Tick();
			
			Update(_gameTime);
			Draw();
		}
	}
}
