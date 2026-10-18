local table_insert_unique = table.insert_unique
local setmetatable = setmetatable
local getmetatable = getmetatable
local type = type

-- 响应式
local reactive = {}

local raw_to_proxy = setmetatable({}, { __mode = 'k' }) -- 原始表 -> 代理表
local proxy_to_raw = setmetatable({}, { __mode = 'k' }) -- 代理表 -> 原始表
local target_map = setmetatable({}, { __mode = 'k' })   -- 原始表 -> { [key] = [effect] }
local active_effect = nil                               -- 当前正在执行的 effect

---跟踪依赖关系
---@param raw table 原始表
---@param key any 键名
local function track(raw, key)
    if not active_effect then return end

    local deps = target_map[raw]
    if not deps then
        deps = {}
        target_map[raw] = deps
    end

    local key_deps = deps[key]
    if not key_deps then
        key_deps = {}
        deps[key] = key_deps
    end

    table_insert_unique(key_deps, active_effect)
end

---触发依赖关系
---@param raw table 原始表
---@param key any 键名
local function trigger(raw, key)
    local deps = target_map[raw]
    if not deps then return end

    local key_deps = deps[key]
    if not key_deps then return end

    -- 先拷贝一份，防止执行过程中依赖表被修改
    local effects = {}
    for _, e in ipairs(key_deps) do
        effects[#effects + 1] = e
    end

    for i = 1, #effects do
        effects[i]()
    end
end

---创建effect
---@param fn function 要执行的函数
---@return function effect 函数
function reactive.effect(fn)
    local e

    e = function()
        local prev = active_effect
        active_effect = e

        fn()

        active_effect = prev
    end

    e()

    return e
end

return setmetatable(reactive, {
    ---代理表
    ---@param obj table 要代理的表
    __call = function(_, obj)
        if type(obj) ~= "table" then return obj end            -- 非表类型，原样返回
        if getmetatable(obj) then return obj end               -- 已有元表，原样返回
        if proxy_to_raw[obj] then return obj end               -- 是代理表，原样返回
        if raw_to_proxy[obj] then return raw_to_proxy[obj] end -- 已代理表，返回代理表

        local proxy = setmetatable({}, {
            __index = function(_, key)
                track(obj, key)

                local value = obj[key]
                if type(value) == "table" then
                    return reactive(value)
                end

                return value
            end,
            __newindex = function(_, key, value)
                local old = obj[key]

                if old ~= value then
                    obj[key] = value
                    trigger(obj, key)
                end
            end,
        })

        raw_to_proxy[obj] = proxy
        proxy_to_raw[proxy] = obj

        return proxy
    end
})
