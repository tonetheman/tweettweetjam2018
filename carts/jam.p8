pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
x=64
y=100
speed=2
e = {}
go = false
r=rect
pr=print
for i=1,20 do
    e[i] = {x=rnd(128),y=0}
end
function _update()
    if btn(0) then
        x-=1
    end
    if btn(1) then
        x+=1
    end
    for i=1,20 do
        p = e[i]
        if x>=p.x and x<=p.x+4 and y>=p.y and y<=p.y+4 then
            go = true
        end
        p.y+=speed
        if p.y>128 then
            p.x = rnd(128)
            p.y=0
        end
    end
end
function _draw()
 if go then
    pr("game over")
 else
    cls(0)
    r(x,y,x+2,y+2,6)
    for i=1,20 do
        q=e[i]
        r(q.x,q.y,q.x+4,q.y+4,3)
    end
  end
end
