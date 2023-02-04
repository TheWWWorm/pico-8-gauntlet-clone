-- Handle global state of object to draw and update
global = {}
global.frame = 0
global.entities = {
  
}
global.latestId = 1

function addEntityToState(entity)
  entitityState = add(global.entities, entity)
  global.latestId += 1
end

function removeEntityFromState(entity)
  entitityState = del(global.entities, entity)
end

function runEntityUpdate()
  foreach(global.entities, function(obj)
    res = obj.update(obj.state)
    if (res == -1) removeEntityFromState(obj)
  end)
end

function runEntityDraw()
  foreach(global.entities, function(obj)
    obj.draw(obj.state)
  end) 
end
