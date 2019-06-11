-- euismod
-- version - alpha 1
-- p1505
--
-- a random grid sequencer,
-- euismod triggers midi notes from
-- a stacked grid.
--
-- notes can be regenerated at random
-- or directly if using a grid controller
--
-- controls
--

----//\\//\\----

--welcome to euismod, version alpha 1

--euismod is an experiment in midi output
--and creating random sequences through collisin detection
--as usual with me the code is messy

--for monome grid, but it isn't essential
--euismod has no roadmap unless users suggest ideas
--please enjoy it, comment on it, suggest ideas for it, and tell me where the code is a mess and how to fix it


-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
--variables
local startStop = true
local screenRefreshMetro
local framesPerSecond = 5
local world
local ball
local rows = 8
local squares = {}
local masterSequence = {
	pos = 0,
	id = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
	data = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
}

--includes
local littleSquare = include('lib/little_square')
local bump = include ('lib/bump')


-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
--basic setup
function init()
	screen.aa(1)
	screen.line_width(1)

	--create our world
	world = bump.newWorld(50)

	--randomise the sequence on init
	randomSequence()

	--create a grid of squares
	for i=1,128 do
		local posX = math.floor(i/rows)
		local posY = i % rows
		squares[i] = littleSquare.new(64+(8*posX), (8*posY), 8, 8, t, "sq"..i)
	end

	--create the ball
	ball = {name="ball"};
	world:add(ball, 30, 30, 4, 4)


	--------------------------------------------------------------------------------------------------------------------------------------------------------
	--create metro
	screenRefreshMetro = metro.init()
	screenRefreshMetro.event = function()
		redraw()
	end
	screenRefreshMetro:start(1/framesPerSecond)
end


-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
--button input

--if button 1
function key (n,z)
  if n == 1 then  --if button 1
	--do
  end

--if button 2
  if n == 2 then  --if button 2
	--do
  end

--if button 3
  if n == 3 then  --if button 3
	--do
  end
end


-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
--encoder input

--if encoder 1
function enc(n,d)
  if n == 1 then --if encoder 1
    --do
  end

--if encoder 2
  if n == 2 then  --if encoder 2
    --do
  end

--if encoder 3
  if n == 3 then  --if encoder 3
    --do
  end
end


-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
--draw the graphical interface
function redraw()
	screen.clear()
	screen.level(4)
	screen.move(2, 8)
	screen.text("euismod")

	for i=1,(#squares) do
		squares[i].drawSquare()
	end
	  
	screen.update()
  end


-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
--create a random sequence

function randomSequence()
	for i=1,(#masterSequence.data) do
		masterSequence.data[i] = (math.random(0, 127));
		masterSequence.id[i] = i;
		print("i: "..i)
	end
  redraw()
end