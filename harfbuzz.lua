-- scaffold geniefile for harfbuzz

harfbuzz_script = path.getabsolute(path.getdirectory(_SCRIPT))
harfbuzz_root = path.join(harfbuzz_script, "harfbuzz")

harfbuzz_includedirs = {
	path.join(harfbuzz_script, "config"),
	harfbuzz_root,
}

harfbuzz_libdirs = {}
harfbuzz_links = {}
harfbuzz_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { harfbuzz_includedirs }
	end,

	_add_defines = function()
		defines { harfbuzz_defines }
	end,

	_add_libdirs = function()
		libdirs { harfbuzz_libdirs }
	end,

	_add_external_links = function()
		links { harfbuzz_links }
	end,

	_add_self_links = function()
		links { "harfbuzz" }
	end,

	_create_projects = function()

project "harfbuzz"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		harfbuzz_includedirs,
	}

	defines {}

	files {
		path.join(harfbuzz_script, "config", "**.h"),
		path.join(harfbuzz_root, "**.h"),
		path.join(harfbuzz_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
