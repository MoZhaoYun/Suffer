---@class mtimer 计时器
---
---@field type string 类型
---@field callback fun(t:mtimer) 回调函数
---@field execute_time integer 执行时间
---@field loop_interval integer 循环间隔
---@field pause_remain_time integer 暂停剩余时间
---@field destroy_flag boolean 摧毁标志
---
---@field destroy fun():mtimer 摧毁计时器
---@field get_remain_time fun():integer 获取剩余时间
---@field pause fun():mtimer 暂停计时器
---@field resume fun():mtimer 恢复计时器

local math_max = math.max
local math_millisecond = math.millisecond

-- 计时器
local timer = {}
mModule.timer = timer

-- 结构
local mt = {
    type = 'mtimer',         -- 类型
    callback = nil,          -- 回调函数
    execute_time = nil,      -- 执行时间
    loop_interval = nil,     -- 循环间隔
    pause_remain_time = nil, -- 暂停剩余时间
    destroy_flag = nil,      -- 摧毁标志
}

local current_index = 0 -- 当前索引
local current_time = 0  -- 当前时间
local max_time = 0      -- 最大时间

local active_queue = {} -- 活跃队列 时间 -> 队列[mtimer]
local free_queue = {}   -- 空闲队列 [队列]

---分配队列
---@return table 队列
local function alloc_queue()
    local n = #free_queue
    if n > 0 then
        local queue = free_queue[n]
        free_queue[n] = nil
        return queue
    end
    return {}
end

---回收队列
---@param queue table 队列
local function recycle_queue(queue)
    for i = #queue, 1, -1 do
        queue[i] = nil
    end
    free_queue[#free_queue + 1] = queue
end

---摧毁计时器
---@return mtimer self 计时器
function mt:destroy()
    self.destroy_flag = true
    return self
end

---获取剩余时间
---@return integer 剩余时间 毫秒
function mt:get_remain_time()
    -- 是否摧毁
    if self.destroy_flag then
        return 0
    end
    -- 是否暂停
    if self.pause_remain_time then
        return self.pause_remain_time
    end
    -- 执行时间等于当前时间，返回循环间隔或0
    if self.execute_time == current_time then
        return self.loop_interval or 0
    end
    return self.execute_time - current_time
end

---暂停计时器
---@return mtimer self 计时器
function mt:pause()
    self.pause_remain_time = self:get_remain_time()

    local timer_queue = active_queue[self.execute_time]
    if timer_queue then
        for i = #timer_queue, 1, -1 do
            if timer_queue[i] == self then
                timer_queue[i] = false
                break
            end
        end
    end
    return self
end

---设置计时器执行的时间
---@param t mtimer 计时器
---@param time integer 执行时间
local function set_timer_execute_time(t, time)
    local execute_time = current_time + time
    local timer_queue = active_queue[execute_time]

    if not timer_queue then
        timer_queue = alloc_queue()
        active_queue[execute_time] = timer_queue
    end

    t.execute_time = execute_time
    timer_queue[#timer_queue + 1] = t
end

---恢复计时器
---@return mtimer self 计时器
function mt:resume()
    if self.pause_remain_time then
        set_timer_execute_time(self, self.pause_remain_time)
        self.pause_remain_time = nil
    end
    return self
end

---计时器等待
---@param second number 时间间隔
---@param callback fun(t:mtimer) 回调函数
---@return mtimer self 计时器
function timer.wait(second, callback)
    local time = math_max(0, math_millisecond(second))
    local obj = setmetatable({
        callback = callback,
    }, mt)
    set_timer_execute_time(obj, time)
    return obj
end

---计时器循环
---@param second number 时间间隔
---@param callback fun(t:mtimer) 回调函数
---@return mtimer self 计时器
function timer.loop(second, callback)
    local time = math_max(0, math_millisecond(second))
    local obj = setmetatable({
        callback = callback,
        loop_interval = time,
    }, mt)
    set_timer_execute_time(obj, time)
    return obj
end

local timer_wait = timer.wait
local timer_loop = timer.loop

---次数计时器
---@param seconds integer 时间间隔
---@param count integer 次数
---@param callback fun(t:mtimer) 回调函数
---@return mtimer self 计时器
function timer.count(seconds, count, callback)
    count = math_max(0, count)

    if count == 0 then
        return timer_wait(seconds, callback)
    end

    local t = timer_loop(seconds, function(self)
        callback(self)
        count = count - 1
        if count <= 0 then
            self:destroy()
        end
    end)

    return t
end

---获取当前时间
---@return integer 当前时间 毫秒
function timer.get_time()
    return current_time
end

---执行计时器
---@param t mtimer 计时器
local function execute_timer(t)
    -- 是否摧毁
    if t.destroy_flag then
        return
    end
    -- 执行回调
    t:callback()
    -- 是否摧毁或暂停
    if t.destroy_flag or t.pause_remain_time then
        return
    end
    -- 是否有循环间隔
    if t.loop_interval then
        set_timer_execute_time(t, t.loop_interval)
    else
        t.destroy_flag = true
    end
end

---执行计时器队列
local function execute_timer_queue()
    -- 当前时间需要执行的计时器队列
    local timer_queue = active_queue[current_time]

    if not timer_queue then
        current_index = 0
        return
    end

    for i = current_index + 1, #timer_queue do
        current_index = i
        local t = timer_queue[i]
        timer_queue[i] = false
        if t then
            execute_timer(t)
        end
    end

    current_index = 0
    recycle_queue(timer_queue)
end

---启动计时器
mWar3.TimerStart(mWar3.CreateTimer(), 0.01, true, function()
    -- 每次最多处理10个时间单位
    local delta = 10

    -- 如果上一个索引没处理完,回退时间
    if current_index ~= 0 then
        current_time = current_time - 1
    end

    max_time = max_time + delta
    while current_time < max_time do
        current_time = current_time + 1
        execute_timer_queue()
    end
end)

mJass.log.info '计时器模块加载完毕'

return timer
