-- Lua2 folder files
	local fonts    = require( 'lua2.fonts' )
	local waves    = require( 'lua2.waves' )
	local textures = require( 'lua2.textures' )
	local buttons  = require( 'lua2.buttons' )
	local savefile = require( 'lua2.savefile' )
	local mazeHold = require( 'lua2.mazes' )

-- Screen Size
	local sSX = app_width
	local sSY = app_height

-- Maze Size
	local mSX = 5 --gameMode == 1 and 23 or gameMode == 2 and 43 or 63
	local mSY = 5 --gameMode == 1 and 23 or gameMode == 2 and 43 or 63

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

local maze = mazeHold.createMaze( mSX , mSY )

for i = 1 , mSX do
	for j = 1 , mSY do
		print( maze[i][j] )
		end
	end

--local randomMaze = gameMode == 1 and mazeHold.getE() or gameMode == 2 and mazeHold.getM() or mazeHold.getH()

function myHas( v , a )
	for i = 1 , #a do if v == a[i] then return true end end
	return false
	end

--for col = 1 , mSX do maze[col] = {} end

--local col , row = 1 , 1

--[[
for value in string.gmatch( randomMaze , "%S" ) do
	local style = '-1'
	if myHas( value , { '5' , '7' , 'd' } ) and value == maze[col][row-1].v then style = maze[col][row-1].s == '-1' and '-2' or '-1' end
	if myHas( value , { 'a' , 'b' , 'e' } ) and value == maze[col-1][row].v then style = maze[col-1][row].s == '-1' and '-2' or '-1' end
	if value == 'f' then style = '-' .. math.random( 1 , 4 ) end
	maze[col][row] = { v = value , s = style }
	col = col + 1
	if col == mSX + 1 then col , row = 1 , row + 1 end
	end
	]]--

currentPosition = { x = 1 , y = 1 }
gameOver = false

print( '( ' .. currentPosition.x .. ' , ' .. currentPosition.y .. ' )' )

function on_update()
	--textures.image( 'images/path-' .. maze[currentPosition.x][currentPosition.y].v .. maze[currentPosition.x][currentPosition.y].s .. '.png' ):draw( tileStartX , tileStartY , tS , tS )
	textures.image( 'images/path-' .. maze[currentPosition.x][currentPosition.y] .. '.png' ):draw( tileStartX , tileStartY , tS , tS )
	--if maze[currentPosition.x][currentPosition.y].v == 'x' then arrow4:draw() end
	--if maze[currentPosition.x][currentPosition.y].v == 'y' then fonts.create( 'fonts/DroidSansMono.ttf' , 48 ):text( 'You Win' ):draw( 100 , 100 ) ; gameOver = true end
	if myHas( maze[currentPosition.x][currentPosition.y]--[[.v , { '1' , '3' , '5' , '7' , '9' , 'b' , 'd' , 'f' }]], { 1 , 3 , 5 , 7 , 9 , 11 , 13 , 15 } ) then arrow1:draw() end
	if myHas( maze[currentPosition.x][currentPosition.y]--[[.v , { '2' , '3' , '6' , '7' , 'a' , 'b' , 'e' , 'f' }]], { 2 , 3 , 6 , 7 , 10 , 11 , 14 , 15 } ) then arrow2:draw() end
	if myHas( maze[currentPosition.x][currentPosition.y]--[[.v , { '4' , '5' , '6' , '7' , 'c' , 'd' , 'e' , 'f' }]], { 4 , 5 , 6 , 7 , 12 , 13 , 14 , 15 } ) then arrow4:draw() end
	if myHas( maze[currentPosition.x][currentPosition.y]--[[.v , { '8' , '9' , 'a' , 'b' , 'c' , 'd' , 'e' , 'f' }]], { 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 } ) then arrow8:draw() end
	end

function on_touch( x , y )
	if gameOver then dofile( 'init.lua' ) end
	--[[if arrow4:contains( x , y ) and maze[currentPosition.x][currentPosition.y].v == 'x' then currentPosition.y = currentPosition.y + 1
	elseif arrow1:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y].v , { '1' , '3' , '5' , '7' , '9' , 'b' , 'd' , 'f' } ) then currentPosition.y = currentPosition.y - 1
	elseif arrow2:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y].v , { '2' , '3' , '6' , '7' , 'a' , 'b' , 'e' , 'f' } ) then currentPosition.x = currentPosition.x + 1
	elseif arrow4:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y].v , { '4' , '5' , '6' , '7' , 'c' , 'd' , 'e' , 'f' } ) then currentPosition.y = currentPosition.y + 1
	elseif arrow8:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y].v , { '8' , '9' , 'a' , 'b' , 'c' , 'd' , 'e' , 'f' } ) then currentPosition.x = currentPosition.x - 1 end
	]]
	if arrow1:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y] , { 1 , 3 , 5 , 7 , 9 , 11 , 13 , 15 } ) then currentPosition.x = currentPosition.x - 1
	elseif arrow2:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y] , { 2 , 3 , 6 , 7 , 10 , 11 , 14 , 15 } ) then currentPosition.y = currentPosition.y + 1
	elseif arrow4:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y] , { 4 , 5 , 6 , 7 , 12 , 13 , 14 , 15 } ) then currentPosition.x = currentPosition.x + 1
	elseif arrow8:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y] , { 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 } ) then currentPosition.y = currentPosition.y - 1 end
	if currentPosition.x < 1 then currentPosition.x = 1 end
	if currentPosition.y < 1 then currentPosition.y = 1 end
	if currentPosition.x > sSX then currentPosition.x = sSX end
	if currentPosition.y > sSY then currentPosition.y = sSY end
	print ( '( ' .. currentPosition.x .. ' , ' .. currentPosition.y .. ' )' )
	end