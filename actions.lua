function heal(amount)
    sfx(0)
    p.hp = min(p.hp + amount, p.hp_max)
end

function inn()
    heal(1000)
    add(log, "slept at inn")
end
