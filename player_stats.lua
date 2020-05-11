function init_player_stats()
    local hp = calc_hp_curve()
    p.hp, p.hp_max = hp, hp
    p.exp, p.exp_max = 0, calc_exp_curve()
    p.damage = calc_damage_curve()
    p.gold = 0
end

function update_player_stats()
    if p.exp >= p.exp_max then
        add(log, "level up!")
        p.exp = 0
        p.level += 1
        p.exp_max = calc_exp_curve()
        p.hp_max = calc_hp_curve()
        p.hp = p.hp_max
        p.damage = calc_damage_curve()
    end
end