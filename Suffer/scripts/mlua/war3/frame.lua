local japi = mJass.japi

-- War3界面
mWar3.frame = {
    -- War3界面类型
    type = {
        simple_frame = 'SIMPLEFRAME', -- 简单界面
        frame        = 'FRAME',       -- 界面
        backdrop     = 'BACKDROP',    -- 背景
        text         = 'TEXT',        -- 文本
        button       = 'BUTTON',      -- 按钮
        sprite       = 'SPRITE',      -- 精灵
    },
    -- War3界面锚点
    point = {
        top_left     = 0x0, -- 左上
        top          = 0x1, -- 顶部
        top_right    = 0x2, -- 右上
        left         = 0x3, -- 左侧
        center       = 0x4, -- 中心
        right        = 0x5, -- 右侧
        bottom_left  = 0x6, -- 左下
        bottom       = 0x7, -- 底部
        bottom_right = 0x8, -- 右下
    },
    -- War3界面区域锚点
    point_rect = {
        top    = 0x0, -- 顶部
        left   = 0x1, -- 左侧
        bottom = 0x2, -- 底部
        right  = 0x3, -- 右侧
    }
}

---创建界面(TagName)
---@param frame_type string War3界面类型
---@param parent integer 父级 War3界面
---@param template? string 模板
---@param name? string 名称
---@param id? integer ID
---@return integer War3界面
function mWar3.CreateFrameByTagName(frame_type, parent, template, name, id)
    if not template then template = '' end
    if not name then name = '' end
    if not id then id = 0 end
    return japi.DzCreateFrameByTagName(frame_type, name, parent, template, id)
end

---创建界面
---@param parent integer 父级 War3界面
---@param name string 名称
---@param id integer ID
---@return integer War3界面
function mWar3.CreateFrame(parent, name, id)
    return japi.DzCreateFrame(name, parent, id)
end

---获取界面的父级
---@param frame integer War3界面
---@return integer 父级 War3界面
function mWar3.GetFrameParent(frame)
    return japi.DzFrameGetParent(frame)
end

---获取低级的游戏界面
---@return integer War3界面
function mWar3.GetLowerLevelGameFrame()
    return japi.DzFrameGetLowerLevelFrame()
end

---获取游戏界面
---@return integer War3界面
function mWar3.GetGameFrame()
    return japi.DzGetGameUI()
end

---获取小地图
---@return integer 小地图 War3界面
function mWar3.GetMinimap()
    return japi.DzFrameGetMinimap()
end

---获取小地图按钮
---@param index integer 按钮索引
---@return integer 小地图按钮 War3界面
function mWar3.GetMiniMapButton(index)
    return japi.DzFrameGetMinimapButton(index)
end

---获取头像
---@return integer 头像 War3界面
function mWar3.GetPortrait()
    return japi.DzFrameGetPortrait()
end

---获取技能按钮
---@param x number X坐标
---@param y number Y坐标
---@return integer 技能按钮 War3界面
function mWar3.GetAbilityButton(x, y)
    return japi.X_GetCommandBarButton(x, y)
end

---设置界面的绝对锚点
---@param frame integer War3界面
---@param point integer War3锚点
---@param x? number X坐标，默认为0
---@param y? number Y坐标，默认为x
---@return integer frame War3界面
function mWar3.SetFramePointAbs(frame, point, x, y)
    if not x then x = 0 end
    if not y then y = x end
    japi.DzFrameSetAbsolutePoint(frame, point, x, y)
    return frame
end

---设置界面的锚点
---@param frame integer War3界面
---@param point integer War3锚点
---@param frame_relative integer 相对界面 War3界面
---@param point_relative integer 相对锚点 War3锚点
---@param x? number X坐标，默认为0
---@param y? number Y坐标，默认为x
---@return integer frame War3界面
function mWar3.SetFramePoint(frame, point, frame_relative, point_relative, x, y)
    if not x then x = 0 end
    if not y then y = x end
    japi.DzFrameSetPoint(frame, point, frame_relative, point_relative, x, y)
    return frame
end

---清除界面的全部锚点
---@param frame integer War3界面
---@return integer frame War3界面
function mWar3.ClearFrameAllPoints(frame)
    japi.DzFrameClearAllPoints(frame)
    return frame
end

---设置界面大小
---@param frame integer War3界面
---@param width number 宽度
---@param height? number 高度，默认为width
---@return integer frame War3界面
function mWar3.SetFrameSize(frame, width, height)
    if not height then height = width end
    japi.DzFrameSetSize(frame, width, height)
    return frame
end

local fp = mWar3.frame.point

local px = {
    left = {
        [fp.top_left] = true,
        [fp.left] = true,
        [fp.bottom_left] = true,
    },
    center = {
        [fp.top] = true,
        [fp.center] = true,
        [fp.bottom] = true,
    },
    right = {
        [fp.top_right] = true,
        [fp.right] = true,
        [fp.bottom_right] = true,
    }
}

local py = {
    top = {
        [fp.top_left] = true,
        [fp.top] = true,
        [fp.top_right] = true,
    },
    center = {
        [fp.left] = true,
        [fp.center] = true,
        [fp.right] = true,
    },
    bottom = {
        [fp.bottom_left] = true,
        [fp.bottom] = true,
        [fp.bottom_right] = true,
    }
}

local fpr = mWar3.frame.point_rect

---获取界面的锚点坐标
---@param frame integer War3界面
---@param point integer War3锚点
---@return number X坐标
---@return number Y坐标
function mWar3.GetFramePointXY(frame, point)
    local x, y
    -- X坐标
    if px.left[point] then
        x = japi.X_FrameGetRectPoint(frame, fpr.left)
    elseif px.center[point] then
        x = (japi.X_FrameGetRectPoint(frame, fpr.left) + japi.X_FrameGetRectPoint(frame, fpr.right)) / 2
    elseif px.right[point] then
        x = japi.X_FrameGetRectPoint(frame, fpr.right)
    end
    -- Y坐标
    if py.top[point] then
        y = japi.X_FrameGetRectPoint(frame, fpr.top)
    elseif py.center[point] then
        y = (japi.X_FrameGetRectPoint(frame, fpr.top) + japi.X_FrameGetRectPoint(frame, fpr.bottom)) / 2
    elseif py.bottom[point] then
        y = japi.X_FrameGetRectPoint(frame, fpr.bottom)
    end
    return x, y
end

---获取界面大小
---@param frame integer War3界面
---@return number 宽度
---@return number 高度
function mWar3.GetFrameSize(frame)
    local x = japi.X_FrameGetRectPoint(frame, fpr.right) - japi.X_FrameGetRectPoint(frame, fpr.left)
    local y = japi.X_FrameGetRectPoint(frame, fpr.top) - japi.X_FrameGetRectPoint(frame, fpr.bottom)
    return x, y
end

---设置界面是否显示
---@param frame integer War3界面
---@param show? boolean 是否显示，默认为 true
---@return integer frame War3界面
function mWar3.SetFrameShow(frame, show)
    if show == nil then show = true end
    japi.DzFrameShow(frame, show)
    return frame
end

---摧毁界面
---@param frame integer War3界面
---@return integer frame War3界面
function mWar3.DestroyFrame(frame)
    japi.DzDestroyFrame(frame)
    return frame
end

---设置黑边
---@param top number 顶部黑边
---@param bottom number 底部黑边
function mWar3.SetBlackBorders(top, bottom)
    japi.DzFrameEditBlackBorders(top, bottom)
end

---隐藏界面
function mWar3.HideInterface()
    japi.DzFrameHideInterface()
end

---调整命令栏大小
---@param row integer 命令栏行数
---@param col integer 命令栏列数
function mWar3.ResizeCommandBar(row, col)
    japi.X_CommandBarResize(row, col)
end

---移动命令栏按钮
---@param command_button integer 命令栏按钮 War3界面
---@param x number X坐标
---@param y number Y坐标
---@param width number 宽度
---@param height number 高度
---@param model_width number 模型宽度
---@param model_height number 模型高度
---@param resize_cooldown boolean 是否调整冷却UI
---@param resize_autocast boolean 是否调整自动施法UI
---@return boolean 是否成功移动
function mWar3.MoveCommandButton(command_button, x, y, width, height, model_width, model_height, resize_cooldown,
                                 resize_autocast)
    return japi.X_MoveCommandButton(command_button, x, y, width, height, model_width, model_height, resize_cooldown,
        resize_autocast)
end

---刷新命令栏
---@param now boolean 是否立即刷新，false为下一帧刷新
---@return boolean 是否成功刷新
function mWar3.RefreshCommandBar(now)
    return japi.X_RefreshCommandBar(now)
end
