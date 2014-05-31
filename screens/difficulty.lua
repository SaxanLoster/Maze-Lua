local fonts    = require('lua2.fonts')
local waves    = require('lua2.waves')
local textures = require('lua2.textures')
local buttons  = require('lua2.buttons')
local savefile = require('lua2.savefile')

local f1 = fonts.create( 'fonts/DroidSansMono.ttf' , 24 )

local t1 = f1:text( 'Easy' )
local t2 = f1:text( 'Medium' )
local t3 = f1:text( 'Hard' )

local b1 = buttons.create_from_texture( t1 , 125 , 100 )
local b2 = buttons.create_from_texture( t2 , 125 , 150 )
local b3 = buttons.create_from_texture( t3 , 125 , 200 )

gameMode = 1

function on_touch( x , y )
	if     b1:contains( x , y ) then gameMode = 1
	elseif b2:contains( x , y ) then gameMode = 2
	elseif b3:contains( x , y ) then gameMode = 3 end
	dofile( 'screens/game.lua' )
	end

function on_update()
	b1:draw()
	b2:draw()
	b3:draw()
	end