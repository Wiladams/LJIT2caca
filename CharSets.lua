

local caca_ffi = require("caca_ffi")
local Lib = caca_ffi.Lib_caca;

local CharSets = {}

function CharSets.utf8Toutf32(chars, size)
	size = size or #chars;
	return Lib.caca_utf8_to_utf32(chars, size)
end

function CharSets.utf32Toutf8(utf32char, buff, buffsize)
	local bytesWritten = Lib.caca_utf32_to_utf8(buff, utf32char)
	return bytesWritten;
end

function CharSets.utf32Toascii(utf32char)
	return Lib.caca_utf32_to_ascii(utf32char);
end

function CharSets.utf32Tocp437(utf32char)
	return Lib.caca_utf32_to_cp437(utf32char);
end

function CharSets.cp437Toutf32(cp437char)
	return Lib.caca_cp437_to_utf32(cp437char);
end

function CharSets.utf32IsFullWidth(utf32char)
	return Lib.caca_utf32_is_fullwidth(utf32char);
end

return CharSets;
