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

function draw_cursor(x, y)
    x = x + flr(sin(time()) + 0.5)
    spr(78, x, y)
end

function update_index_up_and_down(index, max)
    if btnp_up then
        index -= 1
    end
    if btnp_down then
        index += 1
    end
    if (index < 1) index = max
    if (index > max) index = 1
    return index
end

function update_index_left_and_right(index, max)
    if btnp_left then
        index -= 1
    end
    if btnp_right then
        index += 1
    end
    if (index < 1) index = max
    if (index > max) index = 1
    return index
end

function outlined_spr(n, x, y, w, h, flip_x, flip_y)
    w, h, flip_x, flip_y = w or 1, h or 1, flip_x or false, flip_y or false
    pal({0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
    y -= 1
    spr(n, x, y, w, h, flip_x, flip_y)
    y += 1
    x -= 1
    spr(n, x, y, w, h, flip_x, flip_y)
    x += 2
    spr(n, x, y, w, h, flip_x, flip_y)
    x -= 1
    pal()
    spr(n, x, y, w, h, flip_x, flip_y)
end

function rounded_rectfill(x, y, x2, y2, col)
    rectfill(x+1, y, x2-1, y2, col)
    rectfill(x, y+1, x2, y2-1)
end

function update_buttons()
    --buttons aliases
    btn_up,btn_left,btn_down,btn_right=btn(⬆️),btn(⬅️),btn(⬇️),btn(➡️)
    btnp_up,btnp_left,btnp_down,btnp_right=btnp(⬆️),btnp(⬅️),btnp(⬇️),btnp(➡️)
    btn_x,btn_o,btnp_x,btnp_o=btn(❎),btn(🅾️),btnp(❎),btnp(🅾️)
    if btn_x then
        btn_x_timer += 1
    else
        btn_x_held = btn_x_timer
        btn_x_timer = 0
    end
end