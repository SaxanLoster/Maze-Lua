local fonts    = require('lua2.fonts')
local waves    = require('lua2.waves')
local textures = require('lua2.textures')
local buttons  = require('lua2.buttons')


local f1 = fonts.create("fonts/DroidSansMono.ttf", 24)
local f2 = fonts.create("fonts/DroidSansMono.ttf", 18)

local t1 = f1:text("Saxan Loster")
local tE = f2:text("Back to Title Page")

local bE = buttons.create_from_texture( tE , 75 , 300 )

function on_touch( x , y )
	if bE:contains( x , y ) then dofile( 'init.lua' ) end
	end

function on_update()
	t1:draw( 75 , 50 )
	bE:draw()
	end