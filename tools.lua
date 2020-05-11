function tile_has_flag(flag, x, y)
    return fget(mget(x, y), flag)
end

function clone_table(table)
    local new = {}
    for i,j in pairs(table) do
        new[i] = j
    end
    return new
end