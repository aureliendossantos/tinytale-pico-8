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
    spr(14, x, y)
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

function print_shaded(text, x, y)
    print(text, x+1, y, 1)
    print(text, x-1, y, 1)
    print(text, x, y+1, 1)
    print(text, x, y-1, 1)
    print(text, x, y, 7)
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

function bubble(width, height, y, fill_percent)
    local x, x2, y2 = 63 - width/2, 63 + width/2, y + height
    rectfill(x-2, y, x2+2, y2, 0)
    rectfill(x, y-2, x2, y2+2, 0)
    rectfill(x-1, y-1, x2+1, y2+1, 0)
    rectfill(x, y-1, x2, y2+1, 7)
    rectfill(x-1, y, x2+1, y2, 7)
    if fill_percent then
        local fill_x2 = x + fill_percent * (x2 - x) / 100
        if fill_percent > 0 then
            rectfill(x, y-1, fill_x2, y2+1, 12)
            rectfill(x-1, y, fill_x2, y2, 12)
        end
    end
end

function print_align_right(text, x, y, col)
    print(text, x - 4 * #tostr(text), y, col)
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
    --when you press x to exit a menu, can_use_item_shortcut is set
    --to false to avoid using the potion immediately after.
    --the potion can be used again at the next key press:
    if btn_x_timer == 0 and btn_x_held == 0 then
        can_use_item_shortcut = true
    end
end