local common = MJass.common
local math = math

MWar3.Player = setmetatable({},{
    __call = function (self,player_id)
        if not player_id then player_id = 1 end
        if not math.in_range(player_id,1,16) then player_id = 1 end
        return common.Player(player_id - 1)
    end
})

for player_id = 1, 16 do
    MWar3.Player[player_id] = common.Player(player_id - 1)
end

---获取本地玩家
---@return player War3玩家
function MWar3.GetLocalPlayer()
    return common.GetLocalPlayer()
end

---显示文本给玩家(指定时间)
---@param player player War3玩家
---@param x number X坐标
---@param y number Y坐标
---@param message string 显示的文本
function MWar3.DisplayTextToPlayerEx(player,x,y,message,duration)
    common.DisplayTimedTextToPlayer(player,x,y,duration,message)
end

---显示文本给玩家(自动限时)
---@param player player War3玩家
---@param x number X坐标
---@param y number Y坐标
---@param message string 显示的文本
function MWar3.DisplayTextToPlayer(player,x,y,message)
    common.DisplayTextToPlayer(player,x,y,message)
end
