local setmetatable = setmetatable

-- 响应式
local reactive = {}
local mt = {}
setmetatable(reactive, mt)

local raw_proxy = {} -- raw -> proxy
local proxy_raw = {} -- proxy -> raw

local current_effect = nil
local deps = {} -- deps[raw][key] = {effect1, effect2, ...}

-- 响应
---@param fn function 响应函数
---@return function 包装后的响应函数
function reactive.effect(fn)
    local wrapper
    wrapper= function()
        local pre = current_effect
        current_effect = wrapper
        fn()
        current_effect = pre
    end
    wrapper()
    return wrapper
end

---追踪
---@param raw table 原始表
---@param key any 键值
local function track(raw, key)
    if not current_effect then return end

    if not deps[raw] then deps[raw] = {} end
    if not deps[raw][key] then deps[raw][key] = {} end

    table.insert_unique(deps[raw][key], current_effect)
end

---触发
---@param raw table 原始表
---@param key any 键值
local function trigger(raw, key)
    local list = deps[raw] and deps[raw][key]

    if not list then return end

    for _, fn in ipairs(list) do
        fn()
    end
end

---响应式代理
---@param _ table 响应式模块
---@param tbl table 需要响应式代理的表
---@return table 代理表
function mt.__call(_, tbl)
    -- 不是表，直接返回
    if type(tbl) ~= "table" then return tbl end
    -- 是代理表，直接返回
    if proxy_raw[tbl] then return tbl end
    -- 已经代理过的表，直接返回代理表
    if raw_proxy[tbl] then return raw_proxy[tbl] end

    local proxy = {}
    local proxy_mt = {
        __index = function(self, key)
            local raw = proxy_raw[self]
            local value = raw[key]

            track(raw, key)

            if type(value) == "table" then
                return reactive(value)
            end

            return value
        end,
        __newindex = function(self, key, value)
            local raw = proxy_raw[self]
            local old = raw[key]

            if old == value then return end

            raw[key] = value
            trigger(raw, key)
        end
    }

    raw_proxy[tbl] = proxy
    proxy_raw[proxy] = tbl

    return setmetatable(proxy, proxy_mt)
end

MJass.log.info '响应式模块加载完毕'

return reactive
