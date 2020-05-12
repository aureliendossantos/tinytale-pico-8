function _init()
    init_database()
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
end