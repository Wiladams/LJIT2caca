package.path = package.path..";../?.lua"

local ffi = require("ffi")
local caca_ffi = require("caca_ffi")
local Lib = caca_ffi.Lib_caca;

local function test_version()
	local version = Lib.caca_get_version();
	print(ffi.string(version))
end

test_version();