--test_caca.lua

package.path = package.path..";../?.lua"

local caca = require("caca")

local function test_version()
	print("==== test_version ====")

	print("Version: ", caca.version())
end

local function test_rand()
	print("==== test_rand ====")
	
	for i=1,10 do
		print(caca.rand(0,255))
	end
end

test_version();
test_rand();
