function init_database()

--player properties
p = {
    x = 7,
    y = 2,
    ox = 0,
    oy = 0,
    start_ox = 0,
    start_oy = 0,
    flip = false,
    anim_timer = 0,
    name = "player",
    level = 1,
    gold = 0
}

--evolution curves
--base that will be altered by equipment
function calc_hp_curve()
    return 4 + 5 * p.level
end
function calc_exp_curve()
    return 100 * p.level
end
function calc_damage_curve()
    return 1 * p.level
end

towns = {
    name = "aUBERGE DE tILH",
    price = 4
}

items = {
    {
        name = "pOTION",
        posessed = 3,
        spr = 32,
        type = "consumable",
        effect = function() heal(5) end
    },
    {
        name = "kEY",
        posessed = 9,
        spr = 33
    }
}

enemies = {
    {
        name = "slime",
        spr = 17,
        hp = 1,
        damage = 1,
        exp = 10,
        gold = 2
    },
    {
        name = "goblin",
        spr = 18,
        hp = 3,
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