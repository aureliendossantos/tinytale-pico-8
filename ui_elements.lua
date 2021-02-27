window = {life = 0, speed = 2}

function window:new(properties)
    if properties.centered then
        properties.x = 63 - properties.w/2
    end
    setmetatable(properties, self)
    self.__index = self
    return properties
end

function window:draw()
    local target_x, target_y, speed = self.target_x, self.target_y, self.speed
    if target_x then
        if (target_x < self.x) self.x = max(target_x, self.x - speed)
        if (target_x > self.x) self.x = min(target_x, self.x + speed)
    end
    if target_y then
        if (target_y < self.y) self.y = max(target_y, self.y - speed)
        if (target_y > self.y) self.y = min(target_y, self.y + speed)
    end

    local x, y, w, h, life = self.x, self.y, self.w, self.h, self.life
    local x2, y2 = x + w, y + h
    if self.closing and life > 0 then
        life -= 0.2
    end
    if life < 1 then
        x, y, x2, y2 = x + w/2 - (w/2)*life, y + h/2 - (h/2)*life, x + w/2 + (w/2)*life, y + h/2 + (h/2)*life
        self.life = min(1, life + 0.1)
    end
    if not (self.closing and life <= 0) then
        if self.bubble then
            rectfill(x-2, y, x2+2, y2, 0)
            rectfill(x, y-2, x2, y2+2, 0)
            rectfill(x-1, y-1, x2+1, y2+1, 0)
            rectfill(x, y-1, x2, y2+1, 7)
            rectfill(x-1, y, x2+1, y2, 7)
            if self.fill_time then
                local fill_x2 = x + (btn_x_timer*100/self.fill_time) * (x2 - x) / 100
                if btn_x_timer > 0 then
                    rectfill(x, y-1, fill_x2, y2+1, 12)
                    rectfill(x-1, y, fill_x2, y2, 12)
                end
            end
        else
            rounded_rectfill(x - 2, y - 2, x2 + 2, y2 + 3, 1)
            rounded_rectfill(x - 2, y - 2, x2 + 2, y2 + 2, 5)
            rounded_rectfill(x - 1, y - 1, x2 + 1, y2 + 1, 9)
            rectfill(x, y, x2, y2, 5)
        end
        --clip(x - 1, y - 1, self.w + 2, self.h + 2)
        ui_camera_offset_x, ui_camera_offset_y = x, y
        camera(-ui_camera_offset_x, -ui_camera_offset_y)
        if (life == 1) self:draw_contents()
        camera()
        --clip()
    end
end

function window:move(target_x, target_y, speed)
    self.target_x, self.target_y, self.speed = target_x, target_y, speed or self.speed
end

function window:close()
    self.closing = true
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

function tooltip(contents, x, y)
    tooltip_data = {contents, x + ui_camera_offset_x, y + ui_camera_offset_y}
end

function draw_tooltip()
    if tooltip_data then
        local contents, x, y = tooltip_data[1], tooltip_data[2], tooltip_data[3]
        local x2, y2 = x + 2 + #contents * 4, y + 8
        if x2 > 127 then
            x -= x2 - 127
            x2 -= x2 - 127
        end
        line(x+1, y, x2-1, y, 14)
        line(x, y+1, x, y2-1)
        line(x+1, y2, x2-1, y2, 13)
        line(x2, y+1, x2, y2-1)
        rectfill(x+1, y+1, x2-1, y2-1, 7)
        print(contents, x+2, y+2, 1)
        --tooltip must be set each frame in order to be displayed
        tooltip_data = nil
    end
end

---

function print_shaded(text, x, y)
    print(text, x+1, y, 1)
    print(text, x-1, y)
    print(text, x, y+1)
    print(text, x, y-1)
    print(text, x, y, 7)
end

function print_right(text, x, y, col)
    print(text, x - 4 * #tostr(text), y, col)
end

function print_right_shaded(text, x, y)
    print_shaded(text, x - 4 * #tostr(text), y)
end

function print_centered(text, x, y, col)
    print(text, x - 2 * #tostr(text), y, col)
end

function print_centered_shaded(text, x, y)
    print_shaded(text, x - 2 * #tostr(text), y)
end
