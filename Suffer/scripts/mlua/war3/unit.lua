local common = mJass.common
local japi = mJass.japi
local war3 = mWar3
local game = mGame

---创建单位
---@param player player War3玩家
---@param unit_id string 字符串ID
---@param x? number X坐标，默认为0
---@param y? number Y坐标，默认为x
---@param face? number 面向角度，默认为默认面向角度
---@return unit War3单位
function mWar3.CreateUnit(player, unit_id, x, y, face)
    local unit_id_real = war3.S2ID(unit_id)
    if not unit_id_real or unit_id_real == 0 then return 0 end

    if not x then x = 0 end
    if not y then y = x end
    if not face then face = game.face_default end

    return common.CreateUnit(player, unit_id_real, x, y, face)
end

---获取触发单位
---@return unit War3单位
function mWar3.GetTriggerUnit()
    return common.GetTriggerUnit()
end

---获取伤害事件的来源单位
---@return unit War3单位
function mWar3.GetDamageEventSourceUnit()
    return common.GetEventDamageSource()
end

---获取发动攻击事件的目标单位
---@return unit War3单位
function mWar3.GetAttackLaunchEventTargetUnit()
    return japi.X_GetAttackLaunchEventTargetUnit()
end

---获取单位的ID
---@param unit unit War3单位
---@return integer 单位ID War3ID
function mWar3.GetUnitID(unit)
    return common.GetUnitTypeId(unit)
end

---获取单位的名称
---@param unit unit War3单位
---@return string 单位的名称
function mWar3.GetUnitName(unit)
    return common.GetUnitName(unit)
end
