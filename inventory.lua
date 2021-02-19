function init_inventory()
    inv_anim = 70
    inv_index_x, inv_index_y = 1, 1
end

function open_inventory()
    log_opened = false
    _upd = update_inventory
end

function close_inventory()
    _upd = update_map
    inv_anim = 70
end

function update_inventory()
    inv_anim = max(inv_anim - 4, 0)
    inv_index_x = update_index_left_and_right(inv_index_x, 4)
    inv_index_y = update_index_up_and_down(inv_index_y, 2)
    --change of scene:
    if (btnp_o) close_inventory()
end

function draw_inventory()
    local x, y = 10 - inv_anim, 40
    window(x, y, x+30, y+12)
    print("ATK:"..p.damage, x+3, y+3, 9)
    local x, y = 60 + inv_anim, 40
    window(x, y, x+49, y+45)
    x += 6
    y += 3
    print("WEAPONS", x, y, 4)
    y += 8
    for i = 1, 4 do
        spr((inv_index_x == i and inv_index_y == 1) and 36 or 35, x + i*10 - 10, y)
    end
    local x2 = x
    for i = 1, #weapons_inv do
        local item = weapons[weapons_inv[i]]
        spr(item.spr, x2, y)
        if inv_index_x == i and inv_index_y == 1 then
            window(x2, y+9, x2+2+#item.name*4, y+15)
            print(item.name, x2+1, y+10, 15)
        end
        x2 += 10
    end
    y += 14
    print("ITEMS", x, y, 4)
    y += 8
    for i = 1, 4 do
        spr((inv_index_x == i and inv_index_y == 2) and 36 or 35, x + i*10 - 10, y)
    end
    x2 = x
    for i = 1, #items_inv do
        local item, amount = items[items_inv[i][1]], items_inv[i][2]
        spr(item.spr, x2, y)
        print_shaded(amount, x2+4, y+4)
        if inv_index_x == i and inv_index_y == 2 then
            window(x2, y+9, x2+2+#item.name*4, y+15)
            print(item.name, x2+1, y+10, 15)
        end
        x2 += 10
    end
end
