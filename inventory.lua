function open_inventory()
    log_opened = false
    inv_index_x, inv_index_y = 1, 1

    status_window = window:new{x = 20, y = 40, w = 30, h = 12, speed = 4}
    inventory_window = window:new{x = 70, y = 40, w = 49, h = 45, speed = 4}

    function status_window:draw_contents()
        print("ATK:"..p.damage, 3, 3, 9)
    end
    function inventory_window:draw_contents()
        print("WEAPONS", 6, 3, 4)
        for i = 1, 4 do
            spr((inv_index_x == i and inv_index_y == 1) and 95 or 94, 3 + i*10 - 10, 11)
        end
        local x = 3
        for i = 1, #weapons_inv do
            local item = weapons[weapons_inv[i]]
            spr(item.spr, x, 11)
            if inv_index_x == i and inv_index_y == 1 then
                tooltip(item.name, x, 20)
            end
            x += 10
        end
        print("ITEMS", 6, 25, 4)
        x = 3
        for i = 1, 4 do
            spr((inv_index_x == i and inv_index_y == 2) and 95 or 94, x + i*10 - 10, 33)
        end
        x = 3
        for i = 1, #items_inv do
            local item, amount = items[items_inv[i][1]], items_inv[i][2]
            spr(item.spr, x, 33)
            print_shaded(amount, x+4, 37)
            if inv_index_x == i and inv_index_y == 2 then
                tooltip(item.name, x, 42)
            end
            x += 10
        end
    end
    _upd = update_inventory
end

function close_inventory()
    status_window:close()
    inventory_window:close()
    _upd = update_map
end

function update_inventory()
    inv_index_x = update_index_left_and_right(inv_index_x, 4)
    inv_index_y = update_index_up_and_down(inv_index_y, 2)
    --change of scene:
    if (btnp_o) close_inventory()
end

function draw_inventory()
    if (status_window) status_window:draw()
    if (inventory_window) inventory_window:draw()
end
