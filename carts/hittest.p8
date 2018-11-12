pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x=64
y=100
evils = {}
for i=1,10 do
 add(evils,{x=rnd(128),y=rnd(5)})
end
function _update()
	if (btn(0) and x>0) x-=2
	if (btn(1) and x<128-4) x+=2
	for i=1,10 do
		local p=evils[i]
		p.y+=2
	if x>=p.x and x<p.x+4 then
		print("♥☉⧗")
	end
	end
end
function _draw()
	cls(0)
	for i=1,10 do
		local p = evils[i]
		rect(p.x,p.y,p.x+4,p.y+4,rnd(6)+1)
	end
	rect(x,y,x+2,y+2,6)
end
