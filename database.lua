function init_database()

map_width, map_height = 48, 31

--player properties
p = {
    x = 5,
    y = 27,
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

p_sprites = {64, 65, 66, 67}
idle_previous_frame, tick, frame = true, 0, 1

--evolution curves
--base that will be altered by equipment
function calc_hp_curve()
    return 4 + 5 * p.level
end
function calc_exp_curve()
    return 100 * p.level
end
function calc_atk_curve()
    return 1 * p.level
end

towns = {
    x11y24 = {
        name = "aUBERGE DE tILH",
        price = 6,
        shop = {"potion", 12}
    },
    x10y9 = {
        name = "aUBERGE D'aMOU",
        price = 8,
        shop = {"potion", 5, "key", 20}
    }
}

chests = {
    x3y4 = {"potion", 3, "key", 2, "gold", 40}
}

items = {
    potion = {
        name = "pOTION",
        posessed = 3,
        spr = 96,
        effect = function() heal(5) end
    },
    key = {
        name = "kEY",
        posessed = 1,
        spr = 97
    }
}

items_inv = {
    {"potion", 3},
    {"key", 1}
}

weapons = {
    {
        name = "sHORT sWORD",
        atk = 1,
        posessed = 1,
        spr = 112
    },
    {
        name = "lONGSWORD",
        atk = 3,
        posessed = 1,
        spr = 112
    }
}

weapons_inv = {1, 2, 1}

enemies = {
    {
        name = "slime",
        spr = 80,
        hp = 2,
        damage = 2,
        exp = 10,
        gold = 2
    },
    {
        name = "goblin",
        spr = 81,
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
    --6-reserved for chests
    --7-reserved for towns
}

end