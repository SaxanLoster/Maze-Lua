-- There are 5 lua2 modules.
local fonts    = require('lua2.fonts')
local waves    = require('lua2.waves')
local textures = require('lua2.textures')
local buttons  = require('lua2.buttons')
local savefile = require('lua2.savefile')

-- Print lua2 garbage collection.
PRINT_GC = true

-- Create fonts from font files.
-- fonts.create(fontfile, fontsize)
local f1 = fonts.create("fonts/DroidSansMono.ttf", 24)
local f2 = fonts.create("fonts/DroidSansMono.ttf", 18)

-- Create textures from fonts.
-- font:text(text, r, g, b, a) -- ALPHA HAS NO EFFECT RIGHT NOW.
local t = {
	f1:text("Play Game"),
	f1:text("Play Game 2"),
	f1:text("Options"),
	--local t3 = f1:text("Credits")
	f1:text("Exit"),
	}

-- Create buttons from textures.
local b = {}
for i = 1 , #t do
	table.insert( b , buttons.create_from_texture( t[ i ] , 125 , 50 + 50 * i ) )
	end

function on_touch(x, y)
	if b[ 1 ]:contains( x , y ) then 
		dofile( 'screens/difficulty.lua' )
	elseif b[ 2 ]:contains( x , y ) then
		dofile( 'screens/game2.lua' )
	elseif b[ 3 ]:contains( x , y ) then
		dofile( 'screens/options.lua' )
	--elseif b3:contains(x, y) then
	--	dofile('screens/credits.lua')
	elseif b[ 4 ]:contains( x , y ) then
		quit()
		end
	end

function on_update()
	for i = 1 , #b do
		b[ i ]:draw()
		end
	end

-- Backgrounds should be JPG to save space.
-- Foreground objects should be PNG with alpha=0 where background should show through.
