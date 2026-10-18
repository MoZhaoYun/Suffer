local common = mJass.common

---创建计时器
---@return timer War3计时器
function mWar3.CreateTimer()
    return common.CreateTimer()
end

---运行计时器
---@param timer timer War3计时器
---@param timeout real 时间间隔
---@param periodic boolean 周期性
---@param callback fun() 回调函数
---@return timer timer War3计时器
function mWar3.TimerStart(timer, timeout, periodic, callback)
    common.TimerStart(timer, timeout, periodic, callback)
    return timer
end
