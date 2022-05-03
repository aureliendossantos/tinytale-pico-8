function battle()

    enemy = clone_table(enemies[rnd(terrains[cur_terrain].enemies)])
    
    if p.anim_timer > 0.7 then
        sfx(0)
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
            add(log, p.name.." has slained a "..enemy.name.."!")
        end
        --rewards
        p.exp += enemy.exp
        p.gold += enemy.gold
        --reset
        enemy = nil
        steps = 0
        steps_goal_set = false
    end
end

function draw_battle()
    if enemy then
        outlined_spr(enemy.spr, p.x*8 - p.ox/2, p.y*8 - p.oy/2)
    end
end

function should_battle_end(enemy)
    return enemy.hp <= 0 or p.hp <= 0
end

function attack(attacker, defender)
    local damage = attacker.atk * 2 - attacker.def
    defender.hp -= damage
    add(log, attacker.name.." ▶ -"..damage.." "..defender.name.." (♥"..defender.hp..")")
end
