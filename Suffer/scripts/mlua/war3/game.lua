local common = mJass.common

---启用/禁用战争迷雾
---@param enable boolean true为启用，false为禁用
function mWar3.FogEnable(enable)
    common.FogEnable(enable)
end

---启用/禁用黑色阴影
---@param enable boolean true为启用，false为禁用
function mWar3.FogMaskEnable(enable)
    common.FogMaskEnable(enable)
end
