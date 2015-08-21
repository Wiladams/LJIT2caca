local ffi = require("ffi")
local caca_ffi = require("caca_ffi")
local Lib = caca_ffi.Lib_caca;

local Canvas = {}
setmetatable(Canvas, {
	__call = function(self, ...)
		return self:new(...);
	end,
})

local Canvas_mt = {
	__index = Canvas;
}

function Canvas.init(self, handle)
	local obj = {
		Handle = handle;
	}
	setmetatable(obj, Canvas_mt);

	return obj;
end

function Canvas.new(self, width, height)
	width = width or 0;
	height = height or 0;

	local handle = Lib.caca_create_canvas(width, height);
	if handle == nil then
		return nil;
	end

	ffi.gc(handle, Lib.caca_free_canvas);

	return self:init(handle);
end

function Canvas.size(self, width, height)
	if not width and not height then
		local width = Lib.caca_get_canvas_width(self.Handle);
		local height = Lib.caca_get_canvas_height(self.Handle);
		return width, height;
	end

	width = width or 0;
	height = height or 0;

	Lib.caca_set_canvas_size(self.Handle, width, height);
end

function Canvas.line(self, x1, y1, x2, y2)
end

function Canvas.polyline(self, xs, ys, num, attr)
end

function Canvas.strokeCircle(self, x, y, radius, utf32char)
end


function Canvas.strokeEllipse(self, x0, y0, a, b, utf32char)
end

function Canvas.fillEllipse(self, x0, y0, a, b, utf32char)
end

return Canvas
