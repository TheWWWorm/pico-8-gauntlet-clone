function camera_follow()
  -- Put player in the middle
  cam_x=p.x-60
  cam_y=p.y-60
  -- check that camera doesn't show out of bounds are
  -- remove 128, as camera is 128px high/wide
  cam_x=mid(0,cam_x,33 * 8 - 128)
  cam_y=mid(0,cam_y,36 * 8 - 128)
  camera(cam_x,cam_y)
 end
