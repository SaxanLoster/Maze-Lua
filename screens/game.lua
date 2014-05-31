local fonts    = require( 'lua2.fonts' )
local waves    = require( 'lua2.waves' )
local textures = require( 'lua2.textures' )
local buttons  = require( 'lua2.buttons' )
local savefile = require( 'lua2.savefile' )

local screenSizeX = app_width
local screenSizeY = app_height

local mazeSizeX = 63
local mazeSizeY = 63

local tileCountX = 1
local tileCountY = 1

local screenCountX = mazeSizeX / tileCountX
local screenCountY = mazeSizeY / tileCountY

local tileSizeX = 200
local tileSizeY = 200

local tileStartX = ( screenSizeX - ( tileSizeX * tileCountX ) ) / 2
local tileStartY = ( screenSizeY - ( tileSizeY * tileCountY ) ) / 2

local arrowSize = 100

local arrow1 = buttons.create_from_texture( textures.image( 'images/arrow1.png' ) , ( screenSizeX - arrowSize ) / 2 , ( ( ( screenSizeY - tileSizeY ) / 2 ) - arrowSize ) / 2 , arrowSize , arrowSize )
local arrow2 = buttons.create_from_texture( textures.image( 'images/arrow2.png' ) , screenSizeX - arrowSize -  ( ( ( screenSizeX - tileSizeX ) / 2 ) - arrowSize ) / 2 , ( screenSizeY - arrowSize ) / 2 , arrowSize , arrowSize )
local arrow4 = buttons.create_from_texture( textures.image( 'images/arrow4.png' ) , ( screenSizeX - arrowSize ) / 2 , screenSizeY - arrowSize - ( ( ( screenSizeY - tileSizeY ) / 2 ) - arrowSize ) / 2 , arrowSize , arrowSize )
local arrow8 = buttons.create_from_texture( textures.image( 'images/arrow8.png' ) , ( ( ( screenSizeX - tileSizeX ) / 2 ) - arrowSize ) / 2 , ( screenSizeY - arrowSize ) / 2 , arrowSize , arrowSize )

local maze1 = "0 x 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 a a a c 0 2 a a a c 0 4 0 2 a a a e a a a 8 0 6 a 8 0 4 0 2 a e a a a 8 0 4 0 2 a a a c 0 6 a a a 8 0 4 0 6 a 8 0 2 a c 0 0 0 0 0 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 0 2 a c 0 7 a a a a a f a b a c 0 4 0 7 a 8 0 4 0 7 a 8 0 5 0 4 0 7 a 8 0 4 0 3 a e a e a d 0 5 0 6 a e a b a b a 8 0 2 a d 0 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 5 0 5 0 0 0 5 0 5 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 5 0 5 0 5 0 5 0 5 0 5 0 0 0 0 0 0 0 0 0 5 0 0 6 a f a d 0 6 a c 0 1 0 4 0 5 0 7 a b a a a 9 0 5 0 4 0 5 0 5 0 5 0 2 a d 0 2 a 9 0 1 0 7 a f a 9 0 1 0 6 a a a 8 0 2 a 9 0 0 5 0 5 0 5 0 5 0 5 0 0 0 5 0 5 0 5 0 0 0 0 0 0 0 5 0 5 0 5 0 5 0 5 0 0 0 5 0 0 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 1 0 1 0 1 0 1 0 7 a a a b a b a f a 8 0 4 0 6 a b a b a b a 9 0 7 a 8 0 5 0 6 a 8 0 2 a d 0 1 0 6 a e a f a 8 0 6 a 8 0 4 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 5 0 0 0 5 0 5 0 0 0 0 0 0 0 0 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 5 0 0 4 0 4 0 4 0 4 0 1 0 2 a e a c 0 3 a a a d 0 5 0 4 0 4 0 6 a e a 9 0 2 a b a d 0 4 0 6 a b a e a 9 0 1 0 1 0 6 a b a a a 9 0 0 5 0 5 0 5 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 5 0 5 0 5 0 5 0 5 0 0 0 0 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 5 0 3 a d 0 5 0 2 a c 0 1 0 7 a 8 0 2 a d 0 5 0 3 a b a d 0 1 0 6 a 8 0 2 a b a d 0 5 0 4 0 1 0 6 a 8 0 2 a f a 8 0 4 0 0 0 0 5 0 0 0 5 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 0 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 0 3 a a a d 0 5 0 2 a b a e a b a e a 8 0 5 0 7 a 8 0 2 a d 0 6 a b a a a 8 0 2 a b a d 0 7 a a a b a 8 0 4 0 3 a e a 9 0 4 0 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 0 4 0 6 a d 0 5 0 4 0 4 0 1 0 4 0 7 a e a b a f a 8 0 4 0 7 a b a 8 0 4 0 4 0 4 0 6 a b a 9 0 6 a 8 0 2 a b a c 0 5 0 6 a 9 0 0 5 0 5 0 5 0 5 0 5 0 5 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 5 0 5 0 5 0 0 0 0 0 5 0 0 0 0 0 0 0 5 0 5 0 5 0 0 0 0 3 a 9 0 7 a d 0 7 a d 0 4 0 5 0 1 0 1 0 4 0 5 0 4 0 7 a 9 0 4 0 6 a 9 0 5 0 5 0 7 a a a a a f a a a 8 0 2 a b a f a f a 8 0 0 0 0 0 0 5 0 5 0 5 0 5 0 5 0 5 0 0 0 0 0 5 0 5 0 5 0 5 0 0 0 5 0 5 0 0 0 5 0 5 0 5 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 5 0 5 0 0 0 0 2 a a a 9 0 3 a 9 0 3 a f a d 0 2 a a a d 0 5 0 3 a d 0 6 a 9 0 7 a 8 0 7 a b a b a 8 0 2 a d 0 6 a a a e a e a 9 0 3 a c 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 0 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 4 0 6 a a a a a a a c 0 5 0 1 0 4 0 4 0 3 a f a a a b a b a 8 0 7 a a a b a a a e a a a 8 0 3 a b a 8 0 5 0 3 a c 0 4 0 1 0 0 5 0 5 0 0 0 0 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 5 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 5 0 5 0 0 0 0 3 a 9 0 2 a a a c 0 7 a f a e a 9 0 3 a a a b a e a 8 0 4 0 4 0 7 a a a a a 8 0 3 a a a 8 0 6 a a a 8 0 3 a 8 0 7 a d 0 0 0 0 0 0 0 0 0 0 0 0 5 0 5 0 5 0 5 0 0 0 0 0 0 0 0 0 5 0 0 0 5 0 5 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 5 0 5 0 0 0 0 4 0 6 a 8 0 4 0 5 0 1 0 1 0 5 0 2 a a a c 0 2 a f a 8 0 7 a b a b a e a e a c 0 6 a a a a a f a e a 8 0 2 a a a d 0 7 a 8 0 0 5 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 5 0 5 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 5 0 5 0 0 0 0 3 a f a a a b a f a a a a a f a e a e a b a e a b a c 0 7 a a a 8 0 5 0 1 0 7 a f a a a 8 0 1 0 7 a a a a a c 0 1 0 7 a 8 0 0 0 0 5 0 0 0 0 0 5 0 0 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 5 0 0 0 0 0 0 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 0 6 a d 0 4 0 2 a b a 8 0 2 a d 0 5 0 1 0 6 a d 0 4 0 3 a b a e a 8 0 7 a 8 0 5 0 7 a a a a a c 0 3 a a a 8 0 3 a 8 0 7 a 8 0 0 5 0 5 0 5 0 0 0 0 0 0 0 0 0 5 0 5 0 0 0 5 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 1 0 5 0 3 a e a c 0 2 a e a 9 0 5 0 2 a d 0 7 a f a e a c 0 7 a c 0 7 a 8 0 5 0 7 a c 0 4 0 1 0 4 0 6 a c 0 2 a c 0 7 a c 0 0 0 0 5 0 0 0 5 0 5 0 0 0 5 0 0 0 5 0 0 0 5 0 5 0 5 0 5 0 5 0 5 0 5 0 5 0 0 0 5 0 5 0 5 0 5 0 0 0 5 0 5 0 5 0 0 0 5 0 5 0 5 0 0 2 a 9 0 6 a d 0 3 a a a d 0 4 0 1 0 6 a 9 0 5 0 1 0 1 0 5 0 5 0 1 0 1 0 2 a 9 0 1 0 7 a b a 8 0 7 a d 0 3 a a a 9 0 5 0 1 0 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 5 0 0 0 0 2 a a a 9 0 5 0 6 a e a b a f a 8 0 7 a 8 0 7 a e a 8 0 5 0 7 a a a 8 0 6 a 8 0 6 a f a c 0 6 a d 0 1 0 4 0 6 a 8 0 1 0 4 0 0 0 0 0 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 5 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 5 0 5 0 5 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 2 a a a e a 9 0 5 0 1 0 2 a d 0 2 a f a 8 0 5 0 3 a c 0 1 0 7 a a a a a f a 8 0 5 0 5 0 7 a d 0 3 a e a f a f a 8 0 4 0 5 0 0 0 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 0 0 5 0 5 0 5 0 5 0 0 0 5 0 5 0 5 0 0 0 5 0 5 0 0 6 a a a f a c 0 3 a c 0 2 a f a 8 0 1 0 6 a d 0 6 a f a 8 0 7 a a a c 0 7 a c 0 5 0 5 0 5 0 7 a 8 0 1 0 1 0 7 a a a b a 9 0 0 5 0 0 0 5 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 5 0 5 0 5 0 0 0 5 0 0 0 5 0 5 0 5 0 5 0 5 0 5 0 5 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 5 0 6 a d 0 7 a 8 0 5 0 6 a b a e a c 0 1 0 5 0 1 0 7 a 8 0 7 a c 0 1 0 5 0 5 0 1 0 1 0 5 0 7 a e a a a 8 0 7 a a a e a 8 0 0 5 0 5 0 5 0 5 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 5 0 0 0 5 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 0 1 0 1 0 1 0 5 0 2 a 9 0 3 a c 0 1 0 5 0 4 0 1 0 6 a f a 8 0 5 0 1 0 4 0 1 0 7 a a a 8 0 5 0 5 0 3 a 8 0 2 a f a c 0 3 a c 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 5 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 5 0 5 0 0 0 5 0 0 2 a e a c 0 1 0 4 0 4 0 2 a 9 0 6 a b a f a 8 0 5 0 1 0 2 a f a a a d 0 4 0 7 a 8 0 4 0 5 0 7 a a a 8 0 6 a d 0 3 a 8 0 1 0 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 0 0 5 0 5 0 5 0 0 0 5 0 5 0 5 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 0 2 a d 0 3 a a a d 0 3 a c 0 2 a f a 8 0 3 a c 0 1 0 6 a a a d 0 6 a 9 0 5 0 7 a a a 9 0 5 0 3 a a a c 0 5 0 7 a a a e a 8 0 0 0 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 0 2 a d 0 2 a e a f a a a b a e a b a e a 8 0 1 0 6 a d 0 2 a d 0 3 a e a d 0 3 a e a 8 0 7 a 8 0 6 a 9 0 5 0 7 a 8 0 7 a 8 0 0 0 0 5 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 5 0 0 0 5 0 0 0 5 0 5 0 0 0 5 0 0 0 5 0 0 0 5 0 0 0 5 0 5 0 0 0 5 0 0 0 0 6 a 9 0 6 a 9 0 5 0 2 a a a f a c 0 7 a c 0 4 0 1 0 1 0 2 a d 0 2 a d 0 7 a 8 0 1 0 2 a b a 8 0 7 a 8 0 5 0 3 a 8 0 7 a 8 0 0 5 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 5 0 5 0 5 0 5 0 0 0 0 0 0 0 5 0 0 0 5 0 5 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 5 0 0 0 0 0 5 0 0 0 0 1 0 2 a f a 8 0 7 a 8 0 4 0 5 0 5 0 5 0 5 0 3 a a a a a a a f a 8 0 1 0 7 a c 0 6 a 8 0 4 0 4 0 1 0 6 a f a e a 8 0 3 a 8 0 0 0 0 0 0 5 0 0 0 5 0 0 0 5 0 5 0 5 0 5 0 5 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0 5 0 5 0 5 0 0 0 5 0 5 0 0 0 5 0 5 0 5 0 0 0 0 0 0 0 0 6 a c 0 1 0 2 a 9 0 2 a b a d 0 5 0 5 0 1 0 4 0 2 a a a a a d 0 6 a 8 0 1 0 7 a b a a a b a 9 0 4 0 5 0 1 0 3 a a a e a 8 0 0 5 0 5 0 0 0 0 0 0 0 0 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 0 0 0 0 5 0 5 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 5 0 0 0 0 1 0 5 0 6 a a a a a a a e a 9 0 1 0 3 a 8 0 3 a a a a a e a f a b a a a 8 0 5 0 4 0 6 a a a a a 9 0 7 a e a e a 8 0 5 0 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 5 0 0 0 0 0 0 0 5 0 5 0 5 0 0 0 0 0 0 0 5 0 5 0 5 0 0 0 5 0 0 0 0 4 0 7 a d 0 6 a e a a a f a a a a a e a a a a a 8 0 6 a d 0 7 a a a e a c 0 3 a b a b a a a e a 8 0 5 0 1 0 1 0 2 a f a 8 0 0 5 0 5 0 5 0 5 0 5 0 0 0 5 0 0 0 0 0 5 0 0 0 0 0 0 0 5 0 5 0 5 0 0 0 5 0 5 0 0 0 0 0 0 0 0 0 5 0 0 0 5 0 0 0 0 0 0 0 5 0 0 0 0 3 a 9 0 1 0 1 0 1 0 2 a b a 8 0 2 a b a 8 0 2 a a a 9 0 1 0 3 a 8 0 1 0 3 a 8 0 2 a a a 8 0 3 a 8 0 3 a a a 8 0 2 a f a 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 y 0 0 0"
local maze = {}

function myHas( v , a )
	for i = 1 , #a do
		if v == a[i] then return true end
		end
	return false
	end

--[[ 1 tile per screen ]]
	for col = 1 , mazeSizeX do
		maze[col] = {}
		end
	local col = 1
	local row = 1
	for value in maze1.gmatch( maze1 , "%S" ) do
		local style = '-1'
		if myHas( value , { '5' , '7' , 'd' } ) and value == maze[col][row-1].v then style = maze[col][row-1].s == '-1' and '-2' or '-1' end
		if myHas( value , { 'a' , 'b' , 'e' } ) and value == maze[col-1][row].v then style = maze[col-1][row].s == '-1' and '-2' or '-1' end
		if value == 'f' then style = '-' .. math.random( 1 , 4 ) end
		maze[col][row] = { v = value , s = style }
		col = col + 1
		if col == mazeSizeX + 1 then col , row = 1 , row + 1 end
		end

	currentPosition = { x = 2 , y = 1 }
	gameOver = false

	print ( '( ' .. currentPosition.x .. ' , ' .. currentPosition.y .. ' )' )

	function on_update()
		textures.image( 'images/path-' .. maze[currentPosition.x][currentPosition.y].v .. maze[currentPosition.x][currentPosition.y].s .. '.png' ):draw( tileStartX , tileStartY , tileSizeX , tileSizeY )
		if maze[currentPosition.x][currentPosition.y].v == 'x' then arrow4:draw() end
		if maze[currentPosition.x][currentPosition.y].v == 'y' then
			fonts.create( 'fonts/DroidSansMono.ttf' , 48 ):text( 'You Win' ):draw( 100 , 100 )
			gameOver = true
			end
		if myHas( maze[currentPosition.x][currentPosition.y].v , { '1' , '3' , '5' , '7' , '9' , 'b' , 'd' , 'f' } ) then arrow1:draw() end
		if myHas( maze[currentPosition.x][currentPosition.y].v , { '2' , '3' , '6' , '7' , 'a' , 'b' , 'e' , 'f' } ) then arrow2:draw() end
		if myHas( maze[currentPosition.x][currentPosition.y].v , { '4' , '5' , '6' , '7' , 'c' , 'd' , 'e' , 'f' } ) then arrow4:draw() end
		if myHas( maze[currentPosition.x][currentPosition.y].v , { '8' , '9' , 'a' , 'b' , 'c' , 'd' , 'e' , 'f' } ) then arrow8:draw() end
		end

	function on_touch( x , y )
		if gameOver then dofile( 'init.lua' ) end
		if arrow4:contains( x , y ) and maze[currentPosition.x][currentPosition.y].v == 'x' then currentPosition.y = currentPosition.y + 1 end
		if arrow1:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y].v , { '1' , '3' , '5' , '7' , '9' , 'b' , 'd' , 'f' } ) then currentPosition.y = currentPosition.y - 1 end
		if arrow2:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y].v , { '2' , '3' , '6' , '7' , 'a' , 'b' , 'e' , 'f' } ) then currentPosition.x = currentPosition.x + 1 end
		if arrow4:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y].v , { '4' , '5' , '6' , '7' , 'c' , 'd' , 'e' , 'f' } ) then currentPosition.y = currentPosition.y + 1 end
		if arrow8:contains( x , y ) and myHas( maze[currentPosition.x][currentPosition.y].v , { '8' , '9' , 'a' , 'b' , 'c' , 'd' , 'e' , 'f' } ) then currentPosition.x = currentPosition.x - 1 end
		if currentPosition.x < 1 then currentPosition.x = 1 end
		if currentPosition.y < 1 then currentPosition.y = 1 end
		if currentPosition.x > screenSizeX then currentPosition.x = screenSizeX end
		if currentPosition.y > screenSizeY then currentPosition.y = screenSizeY end
		print ( '( ' .. currentPosition.x .. ' , ' .. currentPosition.y .. ' )' )
		end

--[[ 2+ tiles per screen ]
	for colS = 1, screenCountX do
		maze[colS] = {}
		for rowS = 1, screenCountY do
			maze[colS][rowS] = {}
			for colT = 1, tileCountX do
				maze[colS][rowS][colT] = {}
				end
			end
		end

	local colS = 1
	local rowS = 1
	local colT = 1
	local rowT = 1

	for value in maze1.gmatch( maze1 , "%S" ) do
		maze[colS][rowS][colT][rowT] = {
			x = tileStartX + tileSizeX * ( colT - 1 ),
			y = tileStartY + tileSizeY * ( rowT - 1 ),
			v = value
			}
		setmetatable( maze[colS][rowS][colT][rowT] , mt )
		colT = colT + 1
		if colT == tileCountX + 1 then
			colT = 1
			colS = colS + 1
			end
		if colS == screenCountX + 1 then
			colS = 1
			rowT = rowT + 1
			end
		if rowT == tileCountY + 1 then
			rowT = 1
			rowS = rowS + 1
			end
		end
	currentScreen = {
		x = 1,
		y = 1
		}

	function on_update()
		for col = 1 , tileCountX do
			for row = 1 , tileCountY do
				--print( '( ' .. col .. ' , ' .. row .. ' )' )
				textures.image( 'images/path-' .. maze[currentScreen.x][currentScreen.y][col][row].v .. '.png' ):draw( maze[currentScreen.x][currentScreen.y][col][row].x , maze[currentScreen.x][currentScreen.y][col][row].y , tileSizeX , tileSizeY )
				end
			end
		end

	function on_touch( x , y )
		currentScreen.x = currentScreen.x + 1
		end
	--[[]]
