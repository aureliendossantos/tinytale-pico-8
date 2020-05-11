function init_hud()
    log_opened = false
    log_y = 128
    menuitem(2, "event log", function() toggle_log() end)
end

function update_hud()
    update_log()
end

function draw_hud()
    draw_player_status()
    draw_log()
end

function draw_player_status()
    local w = 30
    local h = 27
    --[[
    rect(-1, -1, w, h, 4)
    fillp(0b1010010110100101.1)
    rectfill(0, 0, w-1, h-1, 5)
    fillp(0)
    --]]
    rect(1, 4, w-2, 7, 6)
    rectfill(2, 5, 27, 6, 8)
    rect(1, 13, w-2, 15, 6)
    line(2, 14, 27, 14, 12)
    local y = 18
    for i=1,19,9 do
        spr(35, i, y)
    end
    spr(32, 1, y)
    spr(33, 10, y)
    for entry in all(inv) do
        if entry[1] == 1 then
            print_shaded(entry[2], 3, y+4)
        elseif entry[1] == 2 then
            print_shaded(entry[2], 12, y+4)
        end
    end
    spr(34, 19, y)
    print_shaded(p.gold, 21, y+4, 7)
    local hp = p.hp.."/"..p.hp_max
    print_shaded(hp, 4, 2, 7)
    print_shaded(p.exp.."/"..p.exp_max, 4, 10, 7)
    --print("lv."..p.level, 1, 14, 9)
end

function toggle_log()
    log_opened = not log_opened
    inventory_opened = false
end

function update_log()
    if log_opened then
        log_y = max(72, log_y - 9)
        if (btn(🅾️)) toggle_log()
    else
        log_y = min(128, log_y + 9)
    end
end

function draw_log()
    rectfill(0, log_y, 127, 128, 2)
    local log_text_y = log_y + 1
    for i = #log-7, #log do
        if log[i] then
            print(log[i], 1, log_text_y, 9)
        end
        log_text_y += 7
    end
end