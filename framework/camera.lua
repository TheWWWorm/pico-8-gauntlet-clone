function camera_follow(entity)
  -- Put player in the middle
  cam_x = entity.x-60
  cam_y = entity.y-60
  -- check that camera doesn't show out of bounds are
  -- remove 128, as camera is 128px high/wide
  cam_x=mid(0, cam_x, global.map.max_x * 8 - 128)
  cam_y=mid(0, cam_y, global.map.max_y * 8 - 128)
  camera(cam_x,cam_y)
 end
