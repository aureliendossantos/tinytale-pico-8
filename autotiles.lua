function generate_autotiles(x_max, y_max)
    for x = 0, x_max do
        for y = 0, y_max do
            if is_a_path(x, y) then
                --we found a path tile and set the correct autotile
                local autotile_data = {
                    --one connection
                    {x-1, y, 115},
                    {x+1, y, 113},
                    {x, y-1, 96},
                    {x, y+1, 64},
                    --two connections
                    {x-1, y, x+1, y, 114},
                    {x, y-1, x, y+1, 80},
                    {x+1, y, x, y+1, 65},
                    {x-1, y, x, y+1, 67},
                    {x, y-1, x+1, y, 97},
                    {x-1, y, x, y-1, 99},
                    --three connections
                    {x-1, y, x+1, y, x, y+1, 66},
                    {x, y-1, x+1, y, x, y+1, 81},
                    {x, y-1, x-1, y, x, y+1, 83},
                    {x-1, y, x, y-1, x+1, y, 98},
                    --four connections
                    {x, y-1, x-1, y, x+1, y, x, y+1, 82}
                }
                for i in all(autotile_data) do
                    if #i == 3 and is_a_path(i[1], i[2])
                    or #i == 5 and is_a_path(i[1], i[2]) and is_a_path(i[3], i[4])
                    or #i == 7 and is_a_path(i[1], i[2]) and is_a_path(i[3], i[4]) and is_a_path(i[5], i[6])
                    or #i == 9 and is_a_path(i[1], i[2]) and is_a_path(i[3], i[4]) and is_a_path(i[5], i[6]) and is_a_path(i[7], i[8]) then
                        --the last element of the table is always the tile id
                        mset(x, y, i[#i])
                    end
                end
            end
        end
    end
end

function is_a_path(x, y)
    local path_tile_id = {7, 64, 65, 66, 67, 80, 81, 82, 83, 96, 97, 98, 99, 113, 114, 115}
    for id in all(path_tile_id) do
        if (mget(x, y) == id) return true
    end
    return false
end
