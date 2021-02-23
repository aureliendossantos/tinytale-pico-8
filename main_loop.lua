function _init()
    init_database()
    btn_x_timer, btn_x_held = 0, 0
    test_mode = true
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

function _update60()
    update_buttons()
    _upd()
end

function _draw()
    _drw()
    --print("cpu " .. stat(1)*200 .. "\n" .. stat(7),1,60,9)
end