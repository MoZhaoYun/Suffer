local war3 = mWar3
local module = mModule

-- 层级
Frame.layer_simple = {}
Frame.layer_lower_level = {}
Frame.layer = {}

-- 参数
local params = {
    -- 数量
    number = {
        layer_simple = 10,      -- 层级数量-简单
        layer_lower_level = 10, -- 层级数量-低级
        layer = 10,             -- 层级数量
    }
}

local types = war3.frame.type

-- 层级-简单
local sf = module.frame(0)
for i = 1, params.number.layer_simple do
    Frame.layer_simple[i] = sf:create(types.simple_frame)
end
Frame.natives[0] = sf

-- 层级-低级
local llf = module.frame(war3.GetLowerLevelGameFrame())
for i = 1, params.number.layer_lower_level do
    Frame.layer_lower_level[i] = llf:create(types.frame)
end
Frame.natives.game_lower_level = llf

-- 层级
local f = module.frame(war3.GetGameFrame())
for i = 1, params.number.layer do
    Frame.layer[i] = f:create(types.frame)
end
Frame.natives.game = f
