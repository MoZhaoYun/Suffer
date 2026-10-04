-- 默认字符串
string.default = 'DefaultString'
-- 空字符串
string.empty = ''

---检查字符串是否为空或空白
---@param str string 要检查的字符串
---@return boolean 是否为空
function string.is_empty(str)
    return str == nil or str == '' or (type(str) == 'string' and str:match('^%s*$') ~= nil)
end
