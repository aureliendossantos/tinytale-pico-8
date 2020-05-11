function init_database()

--player properties
p = {
    x = 3,
    y = 3,
    name = "player",
    life = 10,
    damage = 1
}

enemies = {
    {
        name = "slime",
        life = 1,
        damage = 1
    },
    {
        name = "goblin",
        life = 2,
        damage = 2
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