local mazegenerator = {}

math.randomseed( os.time() )

function insideMaze( x , y , w , h )
	return x >= 1 and y >= 1 and x <= w and y <= h
	end

function addSquare( maze , neighbors , x , y )
	if insideMaze( x , y , maze.width , maze.height ) and maze[ x ][ y ] == 0 then
		neighbors[ #neighbors + 1 ] = { x , y }
		end
	end

function hasbit( x , p ) 
	return x % ( p + p ) >= p 
	end

function mazegenerator.setWall( maze , x , y , direction )

	if not insideMaze( x , y , maze.width , maze.height ) then return end
	local val = maze[ y ][ x ]

	if hasbit( val , 2 ^ direction ) then
		maze[ y ][ x ] = val - 2 ^ direction
		end

	end

function knockDownWall( maze , x1 , y1 , x2 , y2 )

	local isUp    = y1 > y2
	local isRight = x1 < x2
	local isDown  = y1 < y2
	local isLeft  = x1 > x2

	if isUp then
		maze[ x1 ][ y1 ] = maze[ x1 ][ y1 ] + 1
		maze[ x2 ][ y2 ] = maze[ x2 ][ y2 ] + 4
	elseif isRight then
		maze[ x1 ][ y1 ] = maze[ x1 ][ y1 ] + 2
		maze[ x2 ][ y2 ] = maze[ x2 ][ y2 ] + 8
	elseif isDown then
		maze[ x1 ][ y1 ] = maze[ x1 ][ y1 ] + 4
		maze[ x2 ][ y2 ] = maze[ x2 ][ y2 ] + 1
	elseif isLeft then
		maze[ x1 ][ y1 ] = maze[ x1 ][ y1 ] + 8
		maze[ x2 ][ y2 ] = maze[ x2 ][ y2 ] + 2
		end

	end

function mazegenerator.createMaze( w , h )

	local maze = { width = w , height = h }

	for x = 1 , w do
		maze[ x ] = {}
		for y = 1 , h do
			maze[ x ][ y ] = 0
			end
		end
	
	local stack  = { { math.random( w ) , math.random( h ) } }

	while #stack > 0 do
		local currentSquare = stack[ #stack ]
		local x , y = currentSquare[ 1 ] , currentSquare[ 2 ]
		local neighbors = {}

		addSquare( maze , neighbors , x + 1 , y     )
		addSquare( maze , neighbors , x     , y + 1 )
		addSquare( maze , neighbors , x - 1 , y     )
		addSquare( maze , neighbors , x     , y - 1 )
		
		if #neighbors == 0 then
			table.remove( stack , #stack )
		else
			local randomNeighbor = neighbors[ math.random( #neighbors ) ]
			knockDownWall( maze , x , y , randomNeighbor[ 1 ] , randomNeighbor[ 2 ] )
			stack[ #stack + 1 ] = randomNeighbor
			end
		end

	maze[ w ][ h ] = maze[ w ][ h ] + 2

	return maze

	end

return mazegenerator
