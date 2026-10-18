local common = mJass.common

-- 世界边界不规则矩形区域
mWar3.WorldBoundsRegion = common.CreateRegion()
common.RegionAddRect(mWar3.WorldBoundsRegion, mWar3.WorldBoundsRect)

---创建不规则矩形区域
---@return region War3不规则矩形区域
function mWar3.CreateRegion()
    return common.CreateRegion()
end

---添加矩形区域到不规则矩形区域
---@param region region War3不规则矩形区域
---@param rect rect War3矩形区域
---@return region region War3不规则矩形区域
function mWar3.RegionAddRect(region, rect)
    common.RegionAddRect(region, rect)
    return region
end
