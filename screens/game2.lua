-- Lua2 folder files
	local fonts    = require( 'lua2.fonts' )
	local waves    = require( 'lua2.waves' )
	local textures = require( 'lua2.textures' )
	local buttons  = require( 'lua2.buttons' )
	local savefile = require( 'lua2.savefile' )
	local mazeHold = require( 'lua2.mazes' )
	local mazeGen  = require( 'lua2.maze2' )

-- Screen Size
	local sSX = app_width
	local sSY = app_height

-- Maze Size
	local mSX = 3
	local mSY = 3

-- Tile and Arrow Size
	local aS = 100
	local tS = 200

-- Postion Tiles
	local tileStartX = ( sSX - tS ) / 2
	local tileStartY = ( sSY - tS ) / 2

-- Directional Arrows
	local arrow1 = buttons.create_from_texture( textures.image( 'images/arrow1.png' ) ,            ( ( ( sSX            )      ) - aS ) / 2 ,            ( ( ( sSY - tS ) / 2 ) - aS )        / 2 , aS , aS )
	local arrow2 = buttons.create_from_texture( textures.image( 'images/arrow2.png' ) , sSX - aS - ( ( ( sSX - tS ) / 2 ) - aS )        / 2 ,            ( ( ( sSY            )      ) - aS ) / 2 , aS , aS )
	local arrow4 = buttons.create_from_texture( textures.image( 'images/arrow4.png' ) ,            ( ( ( sSX            )      ) - aS ) / 2 , sSY - aS - ( ( ( sSY - tS ) / 2 ) - aS )        / 2 , aS , aS )
	local arrow8 = buttons.create_from_texture( textures.image( 'images/arrow8.png' ) ,            ( ( ( sSX - tS ) / 2 ) - aS )        / 2 ,            ( ( ( sSY             )     ) - aS ) / 2 , aS , aS )

local maze = mazeGen.createMaze( mSX , mSY )

function myHas( v , a )
	for i = 1 , #a do if v == a[i] then return true end end
	return false
	end

currentPosition = { x = 1 , y = 1 }

function on_update()
	textures.image( 'images/path-' .. maze[currentPosition.x][currentPosition.y] .. '.png' ):draw( tileStartX , tileStartY , tS , tS )
	if maze[currentPosition.x][currentPosition.y] == 16 then fonts.create( 'fonts/DroidSansMono.ttf' , 48 ):text( 'You Win' ):draw( 100 , 100 ) ; gameOver = true end
	if myHas( maze[currentPosition.x][currentPosition.y] , {  1 ,  3 ,  5 ,  7 ,  9 , 11 , 13 , 15 } ) then arrow1:draw() end
	if myHas( maze[currentPosition.x][currentPosition.y] , {  2 ,  3 ,  6 ,  7 , 10 , 11 , 14 , 15 } ) then arrow2:draw() end
	if myHas( maze[currentPosition.x][currentPosition.y] , {  4 ,  5 ,  6 ,  7 , 12 , 13 , 14 , 15 } ) then arrow4:draw() end
	if myHas( maze[currentPosition.x][currentPosition.y] , {  8 ,  9 , 10 , 11 , 12 , 13 , 14 , 15 } ) then arrow8:draw() end
	end

function on_touch( x , y )
	if gameOver then dofile( 'init.lua' ) end
	if false then
	elseif arrow1:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y] , {  1 ,  3 ,  5 ,  7 ,  9 , 11 , 13 , 15 } ) then currentPosition.y = currentPosition.y - 1
	elseif arrow2:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y] , {  2 ,  3 ,  6 ,  7 , 10 , 11 , 14 , 15 } ) then currentPosition.x = currentPosition.x + 1
	elseif arrow4:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y] , {  4 ,  5 ,  6 ,  7 , 12 , 13 , 14 , 15 } ) then currentPosition.y = currentPosition.y + 1
	elseif arrow8:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y] , {  8 ,  9 , 10 , 11 , 12 , 13 , 14 , 15 } ) then currentPosition.x = currentPosition.x - 1 end
	if currentPosition.x < 1 then currentPosition.x = 1 end
	if currentPosition.y < 1 then currentPosition.y = 1 end
	if currentPosition.x > sSX then currentPosition.x = sSX end
	if currentPosition.y > sSY then currentPosition.y = sSY end
	print ( '( ' .. currentPosition.x .. ' , ' .. currentPosition.y .. ' )' )
	end
