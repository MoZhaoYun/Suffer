local log = mJass.log

local s2id = {}
local id2s = {}

---字符串ID转War3ID
---@param str string 要转换的字符串ID
---@return number War3ID
local function _s2id(str)
    local result = (">I4"):unpack(str)
    s2id[str] = result
    id2s[result] = str
    return result
end

---字符串ID转War3ID
---@param str string 要转换的字符串ID
---@return number War3ID
function mWar3.S2ID(str)
    if #str < 4 then
        log.warn(('War3.S2ID:字符串长度不足4位[%s]'):format(str))
        return 0
    end
    return s2id[str] or _s2id(str)
end

---War3ID转字符串ID
---@param id number 要转换的War3ID
---@return string 字符串ID
local function _id2s(id)
    local result = (">I4"):pack(id)
    id2s[id] = result
    s2id[result] = id
    return result
end

---War3ID转字符串ID
---@param id number 要转换的War3ID
---@return string 字符串ID
function mWar3.ID2S(id)
    return id2s[id] or _id2s(id)
end
