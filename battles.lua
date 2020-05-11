function battle()
    sfx(0)

    local enemy = clone_table(enemies[rnd(terrains[cur_terrain].enemies)])
    --battle loop
    while not should_battle_end(enemy) do
        attack(p, enemy)
        if should_battle_end(enemy) then
            break
        end
        attack(enemy, p)
    end
    --battle end message
    if p.hp <= 0 then
        add(log, enemy.name.." has slained "..p.name.."...")
    else
        add(log, p.name.." has slained a "..enemy.name)
    end

    p.exp += enemy.exp
    p.gold += enemy.gold

    steps = 0
    steps_goal_set = false
end

function should_battle_end(enemy)
    return enemy.hp <= 0 or p.hp <= 0
end

function attack(atker, dfder)
    dfder.hp -= atker.damage
    add(log, atker.name.." atks -"..atker.damage.." "..dfder.name.."!")
end