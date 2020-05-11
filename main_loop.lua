function _init()
    init_database()
    test_mode = false
    if test_mode == true then
        go_to_map()
    else
        init_title()
        _upd = update_title
        _drw = draw_title
    end
end

function go_to_map()
    init_map()
    _upd = update_map
    _drw = draw_map
end

function _update()
    if not inventory_opened then
        btn_up,btn_left,btn_down,btn_right=btn(⬆️),btn(⬅️),btn(⬇️),btn(➡️)
        btnp_up,btnp_left,btnp_down,btnp_right=btnp(⬆️),btnp(⬅️),btnp(⬇️),btnp(➡️)
        btn_x,btn_o=btn(❎),btn(🅾️)
        btnp_x,btnp_o=btnp(❎),btnp(🅾️)
    end
    _upd()
end

function _draw()
    _drw()
end