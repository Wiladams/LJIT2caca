-- test_get_font_list.lua
package.path = package.path..";../?.lua"

local ffi = require("ffi")
local caca_ffi = require("caca_ffi")()
local Lib_caca = caca_ffi.Lib_caca;

local function printFontInfo(name, font)
	print("==== printFontInfo ====")
	print(name);
	local width = caca_get_font_width(font);
	local height = caca_get_font_height(font);

	print(string.format("Size: %dx%d", width, height)); 
end

local function fontNameList()
	local fonts = caca_get_font_list();
	
	local idx = -1;
	local function closure()
		idx = idx + 1;
		if fonts[idx] == nil then
			return nil;
		end

		return ffi.string(fonts[idx]);
	end

	return closure;

end

local function fontList()
	local fontNames = caca_get_font_list();
	
	local idx = -1;
	local function closure()
		idx = idx + 1;
		if fontNames[idx] == nil then
			return nil;
		end

		local font = caca_load_font(fontNames[idx], 0);
		ffi.gc(font, caca_free_font);
		return font, ffi.string(fontNames[idx]);
	end

	return closure;

end

local function test_list_font_info()

	for font, fontName in fontList() do
		printFontInfo(fontName, font);
	end
end

local function test_list_font_names()
	for fontName in fontNameList() do
		print(fontName);
	end
end

test_list_font_names();
test_list_font_info();
