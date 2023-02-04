function player_init(state)
  state.id = global.latestId
  -- start pos
  state.x = 56
  state.y = 56
  -- player speed
  state.spd = 1
  -- intended movement
  state.dx = 0
  state.dy = 0
  -- player size
  state.w = 7
  state.h = 7	
  -- player sprite
	state.sprites = {17, 18}
  state.invertX = false
  state.attackCooldown = 0
  return state
end

function player_update(state) 
  player_move(state)
  player_attack(state)
  state.attackCooldown -= 1
end

function player_move(state)
  state.dx, state.dy= 0, 0
  if (btn(⬅️)) state.dx-=state.spd
  if (btn(➡️)) state.dx+=state.spd
  if (btn(⬆️)) state.dy-=state.spd
  if (btn(⬇️)) state.dy+=state.spd

  if (can_move(state.x + state.dx, state.y, state.w, state.h)) then
    state.x += state.dx
  end
  
  if (can_move(state.x, state.y + state.dy, state.w, state.h)) then
    state.y += state.dy
  end
end

function player_attack(state)
  if (btnp(❎) and state.attackCooldown <= 0) then
    projectileDx = state.dx
    if state.dx == 0 and state.dy == 0  then
      projectileDx = state.invertX and -1 or 1
    end
    projectile_register({
      x = state.x,
      y = state.y,
      dx = projectileDx,
      dy = state.dy,
      spd = 2,
      sprites = { 40 },
      invertX = state.invertX,
      maxFrames = 90
    })
    state.attackCooldown = 10
  end
end

function player_draw(state) 
  if (state.dx == -1) state.invertX = true
  if (state.dx == 1) state.invertX = false
  animate_spr(state.sprites, state.x, state.y, 8, state.invertX)
  camera_follow(state)
end

function player_register()
  addEntityToState({
    state = player_init({}),
    update = player_update,
    draw = player_draw,
  })
end

player_register()
