function animate_spr(sprites, x, y, interval, flipX, flipY)
  spriteIndex = (flr(global.frame / interval) % #sprites) + 1
  spr(sprites[spriteIndex],x,y, 1, 1, flipX, flipY)
end
