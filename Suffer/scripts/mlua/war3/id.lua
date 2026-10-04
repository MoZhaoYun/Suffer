local log = MJass.log
local string_is_empty = string.is_empty

local s2Id = {}
local id2s = {}

---字符串转ID
---@param str string 要转换的字符串
---@return number 转换后的id 转换失败返回0
local function _s2id(str)
    if string_is_empty(str) or #str ~= 4 then
        log.warn(('War3.S2ID:字符串异常[%s]'):format(str))
        return 0
    end

    local result = (">I4"):unpack(str)
    s2Id[str] = result
    id2s[result] = str
    return result
end

---字符串转ID
---@param str string 要转换的字符串
---@return number 转换后的id 转换失败返回0
function MWar3.S2ID(str)
    return s2Id[str] or _s2id(str)
end

---ID转字符串
---@param id number 要转换的ID
---@return string 转换后的字符串 转换失败返回空字符串
local function _id2s(id)
    if not id or id == 0 then
        log.warn(('War3.ID2S:ID异常[%s]'):format(id))
        return ''
    end

    local result = (">I4"):pack(id)
    id2s[id] = result
    s2Id[result] = id
    return result
end

---ID转字符串
---@param id number 要转换的ID
---@return string 转换后的字符串 转换失败返回空字符串
function MWar3.ID2S(id)
    return id2s[id] or _id2s(id)
end
