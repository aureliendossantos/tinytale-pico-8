function clone_table(table)
    local new = {}
    for i,j in pairs(table) do
        new[i] = j
    end
    return new
end

function get_tile_flag(x, y)
    --only returns the first flag
    for i=0,7 do
        if (fget(mget(x, y), i)) return i
    end
end

function tile_has_flag(flag, x, y)
    return fget(mget(x, y), flag)
end

function can_move()
    return not tile_has_flag(0, newx, newy)
end

function print_shaded(text, x, y)
    print(text, x+1, y, 1)
    print(text, x-1, y, 1)
    print(text, x, y+1, 1)
    print(text, x, y-1, 1)
    print(text, x, y, 7)
end

function window(x, y, x2, y2, title)
    rect(x, y, x2, y2, 4)
    rectfill(x+1, y+1, x2-1, y2-1, 5)
    if title then
        rect(x+3, y+3, x2-3, y2-3, 15)
        x+=6
        y+=1
        rectfill(x, y, x + #title*4, y + 6, 5)
        print(title, x+1, y, 15)
    end
end

function update_buttons()
    --buttons aliases
    btn_up,btn_left,btn_down,btn_right=btn(⬆️),btn(⬅️),btn(⬇️),btn(➡️)
    btnp_up,btnp_left,btnp_down,btnp_right=btnp(⬆️),btnp(⬅️),btnp(⬇️),btnp(➡️)
    btn_x,btn_o,btnp_x,btnp_o=btn(❎),btn(🅾️),btnp(❎),btnp(🅾️)
end