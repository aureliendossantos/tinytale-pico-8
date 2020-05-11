function init_map()
    init_player_stats()
    init_inventory()
    init_hud()
    steps = 0
    steps_goal = 0
    cur_terrain = 0
    log = {}
end

function update_map()
    player_movement()
    update_terrain_number()
    if not steps_goal_set or terrain_changed then
        new_steps_goal()
    end
    if steps_goal_set and steps >= steps_goal then
        battle()
    end
    update_player_stats()
    update_hud()
    update_inventory()
end

function player_movement()
    newx, newy = p.x, p.y
    if (btnp_up) newy -= 1
    if (btnp_down) newy += 1
    if (btnp_left) newx -= 1
    if (btnp_right) newx += 1
    if (newx ~= p.x or newy ~= p.y) and can_move() then
        p.x, p.y = newx, newy
        steps += 1
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
    local lower, upper = t.min_steps, t.max_steps
    local difference = upper - lower
    steps_goal = lower + flr(rnd(difference + 1))

    steps_goal_set = true
end

function draw_map()
    cls()
    map()
    spr(16, p.x*8, p.y*8)
    draw_hud()
    draw_inventory()
end