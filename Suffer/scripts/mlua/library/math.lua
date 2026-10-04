---检查数值是否在指定范围内
---@param num number 要检查的数值
---@param min number 最小值
---@param max number 最大值
---@return boolean 是否在范围内
function math.in_range(num, min, max)
	return num >= min and num <= max
end
