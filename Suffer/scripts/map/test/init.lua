local unit = mModule.unit

local u = unit(mWar3.CreateUnit(mWar3.Player[1], 'Obla', -128, 0))
local u2 = unit(mWar3.CreateUnit(mWar3.Player[1], 'Obla', 128, 0))

u:event('单位-攻击')(function(_, data)
    if math.random(0, 1) == 1 then
        return true
    end
    data.attack = data.attack + math.random(1, 1000)
end)

u2:event('单位-被攻击')(function(_, data)
    if math.random(0, 1) == 1 then
        return true
    end
    data.defense = data.defense + math.random(1, 1000)
end)

table.print(u, 'u')
table.print(u2, 'u2')
