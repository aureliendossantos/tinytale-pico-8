--picoboard 1.3
--by afburgess
--(with beautiful optimisations by sibwara)
--simplified by me

function init_picoboard()
    key = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","-"," "}
    txtstr = {}
    keypos={x=0,y=0}
    dspos={x=0,y=0}
end

function picoboard()

    --keymappings
    if btnp(1) then keypos.x +=1 sfx(2) end
    if btnp(0) then keypos.x -=1 sfx(2) end
    if btnp(2) then keypos.y -=1 sfx(2) end
    if btnp(3) then keypos.y +=1 sfx(2) end
    if btnp(4) then backspace() end
    if btnp(5) then select() end

    --keyboard looping
    if keypos.x > 9 then keypos.x = 0 end
    if keypos.x < 0 then keypos.x = 9 end
    if keypos.y > 2 then keypos.y = 0 end
    if keypos.y < 0 then keypos.y = 2 end

    --keyboard draw
    local x, y = 18, 88

    rectfill(x-7,y-7,x+99,y+31,0)
    rect(x-7,y-7,x+99,y+31,7)

    for r1=0,9 do
     print(key[r1+1],x+r1*10,y,7)
     print(key[r1+11],x+r1*10,y+10,7)
    end
    for r2=0,6 do
     print(key[r2+21],x+r2*10,y+20,7)
    end

    for r3=1,3 do
     spr(63+r3,x+59+r3*10,y+20)
    end

    --cursor draw
    rect(keypos.x*10+x-3,keypos.y*10+y-3,keypos.x*10+x+5,keypos.y*10+y+7,7)

    --display string
    rectfill(64-#txtstr*2-5,45,64-#txtstr*2+4*#txtstr+5,59,0)
    str=""
    for i in all(txtstr) do
    str=str..i..""
    print(str,64-#txtstr*2,50,7)
    end

end

function select()
    newkey = keypos.x + keypos.y*10 + 1

    if newkey > 28 then
        if newkey == 29 then backspace() end
        if newkey == 30 then confirm() sfx(3) end
    else
        if #txtstr < 8 then
            add(txtstr,key[newkey])
            sfx(0)
        end
    end
end

function backspace()
    if #txtstr > 0 then txtstr[#txtstr]=nil sfx(1) end
end

function confirm()
    p.name = str
    go_to_map()
end