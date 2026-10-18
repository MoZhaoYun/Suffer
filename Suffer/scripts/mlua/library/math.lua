local math_floor = math.floor

---检查数值是否在指定范围内
---@param num number 要检查的数值
---@param min number 最小值
---@param max number 最大值
---@return boolean 是否在范围内
function math.in_range(num, min, max)
	return num >= min and num <= max
end

---将秒转换为毫秒
---@param second number 秒
---@return integer 毫秒
function math.millisecond(second)
	return math_floor(second * 1000)
end

---将毫秒转换为秒
---@param millisecond integer 毫秒
---@return number 秒
function math.second(millisecond)
	return millisecond / 1000
end
