--caca.lua
local ffi = require("ffi")
local caca_ffi = require("caca_ffi")
local Lib = caca_ffi.Lib_caca;
local Canvas = require("Canvas")
local CharSets = require("CharSets")


-- Convenience functions that apply to the 
-- top level of libcaca
local function rand(low, high)
	low = low or 0
	high = high or math.pow(2, 31)

	return Lib.caca_rand(low, high);
end

local function version()
	return ffi.string(Lib.caca_get_version());
end




local exports = {
	-- convenience functions
	rand = rand;
	version = version;

	-- Convenience Classes
	Canvas = Canvas;
	CharSets = CharSets;
}
setmetatable(exports, {
    __call = function (self, ...)
        for k,v in pairs(self) do
            _G[k] = v;
        end
        return self;
    end,
})


return exports
