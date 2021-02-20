function init_player()
    local hp = calc_hp_curve()
    p.hp, p.hp_max = hp, hp
    p.exp, p.exp_max = 0, calc_exp_curve()
    p.damage = calc_atk_curve()
end

function update_player_stats()
    if p.exp >= p.exp_max then
        add(log, "level up!")
        p.exp = 0
        p.level += 1
        p.exp_max = calc_exp_curve()
        p.hp_max = calc_hp_curve()
        p.hp = p.hp_max
        p.damage = calc_atk_curve()
    end
    p.hp = mid(0, p.hp, p.hp_max)
end

function update_player_movement()
    newx, newy = p.x, p.y
    local dirx, diry = {-1, 1, 0, 0}, {0, 0, -1, 1}
    for i=1,4 do
        if btn(i-1) then
            local dirx, diry = dirx[i], diry[i]
            newx += dirx
            newy += diry
            newox = -dirx*8
            newoy = -diry*8
            if (dirx < 0) p.flip = true
            if (dirx > 0) p.flip = false
            break --can't register multiple buttons
        end
    end
    if (newx ~= p.x or newy ~= p.y) and can_move() then
        p.x, p.y = newx, newy
        p.start_ox, p.start_oy = newox, newoy
        p.anim_timer = 0
        steps += 1
    end
end

function player_animation()
    p.anim_timer = min(p.anim_timer + 0.075, 1)
    p.ox = p.start_ox * (1 - p.anim_timer)
    p.oy = p.start_oy * (1 - p.anim_timer)
    if p.anim_timer == 1 then
        p.busy = false
    else
        p.busy = true --won't move or do other actions while busy
    end
end

function draw_player()
    sprites = {21, 22, 23, 24}

    if (p.busy) idle_previous_frame = false

    tick = (tick + 1) % 6 --change sprite every 4 frames
    if tick == 0 then
        if idle_previous_frame then
            --if the player hasn't moved for more than a frame
            frame = 1
        else
            frame = frame % #sprites + 1
        end
    end
    outlined_spr(enemy and 25 or sprites[frame], p.x*8 + p.ox, p.y*8 + p.oy, 1, 1, p.flip)

    if (not p.busy) idle_previous_frame = true
end