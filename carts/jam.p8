pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x=64
y=100
sp=2
e = {}
go = false
r=rect
pr=print
s=rnd
t=20
u=0
for i=1,t do
 e[i] = {x=s(128),y=s(10)}
end
function _update()
 if (btn(0)) x-=2
 if (btn(1)) x+=2
 
 for i=1,t do
  p = e[i]
  if x>=p.x and x<=p.x+4 and y>=p.y and y<=p.y+4 then
    go = true
  end
  p.y+=sp
  if p.y>128 then
    p.x = s(128)
    p.y=0
    if (i==1) u+=1
  end
 end
end
function _draw()
 if go then
  pr"dead"
 else
  cls(0)
  pr("score:"..u,0,0,1)
  r(x,y,x+2,y+2,6)
  for i=1,t do
   q=e[i]
   r(q.x,q.y,q.x+4,q.y+4,3)
  end
 end
end
