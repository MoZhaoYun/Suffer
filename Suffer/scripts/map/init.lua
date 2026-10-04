local war3 = MWar3
local reactive = require 'mlua.utility.reactive'

-- 地图
Map = {
    -- 响应式
    reactive = {
        fog = false,  -- 是否启用战争迷雾
        fog_mask = false, -- 是否启用黑色阴影
    }
}
Map.reactive = reactive(Map.reactive)

local map_reactive = Map.reactive
reactive.effect(function ()
    war3.FogEnable(map_reactive.fog)
end)
reactive.effect(function ()
    war3.FogMaskEnable(map_reactive.fog_mask)
end)

require 'map.test.init' -- 测试
