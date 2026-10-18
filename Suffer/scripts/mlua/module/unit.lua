---@class munit 单位
---
---@field type string 类型
---@field handle unit 句柄 War3单位
---
---@field event_dispatch fun(self:munit,name:string,...):any 派遣事件
---@field event_notify fun(self:munit,name:string,...):any 通知事件
---@field event fun(self:munit,name:string):fun(f:fun()) 注册事件
---@field attack_sound fun(self:munit,target:munit) 攻击声音

local war3 = mWar3
local event = mModule.event
local module_game = mModule.game
local math_random = math.random
local setmetatable = setmetatable
local data = require 'mlua.data.init'
local attribute = require 'mlua.utility.attribute'
local attack_type = require 'mlua.module.rule.攻击类型'

-- 单位
local unit = {}
mModule.unit = unit

-- 结构
local mt = {
    type = 'munit', -- 类型
    handle = 0,     -- 句柄 War3单位
}
mt.__index = mt

-- 属性处理
local attribute_handle = {
    getter = {
        ['攻击'] = function(self, key)
            local min, max = self['最小攻击'], self['最大攻击']
            return min >= max and min or math_random(min, max)
        end,
        ['防御'] = function(self, key)
            local min, max = self['最小防御'], self['最大防御']
            return min >= max and min or math_random(min, max)
        end
    },
    setter = {
        ['攻击'] = function(self, key, value)
            local data = self.data
            data['最小攻击'] = data['最小攻击'] + value
            data['最大攻击'] = data['最大攻击'] + value
        end,
        ['防御'] = function(self, key, value)
            local data = self.data
            data['最小防御'] = data['最小防御'] + value
            data['最大防御'] = data['最大防御'] + value
        end
    }
}

local handle_to_unit = {} -- 句柄 -> 单位

---派遣事件
---@param name string 事件名称
---@param ... any 事件参数
---@return any 事件返回值
function mt:event_dispatch(name, ...)
    local res = event.dispatch(self, name, ...)
    if res ~= nil then
        return res
    end
    return module_game:event_dispatch(name, ...)
end

---通知事件
---@param name string 事件名称
---@param ... any 事件参数
function mt:event_notify(name, ...)
    event.notify(self, name, ...)
    module_game:event_notify(name, ...)
end

---注册事件
---@param name string 事件名称
---@return fun(f:fun()) 事件注册函数
function mt:event(name)
    return event.register(self, name)
end

---攻击声音
---@param target munit 目标单位
function mt:attack_sound(target)
    local weapon_sound = self['武器声音']
    if weapon_sound then
        war3.DamageTarget(self.handle, target.handle, 0, false, false, nil, nil, attack_type.sound[weapon_sound])
    end
end

-- 任意单位进入地图
local trg = war3.CreateTrigger()
war3.TriggerRegisterAnyUnitEnterRegion(trg, war3.WorldBoundsRegion)
war3.TriggerAddAction(trg, function()
    unit(war3.GetTriggerUnit())
end)

war3.ForPlayer(function(player)
    -- 任意单位发动攻击
    local trg = war3.CreateTrigger()
    war3.TriggerRegisterPlayerUnitEventEx(trg, player, war3.PlayerUnitEventEx.AttackLaunch)
    war3.TriggerAddAction(trg, function()
        local attacker = unit(war3.GetTriggerUnit())
        local attack_target = unit(war3.GetAttackLaunchEventTargetUnit())

        -- 取消原生攻击
        war3.SetAttackLaunchEventCancel(true)

        -- 普通攻击
        local at = attacker['攻击类型']
        if at and attack_type[at] then
            attack_type[at](attacker, attack_target)
        end
    end)
    -- 任意单位造成伤害/接受伤害
    local trg = war3.CreateTrigger()
    war3.TriggerRegisterPlayerUnitEventEx(trg, player, war3.PlayerUnitEventEx.Damaged)
    war3.TriggerAddAction(trg, function()
        war3.SetDamageEventDamage(0)
    end)
end)

return setmetatable(unit, {
    ---封装单位
    ---@param handle unit 句柄 War3单位
    ---@return munit 单位
    __call = function(_, handle)
        if not handle or handle == 0 then return nil end                 -- 无效句柄，返回nil
        if handle_to_unit[handle] then return handle_to_unit[handle] end -- 已经封装，返回封装

        local u = setmetatable({
            type = 'munit',
            handle = handle,
        }, mt)

        -- 初始化属性
        attribute(u, attribute_handle)
        -- 初始化数据
        data(u)

        handle_to_unit[handle] = u

        return u
    end
})
