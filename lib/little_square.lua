local Little_Square = {}

function Little_Square.new(_x, _y, _w, _h, _t, _id)
	local littleSquare = {}
	print("Little_Square says hello")

	local x = _x;
	local y = _y;
	local w = _w;
	local h = _h;
	local t = _t;
	local id = _id;


	function littleSquare.drawSquare()
		screen.level(0)
		screen.rect(x, y, w, h)
		screen.fill()
		screen.level(6)
		screen.rect(x+1, y+1, w-2, h-2)
		screen.fill()
		screen.update()
	end

	function littleSquare.updateScreen(x, y, w, h)
		screen.update()
	end

	return littleSquare
end

return Little_Square