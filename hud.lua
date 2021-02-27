function init_hud()
    hp_bar = bar:new(p.hp, 8, 2)
    exp_bar = bar:new(p.exp, 12, 1)
    gold_bar = bar:new(p.gold)

    status_hud = window:new{x = 0, y = 0, w = 29, h = 28}
    inventory_hud = window:new{x = 85, y = 118, w = 45, h = 10}

    function status_hud:draw_contents()
        hp_bar:draw(1, 6, 27, 2, p.hp_max)
        print_centered_shaded(flr(hp_bar.printed).."/"..p.hp_max, 15, 2)
        exp_bar:draw(1, 16, 27, 1, calc_exp())
        print_centered_shaded("lV."..p.level, 15, 11)
        spr(98, 21, 20)
        print_right_shaded(ceil(gold_bar.printed), 20, 21)
    end
    
    function inventory_hud:draw_contents()
        spr(94, 2, 1)
        spr(96, 2, 1)
        spr(94, 13, 1)
        spr(97, 13, 1)
        print_right_shaded(items_inv[1], 12, 4)
        print_right_shaded(items_inv[2], 23, 4)
        print("🅾️", 25, 4, 1)
        print("🅾️", 25, btn_o and 4 or 3, 15)
    end

    log_opened = false
    log_window = window:new{x = 2, y = 130, w = 123, h = 60, life = 1, speed = 9}

    function log_window:draw_contents()
        local y = 0
        for i = #log-7, #log do
            if log[i] then
                print(log[i], 2, y, 9)
            end
            y += 7
        end
    end

    menuitem(2, "event log", function() toggle_log() end)
end

function update_hud()
    if current_town then
        inventory_corner = false
    else
        inventory_corner = true
    end
    hp_bar:update(p.hp)
    exp_bar:update(p.exp)
    gold_bar:update(p.gold)
    update_inventory_corner()
    update_log()
end

function update_inventory_corner()
    if inventory_corner then
        inventory_hud:move(94, 118)
    else
        inventory_hud:move(104, 118)
    end
end

function draw_hud()
    status_hud:draw()
    inventory_hud:draw()
    log_window:draw()
end

function toggle_log()
    log_opened = not log_opened
end

function update_log()
    if log_opened then
        log_window.target_y = 72
        if (btn(🅾️)) toggle_log()
    else
        log_window.target_y = 130
    end
end
