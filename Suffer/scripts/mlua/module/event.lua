local trigger = mModule.trigger

-- 事件
local event = {}
mModule.event = event

---派遣事件
---@param obj table 事件对象
---@param name string 事件名称
---@param ... any 事件参数
function event.dispatch(obj, name, ...)
	local events = obj.events
	if not events then return end

	local event = events[name]
	if not event then return end

	for i = #event, 1, -1 do
		local res = event[i](...)
		if res ~= nil then
			return res
		end
	end
end

---通知事件
---@param obj table 事件对象
---@param name string 事件名称
---@param ... any 事件参数
function event.notify(obj, name, ...)
	local events = obj.events
	if not events then return end

	local event = events[name]
	if not event then return end

	for i = #event, 1, -1 do
		event[i](...)
	end
end

---注册事件
---@param obj table 事件对象
---@param name string 事件名称
---@return fun(f:fun()) 事件注册函数
function event.register(obj, name)
	local events = obj.events

	if not events then
		events = {}
		obj.events = events
	end

	local event = events[name]
	if not event then
		event = {}
		events[name] = event
		function event:remove()
			events[name] = nil
		end
	end

	return function(f)
		return trigger(event, f)
	end
end

---派遣事件
---@param name string 事件名称
---@param ... any 事件参数
function mModule.game:event_dispatch(name, ...)
	return event.dispatch(self, name, ...)
end

---通知事件
---@param name string 事件名称
---@param ... any 事件参数
function mModule.game:event_notify(name, ...)
	return event.notify(self, name, ...)
end

---注册事件
---@param name string 事件名称
---@return fun(f:fun()) 事件注册函数
function mModule.game:event(name)
	return event.register(self, name)
end

mJass.log.info '事件模块加载完毕'

return event
