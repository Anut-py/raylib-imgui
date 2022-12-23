# raylib-imgui: Haskell bindings for rlImGui

This package provides bindings to rlImGui allowing raylib and dear-imgui interop.

## Usage

Add the following in your `.cabal` file:

```cabal
...
build-depends:
  , base
  , dear-imgui==1.2.2
  , gl
  , GLFW-b
  , h-raylib
  , raylib-imgui==4.5.0.9
...
```

**NOTE: Each version of raylib-imgui requires a specific version of dear-imgui. raylib-imgui 4.5.0.9 requires dear-imgui 1.2.2**

And in your `cabal.project` file add the following:

```
package dear-imgui
  flags: -sdl +glfw +opengl3
```

This is required because raylib uses GLFW rather than SDL.

See the `example` directory in the source for example code.

## See also
- [dear-imgui.hs](https://github.com/haskell-game/dear-imgui.hs#dear-imguihs) for Dear ImGui setup
- [h-raylib](https://github.com/Anut-py/h-raylib#h-raylib-haskell-bindings-for-raylib) for rayllib setup
