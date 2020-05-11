function draw_hud()
    draw_player_status()
    draw_log()
end

function draw_player_status()
    rectfill(0, 0, 20, 15, 2)
    print(p.life, 1, 1, 9)
end

function draw_log()
    rectfill(0, 118, 40, 127, 2)
    local log_text_y = 60
    for i = #log-6, #log do
        if log[i] then
            print(log[i], 1, log_text_y, 9)
        end
        log_text_y += 7
    end
end