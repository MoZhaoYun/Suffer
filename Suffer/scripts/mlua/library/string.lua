-- 默认字符串
string.default = 'DefaultString'
-- 空字符串
string.empty = ''

---检查字符串是否为空
---@param str string 要检查的字符串
---@return boolean 是否为空
function string.is_empty(str)
    if not str then return true end
    return str:match('^%s*$') ~= nil
end
