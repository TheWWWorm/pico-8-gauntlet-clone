id_to_entity_map = {
  [36] = spawner_register
}

function init_map_entities()
  for x = 0, global.map.max_x, 1 do 
    for y = 0, global.map.max_y, 1 do 
      tile_number = mget(x, y)
      if id_to_entity_map[tile_number] then
        id_to_entity_map[tile_number](x * 8, y * 8)
      end
    end
  end
end

function isOverlaping(entity) 
  for key, value in pairs(global.entities) do
    if (value.state.id ~= entity.id) then
      local hasOverlap = overlap(entity, value.state)
      if hasOverlap then return true end
    end
  end
  return false
end

function overlap(a,b)
  return not (a.x>b.x+b.w 
           or a.y>b.y+b.h 
           or a.x+a.w<b.x 
           or a.y+a.h<b.y)
end