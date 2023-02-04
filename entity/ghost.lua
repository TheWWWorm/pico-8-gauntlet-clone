function ghost_init(state)
  state.id = global.latestId
  state.spd = 1
  state.w = 7
  state.h = 7
  state.sprites= {23, 24}
  state.invertX = false
  return state
end

function ghost_update(state) 

end

function ghost_draw(state) 
  animate_spr(state.sprites, state.x, state.y, 8, state.invertX)
end

function ghost_register(x, y) 
  addEntityToState({
    state = ghost_init({x= x, y = y}),
    update = ghost_update,
    draw = ghost_draw
  })
end
