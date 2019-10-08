module bindbc.bgfx.dynload;

version(BindBgfx_Static)
{
	// these functions do nothing with statically-linked library

	@disable bool loadBgfx();
	@disable bool loadBgfx(const(char)* libName);
	@disable void unloadBgfx();
	@disable bool isBgfxLoaded();
}
else:

import bindbc.loader;
import bindbc.bgfx.funcs;

private SharedLib lib;

bool loadBgfx()
{
	version (Windows)
	{
		const(char)[][4] libNames =
		[
			"bgfx.dll",
			"bgfx-shared-libRelease.dll",
			"bgfx_debug.dll",
			"bgfx-shared-libDebug.dll"
		];
	}
	else version (OSX)
	{
		const(char)[][2] libNames =
		[
			"libbgfx-shared-libRelease.dylib",
			"libbgfx-shared-libDebug.dylib"
		];
	}
	else version (linux)
	{
		const(char)[][4] libNames =
		[
			"libbgfx-shared-libRelease.so",
			"libbgfx-shared-libDebug.so",
			"./libbgfx-shared-libRelease.so",
			"./libbgfx-shared-libDebug.so"
		];
	}
	else
		static assert(0, "bindbc-bgfx is not supported on this platform.");

	foreach (libName; libNames)
	{
		bool success = loadBgfx(libName.ptr);
		if (success)
			return success;
	}
	return false;
}

bool loadBgfx(const(char)* libName)
{
	lib = load(libName);
	if (lib == invalidHandle)
		return false;

	size_t errors = errorCount();

	import std.algorithm.searching : startsWith;
	static foreach (m; __traits(allMembers, bindbc.bgfx.funcs))
	{
		static if (m.startsWith("da_"))
			lib.bindSymbol(cast(void**)&__traits(getMember, bindbc.bgfx.funcs, m[3..$]), __traits(getMember, bindbc.bgfx.funcs, m[3..$]).stringof);
	}

	return errors == errorCount();
}

void unloadBgfx()
{
	if(lib != invalidHandle)
		lib.unload();
}

bool isBgfxLoaded()
{
	return lib != invalidHandle;
}