-- 属性
local attribute = {}

return setmetatable(attribute, {
    __call = function(_, obj, attribute_handle)
        local setter = attribute_handle.setter
        if not setter then
            setter = {}
            attribute_handle.setter = setter
        end

        local getter = attribute_handle.getter
        if not getter then
            getter = {}
            attribute_handle.getter = getter
        end

        local mt = getmetatable(obj)
        local old_index = mt.__index

        mt.__index = function(self, key)
            if getter[key] then
                return getter[key](self, key)
            elseif self.data[key] then
                return self.data[key]
            end

            local t = type(old_index)
            if t == 'function' then
                return old_index(self, key)
            end
            return old_index and old_index[key]
        end

        mt.__newindex = function(self, key, value)
            if setter[key] then
                setter[key](self, key, value)
            elseif self.data[key] then
                self.data[key] = value
            else
                rawset(self, key, value)
            end
        end

        return mt
    end
})
