function generate_autotiles(x_max, y_max)
    local terrains = {
        --path
        {2, 209, "path"},
        --water
        {3, 130, "water"},
        --mountain
        {4, 219, "classic"},
        --forest
        {5, 171, "classic"},
        --deep forest
        {6, 214, "classic"},
        --pines
        {7, 166, "classic"}
    }
    
    bitmasks = {
        classic = {
            {
                0b00001011,
                0b00011111,
                0b00010110,
                0b01111111,
                0b11011111
            },
            {
                0b01101011,
                0b11111111,
                0b11010110,
                0b11111011,
                0b11111110
            },
            {
                0b01101000,
                0b11111000,
                0b11010000,
                0b01111110,
                0b11011011
            }
        },
        path = {
            {
                0b00001000,
                0b00000010,
                0b00001010,
                0b00011010,
                0b00010010
            },
            {
                0b00011000,
                0b01000010,
                0b01001010,
                0b01011010,
                0b01010010
            },
            {
                0b00010000,
                0b01000000,
                0b01001000,
                0b01011000,
                0b01010000
            }
        },
        water = {
            {
                0b00001010,
                0b00011010,
                0b00010010,
                0b00001011,
                0b00011111,
                0b00010110,
                0b01011111,
                0b01001010,
                0b01011010,
                0b01010010,
                0b01101011,
                0b11111111,
                0b11010110,
                0b11111010
            },
            {
                0b01001000,
                0b01011000,
                0b01010000,
                0b01101000,
                0b11111000,
                0b11010000,
                0b00011000,
                0b01000010,
                0b01111111,
                0b11011111,
                0b11111011,
                0b11111110,
                0b01111011,
                0b11011110
            }
        }
    }

    for x = 0, x_max do
        for y = 0, y_max do
            for i in all(terrains) do
                if mget(x, y) == i[1] then
                    base_tile, first_tile, bitmask_name = i[1], i[2], i[3]
                    set_autotile(x, y)
                end
            end
        end
    end
end

function set_autotile(x, y)
    --4 bits: haut-gauche haut haut-droite gauche droite bas-gauche bas bas-droite
    tile_surroundings = 0b00000000
    --up, left, right, down
    if (is_a_path(x, y-1)) tile_surroundings |= 0b01000000
    if (is_a_path(x-1, y)) tile_surroundings |= 0b00010000
    if (is_a_path(x+1, y)) tile_surroundings |= 0b00001000
    if (is_a_path(x, y+1)) tile_surroundings |= 0b00000010
    --checking corners, adding them only if relevant
    if (is_a_path(x-1, y-1) and band(0b01010000, tile_surroundings) == 0b01010000) tile_surroundings |= 0b10000000
    if (is_a_path(x+1, y-1) and band(0b01001000, tile_surroundings) == 0b01001000) tile_surroundings |= 0b00100000
    if (is_a_path(x-1, y+1) and band(0b00010010, tile_surroundings) == 0b00010010) tile_surroundings |= 0b00000100
    if (is_a_path(x+1, y+1) and band(0b00001010, tile_surroundings) == 0b00001010) tile_surroundings |= 0b00000001

    local current_bitmasks = bitmasks[bitmask_name]
    
    for i, line in ipairs(current_bitmasks) do
        for j, bitmask in ipairs(line) do
            if (bxor(bitmask, tile_surroundings) == 0) mset(x, y, j-1 + (i-1)*16 + first_tile)
        end
    end
end

function is_a_path(x, y, terrain)
    if (x < 0 or x > map_width or y < 0 or y > map_height) return true
    local correct_tile_ids = {
        base_tile, --simple path/river tile
        32, 33, --bridges
    }
    --size of the autotile rectangle
    local lines = #bitmasks[bitmask_name]
    local columns = #bitmasks[bitmask_name][1]
    --normal autotiles:
    for i = 0, lines do
        for j = 0, columns do
            add(correct_tile_ids, first_tile + j + i*16)
        end
    end
    for id in all(correct_tile_ids) do
        if (mget(x, y) == id) return true
    end
    return false
end
