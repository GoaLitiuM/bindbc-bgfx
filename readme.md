# bindbc-bgfx
Dynamic and static D bindings for [bgfx](https://github.com/bkaradzic/bgfx).

These bindings targets bgfx API version **100** (commit [010676412ef819ed7a2a6eece1f02f88e9666016](https://github.com/bkaradzic/bgfx/tree/010676412ef819ed7a2a6eece1f02f88e9666016)).

## Usage (dub)
```dub add bindbc-bgfx```

The library is configured to `dynamic` configuration by default, and should work out of box if you have the dynamic library installed properly.

For static linking, `static` configuration must be enabled:

__dub.json__:
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