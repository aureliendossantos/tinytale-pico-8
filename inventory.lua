function init_inventory()
    inv_x, inv_y, inv_w, inv_h = 128, 30, 90, 90
    inventory_opened = false
end

function open_inventory()
    log_opened = false
    _upd = update_inventory
    inv_x = 30
end

function close_inventory()
    _upd = update_map
    inv_x = 128
end

function update_inventory()
    --change of scene:
    if (btnp_o) close_inventory()
end

function draw_inventory()
    local x, y, w, h = inv_x, inv_y, inv_w, inv_h
    rectfill(x, y, x+w, y+h, 4)
    for item in all(items) do
        if item.posessed then
            if item.posessed > 0 then
                spr(item.spr, x+10, y+10)
                print_shaded(item.posessed, x+14, y+14)
                x += 9
            end
        end
    end
end
