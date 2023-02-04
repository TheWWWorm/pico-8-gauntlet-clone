function spawner_init(state)
  state.id = global.latestId
  state.w = 7
  state.h = 7	
  state.sprites= {36, 37}
  state.invertX = false
  return state
end

function spawner_update(state) 
  if (global.frame % 60 == 0) then
    local done = false
    foreach(waysPixel, function(wayX)
      if (done) return
      foreach(waysPixel, function(wayY)
        if (done) return

        local newX = state.x + wayX
        local newY = state.y + wayY
        local sprite_number = mget(newX / 8, newY / 8)
        if (sprite_number == 9) then 
          local hasOverlap = isOverlaping({
            x = newX,
            y = newY,
            h = 7,
            w = 7
          })
          if (not hasOverlap) then 
            ghost_register(newX, newY)
            done = true
          end
        end
      end)
    end)
  end
end

function spawner_draw(state) 
  animate_spr(state.sprites, state.x, state.y, 20, state.invertX)
end

function spawner_register(x, y) 
  addEntityToState({
    state = spawner_init({x = x, y = y}),
    update = spawner_update,
    draw = spawner_draw
  })
end
