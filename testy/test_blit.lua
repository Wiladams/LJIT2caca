package.path = package.path..";../?.lua"

local ffi = require("ffi")
local caca_ffi = require("caca_ffi")()
local Lib = caca_ffi.Lib_caca;

local caca_create_canvas = Lib.caca_create_canvas;
local caca_get_canvas_width = Lib.caca_get_canvas_width;
local caca_get_canvas_height = Lib.caca_get_canvas_height;


local caca_create_display = Lib.caca_create_display
local caca_set_color_ansi = Lib.caca_set_color_ansi;
local caca_import_canvas_from_memory = Lib.caca_import_canvas_from_memory
local caca_set_canvas_handle = Lib.caca_set_canvas_handle
local caca_put_str = Lib.caca_put_str
local caca_blit = Lib.caca_blit
local caca_refresh_display = Lib.caca_refresh_display
local caca_get_event = Lib.caca_get_event
local caca_free_display = Lib.caca_free_display
local caca_free_canvas = Lib.caca_free_canvas



pig =[[
  ,__         __,
   \\)`\\_..._/`(/
   .'  _   _  '.
  /    o\\ /o   \\
  |    .-.-.    |  _
  |   /() ()\\   | (,`)
 / \\  '-----'  / \\ .'
|   '-..___..-'   |
|                 |
|                 |
;                 ;
 \\      / \\      /
  \\-..-/'-'\\-..-/
jgs\\/\\/     \\/\\/
]]

local function main(argc, argv)

    local cv = caca_create_canvas(80, 24);
    if(cv == nil) then    
        print(string.format("Failed to create canvas\n"));
        return 1;
    end

    local dp = caca_create_display(cv);
    if(dp == nil) then
    
        print(string.format("Failed to create display\n"));
        return 1;
    end

    local sprite = caca_create_canvas(0, 0);
    caca_set_color_ansi(sprite, CACA_LIGHTRED, CACA_BLACK);
    caca_import_canvas_from_memory(sprite, pig, #pig, "text");
    caca_set_canvas_handle(sprite, caca_get_canvas_width(sprite) / 2,
                                    caca_get_canvas_height(sprite) / 2);

    caca_set_color_ansi(cv, CACA_WHITE, CACA_BLUE);
    caca_put_str(cv, 0, 0, "Centered sprite");

    caca_blit(cv, caca_get_canvas_width(cv) / 2,
                   caca_get_canvas_height(cv) / 2, sprite, nil);

    caca_refresh_display(dp);

    caca_get_event(dp, CACA_EVENT_KEY_PRESS, nil, -1);

    caca_free_display(dp);
    caca_free_canvas(sprite);
    caca_free_canvas(cv);

    return 0;
end

main()