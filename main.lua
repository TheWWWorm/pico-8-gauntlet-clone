global = {}
global.frame = 0

function _init()
	init_player()
end

function _update()
  -- Support animations until 5seconds
  if (global.frame == 1800) then
    global.frame = 0
  else  
    global.frame+=1
  end
	check_player_controls()
end
 
function _draw()
  cls()
  camera_follow()
  map(0, 0, 0, 0, 33,36)
  draw_player() 
end
