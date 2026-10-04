local common = MJass.common
local game = MGame
local war3 = MWar3

---创建单位
---@param player player War3玩家
---@param unit_id string 单位ID
---@param x number X坐标
---@param y number Y坐标
---@param face? number 面向角度
---@return unit War3单位
function MWar3.CreateUnit(player,unit_id,x,y,face)
    local unit_id_real = war3.S2ID(unit_id)
    if not unit_id_real or unit_id_real == 0 then return 0 end

    if not face then face = game.face_default end

    local u = common.CreateUnit(player,unit_id_real,x,y,face)

    return u
end

---获取单位的名称
---@param unit unit 要获取名称的单位
---@return string 单位的名称
function MWar3.GetUnitName(unit)
    return common.GetUnitName(unit)
end
