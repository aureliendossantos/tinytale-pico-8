function init_inventory()
    inventory_opened = false
    menuitem(1, "inventory", function() toggle_inventory() end)
end

function toggle_inventory()
    inventory_opened = not inventory_opened
    log_opened = false
end

function update_inventory()
    if inventory_opened then
        if (btn(🅾️)) toggle_inventory()
    end
end

function draw_inventory()
    if inventory_opened then
        local x, y, w, h = 30, 30, 90, 90
        rectfill(x, y, x+w, y+h, 4)
        for entry in all(inv) do
            local item = items[entry[1]]
            spr(item.spr, x+10, y+10)
            print(entry[2], x+12, y+14, 7)
            x += 9
        end
    end
end
