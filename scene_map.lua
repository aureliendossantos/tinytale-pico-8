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
    if cur_terrain == 7 then
        if not p.busy and not just_left_town then
            enter_town()
        end
    else
        just_left_town = false
    end
    if cur_terrain == 6 and items.key.posessed > 0 and btn_x_timer > 30 then
        open_chest(p.x, p.y)
        items.key.posessed -= 1
    end
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

function open_chest(x, y)
    mset(x, y, 6)
    local chest = chests["x"..x.."y"..y]
    for i = 1, #chest, 2 do
        local item = chest[i]
        items[item].posessed += chest[i+1]
    end
end

function draw_chest_bubble()
    if cur_terrain == 6 then
        if items.key.posessed > 0 then
            local x, y = 30, 96
            bubble(69, 8, y-2, btn_x_timer*100/30)
            print("hold ❎ to use  !", x, y, 0)
            spr(33, x + 56, y - 2)
        else
            local x, y = 40, 96
            bubble(52, 8, y-2)
            print("you need a", x, y, 0)
            spr(33, x + 41, y - 2)
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
    local map_width = 127
    local map_height = 63
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
    draw_chest_bubble()
    draw_inventory()
    draw_town()
end
