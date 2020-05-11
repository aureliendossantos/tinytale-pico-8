function _init()
    init_map()
end

function _update()
    btn_up,btn_left,btn_down,btn_right=btn(⬆️),btn(⬅️),btn(⬇️),btn(➡️)
    btnp_up,btnp_left,btnp_down,btnp_right=btnp(⬆️),btnp(⬅️),btnp(⬇️),btnp(➡️)
    update_map()
end

function _draw()
    draw_map()
end