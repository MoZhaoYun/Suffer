---@class mframe 界面
---
---@field type string 类型
---@field handle integer 句柄 War3界面
---@field parent mframe 父级
---@field frame_type string War3界面类型
---@field template string 模板
---@field name string 名称
---@field id integer ID
---
---@field create fun(self:mframe,frame_type:string,template:string,name:string,id?:integer):mframe 创建界面
---@field destroy fun(self:mframe):mframe 摧毁界面
---@field clear_point_all fun(self:mframe):mframe 清除所有锚点
---@field set_point_abs fun(self:mframe,point:integer,x?:number,y?:number):mframe 设置绝对锚点
---@field set_point fun(self:mframe,point:integer,frame_relative:mframe,point_relative?:integer,x?:number,y?:number):mframe 设置锚点
---@field set_size fun(self:mframe,width?:number,height?:number):mframe 设置大小
---@field command_button_move fun(self:mframe,x:number,y:number,width:number,height:number,model_width:number,model_height:number,resize_cooldown:boolean,resize_autocast:boolean):mframe 移动命令按钮

local war3 = mWar3
local setmetatable = setmetatable

-- 界面
local frame = {}
mModule.frame = frame

-- 结构
local mt = {
    type = 'mframe',  -- 类型
    handle = 0,       -- 句柄
    parent = nil,     -- 父级
    frame_type = nil, -- 界面类型
    template = nil,   -- 模板
    name = nil,       -- 名称
    id = nil,         -- ID
}
mt.__index = mt

local handle_to_frame = {} -- 句柄 -> 界面

---创建界面
---@param frame_type string War3界面类型
---@param template string 模板
---@param name string 名称
---@param id integer ID
---@return mframe 界面
function mt:create(frame_type, template, name, id)
    local parent_handle = self.handle
    local handle = war3.CreateFrameByTagName(frame_type, parent_handle, template, name, id)
    return frame(handle, frame_type, template, name, id)
end

---摧毁界面
---@return mframe self 界面
function mt:destroy()
    local handle = self.handle
    handle_to_frame[handle] = nil
    war3.DestroyFrame(handle)
    return self
end

---清除所有锚点
---@return mframe self 界面
function mt:clear_point_all()
    war3.ClearFrameAllPoints(self.handle)
    return self
end

---设置绝对锚点
---@param point integer War3锚点
---@param x number X坐标，默认为0
---@param y number Y坐标，默认为x
---@return mframe self 界面
function mt:set_point_abs(point, x, y)
    war3.SetFramePointAbs(self.handle, point, x, y)
    return self
end

---设置锚点
---@param point integer War3锚点
---@param frame_relative mframe 相对界面
---@param point_relative integer 相对锚点 War3锚点
---@param x number X坐标，默认为0
---@param y number Y坐标，默认为x
---@return mframe self 界面
function mt:set_point(point, frame_relative, point_relative, x, y)
    war3.SetFramePoint(self.handle, point, frame_relative.handle, point_relative, x, y)
    return self
end

---设置大小
---@param width number 宽度
---@param height number 高度，默认为width
---@return mframe self 界面
function mt:set_size(width, height)
    war3.SetFrameSize(self.handle, width, height)
    return self
end

---移动命令按钮
---@param x number X坐标
---@param y number Y坐标
---@param width number 宽度
---@param height number 高度
---@param model_width number 模型宽度
---@param model_height number 模型高度
---@param resize_cooldown boolean 是否调整冷却UI
---@param resize_autocast boolean 是否调整自动施法UI
---@return mframe self 界面
---@return boolean 是否成功移动
function mt:command_button_move(x, y, width, height, model_width, model_height, resize_cooldown, resize_autocast)
    local res = war3.MoveCommandButton(self.handle, x, y, width, height, model_width, model_height, resize_cooldown,
        resize_autocast)
    return self, res
end

return setmetatable(frame, {
    ---封装界面
    ---@param handle integer 句柄 War3界面
    ---@param frame_type? string War3界面类型
    ---@param template? string 模板
    ---@param name? string 名称
    ---@param id? integer ID
    ---@return mframe 界面
    __call = function(self, handle, frame_type, template, name, id)
        if not handle then handle = 0 end
        if handle_to_frame[handle] then return handle_to_frame[handle] end -- 已经封装，返回封装

        local obj = setmetatable({
            handle = handle,
            frame_type = frame_type,
            template = template,
            name = name,
            id = id
        }, mt)

        handle_to_frame[handle] = obj

        obj.parent = self(war3.GetFrameParent(handle))

        return obj
    end
})
