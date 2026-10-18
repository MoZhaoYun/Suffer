local log = mJass.log
local io_open = io.open
local table_insert = table.insert
local pairs = pairs
local ipairs = ipairs
local tostring = tostring
local type = type

---插入唯一元素
---@param list table 要插入的表
---@param value any 要插入的值
function table.insert_unique(list, value)
    for _, list_value in ipairs(list) do
        if list_value == value then return end
    end
    table_insert(list, value)
end

local log_file  -- 日志文件
local log_write -- 日志写入

if mMap.release then
    -- 发布版本
    log_write = function(...)
        if log_file then
            log_file:write(...)
        end
    end
else
    -- 未发布版本
    local io_write = io.write
    log_write = function(...)
        io_write(...) -- 打印到控制台
        if log_file then
            log_file:write(...)
        end
    end
end

---打印表
---@param tbl table 要打印的表
---@param name string? 表的名称
---@param indent string? 缩进
---@param visited table? 已访问的表列表
local function table_print(tbl, name, indent, visited)
    indent = indent or ''
    visited = visited or {}

    local t = type(tbl)
    if t == 'table' then
        -- 是否已经遍历过这个table
        if visited[tbl] then
            log_write(indent:gsub('\t', '') .. tostring(tbl) .. '\n')
            return
        end

        -- 标记为已访问
        visited[tbl] = true

        if name then
            log_write(indent:gsub('\t', '') .. name .. (' = %s {\n'):format(tostring(tbl)))
        else
            log_write(indent:gsub('\t', '') .. ('%s {\n'):format(tostring(tbl)))
        end

        for k, v in pairs(tbl) do
            local kt = type(k)
            if kt == 'string' then
                log_write(indent .. '\t' .. ('["%s"]'):format(k) .. ' = ')
            elseif kt == "number" then
                log_write(indent .. '\t' .. ('[%s]'):format(k) .. ' = ')
            else
                log_write(indent .. '\t' .. tostring(k) .. ' = ')
            end

            local vt = type(v)
            if vt == 'table' then
                table_print(v, nil, indent .. '\t', visited)
            elseif vt == 'string' then
                log_write(('"%s"'):format(v) .. '\n')
            else
                log_write(tostring(v) .. '\n')
            end
        end

        log_write(indent .. '}\n')
    elseif t == 'string' then
        log_write(indent .. ('"%s"'):format(tbl) .. '\n')
    else
        log_write(indent .. tostring(tbl) .. '\n')
    end
end

---打印表
---@param tbl table 要打印的表
---@param name string? 表的名称
function table.print(tbl, name)
    local file, errmsg

    if log_file then
        file = log_file
    else
        file, errmsg = io_open(log.path, 'a')
        if file then
            log_file = file
        else
            log.warn(errmsg)
            return
        end
    end

    table_print(tbl, name)

    if file then
        file:close()
        log_file = nil
    end
end
