function init_map()
    init_player()
    init_inventory()
    init_hud()
    steps = 0
    steps_goal = 0
    cur_terrain = 0
    log = {}
    cursor_timer = 0
end

function update_map()
    update_town()
    if (not p.busy) player_movement()
    update_terrain_number()
    if not steps_goal_set or terrain_changed then
        new_steps_goal()
    end
    if steps_goal_set and steps >= steps_goal then
        battle()
    end
    update_hud()
    update_player_stats()
    player_animation()
    --change of scene:
    if (btnp_o) open_inventory()
end

function update_town()
    current_town = nil
    if cur_terrain == 7 then
        if not p.busy and not just_left_town then
            current_town = towns
            if btnp_x then
                heal(1000)
                just_left_town = true
            end
            if btnp_o then
                just_left_town = true
            end
        end
    else
        just_left_town = false
    end
end

function draw_town()
    if current_town then
        local name = current_town.name
        local w = #name * 4 + 2
        local x = 64 - w/2
        local y = 100
        window(x - 5, y + 4, x + w + 5, 128)
        window(x, y, x + w, 108)
        print(name, x + 2, y + 2, 15)
        draw_choice(x + 5,y + 20)
    end
end

function draw_choice(x, y)
    draw_cursor(x, y)
    spr(15, x + 14, y)
    print("sleep", x + 25, y + 1)
    print("4", x+60,y+1)
end

function draw_cursor(x, y)
    cursor_timer += 0.01
    x = x + flr(cos(cursor_timer)+0.5)
    spr(14, x, y)
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

function draw_map()
    cls()
    map()
    draw_player()
    draw_battle()
    draw_hud()
    draw_inventory()
    draw_town()
end