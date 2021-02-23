window = {life = 0}

function window:new(properties)
    properties = properties or {}
    setmetatable(properties, self)
    self.__index = self
    return properties
end

function window:draw()
    local x, y, x2, y2 = self.x, self.y, self.x + self.w, self.y + self.h
    rect(x - 1, y - 1, x2 + 1, y2 + 1, 4)
    rectfill(x, y, x2, y2, 5)
    clip(x - 1, y - 1, self.w + 2, self.h + 2)
    camera(-x, -y)
    self:draw_contents()
    camera()
    clip()
end

function window:move(target_x, target_y, speed)
    speed = speed or 2
    if (target_x < self.x) self.x = max(target_x, self.x - speed)
    if (target_x > self.x) self.x = min(target_x, self.x + speed)
    if (target_y < self.y) self.y = max(target_y, self.y - speed)
    if (target_y > self.y) self.y = min(target_y, self.y + speed)
end

---

bar = {timer = 0}

function bar:new(value, fill_col, back_col)
    new_bar = {
        start = value,
        printed = value,
        final_value = value,
        fill_col = fill_col,
        back_col = back_col
    }
    setmetatable(new_bar, self)
    self.__index = self
    return new_bar
end

function bar:update(monitored_value)
    --example: if current value different from real hp
    if self.final_value ~= monitored_value then
        self.timer = 0
        self.start = self.printed
        self.final_value = monitored_value
    end
    --timer 1 = end of animation
    self.timer = min(1, self.timer + 0.05)
    self.printed = circular_out(self.timer, self.start, self.final_value - self.start, 1)
end

function bar:draw(x, y, w, h, max_value)
    rectfill(x, y+1, 27, y+h, self.back_col)
    rectfill(x, y+1, 1 + self.printed * (w-1) / max_value, y+h, self.fill_col)
    rect(x, y, w, y+h+1, 6)
end

---

function print_shaded(text, x, y)
    print(text, x+1, y, 1)
    print(text, x-1, y)
    print(text, x, y+1)
    print(text, x, y-1)
    print(text, x, y, 7)
end

function print_align_right(text, x, y, col)
    print(text, x - 4 * #tostr(text), y, col)
end

function print_align_right_shaded(text, x, y)
    print_shaded(text, x - 4 * #tostr(text), y)
end

function print_centered_shaded(text, x, y)
    print_shaded(text, x - 2 * #tostr(text), y)
end
