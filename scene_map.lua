function init_map()
    init_player()
    init_hud()
    steps = 0
    steps_goal = 0
    cur_terrain = 0
    log = {}
    generate_autotiles(48, 31)
end

function update_map()
    if cur_terrain == 7 then
        if not p.busy and not just_left_town then
            enter_town()
        end
    else
        just_left_town = false
    end
    if cur_terrain == 6 and items_inv[2] > 0 and btn_x_timer > 30 then
        open_chest(p.x, p.y)
        items_inv[2] -= 1
    end
    if (not p.busy) update_player_movement()
    update_terrain_number()
    if not steps_goal_set or terrain_changed then
        new_steps_goal()
    end
    if steps_goal_set and steps >= steps_goal then
        battle()
    end
    update_hud()
    create_chest_bubble()
    update_player_stats()
    update_player_animation()
    --change of scene:
    if (btnp_o) open_inventory()
end

function open_chest(x, y)
    mset(x, y, mget(x, y) + 1)
    current_chest = chests["x"..x.."y"..y]

    chest_window = window:new{centered = true, y = 60, w = 50, h = 46}
    function chest_window:draw_contents()
        local y = 0
        for i = 1, #current_chest, 2 do
            local item = {}
            if current_chest[i] == "gold" then
                item = {spr = 34, name = "gOLD"}
            else
                item = items[current_chest[i]]
            end
            local amount = current_chest[i+1]
            spr(item.spr, 0, y)
            y += 1
            print(item.name, 12, y, 15)
            print_right(amount, 43, y, 15)
            y += 9
        end
        print("❎ take", x+6, y+3)
    end

    _upd = update_chest_popup
end

function update_chest_popup()
    if btnp_x and btn_x_timer == 1 then
        for i = 1, #current_chest, 2 do
            local item = current_chest[i]
            if item == "gold" then
                p.gold += current_chest[i+1]
            else
                items_inv[item] += current_chest[i+1]
            end
        end
        chest_window.closing = true
        current_chest = nil
        _upd = update_map
    end
end

function create_chest_bubble()
    if cur_terrain == 6 then
        if not chest_bubble then
            local w, fill_time = 52
            if items_inv[2] > 0 then
                w, fill_time = 69, 30
                local x, y = 30, 96
            end
            chest_bubble = window:new{bubble = true, life = 0.5, fill_time = fill_time, centered = true, y = 96, w = w, h = 8}
            function chest_bubble:draw_contents()
                local text, x = "you need a", 41
                if (items_inv[2] > 0) text, x = "hold ❎ to use  !", 56
                print(text, 0, 2, 0)
                spr(33, x, 0)
            end
        end
    else
        if chest_bubble then
            chest_bubble.closing = true
            if (chest_bubble.life <= 0) chest_bubble = nil
        end
    end
end

function update_terrain_number()
    terrain_changed = false
    local new_terrain = get_tile_flag(p.x, p.y)
    if new_terrain ~= cur_terrain then
        terrain_changed = true
        cur_terrain = new_terrain
    end
end

function new_steps_goal()
    local t = terrains[cur_terrain] -- t = nil if terrain doesn't exist in database
    if t then
        local lower, upper = t.min_steps, t.max_steps
        local difference = upper - lower
        steps_goal = lower + flr(rnd(difference + 1))
        steps_goal_set = true
    else
        steps_goal_set = false
    end
end

function update_camera()
    local camx = mid(0, (p.x - 7.5) * 8 + p.ox, (map_width - 15) * 8)
    local camy = mid(0, (p.y - 7.5) * 8 + p.oy, (map_height - 15) * 8)
    camera(camx, camy)
end

function draw_map()
    cls()
    update_camera()
    map(0, 0, 0, 0, 128, 64)
    draw_player()
    draw_battle()
    camera()
    draw_hud()
    if (chest_bubble) chest_bubble:draw()
    if (chest_window) chest_window:draw()
    draw_inventory()
    if (town_window) town_window:draw()
    draw_tooltip()
end
