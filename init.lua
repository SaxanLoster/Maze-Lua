local fonts    = require('lua2.fonts')
local waves    = require('lua2.waves')
local textures = require('lua2.textures')
local buttons  = require('lua2.buttons')
local savefile = require('lua2.savefile')

PRINT_GC = true

local f1 = fonts.create("fonts/DroidSansMono.ttf", 24)
local f2 = fonts.create("fonts/DroidSansMono.ttf", 18)

local t = {
	f1:text("Play Game"),
	f1:text("Options"),
	--local t3 = f1:text("Credits")
	f1:text("Exit"),
	}

local b = {}
for i = 1 , #t do
	table.insert( b , buttons.create_from_texture( t[ i ] , 125 , 50 + 50 * i ) )
	end

function on_touch(x, y)
	if b[ 1 ]:contains( x , y ) then 
		dofile( 'screens/difficulty.lua' )
	elseif b[ 2 ]:contains( x , y ) then
		dofile( 'screens/options.lua' )
	--elseif b3:contains(x, y) then
	--	dofile('screens/credits.lua')
	elseif b[ 3 ]:contains( x , y ) then
		quit()
		end
	end

function on_update()
	for i = 1 , #b do
		b[ i ]:draw()
		end
	end