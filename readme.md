# bindbc-bgfx
Dynamic and static D bindings for [bgfx](https://github.com/bkaradzic/bgfx).

These bindings target bgfx API version **108** (commit [ecb0143a40a4888465ad22f128b45bf6505e644b](https://github.com/bkaradzic/bgfx/tree/ecb0143a40a4888465ad22f128b45bf6505e644b)).

## Usage (DUB)
To install this library with DUB, simply run the following commands:
```
dub add bindbc-bgfx
dub add bindbc-loader
```

The library is configured to `dynamic` configuration by default, and should work out of box if you have the dynamic library installed properly.

For static linking, `static` configuration must be enabled:

__dub.json__
```
"subConfigurations": {
	"bindbc-bgfx": "static"
}

"libs": {
	"bgfxRelease", "bxRelease", "bimgRelease"
}
```

The bindings also support `-betterC`, which can be enabled with `staticBC` and `dynamicBC` configurations.

## Sample

```d
import bindbc.bgfx;

loadBgfx(); // required with dynamically linked bgfx

bgfx_init_t init;
bgfx_init_ctor(&init);

bgfx_init(&init);
bgfx_reset(1280, 720, BGFX_RESET_NONE, init.resolution.format);

bgfx_shutdown();

unloadBgfx(); // optional, only with dynamically linked bgfx
```

## Generating bindings

The bindings can be regenerated manually by running `genie idl` in bgfx project folder, and copying the generated files from `bgfx/bindings/d/` over the files in `bindbc-bgfx/source/bindbc/bgfx`.