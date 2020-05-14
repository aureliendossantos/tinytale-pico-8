function init_hud()
    log_opened = false
    log_y = 128
    inv_corner_x = 84
    inv_corner_y = 117
    menuitem(2, "event log", function() toggle_log() end)

    bar = {timer = 0}

    function bar:new(value)
        new_bar = {
            start = value,
            printed = value,
            final_value = value
        }
        setmetatable(new_bar, self)
        self.__index = self
        return new_bar
    end

    function bar:update(monitored_value)
        --example: if current value different from real hp
        if self.final_value ~= monitored_value then
            self.timer = 0
            self.start = self.printed
            self.final_value = monitored_value
        end
        --timer 1 = end of animation
        self.timer = min(1, self.timer + 0.05)
        self.printed = circular_out(self.timer, self.start, self.final_value - self.start, 1)
    end

    hp_bar = bar:new(p.hp)
    exp_bar = bar:new(p.exp)
    gold_bar = bar:new(p.gold)
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
        inv_corner_x = 84
        inv_corner_y = max(117, inv_corner_y - 2)
        if btnp_x then
            if items[1].posessed > 0 then
                items[1].effect()
                items[1].posessed -= 1
            end
        end
    else
        inv_corner_x = 84
        inv_corner_y = min(128, inv_corner_y + 3)
    end
end

function draw_hud()
    draw_player_status()
    draw_inventory_corner()
    draw_log()
end

function draw_player_status()
    local w = 30
    local h = 29

    window(-1, -1, w, h)

    draw_bar(1, 6, 27, 2, hp_bar.printed, p.hp_max, 8, 2)
    local str = flr(hp_bar.printed).."/"..p.hp_max
    print_shaded(str, 15-#str*2, 2, 7)

    draw_bar(1, 16, 27, 1, exp_bar.printed, calc_exp_curve(), 12, 1)
    str = "lV."..p.level
    print_shaded(str, 15-#str*2, 11, 9)

    local y = 20
    spr(34, 21, y)
    str = tostr(ceil(gold_bar.printed))
    print_shaded(str, 20-#str*4, y+1, 7)
end

function draw_bar(x, y, w, h, cur_value, max_value, fill_col, back_col)
    rectfill(x, y+1, 27, y+h, back_col)
    rectfill(x, y+1, 1 + cur_value * (w-1) / max_value, y+h, fill_col)
    rect(x, y, w, y+h+1, 6)
end

function draw_inventory_corner()
    local x = inv_corner_x
    local y = inv_corner_y
    window(x, y, 129, 129)
    x += 3
    y += 2
    print("❎", x, y+2, 15)
    x += 9
    spr(35, x, y)
    spr(32, x, y)
    print_shaded(items[1].posessed, x+6, y+3)
    x += 12
    print("🅾️iNV", x, y+2, 15)
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
    window(0, log_y, 127, 129)
    local log_text_y = log_y + 1
    for i = #log-7, #log do
        if log[i] then
            print(log[i], 1, log_text_y, 9)
        end
        log_text_y += 7
    end
end