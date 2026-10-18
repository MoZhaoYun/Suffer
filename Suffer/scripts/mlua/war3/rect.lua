local common = mJass.common

-- 世界边界矩形区域
mWar3.WorldBoundsRect = common.GetWorldBounds()

---创建矩形区域
---@return rect War3矩形区域
function mWar3.GetWorldBounds()
    return common.GetWorldBounds()
end
