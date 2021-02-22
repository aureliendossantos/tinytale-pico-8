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
        _upd = update_map
    end
    update_hud()
    update_player_stats()
end

function open_shop()
    index = 1
    choices = {}
    for i = 1, #current_town.shop, 2 do
        local item = current_town.shop[i]
        add(choices, {spr = items[item].spr, id = item, name = items[item].name, price = current_town.shop[i+1]})
    end
    _upd = update_shop
end

function update_shop()
    index = update_index_up_and_down(index, #choices)
    if btnp_x then
        local choice = choices[index]
        if p.gold >= choice.price then
            items[choice.id].posessed += 1
            p.gold -= choice.price
        end
    end
    if btnp_o then
        enter_town()
    end
    update_hud()
    update_player_stats()
end

function draw_town()
    if current_town then
        local name = current_town.name
        local w = #name * 4 + 2
        local x = 64 - w/2
        local y = 115 - #choices*8
        window(x - 5, y + 4, x + w + 5, 128)
        window(x, y, x + w, y + 8)
        print(name, x + 2, y + 2, 15)
        x -= 2
        y += 11
        for i = 1, #choices do
            local choice = choices[i]
            if (index == i) draw_cursor(x, y)
            if (choice.spr) spr(choice.spr, x + 12, y)
            print(choice.name, x + 24, y + 1)
            if (choice.price) print_align_right(choice.price, x+63, y+1, 15)
            y+=8
        end
    end
end
