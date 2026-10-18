local war3 = mWar3
local module = mModule

-- 界面
Frame = {
    -- 原生界面
    natives = {}
}

require 'map.frame.layer' -- 层级

-- 参数
local params = {
    -- 地图
    map = {
        size = { 0.139375, 0.138125 }, -- 地图尺寸
        -- 地图按钮
        button = {
            size = { 0.023125, 0.020625 }, -- 地图按钮尺寸
        }
    },
    -- 头像
    portrait = {
        size = { 0.09, 0.0856 }, -- 头像尺寸
    },
    -- 命令栏
    command_bar = {
        row_number = 4,    -- 命令栏行数
        column_number = 5, -- 命令栏列数
        -- 命令栏按钮
        button = {
            size = { 0.038, 0.038 } -- 命令栏按钮尺寸
        }
    }
}

local points = war3.frame.point

-- 隐藏界面
war3.HideInterface()
-- 隐藏黑边
war3.SetBlackBorders(0, 0)

-- 地图
local map = module.frame(war3.GetMinimap())
map:clear_point_all()
map:set_point_abs(points.bottom_left, 0, 0)
map:set_size(params.map.size[1], params.map.size[2])
Frame.natives.map = map

-- 地图按钮
local last_button
Frame.natives.map_button = {}
for i = 0, 4 do
    local button = module.frame(war3.GetMiniMapButton(i))

    button:clear_point_all()
    if i == 0 then
        button:set_point(points.top_left, map, points.top_right)
    else
        button:set_point(points.top, last_button, points.bottom)
    end
    button:set_size(params.map.button.size[1], params.map.button.size[2])

    last_button = button
    Frame.natives.map_button[i + 1] = button
end

-- 头像
local portrait = module.frame(war3.GetPortrait())
portrait:clear_point_all()
portrait:set_point_abs(points.bottom, 0.4, 0)
portrait:set_size(params.portrait.size[1], params.portrait.size[2])
Frame.natives.portrait = portrait

-- 命令栏
local pcb = params.command_bar
local x_start = 0.8 - pcb.button.size[1] / 2 * (pcb.column_number * 2 - 1)
local y_start = pcb.button.size[2] / 2 * (pcb.row_number * 2 - 1)
module.timer.wait(1, function()
    -- 调整
    war3.ResizeCommandBar(pcb.row_number, pcb.column_number)
    war3.RefreshCommandBar(true)
    module.timer.wait(1, function()
        local index = 0
        Frame.natives.command_button = {}
        -- 移动
        for row = 0, pcb.row_number - 1 do
            for column = 0, pcb.column_number - 1 do
                local button = module.frame(war3.GetAbilityButton(column, row))
                local x = x_start + column * pcb.button.size[1]
                local y = y_start - row * pcb.button.size[2]
                button:command_button_move(x, y, pcb.button.size[1], pcb.button.size[2], pcb.button.size[2],
                    pcb.button.size[2], true, true)

                index = index + 1
                Frame.natives.command_button[index] = button
            end
        end
    end)
end)
