local common = mJass.common
local war3 = mWar3
local math_in_range = math.in_range

mWar3.Player = setmetatable({}, {
    __call = function(_, player_id)
        if not player_id then player_id = 1 end
        if not math_in_range(player_id, 1, 16) then player_id = 1 end
        return common.Player(player_id - 1)
    end
})

for player_id = 1, 16 do
    war3.Player[player_id] = common.Player(player_id - 1)
end

mWar3.LocalPlayer = common.GetLocalPlayer()

---遍历所有玩家
---@param callback fun(player: player) 回调函数
function mWar3.ForPlayer(callback)
    for player_id = 1, 16 do
        callback(war3.Player[player_id])
    end
end

---获取本地玩家
---@return player 本地玩家 War3玩家
function mWar3.GetLocalPlayer()
    return common.GetLocalPlayer()
end

---显示文本给玩家(指定时间)
---@param player player War3玩家
---@param message string 显示的文本
---@param duration number 显示时间
---@param x? number X坐标，默认为0
---@param y? number Y坐标，默认为0
---@return player player War3玩家
function mWar3.DisplayTextToPlayerEx(player, message, duration, x, y)
    if not x then x = 0 end
    if not y then y = 0 end
    common.DisplayTimedTextToPlayer(player, x, y, duration, message)
    return player
end

---显示文本给玩家(自动限时)
---@param player player War3玩家
---@param message string 显示的文本
---@param x? number X坐标，默认为0
---@param y? number Y坐标，默认为0
---@return player player War3玩家
function mWar3.DisplayTextToPlayer(player, message, x, y)
    if not x then x = 0 end
    if not y then y = 0 end
    common.DisplayTextToPlayer(player, x, y, message)
    return player
end
