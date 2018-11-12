pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x=64
y=100
sp=2
e={}
g=false
r=rect
pr=print
s=rnd
t=20
u=0
c=128
for i=1,t do
 e[i]={x=s(c),y=s(50)}
end
function _update()
 if (btn(0) and x>0) x-=2
 if (btn(1) and x<c-2) x+=2
 for i=1,t do
  p=e[i]
  if(x>=p.x and x<=p.x+4 and y>=p.y and y<=p.y+4)g=true;x=-9;w=u
  p.y+=sp
  if p.y>c then
    p.x=s(c)
    p.y=s(50)
    if (i==1)u+=1;add(e,{x=s(c),y=0});t+=1
  end
 end
end
function _draw()
 if g then
  cls(0)
  pr(":( "..w,64,64)
 else
  cls(0)
  pr("s: "..u,0,0,1)
  r(x,y,x+2,y+2,6)
  for i=1,t do
   q=e[i]
   r(q.x,q.y,q.x+4,q.y+4,3)
  end
 end
end
