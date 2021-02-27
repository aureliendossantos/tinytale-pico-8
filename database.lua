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
function calc_hp()
    return 4 + 5 * p.level
end
function calc_exp()
    return 100 * p.level
end
function calc_atk()
    return 1 * p.level + weapons[weapons_inv[weapon_equipped]].atk
end
function calc_def()
    return 1 * p.level + armors[armors_inv[armor_equipped]].def
end

towns = {
    x11y24 = {
        name = "aUBERGE DE tILH",
        price = 6,
        shop = {"item", 1, 12, "weapon", 2, 2}
    },
    x10y9 = {
        name = "aUBERGE D'aMOU",
        price = 8,
        shop = {1, 5, 2, 20}
    }
}

chests = {
    x24y26 = {1, 3, 2, 2, "gold", 40}
}

items = {
    {
        name = "pOTION",
        spr = 96,
        effect = function() heal(5) end
    },
    {
        name = "kEY",
        spr = 97
    }
}

items_inv = {2, 1}

weapons = {
    {
        name = "sHORT sWORD",
        atk = 1,
        spr = 112
    },
    {
        name = "lONGSW",
        atk = 3,
        spr = 112
    }
}

weapons_inv = {1}
weapon_equipped = 1

armors = {
    {
        name = "t-sHIRT",
        def = 1,
        spr = 113
    },
    {
        name = "fAT t-sHIRT",
        def = 2,
        spr = 113
    }
}

armors_inv = {1}
armor_equipped = 1

enemies = {
    {
        name = "slime",
        spr = 80,
        hp = 2,
        atk = 2,
        def = 2,
        exp = 10,
        gold = 2
    },
    {
        name = "goblin",
        spr = 81,
        hp = 4,
        atk = 2,
        def = 2,
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