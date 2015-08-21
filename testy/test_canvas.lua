--test_canvas.lua
package.path = package.path..";../?.lua"

--local ffi = require("ffi")
--local caca_ffi = require("caca_ffi")()
--local Lib_caca = caca_ffi.Lib_caca;
local Canvas = require("caca").Canvas

local function test_canvas_construction()
	local can = Canvas(80,20);
	print("Size: ", can:size());
end


test_canvas_construction();
