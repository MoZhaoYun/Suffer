local table_insert = table.insert

---插入唯一元素
---@param list table
---@param value any
function table.insert_unique(list, value)
    for _, list_value in ipairs(list) do
        if list_value == value then return end
    end
    table_insert(list, value)
end
