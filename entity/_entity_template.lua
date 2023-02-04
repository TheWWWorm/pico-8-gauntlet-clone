-- This a tempalte for a new entity
function template_init(state)
  state.id = global.latestId
  state.x=1
  state.y=1
  state.w = 7
  state.h = 7	
  state.spd = 1
  state.sprites= {1}
  state.invertX = false
  return state
end

function template_update(state) 

end

function template_draw(state) 
  animate_spr(state.sprites, state.x, state.y, 8, state.invertX)
end

function template_register() 
  addEntityToState({
    state = template_init({}),
    update = template_update,
    draw = template_draw
  })
end
