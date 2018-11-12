pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x=64
y=100
hit=false
evils = {}
ecount=5
for i=1,ecount do
 add(evils,{x=rnd(128),y=rnd(5)})
end
function checkhit(p)
	if x>=p.x and x<=p.x+4 then
		if y>=p.y and y<p.y+4 then
			return true
		end
	end
	return fals
end
function _update()
	if (btn(0) and x>0) x-=2
	if (btn(1) and x<128-4) x+=2
	for i=1,ecount do
		local p=evils[i]
		p.y+=2
		if checkhit(p) then
			hit=true
		end
		if p.y>128 then
			p.y = 0
		end
	end
end
function _draw()
	cls(0)
	print("x,y:"..x..","..y,0,0,6)
	if hit then
		print("HIT",100,0,6)
	end
	for i=1,ecount do
		local p = evils[i]
		rect(p.x,p.y,p.x+4,p.y+4,rnd(6)+1)
	end
	rect(x,y,x+2,y+2,6)
end
