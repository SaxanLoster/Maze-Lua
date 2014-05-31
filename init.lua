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
local t1 = f1:text("Play Game")
local t2 = f1:text("Options")
--local t3 = f1:text("Credits")
local t4 = f1:text("Exit")

-- Create textures from image files.
--local bg = textures.image('bg/schoolFiller.jpg')
local bg = textures.text(f1,"",0,0,0,0)
--local c1 = textures.image('images/Cara.png') 

-- Create buttons from textures.
local b1 = buttons.create_from_texture(t1, 125, 100)
local b2 = buttons.create_from_texture(t2, 125, 150)
--local b3 = buttons.create_from_texture(t3, 125, 200)
local b4 = buttons.create_from_texture(t4, 125, 200)

function on_touch(x, y)
	if b1:contains(x, y) then 
		dofile('screens/game.lua')
	elseif b2:contains(x, y) then
		dofile('screens/options.lua')
	--elseif b3:contains(x, y) then
	--	dofile('screens/credits.lua')
	elseif b4:contains(x, y) then
		quit()
		end
	end

function on_update()
	--bg:draw() -- Background textures must be drawn first.
	b1:draw()
	b2:draw()
	--b3:draw()
	b4:draw()
	end

-- Backgrounds should be JPG to save space.
-- Foreground objects should be PNG with alpha=0 where background should show through.
