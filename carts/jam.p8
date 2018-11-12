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
 e[i] = {x=s(128),y=s(50)}
end
function _update()
 if (btn(0)) x-=2
 if (btn(1)) x+=2
 if (x<0)x=0
 if (x>128)x=128
 for i=1,t do
  p = e[i]
  if x>=p.x and x<=p.x+4 and y>=p.y and y<=p.y+4 then
    go = true
    w=u
  end
  p.y+=sp
  if p.y>128 then
    p.x=s(128)
    p.y=s(50)
    if i==1 then
     u+=1
     add(e,{x=s(128),y=0})
     t+=1
    end
  end
 end
end
function _draw()
 if go then
  cls(0)
  pr("dead: "..w,64,64)
 else
  cls(0)
  pr("score: "..u,0,0,1)
  r(x,y,x+2,y+2,6)
  for i=1,t do
   q=e[i]
   r(q.x,q.y,q.x+4,q.y+4,3)
  end
 end
end
