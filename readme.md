# bindbc-bgfx
Dynamic and static D bindings for [bgfx](https://github.com/bkaradzic/bgfx).

These bindings target bgfx API version **112** (commit [5a6c1361ce5a7d315ac6bd537668ee95e86b6475](https://github.com/bkaradzic/bgfx/tree/5a6c1361ce5a7d315ac6bd537668ee95e86b6475)).

## Usage (DUB)
To install this library with DUB, simply run the following command:
```
dub add bindbc-bgfx
```

The library is configured to `dynamic` configuration by default, and should work out of box if you have the dynamic library installed properly (e.g. on Windows, the .DLL files are accessible by the application).

## Static bindings

For static linking, `static` configuration must be enabled:

__dub.json__
```
"subConfigurations": {
	"bindbc-bgfx": "static"
},

"libs": [
	"bgfxRelease", "bxRelease", "bimgRelease"
]
```

Make sure to link against all the necessary system libraries needed by bgfx, and setup the library paths for linker:
```
"libs-windows": [
	"User32", "Gdi32"
],
"lflags-windows": [
	"/LIBPATH:example\\path\\to\\bgfx\\.build\\win64_vs2019\\bin\\"
],

"libs-linux": [
	"stdc++", "GL", "X11"
],
"lflags-linux": [
	"-L/example/path/to/bgfx/bgfx/.build/linux64_gcc/bin"
]
```

The bindings also support `-betterC`, which can be enabled with `staticBC` and `dynamicBC` configurations.

## Usage

```d
import bindbc.bgfx;

loadBgfx(); // required with dynamically linked bgfx

bgfx_init_t init;
bgfx_init_ctor(&init);

bgfx_init(&init);
bgfx_reset(1280, 720, BGFX_RESET_NONE, init.resolution.format);

bgfx_shutdown();

unloadBgfx(); // optional, only needed with dynamically linked bgfx
```

This is a very simple sample of how to use these bindings with bgfx. The sample code does not render or output anything but merely demonstrates how the bindings are initialized for proper use. To setup a window, libraries like SDL2 are often used with bgfx to provide the window for bgfx to use with rendering. Please see [this C++ example](https://github.com/bkaradzic/bgfx/blob/master/examples/common/entry/entry_sdl.cpp#L75) on how to setup bgfx with SDL2.

If you need more in-depth tutorial of how to use bgfx, please see the [bgfx examples here.](https://bkaradzic.github.io/bgfx/examples.html)

## Generating bindings

The main bgfx repository already contains the latest generated binding definitions for D, so these files can be copied from `bgfx/bindings/d/` over the files in `bindbc-bgfx/source/bindbc/bgfx` when pairing these bindings with custom versions of bgfx. If you need to regenerate the bindings, you can run `genie idl` in bgfx project folder, and copy the regenerated files to previously mentioned location.