local war3 = mWar3
local type = type

-- 数据
local data = {}

-- 游戏数据
local game_data = require 'mlua.data.游戏数据'

-- 数据键值
local data_keys = {
    key = '键值',
    unit = '单位数据',
}

---单位数据
---@param unit munit 单位
---@return munit unit 单位
function data.unit(unit)
    if type(unit) ~= 'table' then return unit end
    if unit.type ~= 'munit' then return unit end

    local unit_id = war3.ID2S(war3.GetUnitID(unit.handle))

    local data = rawget(unit, 'data')
    if not data then
        data = {}
        rawset(unit, 'data', data)
    end

    for _, key in ipairs(game_data[data_keys.key][data_keys.unit]) do
        local value = game_data[data_keys.unit][unit_id][key]
        if value ~= nil then
            data[key] = value
        end
    end

    return unit
end

-- 函数
local funcs = {
    munit = data.unit -- 单位
}

return setmetatable(data, {
    __call = function(_, obj)
        if obj and obj.type then
            local f = funcs[obj.type]
            if f then
                return f(obj)
            end
        end
        return obj
    end
})
