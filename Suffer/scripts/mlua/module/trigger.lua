---@class mtrigger 触发器
---
---@field type string 类型
---@field event table 事件
---@field callback function 回调函数
---@field enable_flag boolean 是否启用
---@field destroy_flag boolean 是否摧毁
---
---@field disable fun():mtrigger 禁用触发器
---@field enable fun():mtrigger 启用触发器
---@field is_enable fun():boolean 是否启用触发器
---@field destroy fun():mtrigger 摧毁触发器
---@field __call fun(...):any 运行触发器

local timer = mModule.timer
local table_insert = table.insert
local table_remove = table.remove
local setmetatable = setmetatable

-- 触发器
local trigger = {}
mModule.trigger = trigger

-- 结构
local mt = {
	type = 'mtrigger', -- 类型
	event = nil,     -- 事件
	callback = nil,  -- 回调函数
	enable_flag = true, -- 启用标志
	destroy_flag = nil, -- 摧毁标志
}
mt.__index = mt

---禁用触发器
---@return mtrigger self 触发器
function mt:disable()
	self.enable_flag = false
	return self
end

---启用触发器
---@return mtrigger self 触发器
function mt:enable()
	self.enable_flag = true
	return self
end

---是否启用触发器
---@return boolean  是否启用触发器
function mt:is_enable()
	return self.enable_flag
end

---摧毁触发器
---@return mtrigger self 触发器
function mt:destroy()
	if not self.event then return self end

	local event = self.event
	self.event = nil
	self.destroy_flag = true

	timer.wait(0, function()
		if not event then return end

		for i, trg in ipairs(event) do
			if trg == self then
				table_remove(event, i)
				break
			end
		end
	end)

	return self
end

---运行触发器
---@return any 回调函数返回值
function mt:__call(...)
	if self.destroy_flag then return end
	if self.enable_flag then
		return self:callback(...)
	end
end

mJass.log.info '触发器模块加载完毕'

return setmetatable(trigger, {
	---创建触发器
	---@param event table 要触发的事件
	---@param callback fun(trg:mtrigger,...) 回调函数
	---@return mtrigger 触发器
	__call = function(_, event, callback)
		local trg = setmetatable({ event = event, callback = callback }, mt)
		table_insert(event, trg)
		return trg
	end
})
