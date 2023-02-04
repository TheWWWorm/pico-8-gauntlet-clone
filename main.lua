function _init()
  global.map = {
    max_x = 33,
    max_y = 36
  }
  init_map_entities()
end

function _update()
  -- Support animations until 5seconds
  if (global.frame == 18000) then
    global.frame = 0
  else  
    global.frame+=1
  end

  -- Update Entities
  runEntityUpdate()
end
 
function _draw()
  -- Clear and draw map
  cls()
  map(0, 0, 0, 0, global.map.max_x, global.map.max_y)

  -- Draw entities
  runEntityDraw()
end
