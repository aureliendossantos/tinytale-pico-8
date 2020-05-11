function init_database()

--player properties
p = {
    x = 3,
    y = 3,
    name = "player",
    level = 1
}

--evolution curves
--base that will be altered by equipment
function calc_hp_curve()
    return 5 + 5 * p.level
end
function calc_exp_curve()
    return 100 * p.level
end
function calc_damage_curve()
    return 1 * p.level
end

inv = {
    {1, 3},
    {2, 9}
}

items = {
    {
        name = "pOTION",
        spr = 32
    },
    {
        name = "kEY",
        spr = 33
    }
}

enemies = {
    {
        name = "slime",
        hp = 1,
        damage = 1,
        exp = 10,
        gold = 2
    },
    {
        name = "goblin",
        hp = 2,
        damage = 2,
        exp = 25,
        gold = 3
    }
}

terrains = {
    --1-plain
    {
        min_steps = 3,
        max_steps = 4,
        enemies = {1}
    },
    --2-forest
    {
        min_steps = 2,
        max_steps = 2,
        enemies = {2}
    }
}

end