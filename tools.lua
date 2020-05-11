function clone_table(table)
    local new = {}
    for i,j in pairs(table) do
        new[i] = j
    end
    return new
end

function tile_has_flag(flag, x, y)
    return fget(mget(x, y), flag)
end

function can_move()
    return not tile_has_flag(0, newx, newy)
end

function print_shaded(text, x, y)
    print(text, x+1, y, 1)
    print(text, x, y, 7)
end