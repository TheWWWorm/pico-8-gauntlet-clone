-- This a tempalte for the arrow
function projectile_init(state)
  state.id = global.latestId
  state.w = 7
  state.h = 7	
  state.frame = 0
  return state
end

function projectile_update(state)
  state.frame += 1
  if (state.frame >= state.maxFrames) then
    return -1
  end
  if (can_move(state.x + state.dx, state.y, state.w, state.h)) then
    state.x += state.dx * state.spd
  else
    return -1 
  end 
  
  if (can_move(state.x, state.y + state.dy, state.w, state.h)) then
    state.y += state.dy * state.spd
  else
    return -1 
  end 
end

function projectile_draw(state) 
  animate_spr(state.sprites, state.x, state.y, 8, state.invertX)
end

-- Params should be
-- x, y, dx, dy, spd, sprites
function projectile_register(params) 
  addEntityToState({
    state = projectile_init(params),
    update = projectile_update,
    draw = projectile_draw
  })
end
