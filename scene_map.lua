function init_map()
    init_player()
    init_inventory()
    init_hud()
    steps = 0
    steps_goal = 0
    cur_terrain = 0
    log = {}
end

function update_map()
    if (not p.busy) player_movement()
    update_terrain_number()
    if not steps_goal_set or terrain_changed then
        new_steps_goal()
    end
    if steps_goal_set and steps >= steps_goal then
        battle()
    end
    update_hud()
    update_quick_item()
    update_player_stats()
    player_animation()
    --change of scene:
    if (btnp_o) open_inventory()
end

function update_quick_item()
    if btnp_x then
        if items[1].posessed > 0 then
            items[1].effect()
            items[1].posessed -= 1
        end
    end
end

function update_terrain_number()
    terrain_changed = false
    local new_terrain = 0
    for i = 1,2 do
        if (tile_has_flag(i, p.x, p.y)) new_terrain = i
    end
    if new_terrain ~= cur_terrain then
        terrain_changed = true
        cur_terrain = new_terrain
    end
end

function new_steps_goal()
    local t = terrains[cur_terrain]
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
end