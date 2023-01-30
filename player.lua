function init_player()
	p={}
  -- start pos
	p.x=56
	p.y=56
  -- player speed
  p.spd = 1
  -- intended movement
	p.dx=0
	p.dy=0
  -- player size
	p.w=7
	p.h=7	
  -- player sprite
	p.sprites= {17, 18}
  p.invertX= false
end

function check_player_controls() 
  player_move()
  player_attack()
end

function player_move()
  p.dx,p.dy=0,0
	if (btn(⬅️)) p.dx-=p.spd
	if (btn(➡️)) p.dx+=p.spd
	if (btn(⬆️)) p.dy-=p.spd
	if (btn(⬇️)) p.dy+=p.spd

 if (can_move(p.x+p.dx,p.y,p.w,p.h)) then
	 p.x+=p.dx
 end
 
 if (can_move(p.x,p.y+p.dy,p.w,p.h)) then
		p.y+=p.dy
	end
end

function player_attack()
end

function draw_player() 
  if (p.dx == -1) p.invertX = true
	if (p.dx == 1) p.invertX = false
  animate_spr(p.sprites,p.x,p.y, 8, p.invertX)
end