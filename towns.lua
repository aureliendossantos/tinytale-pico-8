function enter_town()
    current_town = towns["x"..p.x.."y"..p.y]
    --first choice is always sleep
    choices = {
        {spr = 79, name = "sleep",  price = current_town.price, action = function() inn() end}
    }
    if current_town.shop then
        add(choices, {name = "shop", action = function() open_shop() end})
    end
    index = 1

    town_window = window:new{type = "centered", y = 130, w = 70, h = 100, life = 1, speed = 3}

    town_window.target_y = 115 - #choices*8

    function town_window:draw_contents()
        if current_town then
            print_centered(current_town.name, 35, 3, 15)
            local y = 11
            for i = 1, #choices do
                local choice = choices[i]
                if (index == i) draw_cursor(2, y)
                if (choice.spr) spr(choice.spr, 14, y)
                print(choice.name, 26, y + 1, 15)
                if (choice.price) print_right(choice.price, 65, y+1, 15)
                y += 8
            end
        end
    end

    _upd = update_town
end

function update_town()
    index = update_index_up_and_down(index, #choices)
    if btnp_x then
        if choices[index].price and p.gold >= choices[index].price then
            choices[index].action()
            p.gold -= choices[index].price
        else
            choices[index].action()
        end
    end
    if btnp_o then
        just_left_town = true
        current_town = nil
        town_window.target_y = 130
        _upd = update_map
    end
    update_hud()
    update_player_stats()
end

function open_shop()
    index = 1
    choices = {}
    local shop = current_town.shop
    for i = 1, #shop, 3 do
        local type, id, price, item_spr, name = shop[i], shop[i+1], shop[i+2]
        if type == "item" then
            item_spr, name = items[id].spr, items[id].name
        elseif type == "weapon" then
            item_spr, name = weapons[id].spr, weapons[id].name
        else
            item_spr, name = armors[id].spr, armors[id].name
        end
        add(choices, {type = type, spr = item_spr, id = id, name = name, price = price})
    end
    _upd = update_shop
end

function update_shop()
    index = update_index_up_and_down(index, #choices)
    if btnp_x then
        local choice = choices[index]
        if p.gold >= choice.price then
            if choice.type == "item" then
                items_inv[choice.id] += 1
            elseif choice.type == "weapon" then
                add(weapons_inv, choice.id)
            else
                add(armors_inv, choice.id)
            end
            p.gold -= choice.price
        end
    end
    if btnp_o then
        enter_town()
    end
    update_hud()
    update_player_stats()
end
