# directx-beef
**directx-beef** is a wrapper library written in Beef for the **DirectX-API**.

This wrapper also contains some basic bindings for the **WinAPI** so you can create windows for the DirectX applications.

## Notice:
This wrapper is very unfinished. It only contains the interfaces and structures from **D3D11** and **DXGI**.

Since there is a [project](https://github.com/blat-blatnik/BeefWin32) that prorvides bindings for (almost) the entire Win32-API it's unlikely that much work will be put into this wrapper.

# Quick Start (Beef IDE)
1. **Download** directx-beef
2. **Copy** the *DirectX*-Folder into the *BeefLibs*-Directory (usualy `C:\Program Files\BeefLang\BeefLibs`)
3. Right-click your Workspace, click **Add from Installed...** and select **DirectX**
4. Add **DirectX** as dependency for your project

There is also an example in this repository to demonstrate basic initialization and usage.

# Credits
Beef language website: https://www.beeflang.org

Some (basically every non trivial) Vector and Matrix functions are from *Eric Lengyel's* books "Foundations of Game Engine Development" Volume 1 and 2
