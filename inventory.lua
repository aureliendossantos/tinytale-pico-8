function open_inventory()
    log_opened = false
    inv_index_x, inv_index_y = 1, 1

    status_window = window:new{x = 26, y = 44, w = 30, h = 17, speed = 4}
    inventory_window = window:new{x = 71, y = 30, w = 44, h = 66, speed = 4}

    function status_window:draw_contents()
        print("ATK:"..p.atk.."\nDEF:"..p.def, 3, 3, 9)
    end
    function inventory_window:draw_contents()
        print("ITEMS", 6, 3, 15)
        local x = 4
        for i = 1, 4 do
            spr((inv_index_x == i and inv_index_y == 1) and 95 or 94, x + i*10 - 10, 11)
        end
        x = 4
        local j = 0
        for i, amount in  ipairs(items_inv) do
            if amount > 0 then
                j += 1
                local item = items[i]
                spr(item.spr, x, 11)
                print_right_shaded(amount, x+10, 15)
                if inv_index_x == j and inv_index_y == 1 then
                    tooltip(item.name, x, 20)
                    if btnp_x and item.effect then
                        item.effect()
                        items_inv[i] -= 1
                        add(log, "used "..items[1].name)
                    end
                end
                x += 10
            end
        end
        print("WEAPONS", 6, 25, 15)
        for i = 1, 4 do
            if (inv_index_x == i and inv_index_y == 2) then
                back_spr = weapon_equipped == i and 111 or 95
            else
                back_spr = weapon_equipped == i and 110 or 94
            end
            spr(back_spr, 3 + i*10 - 10, 33)
        end
        x = 4
        for i = 1, #weapons_inv do
            local item = weapons[weapons_inv[i]]
            spr(item.spr, x, 33)
            if inv_index_x == i and inv_index_y == 2 then
                tooltip(item.name, x, 42)
                if (btnp_x) weapon_equipped = i
            end
            x += 10
        end
        print("ARMORS", 6, 47, 15)
        for i = 1, 4 do
            if (inv_index_x == i and inv_index_y == 3) then
                back_spr = armor_equipped == i and 111 or 95
            else
                back_spr = armor_equipped == i and 110 or 94
            end
            spr(back_spr, 3 + i*10 - 10, 55)
        end
        local x = 3
        for i = 1, #armors_inv do
            local item = armors[armors_inv[i]]
            spr(item.spr, x, 55)
            if inv_index_x == i and inv_index_y == 3 then
                tooltip(item.name, x, 64)
                if (btnp_x) armor_equipped = i
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
    update_player_stats()
    inv_index_x = update_index_left_and_right(inv_index_x, 4)
    inv_index_y = update_index_up_and_down(inv_index_y, 3)
    update_hud()
    --change of scene:
    if (btnp_o) close_inventory()
end

function draw_inventory()
    if (status_window) status_window:draw()
    if (inventory_window) inventory_window:draw()
end
