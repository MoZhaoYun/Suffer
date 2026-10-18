---@meta

---@class integer : number
---@class real :number
---@class code : function
---@class trigger : integer
---@class timer : integer
---@class unit : integer, widget
---@class X_EffectGroup : integer
---@class X_Vector : integer
---@class boolexpr : nil

---'japi'
---@class japi
local japi = {}

-- BzAPI
-- hardware

---获取鼠标在游戏内的坐标X
---@return real
function japi.DzGetMouseTerrainX() end

---获取鼠标在游戏内的坐标Y
---@return real
function japi.DzGetMouseTerrainY() end

---获取鼠标在游戏内的坐标Z
---@return real
function japi.DzGetMouseTerrainZ() end

---鼠标是否在游戏内
---@return boolean
function japi.DzIsMouseOverUI() end

---获取鼠标在屏幕的坐标X
---@return integer
function japi.DzGetMouseX() end

---获取鼠标在屏幕的坐标Y
---@return integer
function japi.DzGetMouseY() end

---获取鼠标游戏窗口坐标X
---@return integer
function japi.DzGetMouseXRelative() end

---获取鼠标游戏窗口坐标Y
---@return integer
function japi.DzGetMouseYRelative() end

---设置鼠标的坐标
---@param x integer
---@param y integer
function japi.DzSetMousePos(x, y) end

---注册鼠标事件
---@param trig trigger
---@param btn integer
---@param status integer
---@param sync boolean
---@param func string
function japi.DzTriggerRegisterMouseEvent(trig, btn, status, sync, func) end

---注册鼠标事件(ByCode)
---@param trig trigger
---@param btn integer
---@param status integer
---@param sync boolean
---@param funcHandle code
function japi.DzTriggerRegisterMouseEventByCode(trig, btn, status, sync, funcHandle) end

---键盘事件
---@param trig trigger
---@param key integer
---@param status integer
---@param sync boolean
---@param func string
function japi.DzTriggerRegisterKeyEvent(trig, key, status, sync, func) end

---键盘事件(ByCode)
---@param trig trigger
---@param key integer
---@param status integer
---@param sync boolean
---@param funcHandle code
function japi.DzTriggerRegisterKeyEventByCode(trig, key, status, sync, funcHandle) end

---鼠标滚轮事件
---@param trig trigger
---@param sync boolean
---@param func string
function japi.DzTriggerRegisterMouseWheelEvent(trig, sync, func) end

---鼠标滚轮事件(ByCode)
---@param trig trigger
---@param sync boolean
---@param funcHandle code
function japi.DzTriggerRegisterMouseWheelEventByCode(trig, sync, funcHandle) end

---鼠标移动事件
---@param trig trigger
---@param sync boolean
---@param func string
function japi.DzTriggerRegisterMouseMoveEvent(trig, sync, func) end

---鼠标移动事件(ByCode)
---@param trig trigger
---@param sync boolean
---@param funcHandle code
function japi.DzTriggerRegisterMouseMoveEventByCode(trig, sync, funcHandle) end

---事件响应 - 获取触发的按键
---@return integer
function japi.DzGetTriggerKey() end

---事件响应 - 获取滚轮变化值
---@return integer
function japi.DzGetWheelDelta() end

---判断按键是否按下
---@param iKey integer
---@return boolean
function japi.DzIsKeyDown(iKey) end

---事件响应 - 获取触发硬件事件的玩家
---@return player
function japi.DzGetTriggerKeyPlayer() end

---获取war3窗口宽度
---@return integer
function japi.DzGetWindowWidth() end

---获取魔兽窗口高度
---@return integer
function japi.DzGetWindowHeight() end

---获取魔兽窗口X坐标
---@return integer
function japi.DzGetWindowX() end

---获取魔兽窗口Y坐标
---@return integer
function japi.DzGetWindowY() end

---窗口大小变化事件
---@param trig trigger
---@param sync boolean
---@param func string
function japi.DzTriggerRegisterWindowResizeEvent(trig, sync, func) end

---窗口大小变化事件(ByCode)
---@param trig trigger
---@param sync boolean
---@param funcHandle code
function japi.DzTriggerRegisterWindowResizeEventByCode(trig, sync, funcHandle) end

---判断游戏窗口是否处于活动状态
---@return boolean
function japi.DzIsWindowActive() end

-- plus

---设置可破坏物位置 [BZAPI]
---@param d destructable
---@param x real
---@param y real
function japi.DzDestructablePosition(d, x, y) end

---设置单位位置 - 本地调用 [BZAPI]
---@param whichUnit unit
---@param x real
---@param y real
function japi.DzSetUnitPosition(whichUnit, x, y) end

---异步执行函数
---@param funcName string
function japi.DzExecuteFunc(funcName) end

---获取鼠标指向的单位(异步)
---@return unit
function japi.DzGetUnitUnderMouse() end

---替换单位贴图 [BZAPI]
---@param whichUnit unit
---@param path string
---@param texId integer
function japi.DzSetUnitTexture(whichUnit, path, texId) end

---设置内存数值
---@param address integer
---@param value real
function japi.DzSetMemory(address, value) end

---替换单位类型 [BZAPI]
---@param whichUnit unit
---@param id integer
function japi.DzSetUnitID(whichUnit, id) end

---替换单位模型 [BZAPI]
---@param whichUnit unit
---@param path string
function japi.DzSetUnitModel(whichUnit, path) end

---原生 - 设置小地图背景贴图
---@param map string
function japi.DzSetWar3MapMap(map) end

---获取客户端语言
---@return string
function japi.DzGetLocale() end

---获取升级所需经验
---@param whichUnit unit
---@param level integer
---@return integer
function japi.DzGetUnitNeededXP(whichUnit, level) end

-- sync

---数据同步
---@param trig trigger
---@param prefix string
---@param server boolean
function japi.DzTriggerRegisterSyncData(trig, prefix, server) end

---同步游戏数据
---@param prefix string
---@param data string
function japi.DzSyncData(prefix, data) end

---事件响应 - 获取同步的数据前缀
---@return string
function japi.DzGetTriggerSyncPrefix() end

---事件响应 - 获取同步的数据
---@return string
function japi.DzGetTriggerSyncData() end

---事件响应 - 获取同步数据的玩家
---@return player
function japi.DzGetTriggerSyncPlayer() end

---同步游戏数据（指定长度）
---@param prefix string
---@param data string
---@param dataLen integer
function japi.DzSyncBuffer(prefix, data, dataLen) end

---native DzGetPushContext takes nothing returns string
---同步游戏数据（立即）
---@param prefix string
---@param data string
function japi.DzSyncDataImmediately(prefix, data) end

-- gui

---原生 - 隐藏界面元素
function japi.DzFrameHideInterface() end

---原生 - 修改游戏渲染黑边范围
---@param upperHeight real
---@param bottomHeight real
function japi.DzFrameEditBlackBorders(upperHeight, bottomHeight) end

---原生 - 单位大头像
---@return integer
function japi.DzFrameGetPortrait() end

---原生 - 小地图
---@return integer
function japi.DzFrameGetMinimap() end

---原生 - 技能按钮
---@param row integer
---@param column integer
---@return integer
function japi.DzFrameGetCommandBarButton(row, column) end

---原生 - 英雄按钮
---@param buttonId integer
---@return integer
function japi.DzFrameGetHeroBarButton(buttonId) end

---原生 - 英雄血条
---@param buttonId integer
---@return integer
function japi.DzFrameGetHeroHPBar(buttonId) end

---原生 - 英雄蓝条
---@param buttonId integer
---@return integer
function japi.DzFrameGetHeroManaBar(buttonId) end

---原生 - 物品栏按钮
---@param buttonId integer
---@return integer
function japi.DzFrameGetItemBarButton(buttonId) end

---原生 - 小地图按钮
---@param buttonId integer
---@return integer
function japi.DzFrameGetMinimapButton(buttonId) end

---原生 - 界面按钮
---@param buttonId integer
---@return integer
function japi.DzFrameGetUpperButtonBarButton(buttonId) end

---原生 - 鼠标提示
---@return integer
function japi.DzFrameGetTooltip() end

---原生 - 玩家聊天信息框
---@return integer
function japi.DzFrameGetChatMessage() end

---原生 - 系统消息框
---@return integer
function japi.DzFrameGetUnitMessage() end

---原生 - 上方消息框
---@return integer
function japi.DzFrameGetTopMessage() end

---取 RGBA 色值
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---@return integer
function japi.DzGetColor(r, g, b, a) end

---注册 - 异步注册玩家界面更新回调
---@param func string
function japi.DzFrameSetUpdateCallback(func) end

---注册 - 异步注册玩家界面更新回调
---@param funcHandle code
function japi.DzFrameSetUpdateCallbackByCode(funcHandle) end

---显示/隐藏
---@param frame integer
---@param enable boolean
function japi.DzFrameShow(frame, enable) end

---新建Frame
---@param name string
---@param parent integer
---@param id integer
---@return integer
function japi.DzCreateFrame(name, parent, id) end

---DzCreateSimpleFrame
---@param name string
---@param parent integer
---@param id integer
---@return integer
function japi.DzCreateSimpleFrame(name, parent, id) end

---销毁
---@param frame integer
function japi.DzDestroyFrame(frame) end

---加载Toc文件列表
---@param fileName string
function japi.DzLoadToc(fileName) end

---设置相对位置
---@param frame integer
---@param point integer
---@param relativeFrame integer
---@param relativePoint integer
---@param x real
---@param y real
function japi.DzFrameSetPoint(frame, point, relativeFrame, relativePoint, x, y) end

---设置绝对位置
---@param frame integer
---@param point integer
---@param x real
---@param y real
function japi.DzFrameSetAbsolutePoint(frame, point, x, y) end

---清空所有锚点
---@param frame integer
function japi.DzFrameClearAllPoints(frame) end

---启用/禁用
---@param name integer
---@param enable boolean
function japi.DzFrameSetEnable(name, enable) end

---注册UI事件回调(func name)[观战、录像不响应]
---@param frame integer
---@param eventId integer
---@param func string
---@param sync boolean
function japi.DzFrameSetScript(frame, eventId, func, sync) end

---注册UI事件回调(func handle)[观战、录像不响应]
---@param frame integer
---@param eventId integer
---@param funcHandle code
---@param sync boolean
function japi.DzFrameSetScriptByCode(frame, eventId, funcHandle, sync) end

---注册UI事件回调-异步(func handle)[观战、录像不响应][new]
---@param frame integer
---@param eventId integer
---@param funcHandle code
---@param sync boolean
function japi.DzFrameSetScriptBlock(frame, eventId, funcHandle, sync) end

---注册UI事件回调-异步(func name)[观战、录像可响应][new]
---@param frame integer
---@param eventId integer
---@param funcName string
function japi.DzFrameSetScriptAsync(frame, eventId, funcName) end

---注册UI事件回调-异步(func handle)[观战、录像可响应][new]
---@param frame integer
---@param eventId integer
---@param func code
function japi.DzFrameSetScriptByCodeAsync(frame, eventId, func) end

---注册UI事件回调-异步(func handle)[观战、录像可响应][new]
---@param frame integer
---@param eventId integer
---@param func code
function japi.DzFrameSetScriptBlockAsync(frame, eventId, func) end

---事件响应 - 获取触发ui的玩家
---@return player
function japi.DzGetTriggerUIEventPlayer() end

---事件响应 - 触发的Frame
---@return integer
function japi.DzGetTriggerUIEventFrame() end

---获取子Frame
---@param name string
---@param id integer
---@return integer
function japi.DzFrameFindByName(name, id) end

---获取子SimpleFrame
---@param name string
---@param id integer
---@return integer
function japi.DzSimpleFrameFindByName(name, id) end

---获取子SimpleFontString
---@param name string
---@param id integer
---@return integer
function japi.DzSimpleFontStringFindByName(name, id) end

---获取子SimpleTexture
---@param name string
---@param id integer
---@return integer
function japi.DzSimpleTextureFindByName(name, id) end

---原生 - 游戏UI
---@return integer
function japi.DzGetGameUI() end

---点击
---@param frame integer
function japi.DzClickFrame(frame) end

---原生 - 修改屏幕比例(FOV)
---@param value real
function japi.DzSetCustomFovFix(value) end

---开启/关闭宽屏模式
---@param enable boolean
function japi.DzEnableWideScreen(enable) end

---设置文本
---@param frame integer
---@param text string
function japi.DzFrameSetText(frame, text) end

---获取 Frame 内的文字
---@param frame integer
---@return string
function japi.DzFrameGetText(frame) end

---设置字数限制
---@param frame integer
---@param size integer
function japi.DzFrameSetTextSizeLimit(frame, size) end

---获取 Frame 的 字数限制
---@param frame integer
---@return integer
function japi.DzFrameGetTextSizeLimit(frame) end

---DzFrameSetTextColor
---@param frame integer
---@param color integer
function japi.DzFrameSetTextColor(frame, color) end

---鼠标所在的Frame控件指针
---@return integer
function japi.DzGetMouseFocus() end

---移动所有锚点到Frame
---@param frame integer
---@param relativeFrame integer
---@return boolean
function japi.DzFrameSetAllPoints(frame, relativeFrame) end

---设置焦点
---@param frame integer
---@param enable boolean
---@return boolean
function japi.DzFrameSetFocus(frame, enable) end

---设置模型
---@param frame integer
---@param modelFile string
---@param modelType integer
---@param flag integer
function japi.DzFrameSetModel(frame, modelFile, modelType, flag) end

---控件是否启用
---@param frame integer
---@return boolean
function japi.DzFrameGetEnable(frame) end

---设置透明度(0-255)
---@param frame integer
---@param alpha integer
function japi.DzFrameSetAlpha(frame, alpha) end

---获取 Frame 的 透明度(0-255)
---@param frame integer
---@return integer
function japi.DzFrameGetAlpha(frame) end

---设置动画
---@param frame integer
---@param animId integer
---@param autocast boolean
function japi.DzFrameSetAnimate(frame, animId, autocast) end

---设置动画进度
---@param frame integer
---@param offset real
function japi.DzFrameSetAnimateOffset(frame, offset) end

---设置贴图
---@param frame integer
---@param texture string
---@param flag integer
function japi.DzFrameSetTexture(frame, texture, flag) end

---设置缩放
---@param frame integer
---@param scale real
function japi.DzFrameSetScale(frame, scale) end

---设置提示
---@param frame integer
---@param tooltip integer
function japi.DzFrameSetTooltip(frame, tooltip) end

---限制鼠标移动
---@param frame integer
---@param enable boolean
function japi.DzFrameCageMouse(frame, enable) end

---获取当前值
---@param frame integer
---@return real
function japi.DzFrameGetValue(frame) end

---设置最大/最小值
---@param frame integer
---@param minValue real
---@param maxValue real
function japi.DzFrameSetMinMaxValue(frame, minValue, maxValue) end

---设置步进值
---@param frame integer
---@param step real
function japi.DzFrameSetStepValue(frame, step) end

---设置当前值
---@param frame integer
---@param value real
function japi.DzFrameSetValue(frame, value) end

---设置大小
---@param frame integer
---@param w real
---@param h real
function japi.DzFrameSetSize(frame, w, h) end

---新建Frame [Tag]
---@param frameType string
---@param name string
---@param parent integer
---@param template string
---@param id integer
---@return integer
function japi.DzCreateFrameByTagName(frameType, name, parent, template, id) end

---设置颜色
---@param frame integer
---@param color integer
function japi.DzFrameSetVertexColor(frame, color) end

---DzOriginalUIAutoResetPoint
---@param enable boolean
function japi.DzOriginalUIAutoResetPoint(enable) end

---设置优先级
---@param frame integer
---@param priority integer
function japi.DzFrameSetPriority(frame, priority) end

---设置父窗口
---@param frame integer
---@param parent integer
function japi.DzFrameSetParent(frame, parent) end

---获取 Frame 的 高度
---@param frame integer
---@return real
function japi.DzFrameGetHeight(frame) end

---设置字体
---@param frame integer
---@param fileName string
---@param height real
---@param flag integer
function japi.DzFrameSetFont(frame, fileName, height, flag) end

---获取父窗口
---@param frame integer
---@return integer
function japi.DzFrameGetParent(frame) end

---设置文字对齐方式
---@param frame integer
---@param align integer
function japi.DzFrameSetTextAlignment(frame, align) end

---获取名称
---@param frame integer
---@return string
function japi.DzFrameGetName(frame) end

---获取客户端宽度
---@return integer
function japi.DzGetClientWidth() end

---获取客户端高度
---@return integer
function japi.DzGetClientHeight() end

---控件是否可见
---@param frame integer
---@return boolean
function japi.DzFrameIsVisible(frame) end

---显示/隐藏SimpleFrame
---@param frame integer
---@param enable boolean
function japi.DzSimpleFrameShow(frame, enable) end

---追加文字（支持TextArea）
---@param frame integer
---@param text string
function japi.DzFrameAddText(frame, text) end

---沉默单位-禁用技能
---@param whichUnit unit
---@param disable boolean
function japi.DzUnitSilence(whichUnit, disable) end

---禁用攻击
---@param whichUnit unit
---@param disable boolean
function japi.DzUnitDisableAttack(whichUnit, disable) end

---禁用道具
---@param whichUnit unit
---@param disable boolean
function japi.DzUnitDisableInventory(whichUnit, disable) end

---刷新小地图
function japi.DzUpdateMinimap() end

---修改单位alpha
---@param whichUnit unit
---@param alpha integer
---@param forceUpdate boolean
function japi.DzUnitChangeAlpha(whichUnit, alpha, forceUpdate) end

---设置单位是否可以选中
---@param whichUnit unit
---@param state boolean
function japi.DzUnitSetCanSelect(whichUnit, state) end

---修改单位是否可以被设置为目标
---@param whichUnit unit
---@param state boolean
function japi.DzUnitSetTargetable(whichUnit, state) end

---保存内存数据
---@param cache string
function japi.DzSaveMemoryCache(cache) end

---读取内存数据
---@return string
function japi.DzGetMemoryCache() end

---设置加速倍率
---@param ratio real
function japi.DzSetSpeed(ratio) end

---转换世界坐标为屏幕坐标-异步
---@param x real
---@param y real
---@param z real
---@param callback code
---@return boolean
function japi.DzConvertWorldPosition(x, y, z, callback) end

---转换世界坐标为屏幕坐标-获取转换后的X坐标
---@return real
function japi.DzGetConvertWorldPositionX() end

---转换世界坐标为屏幕坐标-获取转换后的Y坐标
---@return real
function japi.DzGetConvertWorldPositionY() end

---创建command button
---@param parent integer
---@param icon string
---@param name string
---@param desc string
---@return integer
function japi.DzCreateCommandButton(parent, icon, name, desc) end

-- DzAPI

---玩家是否拥有地图商城道具
---@param whichPlayer player
---@param key string
---@return boolean
function japi.DzAPI_Map_HasMallItem(whichPlayer, key) end

---玩家地图等级
---@param whichPlayer player
---@return integer
function japi.DzAPI_Map_GetMapLevel(whichPlayer) end

---RequestExtraIntegerData
---@param dataType integer
---@param whichPlayer player
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return integer
function japi.RequestExtraIntegerData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end

---RequestExtraBooleanData
---@param dataType integer
---@param whichPlayer player
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return boolean
function japi.RequestExtraBooleanData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end

---RequestExtraStringData
---@param dataType integer
---@param whichPlayer player
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return string
function japi.RequestExtraStringData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end

---RequestExtraRealData
---@param dataType integer
---@param whichPlayer player
---@param param1 string
---@param param2 string
---@param param3 boolean
---@param param4 integer
---@param param5 integer
---@param param6 integer
---@return real
function japi.RequestExtraRealData(dataType, whichPlayer, param1, param2, param3, param4, param5, param6) end

-- KKAPI

---当前选择的单位(异步)
---@return unit
function japi.DzGetSelectedLeaderUnit() end

---聊天框是否打开
---@return boolean
function japi.DzIsChatBoxOpen() end

---设置单位的鼠标指向UI和血条显示/隐藏
---@param whichUnit unit
---@param visible boolean
function japi.DzSetUnitPreselectUIVisible(whichUnit, visible) end

---设置特效播放动画
---@param whichEffect effect
---@param index integer
---@param flag integer
function japi.DzSetEffectAnimation(whichEffect, index, flag) end

---设置特效坐标
---@param whichEffect effect
---@param x real
---@param y real
---@param z real
function japi.DzSetEffectPos(whichEffect, x, y, z) end

---设置特效颜色
---@param whichEffect effect
---@param color integer
function japi.DzSetEffectVertexColor(whichEffect, color) end

---设置特效透明度
---@param whichEffect effect
---@param alpha integer
function japi.DzSetEffectVertexAlpha(whichEffect, alpha) end

---设置特效模型
---@param whichEffect effect
---@param model string
function japi.DzSetEffectModel(whichEffect, model) end

---设置特效队伍颜色
---@param whichHandle effect
---@param playerId integer
function japi.DzSetEffectTeamColor(whichHandle, playerId) end

---设置控件视口
---@param whichframe integer
---@param enable boolean
function japi.DzFrameSetClip(whichframe, enable) end

---设置魔兽窗口大小
---@param width integer
---@param height integer
---@return boolean
function japi.DzChangeWindowSize(width, height) end

---播放特效动画
---@param whichEffect effect
---@param anim string
---@param link string
function japi.DzPlayEffectAnimation(whichEffect, anim, link) end

---绑定特效
---@param parent widget
---@param attachPoint string
---@param whichEffect effect
function japi.DzBindEffect(parent, attachPoint, whichEffect) end

---解除绑定特效
---@param whichEffect effect
function japi.DzUnbindEffect(whichEffect) end

---单位缩放
---@param whichUnit widget
---@param scale real
function japi.DzSetWidgetSpriteScale(whichUnit, scale) end

---特效缩放
---@param whichHandle effect
---@param scale real
function japi.DzSetEffectScale(whichHandle, scale) end

---获取特效颜色
---@param whichEffect effect
---@return integer
function japi.DzGetEffectVertexColor(whichEffect) end

---获取特效透明度
---@param whichEffect effect
---@return integer
function japi.DzGetEffectVertexAlpha(whichEffect) end

---获取物品技能
---@param whichEffect item
---@param index integer
---@return ability
function japi.DzGetItemAbility(whichEffect, index) end

---获取子控件数量
---@param whichframe integer
---@return integer
function japi.DzFrameGetChildrenCount(whichframe) end

---获取子控件
---@param whichframe integer
---@param index integer
---@return integer
function japi.DzFrameGetChild(whichframe, index) end

---解锁BLP像素限制
---@param enable boolean
function japi.DzUnlockBlpSizeLimit(enable) end

---获取商店目标
---@param store unit
---@param p player
---@return unit
function japi.DzGetActivePatron(store, p) end

---获取玩家选中的单位数量
---@return integer
function japi.DzGetLocalSelectUnitCount() end

---获取玩家选中的单位
---@param index integer
---@return unit
function japi.DzGetLocalSelectUnit(index) end

---获取字符串数量
---@return integer
function japi.DzGetJassStringTableCount() end

---清除模型内存缓存
---@param path string
function japi.DzModelRemoveFromCache(path) end

---清除所有模型内存缓存
function japi.DzModelRemoveAllFromCache() end

---获取框选控件
---@param index integer
---@return integer
function japi.DzFrameGetInfoPanelSelectButton(index) end

---获取BUFF控件
---@param index integer
---@return integer
function japi.DzFrameGetInfoPanelBuffButton(index) end

---获取农民控件
---@return integer
function japi.DzFrameGetPeonBar() end

---获取技能右下角数字文本控件
---@param whichframe integer
---@return integer
function japi.DzFrameGetCommandBarButtonNumberText(whichframe) end

---获取技能右下角数字文本框体
---@param whichframe integer
---@return integer
function japi.DzFrameGetCommandBarButtonNumberOverlay(whichframe) end

---获取技能冷却指示器
---@param whichframe integer
---@return integer
function japi.DzFrameGetCommandBarButtonCooldownIndicator(whichframe) end

---获取技能自动释放指示器
---@param whichframe integer
---@return integer
function japi.DzFrameGetCommandBarButtonAutoCastIndicator(whichframe) end

---设置FPS显示/隐藏
---@param show boolean
function japi.DzToggleFPS(show) end

---获取FPS
---@return integer
function japi.DzGetFPS() end

---转换地图坐标为小地图x坐标
---@param x real
---@param y real
---@return real
function japi.DzFrameWorldToMinimapPosX(x, y) end

---转换地图坐标为小地图y坐标
---@param x real
---@param y real
---@return real
function japi.DzFrameWorldToMinimapPosY(x, y) end

---自定义指定单位的小地图图标
---@param whichunit unit
---@param path string
function japi.DzWidgetSetMinimapIcon(whichunit, path) end

---设置单位小地图图标显示/隐藏
---@param whichunit unit
---@param enable boolean
function japi.DzWidgetSetMinimapIconEnable(whichunit, enable) end

---游戏提示信息界面
---@return integer
function japi.DzFrameGetWorldFrameMessage() end

---显示游戏提示信息
---@param whichframe integer
---@param text string
---@param color integer
---@param duration real
---@param permanent boolean
function japi.DzSimpleMessageFrameAddMessage(whichframe, text, color, duration, permanent) end

---清理游戏提示信息
---@param whichframe integer
function japi.DzSimpleMessageFrameClear(whichframe) end

---转换屏幕坐标到世界x坐标
---@param x real
---@param y real
---@return real
function japi.DzConvertScreenPositionX(x, y) end

---转换屏幕坐标到世界y坐标
---@param x real
---@param y real
---@return real
function japi.DzConvertScreenPositionY(x, y) end

---监听建筑选位置
---@param func code
function japi.DzRegisterOnBuildLocal(func) end

---获取建造的命令id
---@return integer
function japi.DzGetOnBuildOrderId() end

---获取建造的命令类型
---@return integer
function japi.DzGetOnBuildOrderType() end

---获取预建造对象
---@return widget
function japi.DzGetOnBuildAgent() end

---监听技能预选目标
---@param func code
function japi.DzRegisterOnTargetLocal(func) end

---获取监听到的技能
---@return integer
function japi.DzGetOnTargetAbilId() end

---获取监听到技能预选命令
---@return integer
function japi.DzGetOnTargetOrderId() end

---获取监听到技能预选命令类型
---@return integer
function japi.DzGetOnTargetOrderType() end

---获取监听到技能预选目标
---@return widget
function japi.DzGetOnTargetAgent() end

---获取监听到技能预选目标
---@return widget
function japi.DzGetOnTargetInstantTarget() end

---打开QQ群链接
---@param url string
---@return boolean
function japi.DzOpenQQGroupUrl(url) end

---游戏界面限制设置
---@param enable boolean
function japi.DzFrameEnableClipRect(enable) end

---设置单位名字
---@param whichUnit unit
---@param name string
function japi.DzSetUnitName(whichUnit, name) end

---设置单位头像模型
---@param whichUnit unit
---@param modelFile string
function japi.DzSetUnitPortrait(whichUnit, modelFile) end

---设置单位描述
---@param whichUnit unit
---@param value string
function japi.DzSetUnitDescription(whichUnit, value) end

---设置单位普攻弹道弧度
---@param whichUnit unit
---@param arc real
function japi.DzSetUnitMissileArc(whichUnit, arc) end

---设置单位普攻弹道模型
---@param whichUnit unit
---@param modelFile string
function japi.DzSetUnitMissileModel(whichUnit, modelFile) end

---设置英雄称谓
---@param whichUnit unit
---@param name string
function japi.DzSetUnitProperName(whichUnit, name) end

---设置单位普攻弹道自导允许
---@param whichUnit unit
---@param enable boolean
function japi.DzSetUnitMissileHoming(whichUnit, enable) end

---设置单位普攻弹道速度
---@param whichUnit unit
---@param speed real
function japi.DzSetUnitMissileSpeed(whichUnit, speed) end

---特效显示/隐藏
---@param whichHandle effect
---@param enable boolean
function japi.DzSetEffectVisible(whichHandle, enable) end

---复活单位
---@param whichUnit unit
---@param whichPlayer player
---@param hp real
---@param mp real
---@param x real
---@param y real
function japi.DzReviveUnit(whichUnit, whichPlayer, hp, mp, x, y) end

---获取普攻技能
---@param whichUnit unit
---@return ability
function japi.DzGetAttackAbility(whichUnit) end

---结束普攻技能CD
---@param whichHandle ability
function japi.DzAttackAbilityEndCooldown(whichHandle) end

---EXSetUnitArrayString
---@param uid integer
---@param id integer
---@param n integer
---@param name string
---@return boolean
function japi.EXSetUnitArrayString(uid, id, n, name) end

---EXSetUnitInteger
---@param uid integer
---@param id integer
---@param n integer
---@return boolean
function japi.EXSetUnitInteger(uid, id, n) end

---新建地形装饰物
---@param id integer
---@param var integer
---@param x real
---@param y real
---@param z real
---@param rotate real
---@param scale real
---@return integer
function japi.DzDoodadCreate(id, var, x, y, z, rotate, scale) end

---装饰物的类型ID
---@param doodad integer
---@return integer
function japi.DzDoodadGetTypeId(doodad) end

---设置装饰物模型
---@param doodad integer
---@param modelFile string
function japi.DzDoodadSetModel(doodad, modelFile) end

---改变装饰物队伍颜色
---@param doodad integer
---@param color integer
function japi.DzDoodadSetTeamColor(doodad, color) end

---设置装饰物颜色
---@param doodad integer
---@param color integer
function japi.DzDoodadSetColor(doodad, color) end

---装饰物的X坐标
---@param doodad integer
---@return real
function japi.DzDoodadGetX(doodad) end

---装饰物的Y坐标
---@param doodad integer
---@return real
function japi.DzDoodadGetY(doodad) end

---装饰物的Z坐标
---@param doodad integer
---@return real
function japi.DzDoodadGetZ(doodad) end

---设置装饰物位置
---@param doodad integer
---@param x real
---@param y real
---@param z real
function japi.DzDoodadSetPosition(doodad, x, y, z) end

---设置装饰物旋转
---@param doodad integer
---@param angle real
---@param axisX real
---@param axisY real
---@param axisZ real
function japi.DzDoodadSetOrientMatrixRotate(doodad, angle, axisX, axisY, axisZ) end

---修改装饰物尺寸
---@param doodad integer
---@param x real
---@param y real
---@param z real
function japi.DzDoodadSetOrientMatrixScale(doodad, x, y, z) end

---装饰物重置大小
---@param doodad integer
function japi.DzDoodadSetOrientMatrixResize(doodad) end

---装饰物显示/隐藏
---@param doodad integer
---@param enable boolean
function japi.DzDoodadSetVisible(doodad, enable) end

---装饰物播放动画
---@param doodad integer
---@param animName string
---@param animRandom boolean
function japi.DzDoodadSetAnimation(doodad, animName, animRandom) end

---设置装饰物动画播放速度
---@param doodad integer
---@param scale real
function japi.DzDoodadSetTimeScale(doodad, scale) end

---装饰物动画播放速度
---@param doodad integer
---@return real
function japi.DzDoodadGetTimeScale(doodad) end

---装饰物当前动画编号
---@param doodad integer
---@return integer
function japi.DzDoodadGetCurrentAnimationIndex(doodad) end

---装饰物动画数量
---@param doodad integer
---@return integer
function japi.DzDoodadGetAnimationCount(doodad) end

---装饰物动画名
---@param doodad integer
---@param index integer
---@return string
function japi.DzDoodadGetAnimationName(doodad, index) end

---装饰物动画时间
---@param doodad integer
---@param index integer
---@return integer
function japi.DzDoodadGetAnimationTime(doodad, index) end

---解锁JASS字节码限制 [NEW]
---@param enable boolean
function japi.DzUnlockOpCodeLimit(enable) end

---设置剪切板 [NEW]
---@param content string
---@return boolean
function japi.DzSetClipboard(content) end

---删除装饰物  [NEW]
---@param doodad integer
function japi.DzDoodadRemove(doodad) end

---降低玩家科技等级 [NEW]
---@param whichPlayer player
---@param techid integer
---@param removelevels integer
function japi.DzRemovePlayerTechResearched(whichPlayer, techid, removelevels) end

---获取单位的指定技能
---@param whichUnit unit
---@param abilcode integer
---@return ability
function japi.DzUnitFindAbility(whichUnit, abilcode) end

---设置技能数据-字符串
---@param whichAbility ability
---@param key string
---@param value string
function japi.DzAbilitySetStringData(whichAbility, key, value) end

---设置技能启用/禁用
---@param whichAbility ability
---@param enable boolean
---@param hideUI boolean
function japi.DzAbilitySetEnable(whichAbility, enable, hideUI) end

---设置单位实例的移动类型
---@param whichUnit unit
---@param moveType string
function japi.DzUnitSetMoveType(whichUnit, moveType) end

---获取 Frame 的 宽度
---@param frame integer
---@return real
function japi.DzFrameGetWidth(frame) end

---设置模型界面播放动画（编号）
---@param frame integer
---@param index integer
---@param flag integer
function japi.DzFrameSetAnimateByIndex(frame, index, flag) end

---设置单位数据缓存整数
---@param uid integer
---@param id integer
---@param index integer
---@param v integer
function japi.DzSetUnitDataCacheInteger(uid, id, index, v) end

---单位UI增加等级数组整数
---@param uid integer
---@param id integer
---@param lv integer
---@param v integer
function japi.DzUnitUIAddLevelArrayInteger(uid, id, lv, v) end

---设置物品模型 [NEW]
---@param whichItem item
---@param file string
function japi.DzItemSetModel(whichItem, file) end

---设置物品颜色 [NEW]
---@param whichItem item
---@param color integer
function japi.DzItemSetVertexColor(whichItem, color) end

---设置物品透明度(0-255) [NEW]
---@param whichItem item
---@param color integer
function japi.DzItemSetAlpha(whichItem, color) end

---设置物品头像 [NEW]
---@param whichItem item
---@param modelPath string
function japi.DzItemSetPortrait(whichItem, modelPath) end

---血条刷新事件 [NEW]
---@param func code
function japi.DzFrameHookHpBar(func) end

---触发血条的单位 [NEW]
---@return unit
function japi.DzFrameGetTriggerHpBarUnit() end

---触发的血条 [NEW]
---@return integer
function japi.DzFrameGetTriggerHpBar() end

---获取单位血条 [NEW]
---@param whichUnit unit
---@return integer
function japi.DzFrameGetUnitHpBar(whichUnit) end

---鼠标界面 [NEW]
---@return integer
function japi.DzGetCursorFrame() end

---是否有指定锚点 [NEW]
---@param frame integer
---@param anchor integer
---@return boolean
function japi.DzFrameGetPointValid(frame, anchor) end

---获取相对锚点所在界面 [NEW]
---@param frame integer
---@param anchor integer
---@return integer
function japi.DzFrameGetPointRelative(frame, anchor) end

---获取相对锚点的界面锚点 [NEW]
---@param frame integer
---@param anchor integer
---@return integer
function japi.DzFrameGetPointRelativePoint(frame, anchor) end

---获取锚点X坐标 [NEW]
---@param frame integer
---@param anchor integer
---@return real
function japi.DzFrameGetPointX(frame, anchor) end

---获取锚点Y坐标 [NEW]
---@param frame integer
---@param anchor integer
---@return real
function japi.DzFrameGetPointY(frame, anchor) end

---打印调试信息到平台日志 [NEW]
---@param msg string
function japi.DzWriteLog(msg) end

---获取当前漂浮文字的字体 [NEW]
---@return string
function japi.DzTextTagGetFont() end

---设置漂浮文字字体 [NEW]
---@param fileName string
function japi.DzTextTagSetFont(fileName) end

---设置漂浮文字透明度 [NEW]
---@param t texttag
---@param alpha integer
function japi.DzTextTagSetStartAlpha(t, alpha) end

---获取漂浮文字的阴影颜色 [NEW]
---@param t texttag
---@return integer
function japi.DzTextTagGetShadowColor(t) end

---设置漂浮文字阴影颜色 [NEW]
---@param t texttag
---@param color integer
function japi.DzTextTagSetShadowColor(t, color) end

---获取单位组里单位数量 [NEW]
---@param g group
---@return integer
function japi.DzGroupGetCount(g) end

---获取单位组里指定索引的单位 [NEW]
---@param g group
---@param index integer
---@return unit
function japi.DzGroupGetUnitAt(g, index) end

---创建幻象单位 [NEW]
---@param p player
---@param unitId integer
---@param x real
---@param y real
---@param face real
---@return unit
function japi.DzUnitCreateIllusion(p, unitId, x, y, face) end

---为单位创建幻象 [NEW]
---@param u unit
---@return unit
function japi.DzUnitCreateIllusionFromUnit(u) end

---检查字符串是否包含指定的子字符串 [NEW]
---@param s string
---@param whichString string
---@param caseSensitive boolean
---@return boolean
function japi.DzStringContains(s, whichString, caseSensitive) end

---字符串中查找子字符串并返回其位置 [NEW]
---@param s string
---@param whichString string
---@param off integer
---@param caseSensitive boolean
---@return integer
function japi.DzStringFind(s, whichString, off, caseSensitive) end

---检测字符串里第一个包含指定字符串里任意字符的位置 [NEW]
---@param s string
---@param whichString string
---@param off integer
---@param caseSensitive boolean
---@return integer
function japi.DzStringFindFirstOf(s, whichString, off, caseSensitive) end

---检查字符串第一个不包含指定字符串里任意字符的位置 [NEW]
---@param s string
---@param whichString string
---@param off integer
---@param caseSensitive boolean
---@return integer
function japi.DzStringFindFirstNotOf(s, whichString, off, caseSensitive) end

---从后往前查找字符串中包含指定字符串任意字符的所在位置 [NEW]
---@param s string
---@param whichString string
---@param off integer
---@param caseSensitive boolean
---@return integer
function japi.DzStringFindLastOf(s, whichString, off, caseSensitive) end

---从后往前查找字符串中不包含指定字符串任意字符的所在位置 [NEW]
---@param s string
---@param whichString string
---@param off integer
---@param caseSensitive boolean
---@return integer
function japi.DzStringFindLastNotOf(s, whichString, off, caseSensitive) end

---删除字符串左边的空格 [NEW]
---@param s string
---@return string
function japi.DzStringTrimLeft(s) end

---删除字符串右边的空格 [NEW]
---@param s string
---@return string
function japi.DzStringTrimRight(s) end

---删除字符串两边的空格 [NEW]
---@param s string
---@return string
function japi.DzStringTrim(s) end

---反转字符串 [NEW]
---@param s string
---@return string
function japi.DzStringReverse(s) end

---替换字符串 [NEW]
---@param s string
---@param whichString string
---@param replaceWith string
---@param caseSensitive boolean
---@return string
function japi.DzStringReplace(s, whichString, replaceWith, caseSensitive) end

---插入字符串 [NEW]
---@param s string
---@param whichPosition integer
---@param whichString string
---@return string
function japi.DzStringInsert(s, whichPosition, whichString) end

---整数的2进制的位值 [NEW]
---@param i integer
---@param byteIndex integer
---@return integer
function japi.DzBitGet(i, byteIndex) end

---设置整数的2进制的位值 [NEW]
---@param i integer
---@param byteIndex integer
---@param byteValue integer
---@return integer
function japi.DzBitSet(i, byteIndex, byteValue) end

---整数的256进制的位值 [NEW]
---@param i integer
---@param byteIndex integer
---@return integer
function japi.DzBitGetByte(i, byteIndex) end

---设置整数的256进制的位值 [NEW]
---@param i integer
---@param byteIndex integer
---@param byteValue integer
---@return integer
function japi.DzBitSetByte(i, byteIndex, byteValue) end

---按位取反 [NEW]
---@param i integer
---@return integer
function japi.DzBitNot(i) end

---按位与 [NEW]
---@param a integer
---@param b integer
---@return integer
function japi.DzBitAnd(a, b) end

---按位或 [NEW]
---@param a integer
---@param b integer
---@return integer
function japi.DzBitOr(a, b) end

---按位异或 [NEW]
---@param a integer
---@param b integer
---@return integer
function japi.DzBitXor(a, b) end

---按位左移 [NEW]
---@param i integer
---@param bitsToShift integer
---@return integer
function japi.DzBitShiftLeft(i, bitsToShift) end

---按位右移 [NEW]
---@param i integer
---@param bitsToShift integer
---@return integer
function japi.DzBitShiftRight(i, bitsToShift) end

---4字节组合为整数 [NEW]
---@param b1 integer
---@param b2 integer
---@param b3 integer
---@param b4 integer
---@return integer
function japi.DzBitToInt(b1, b2, b3, b4) end

---对单位组添加命令到队列(无目标) [NEW]
---@param whichGroup group
---@param order integer
---@return boolean
function japi.DzQueueGroupImmediateOrderById(whichGroup, order) end

---对单位组添加命令到队列(指定坐标) [NEW]
---@param whichGroup group
---@param order integer
---@param x real
---@param y real
---@return boolean
function japi.DzQueueGroupPointOrderById(whichGroup, order, x, y) end

---对单位组添加命令到队列(指定目标)
---@param whichGroup group
---@param order integer
---@param targetWidget widget
---@return boolean
function japi.DzQueueGroupTargetOrderById(whichGroup, order, targetWidget) end

---对单位添加命令到队列(无目标) [NEW]
---@param whichUnit unit
---@param order integer
---@return boolean
function japi.DzQueueIssueImmediateOrderById(whichUnit, order) end

---对单位添加命令到队列(指定坐标) [NEW]
---@param whichUnit unit
---@param order integer
---@param x real
---@param y real
---@return boolean
function japi.DzQueueIssuePointOrderById(whichUnit, order, x, y) end

---对单位添加命令到队列(指定目标)
---@param whichUnit unit
---@param order integer
---@param targetWidget widget
---@return boolean
function japi.DzQueueIssueTargetOrderById(whichUnit, order, targetWidget) end

---对单位添加即时命令到队列(指定坐标)
---@param whichUnit unit
---@param order integer
---@param x real
---@param y real
---@param instantTargetWidget widget
---@return boolean
function japi.DzQueueIssueInstantPointOrderById(whichUnit, order, x, y, instantTargetWidget) end

---对单位添加即时命令到队列(指定目标)
---@param whichUnit unit
---@param order integer
---@param targetWidget widget
---@param instantTargetWidget widget
---@return boolean
function japi.DzQueueIssueInstantTargetOrderById(whichUnit, order, targetWidget, instantTargetWidget) end

---对单位添加建造命令到队列 [NEW]
---@param whichPeon unit
---@param unitId integer
---@param x real
---@param y real
---@return boolean
function japi.DzQueueIssueBuildOrderById(whichPeon, unitId, x, y) end

---添加中介命令到队列(无目标) [NEW]
---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitId integer
---@return boolean
function japi.DzQueueIssueNeutralImmediateOrderById(forWhichPlayer, neutralStructure, unitId) end

---添加中介命令到队列(指定坐标) [NEW]
---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitId integer
---@param x real
---@param y real
---@return boolean
function japi.DzQueueIssueNeutralPointOrderById(forWhichPlayer, neutralStructure, unitId, x, y) end

---添加中介命令到队列(指定目标)
---@param forWhichPlayer player
---@param neutralStructure unit
---@param unitId integer
---@param target widget
---@return boolean
function japi.DzQueueIssueNeutralTargetOrderById(forWhichPlayer, neutralStructure, unitId, target) end

---获取单位的命令数量 [NEW]
---@param u unit
---@return integer
function japi.DzUnitOrdersCount(u) end

---清除单位命令队列 [NEW]
---@param u unit
---@param onlyQueued boolean
function japi.DzUnitOrdersClear(u, onlyQueued) end

---执行单位的命令队列 [NEW]
---@param u unit
function japi.DzUnitOrdersExec(u) end

---强制停止单位当前命令 [NEW]
---@param u unit
---@param clearQueue boolean
function japi.DzUnitOrdersForceStop(u, clearQueue) end

---反转单位命令队列 [NEW]
---@param u unit
function japi.DzUnitOrdersReverse(u) end

---打开Excel文件 [NEW]
---@param filePath string
---@return integer
function japi.DzXlsxOpen(filePath) end

---关闭工作表 [NEW]
---@param docHandle integer
---@return boolean
function japi.DzXlsxClose(docHandle) end

---工作表的总行数 [NEW]
---@param docHandle integer
---@param sheetName string
---@return integer
function japi.DzXlsxWorksheetGetRowCount(docHandle, sheetName) end

---工作表的总列数 [NEW]
---@param docHandle integer
---@param sheetName string
---@return integer
function japi.DzXlsxWorksheetGetColumnCount(docHandle, sheetName) end

---单元格的数据类型 [NEW]
---@param docHandle integer
---@param sheetName string
---@param row integer
---@param column integer
---@return integer
function japi.DzXlsxWorksheetGetCellType(docHandle, sheetName, row, column) end

---工作表的值（字符串） [NEW]
---@param docHandle integer
---@param sheetName string
---@param row integer
---@param column integer
---@return string
function japi.DzXlsxWorksheetGetCellString(docHandle, sheetName, row, column) end

---工作表的值（整数） [NEW]
---@param docHandle integer
---@param sheetName string
---@param row integer
---@param column integer
---@return integer
function japi.DzXlsxWorksheetGetCellInteger(docHandle, sheetName, row, column) end

---工作表的值（布尔值） [NEW]
---@param docHandle integer
---@param sheetName string
---@param row integer
---@param column integer
---@return boolean
function japi.DzXlsxWorksheetGetCellBoolean(docHandle, sheetName, row, column) end

---工作表的值（实数） [NEW]
---@param docHandle integer
---@param sheetName string
---@param row integer
---@param column integer
---@return real
function japi.DzXlsxWorksheetGetCellFloat(docHandle, sheetName, row, column) end

---设置界面纹理坐标 [NEW]
---@param frame integer
---@param left real
---@param top real
---@param right real
---@param bottom real
function japi.DzFrameSetTexCoord(frame, left, top, right, bottom) end

---技能 - 设置技能施法距离
---@param Unit unit
---@param abil_code integer
---@param value real
---@return boolean
function japi.DzSetUnitAbilityRange(Unit, abil_code, value) end

---技能 - 获取技能施法距离
---@param Unit unit
---@param abil_code integer
---@return real
function japi.DzGetUnitAbilityRange(Unit, abil_code) end

---技能 - 设置技能施法范围
---@param Unit unit
---@param abil_code integer
---@param value real
---@return boolean
function japi.DzSetUnitAbilityArea(Unit, abil_code, value) end

---技能 - 获取技能施法范围
---@param Unit unit
---@param abil_code integer
---@return real
function japi.DzGetUnitAbilityArea(Unit, abil_code) end

---技能 - 设置技能冷却时间
---@param Unit unit
---@param abil_code integer
---@param cool real
---@param max_cool real
---@return boolean
function japi.DzSetUnitAbilityCool(Unit, abil_code, cool, max_cool) end

---技能 - 获取技能当前冷却时间
---@param Unit unit
---@param abil_code integer
---@return real
function japi.DzGetUnitAbilityCool(Unit, abil_code) end

---技能 - 获取技能最大冷却时间
---@param Unit unit
---@param abil_code integer
---@return real
function japi.DzGetUnitAbilityMaxCool(Unit, abil_code) end

---技能 - 设置技能数据A
---@param Unit unit
---@param abil_code integer
---@param value real
---@return boolean
function japi.DzSetUnitAbilityDataA(Unit, abil_code, value) end

---技能 - 获取技能数据A
---@param Unit unit
---@param abil_code integer
---@return real
function japi.DzGetUnitAbilityDataA(Unit, abil_code) end

---技能 - 设置技能数据B
---@param Unit unit
---@param abil_code integer
---@param value real
---@return boolean
function japi.DzSetUnitAbilityDataB(Unit, abil_code, value) end

---技能 - 获取技能数据B
---@param Unit unit
---@param abil_code integer
---@return real
function japi.DzGetUnitAbilityDataB(Unit, abil_code) end

---技能 - 设置技能数据C
---@param Unit unit
---@param abil_code integer
---@param value real
---@return boolean
function japi.DzSetUnitAbilityDataC(Unit, abil_code, value) end

---技能 - 获取技能数据C
---@param Unit unit
---@param abil_code integer
---@return real
function japi.DzGetUnitAbilityDataC(Unit, abil_code) end

---技能 - 设置技能数据D
---@param Unit unit
---@param abil_code integer
---@param value real
---@return boolean
function japi.DzSetUnitAbilityDataD(Unit, abil_code, value) end

---技能 - 获取技能数据D
---@param Unit unit
---@param abil_code integer
---@return real
function japi.DzGetUnitAbilityDataD(Unit, abil_code) end

---技能 - 设置技能数据E
---@param Unit unit
---@param abil_code integer
---@param value real
---@return boolean
function japi.DzSetUnitAbilityDataE(Unit, abil_code, value) end

---技能 - 获取技能数据E
---@param Unit unit
---@param abil_code integer
---@return real
function japi.DzGetUnitAbilityDataE(Unit, abil_code) end

---技能 - 设置技能按钮位置
---@param Unit unit
---@param abil_code integer
---@param x integer
---@param y integer
---@return boolean
function japi.DzSetUnitAbilityButtonPos(Unit, abil_code, x, y) end

---技能 - 设置技能快捷键
---@param Unit unit
---@param abil_code integer
---@param key string
---@return boolean
function japi.DzSetUnitAbilityHotkey(Unit, abil_code, key) end

---DzConvertTargs2Str
---@param targs integer
---@return string
function japi.DzConvertTargs2Str(targs) end

---DzConvertStr2Targs
---@param targs string
---@return integer
function japi.DzConvertStr2Targs(targs) end

---技能 - 设置技能目标允许
---@param Unit unit
---@param abil_code integer
---@param value integer
---@return boolean
function japi.DzSetUnitAbilityTargs(Unit, abil_code, value) end

---技能 - 获取技能目标允许
---@param Unit unit
---@param abil_code integer
---@return integer
function japi.DzGetUnitAbilityTargs(Unit, abil_code) end

---技能 - 设置技能魔法消耗
---@param Unit unit
---@param abil_code integer
---@param value integer
---@return boolean
function japi.DzSetUnitAbilityCost(Unit, abil_code, value) end

---技能 - 获取技能魔法消耗
---@param Unit unit
---@param abil_code integer
---@return integer
function japi.DzGetUnitAbilityCost(Unit, abil_code) end

---技能 - 设置技能等级要求
---@param Unit unit
---@param abil_code integer
---@param value integer
---@return boolean
function japi.DzSetUnitAbilityReqLevel(Unit, abil_code, value) end

---技能 - 获取技能等级要求
---@param Unit unit
---@param abil_code integer
---@return integer
function japi.DzGetUnitAbilityReqLevel(Unit, abil_code) end

---技能 - 设置建造技能单位ID（象牙塔）
---@param Unit unit
---@param abil_code integer
---@param value integer
---@return boolean
function japi.DzSetUnitAbilityUnitId(Unit, abil_code, value) end

---技能 - 获取建造技能单位ID（象牙塔）
---@param Unit unit
---@param abil_code integer
---@return integer
function japi.DzGetUnitAbilityUnitId(Unit, abil_code) end

---技能 - 设置建造技能命令ID（象牙塔）
---@param Unit unit
---@param abil_code integer
---@param value integer
---@return boolean
function japi.DzSetUnitAbilityBuildOrderId(Unit, abil_code, value) end

---技能 - 获取建造技能命令ID（象牙塔）
---@param Unit unit
---@param abil_code integer
---@return integer
function japi.DzGetUnitAbilityBuildOrderId(Unit, abil_code) end

---技能 - 设置建造技能模型（象牙塔）
---@param Unit unit
---@param abil_code integer
---@param model_path string
---@param model_scale real
---@return boolean
function japi.DzSetUnitAbilityBuildModel(Unit, abil_code, model_path, model_scale) end

---技能 - 判断单位是否拥有技能 (包含模版技能)
---@param Unit unit
---@param abil_code integer
---@return boolean
function japi.DzUnitHasAbility(Unit, abil_code) end

---技能 - 创建技能按钮控件
---@return integer
function japi.KKCreateCommandButton() end

---技能按钮 - 删除技能按钮
---@param btn integer
function japi.KKDestroyCommandButton(btn) end

---技能按钮 - 鼠标点击技能按钮
---@param btn integer
---@param mouse_type integer
function japi.KKCommandButtonClick(btn, mouse_type) end

---技能按钮 - 目标指示器点击目标单位
---@param mouse_type integer
---@param target widget
---@return boolean
function japi.KKCommandTargetClick(mouse_type, target) end

---技能按钮 - 目标指示器点击地面坐标
---@param mouse_type integer
---@param x real
---@param y real
---@param z real
---@return boolean
function japi.KKCommandTerrainClick(mouse_type, x, y, z) end

---技能按钮 - 绑定单位技能
---@param btn integer
---@param Unit unit
---@param abil_code integer
function japi.KKSetCommandUnitAbility(btn, Unit, abil_code) end

---物品 - 获取物品颜色
---@param Item item
---@return integer
function japi.DzItemGetVertexColor(Item) end

---物品 - 物品大小
---@param Item item
---@param size real
function japi.DzItemSetSize(Item, size) end

---物品 - 获取物品大小
---@param Item item
---@return real
function japi.DzItemGetSize(Item) end

---物品 - 模型按照X轴旋转
---@param Item item
---@param x real
function japi.DzItemMatRotateX(Item, x) end

---物品 - 模型按照Y轴旋转
---@param Item item
---@param y real
function japi.DzItemMatRotateY(Item, y) end

---物品 - 模型按照Z轴旋转
---@param Item item
---@param z real
function japi.DzItemMatRotateZ(Item, z) end

---物品 - 模型按照XYZ轴缩放
---@param Item item
---@param x real
---@param y real
---@param z real
function japi.DzItemMatScale(Item, x, y, z) end

---物品 - 模型重置旋转缩
---@param Item item
function japi.DzItemMatReset(Item) end

---物品 - 当前选择的物品(异步)
---@return item
function japi.DzGetLastSelectedItem() end

---DzSetPariticle2Size
---@param Widget agent
---@param scale real
function japi.DzSetPariticle2Size(Widget, scale) end

---单位 - 修改单位碰撞体积
---@param Unit unit
---@param size real
function japi.DzSetUnitCollisionSize(Unit, size) end

---单位 - 获取单位的碰撞体积
---@param Unit unit
---@return real
function japi.DzGetUnitCollisionSize(Unit) end

---设置组件纹理
---@param Handle agent
---@param TexturePath string
---@param ReplaceId integer
function japi.DzSetWidgetTexture(Handle, TexturePath, ReplaceId) end

---单位 - 修改单位选择圈缩放
---@param Unit unit
---@param scale real
function japi.DzSetUnitSelectScale(Unit, scale) end

---单位 - 设置单位是否忽略点击
---@param Unit unit
---@param ignore boolean
function japi.DzSetUnitHitIgnore(Unit, ignore) end

---特效 - 特效绑定特效
---@param Handle agent
---@param AttachName string
---@param eff effect
function japi.DzEffectBindEffect(Handle, AttachName, eff) end

---界面 - 设置Frame控件忽略点击事件
---@param frame integer
---@param ignore boolean
function japi.DzFrameSetIgnoreTrackEvents(frame, ignore) end

---界面 - 创建ui模型控件
---@param parent_frame integer
---@return integer
function japi.DzFrameAddModel(parent_frame) end

---界面 - ui模型 - 设置模型文件
---@param model_frame integer
---@param model_file string
---@param team_color_id integer
function japi.DzFrameSetModel2(model_frame, model_file, team_color_id) end

---界面 - ui模型 - 添加绑定特效
---@param model_frame integer
---@param attach_point string
---@param model_file string
---@return integer
function japi.DzFrameAddModelEffect(model_frame, attach_point, model_file) end

---界面 - ui模型 - 移除绑定特效
---@param model_frame integer
---@param effect_frame integer
function japi.DzFrameRemoveModelEffect(model_frame, effect_frame) end

---界面 - ui模型 - 播放动画指定索引
---@param model_frame integer
---@param anim_index integer
function japi.DzFrameSetModelAnimationByIndex(model_frame, anim_index) end

---界面 - ui模型 - 播放动画指定动画名
---@param model_frame integer
---@param animation string
function japi.DzFrameSetModelAnimation(model_frame, animation) end

---界面 - ui模型 - 设置场景内镜头源点
---@param model_frame integer
---@param x real
---@param y real
---@param z real
function japi.DzFrameSetModelCameraSource(model_frame, x, y, z) end

---界面 - ui模型 - 设置场景内镜头目标点
---@param model_frame integer
---@param x real
---@param y real
---@param z real
function japi.DzFrameSetModelCameraTarget(model_frame, x, y, z) end

---界面 - ui模型 - 设置缩放大小
---@param model_frame integer
---@param size real
function japi.DzFrameSetModelSize(model_frame, size) end

---界面 - ui模型 - 获取缩放大小
---@param model_frame integer
---@return real
function japi.DzFrameGetModelSize(model_frame) end

---界面 - ui模型 - 设置场景内的坐标(X Y Z)
---@param model_frame integer
---@param x real
---@param y real
---@param z real
function japi.DzFrameSetModelPosition(model_frame, x, y, z) end

---界面 - ui模型 - 设置场景内的坐标X轴
---@param model_frame integer
---@param x real
function japi.DzFrameSetModelX(model_frame, x) end

---界面 - ui模型 - 获取场景内的坐标X轴
---@param model_frame integer
---@return real
function japi.DzFrameGetModelX(model_frame) end

---界面 - ui模型 - 设置场景内的坐标Y轴
---@param model_frame integer
---@param y real
function japi.DzFrameSetModelY(model_frame, y) end

---界面 - ui模型 - 获取场景内的坐标Y轴
---@param model_frame integer
---@return real
function japi.DzFrameGetModelY(model_frame) end

---界面 - ui模型 - 设置场景内的坐标Z轴
---@param model_frame integer
---@param z real
function japi.DzFrameSetModelZ(model_frame, z) end

---界面 - ui模型 - 获取场景内的坐标Z轴
---@param model_frame integer
---@return real
function japi.DzFrameGetModelZ(model_frame) end

---界面 - ui模型 - 设置动画播放速度
---@param model_frame integer
---@param speed real
function japi.DzFrameSetModelSpeed(model_frame, speed) end

---界面 - ui模型 - 获取动画播放速度
---@param model_frame integer
---@return real
function japi.DzFrameGetModelSpeed(model_frame) end

---界面 - ui模型 - 设置矩阵缩放
---@param model_frame integer
---@param x real
---@param y real
---@param z real
function japi.DzFrameSetModelScale(model_frame, x, y, z) end

---界面 - ui模型 - 设置矩阵重置
---@param model_frame integer
function japi.DzFrameSetModelMatReset(model_frame) end

---界面 - ui模型 - 设置矩阵旋转X轴
---@param model_frame integer
---@param x real
function japi.DzFrameSetModelRotateX(model_frame, x) end

---界面 - ui模型 - 设置矩阵旋转Y轴
---@param model_frame integer
---@param y real
function japi.DzFrameSetModelRotateY(model_frame, y) end

---界面 - ui模型 - 设置矩阵旋转Z轴
---@param model_frame integer
---@param z real
function japi.DzFrameSetModelRotateZ(model_frame, z) end

---界面 - ui模型 - 设置模型颜色
---@param model_frame integer
---@param color integer
function japi.DzFrameSetModelColor(model_frame, color) end

---界面 - ui模型 - 获取颜色
---@param model_frame integer
---@return integer
function japi.DzFrameGetModelColor(model_frame) end

---界面 - ui模型 - 替换模型id贴图
---@param model_frame integer
---@param texture_file string
---@param replace_texutre_id integer
function japi.DzFrameSetModelTexture(model_frame, texture_file, replace_texutre_id) end

---界面 - ui模型 - 设置粒子2缩放大小
---@param model_frame integer
---@param scale real
function japi.DzFrameSetModelParticle2Size(model_frame, scale) end

---界面 - 获取游戏外界面底层
---@return integer
function japi.DzGetGlueUI() end

---界面 - 获取鼠标控件
---@return integer
function japi.DzFrameGetMouse() end

---界面 - 获取控件绑定的整数
---@param frame integer
---@return integer
function japi.DzFrameGetContext(frame) end

---界面 - 获取控件的全局名字
---@param frame integer
---@return string
function japi.DzFrameGetName(frame) end

---界面 - 设置控件全局名字跟绑定整数
---@param frame integer
---@param name string
---@param context integer
function japi.DzFrameSetNameContext(frame, name, context) end

---界面 - 设置文本控件字间距
---@param text_frame integer
---@param spacing real
function japi.DzFrameSetTextFontSpacing(text_frame, spacing) end

---界面 - 获取技能/物品按钮的冷却模型控件
---@param cmd_btn integer
---@return integer
function japi.KKCommandGetCooldownModel(cmd_btn) end

---界面 - 设置技能/物品按钮的冷却模型缩放大小
---@param cmd_btn integer
---@param size real
function japi.KKCommandSetCooldownModelSize(cmd_btn, size) end

---KKCommandSetCooldownModelSize2
---@param cmd_btn integer
---@param width real
---@param height real
function japi.KKCommandSetCooldownModelSize2(cmd_btn, width, height) end

---物品 - 玩家当前选择的物品(同步)
---@param p player
---@return item
function japi.DzGetPlayerLastSelectedItem(p) end

---获取当前缓存模型的数量
---@return integer
function japi.DzGetCacheModelCount() end

---游戏 - 限制最高帧数
---@param max_fps integer
function japi.DzSetMaxFps(max_fps) end

---允许查看指定单位技能
---@param u unit
---@param is_enable boolean
function japi.DzEnableDrawSkillPanel(u, is_enable) end

---允许查看指定玩家单位技能
---@param p player
---@param is_enable boolean
function japi.DzEnableDrawSkillPanelByPlayer(p, is_enable) end

---特效 - 设置特效迷雾可见
---@param eff effect
---@param is_visible boolean
function japi.DzSetEffectFogVisible(eff, is_visible) end

---特效 - 设置特效黑色阴影可见
---@param eff effect
---@param is_visible boolean
function japi.DzSetEffectMaskVisible(eff, is_visible) end

---世界坐标 - 绑定Frame到单位实时位置
---@param frame integer
---@param u widget
---@param world_x real
---@param world_y real
---@param world_z real
---@param screen_x real
---@param screen_y real
---@param fog_visible boolean
---@param unit_visible boolean
---@param dead_visible boolean
function japi.DzFrameBindWidget(frame, u, world_x, world_y, world_z, screen_x, screen_y, fog_visible, unit_visible,
                                dead_visible) end

---世界坐标 - 绑定Frame到世界坐标实时位置
---@param frame integer
---@param world_x real
---@param world_y real
---@param world_z real
---@param screen_x real
---@param screen_y real
---@param fog_visible boolean
function japi.DzFrameBindWorldPos(frame, world_x, world_y, world_z, screen_x, screen_y, fog_visible) end

---世界坐标 - 解除Frame的绑定
---@param frame integer
function japi.DzFrameUnBind(frame) end

---世界坐标 - 绑定Frame到物品实时位置
---@param frame integer
---@param u widget
---@param world_x real
---@param world_y real
---@param world_z real
---@param screen_x real
---@param screen_y real
---@param fog_visible boolean
---@param item_visible boolean
function japi.KKFrameBindItem(frame, u, world_x, world_y, world_z, screen_x, screen_y, fog_visible, item_visible) end

---界面 - 屏蔽所有单位指向UI跟血条
function japi.DzDisableUnitPreselectUi() end

---界面 - 屏蔽所有物品指向UI
function japi.DzDisableItemPreselectUi() end

---界面 - 获取低于控制台的底层Frame
---@return integer
function japi.DzFrameGetLowerLevelFrame() end

---界面 - 设置复选框勾选状态
---@param check_box_frame integer
---@param checked boolean
function japi.DzFrameSetCheckBoxState(check_box_frame, checked) end

---界面 - 获取复选框勾选状态
---@param check_box_frame integer
---@return boolean
function japi.DzFrameGetCheckBoxState(check_box_frame) end

---界面 - 获取控件是否焦点
---@param frame integer
---@return boolean
function japi.DzFrameIsFocus(frame) end

---界面 - 设置编辑框激活状态
---@param frame integer
---@param is_active boolean
function japi.DzFrameSetEditBoxActive(frame, is_active) end

---界面 - 设置编辑框禁用输入法
---@param frame integer
---@param is_disable boolean
function japi.DzFrameSetEditBoxDisableIme(frame, is_disable) end

---硬件 - 当前游戏是否窗口化模式
---@return boolean
function japi.DzIsWindowMode() end

---硬件 - 当前游戏窗口是否活动窗口
---@return boolean
function japi.DzIsWindowActive() end

---硬件 - 设置游戏窗口位置
---@param x integer
---@param y integer
function japi.DzWindowSetPoint(x, y) end

---硬件 - 设置游戏窗口大小
---@param width integer
---@param height integer
function japi.DzWindowSetSize(width, height) end

---硬件 - 获取屏幕设备宽度
---@return integer
function japi.DzGetSystemMetricsWidth() end

---硬件 - 获取屏幕设备高度
---@return integer
function japi.DzGetSystemMetricsHeight() end

---装饰物 - 获取当前地形装饰物数量
---@return integer
function japi.DzGetDoodadsCount() end

---装饰物 - 设置地形装饰物矩阵缩放
---@param doodads_index integer
---@param x real
---@param y real
---@param z real
function japi.DzSetDoodadsMatScale(doodads_index, x, y, z) end

---装饰物 - 设置地形装饰物矩阵旋转X轴
---@param doodads_index integer
---@param x real
function japi.DzSetDoodadsMatRotateX(doodads_index, x) end

---装饰物 - 设置地形装饰物矩阵旋转Y轴
---@param doodads_index integer
---@param y real
function japi.DzSetDoodadsMatRotateY(doodads_index, y) end

---装饰物 - 设置装饰物矩阵旋转Z轴
---@param doodads_index integer
---@param z real
function japi.DzSetDoodadsMatRotateZ(doodads_index, z) end

---装饰物 - 设置地形装饰物矩阵重置
---@param doodads_index integer
function japi.DzSetDoodadsMatReset(doodads_index) end

---技能 - 设置技能图标
---@param u unit
---@param abil_id integer
---@param art_path string
---@return boolean
function japi.DzSetUnitAbilityArt(u, abil_id, art_path) end

---技能 - 获取技能图标
---@param u unit
---@param abil_id integer
---@return string
function japi.DzGetUnitAbilityArt(u, abil_id) end

---技能 - 设置技能提示
---@param u unit
---@param abil_id integer
---@param tip string
---@return boolean
function japi.DzSetUnitAbilityTip(u, abil_id, tip) end

---技能 - 获取技能提示
---@param u unit
---@param abil_id integer
---@return string
function japi.DzGetUnitAbilityTip(u, abil_id) end

---技能 - 设置技能提示扩展
---@param u unit
---@param abil_id integer
---@param ubertip string
---@return boolean
function japi.DzSetUnitAbilityUberTip(u, abil_id, ubertip) end

---技能 - 获取技能提示扩展
---@param u unit
---@param abil_id integer
---@return string
function japi.DzGetUnitAbilityUberTip(u, abil_id) end

---技能 - 设置刷新数据
---@param u unit
---@param abil_id integer
---@return boolean
function japi.DzSetUnitAbilityUpdate(u, abil_id) end

---技能 - 设置技能命令ID
---@param u unit
---@param abil_id integer
---@param order_id integer
---@return boolean
function japi.DzSetUnitAbilityOrderId(u, abil_id, order_id) end

---技能 - 获取技能命令ID
---@param u unit
---@param abil_id integer
---@return integer
function japi.DzGetUnitAbilityOrderId(u, abil_id) end

---技能 - 设置魔法书的技能列表
---@param u unit
---@param abil_id integer
---@param abil_list string
---@param save_cooldown boolean
---@return boolean
function japi.DzSetUnitAbilitySpellBookList(u, abil_id, abil_list, save_cooldown) end

---技能 - 获取魔法书的技能列表
---@param u unit
---@param abil_id integer
---@return string
function japi.DzGetUnitAbilitySpellBookList(u, abil_id) end

---技能 - 设置技能投射物模型
---@param u unit
---@param abil_id integer
---@param missile_art string
---@return boolean
function japi.DzSetUnitAbilityMissileArt(u, abil_id, missile_art) end

---技能 - 获取技能投射物模型
---@param u unit
---@param abil_id integer
---@return string
function japi.DzGetUnitAbilityMissileArt(u, abil_id) end

---技能 - 设置技能投射物速度
---@param u unit
---@param abil_id integer
---@param missile_speed real
---@return boolean
function japi.DzSetUnitAbilityMissileSpeed(u, abil_id, missile_speed) end

---技能 - 获取技能投射物速度
---@param u unit
---@param abil_id integer
---@return real
function japi.DzGetUnitAbilityMissileSpeed(u, abil_id) end

---技能 - 设置技能投射物弧度
---@param u unit
---@param abil_id integer
---@param missile_arc real
---@return boolean
function japi.DzSetUnitAbilityMissileArc(u, abil_id, missile_arc) end

---技能 - 获取技能投射物弧度
---@param u unit
---@param abil_id integer
---@return real
function japi.DzGetUnitAbilityMissileArc(u, abil_id) end

---技能 - 设置技能投射物允许自导
---@param u unit
---@param abil_id integer
---@param missile_homing boolean
---@return boolean
function japi.DzSetUnitAbilityMissileHoming(u, abil_id, missile_homing) end

---技能 - 获取技能投射物允许自导
---@param u unit
---@param abil_id integer
---@return boolean
function japi.DzGetUnitAbilityMissileHoming(u, abil_id) end

---技能 - 设置技能投射物数量 (弹幕攻击)
---@param u unit
---@param abil_id integer
---@param missile_count integer
---@return boolean
function japi.DzSetUnitAbilityMissileCount(u, abil_id, missile_count) end

---技能 - 获取技能投射物数量 (弹幕攻击)
---@param u unit
---@param abil_id integer
---@return integer
function japi.DzGetUnitAbilityMissileCount(u, abil_id) end

---技能 - 设置技能投射物伤害 (弹幕攻击)
---@param u unit
---@param abil_id integer
---@param damage real
---@param max_damage real
---@param atktp attacktype
---@param dmgtp damagetype
---@return boolean
function japi.DzSetUnitAbilityMissileDamage(u, abil_id, damage, max_damage, atktp, dmgtp) end

---技能 - 获取技能投射物伤害 (弹幕攻击)
---@param u unit
---@param abil_id integer
---@return real
function japi.DzGetUnitAbilityMissileDamage(u, abil_id) end

---技能 - 获取技能投射物最大伤害 (弹幕攻击)
---@param u unit
---@param abil_id integer
---@return real
function japi.DzGetUnitAbilityMissileMaxDamage(u, abil_id) end

---游戏 - 模拟按键 (窗口消息)
---@param p player
---@param key_code integer
---@param is_down integer
function japi.DzSendKeyboard(p, key_code, is_down) end

---游戏 - 模拟按键 (游戏UI消息)
---@param p player
---@param key_code integer
---@param is_down integer
function japi.DzForceUiKeyboard(p, key_code, is_down) end

---游戏 - 屏蔽按键 (窗口消息)
---@param p player
---@param key_code integer
function japi.DzDisableWindowKeyboard(p, key_code) end

---游戏 - 屏蔽按键 (游戏UI消息)
---@param p player
---@param key_code integer
function japi.DzDisableGameUIKeyboard(p, key_code) end

---单位 - 是否可以被放置到坐标
---@param obj widget
---@param x real
---@param y real
---@return boolean
function japi.DzUnitCanPlaceAround(obj, x, y) end

---坐标 - 获取地形Z轴高度
---@param x real
---@param y real
---@return real
function japi.DzGetTerrainZ(x, y) end

---单位 - 获取单位Z轴高度
---@param u unit
---@return real
function japi.DzGetUnitZ(u) end

---单位 - 获取单位头顶高度偏移
---@param u widget
---@return real
function japi.DzGetUnitOverheadOffset(u) end

---界面 - ui模型 - 设置宽屏补丁
---@param frame integer
---@param is_enable boolean
function japi.DzFrameSetModelEnableWideScreen(frame, is_enable) end

---技能 - 设置技能启用
---@param u unit
---@param abil_id integer
---@return boolean
function japi.DzSetUnitAbilityEnable(u, abil_id) end

---技能 - 设置技能禁用
---@param u unit
---@param abil_id integer
---@return boolean
function japi.DzSetUnitAbilityDisable(u, abil_id) end

---技能 - 获取当前是否禁用状态
---@param u unit
---@param abil_id integer
---@return boolean
function japi.DzGetUnitAbilityIsDisabled(u, abil_id) end

---技能 - 获取当前禁用的内部计数
---@param u unit
---@param abil_id integer
---@return integer
function japi.DzGetUnitAbilityDisabledCount(u, abil_id) end

---技能 - 设置技能科技条件达成
---@param u unit
---@param abil_id integer
---@param reach boolean
---@return boolean
function japi.DzSetUnitAbilityTechReach(u, abil_id, reach) end

---技能 - 获取当前科技条件是否达成
---@param u unit
---@param abil_id integer
---@return boolean
function japi.DzGetUnitAbilityTechReach(u, abil_id) end

---技能 - 设置技能科技条件文本
---@param u unit
---@param abil_id integer
---@param tip string
---@return boolean
function japi.DzSetUnitAbilityTechReachTip(u, abil_id, tip) end

---建造 - 异步获取当前正在建造的技能Id
---@return integer
function japi.DzAsyncGetCurrentBuildingAbilityId() end

---建造 - 异步获取当前正在建造的单位Id
---@return integer
function japi.DzAsyncGetCurrentBuildingUnitId() end

---界面 - 解锁右下角区域鼠标焦点限制
---@param is_unlock boolean
function japi.DzFrameUnlockMouseRectLimit(is_unlock) end

---界面 - 判断SimpleFrame类型控件是否显示
---@param simple_frame integer
---@return boolean
function japi.KKSimpleFrameIsVisible(simple_frame) end

---界面 - 原生 - 获取聊天输入栏控件
---@return integer
function japi.DzFrameGetChatEditBar() end

---玩家 - 获取本地玩家的聊天频道
---@return integer
function japi.DzGetLocalChatRecipient() end

---玩家 - 发送聊天消息(触发同步事件)
---@param p player
---@param msg string
---@param recipient integer
function japi.DzPlayerSendChat(p, msg, recipient) end

---哈希表 - 开启保存空值(逆天设置null)
---@param is_enable boolean
function japi.DzEnableHashtableSetNull(is_enable) end

---物品 - 修改物品碰撞体积
---@param it item
---@param size real
function japi.DzSetItemCollisionSize(it, size) end

---物品 - 获取物品的碰撞体积
---@param it item
---@return real
function japi.DzGetItemCollisionSize(it) end

---单位 - 设置单位屏蔽本地命令(模拟失控)
---@param u unit
---@param is_disable boolean
function japi.DzSetUnitDisableLocalOrder(u, is_disable) end

---单位 - 获取单位本地命令是否被屏蔽
---@param u unit
---@return boolean
function japi.DzGetUnitDisableLocalOrder(u) end

---单位 - 设置单位屏蔽控制命令(模拟失控)
---@param u unit
---@param is_disable boolean
function japi.DzSetUnitDisableControlOrder(u, is_disable) end

---单位 - 获取单位控制命令是否被屏蔽
---@param u unit
---@return boolean
function japi.DzGetUnitDisableControlOrder(u) end

---单位 - 设置单位攻击1目标允许
---@param u unit
---@param target_type integer
function japi.DzSetUnitAttack1TargetType(u, target_type) end

---单位 - 获取单位攻击1目标允许
---@param u unit
---@return integer
function japi.DzGetUnitAttack1TargetType(u) end

---单位 - 设置单位攻击2目标允许
---@param u unit
---@param target_type integer
function japi.DzSetUnitAttack2TargetType(u, target_type) end

---单位 - 获取单位攻击2目标允许
---@param u unit
---@return integer
function japi.DzGetUnitAttack2TargetType(u) end

---单位 - 设置单位作为目标类型
---@param u unit
---@param target_type integer
function japi.DzSetUnitAsAttackTargetType(u, target_type) end

---单位 - 获取单位作为目标类型
---@param u unit
---@return integer
function japi.DzGetUnitAsAttackTargetType(u) end

---世界坐标 - 为绑定的Frame添加隐藏区域
---@param frame integer
---@param left real
---@param bottom real
---@param right real
---@param top real
---@param width real
---@param height real
function japi.DzFrameBindAddHideRect(frame, left, bottom, right, top, width, height) end

---界面 - 获取控件实际宽度
---@param frame integer
---@return real
function japi.DzFrameGetRealWidth(frame) end

---界面 - 获取控件实际高度
---@param frame integer
---@return real
function japi.DzFrameGetRealHeight(frame) end

---技能 - 设置魔法书技能列表添加新技能
---@param u unit
---@param abil_id integer
---@param add_abil_id integer
---@return boolean
function japi.DzSetUnitAbilitySpellBookAddAbility(u, abil_id, add_abil_id) end

---技能 - 设置魔法书技能列表移除指定技能
---@param u unit
---@param abil_id integer
---@param remove_abil_id integer
---@return boolean
function japi.DzSetUnitAbilitySpellBookRemoveAbility(u, abil_id, remove_abil_id) end

---技能按钮 - 获取按钮上的技能ID
---@param command_button integer
---@return integer
function japi.KKCommandButtonGetAbilityId(command_button) end

---技能按钮 - 获取按钮上的命令ID
---@param command_button integer
---@return integer
function japi.KKCommandButtonGetOrderId(command_button) end

---游戏 - 修复单位命令事件泄漏
function japi.DzFixUnitEventMemoryLeak() end

-- YDWEAdvancedUnitDataSystem

---获取 黄金消耗 (单位类型)
---@param unitid integer
---@return integer
function japi.GetUnitGoldCost(unitid) end

---获取 木头消耗 (单位类型)
---@param unitid integer
---@return integer
function japi.GetUnitWoodCost(unitid) end

---获取 建造时间 (单位类型)
---@param unitid integer
---@return integer
function japi.GetUnitBuildTime(unitid) end

---GetUnitCountDone
---@param unitid integer
---@return integer
function japi.GetUnitCountDone(unitid) end

---单位使用人口数量
---@param whichUnit unit
---@return integer
function japi.GetUnitFoodUsed(whichUnit) end

---单位提供人口数量
---@param whichUnit unit
---@return integer
function japi.GetUnitFoodMade(whichUnit) end

-- YDWEAbilityState

---EXGetUnitAbility
---@param u unit
---@param abilcode integer
---@return ability
function japi.EXGetUnitAbility(u, abilcode) end

---EXGetUnitAbilityByIndex
---@param u unit
---@param index integer
---@return ability
function japi.EXGetUnitAbilityByIndex(u, index) end

---EXGetAbilityId
---@param abil ability
---@return integer
function japi.EXGetAbilityId(abil) end

---EXGetAbilityState
---@param abil ability
---@param state_type integer
---@return real
function japi.EXGetAbilityState(abil, state_type) end

---EXSetAbilityState
---@param abil ability
---@param state_type integer
---@param value real
---@return boolean
function japi.EXSetAbilityState(abil, state_type, value) end

---EXGetAbilityDataReal
---@param abil ability
---@param level integer
---@param data_type integer
---@return real
function japi.EXGetAbilityDataReal(abil, level, data_type) end

---EXSetAbilityDataReal
---@param abil ability
---@param level integer
---@param data_type integer
---@param value real
---@return boolean
function japi.EXSetAbilityDataReal(abil, level, data_type, value) end

---EXGetAbilityDataInteger
---@param abil ability
---@param level integer
---@param data_type integer
---@return integer
function japi.EXGetAbilityDataInteger(abil, level, data_type) end

---EXSetAbilityDataInteger
---@param abil ability
---@param level integer
---@param data_type integer
---@param value integer
---@return boolean
function japi.EXSetAbilityDataInteger(abil, level, data_type, value) end

---EXGetAbilityDataString
---@param abil ability
---@param level integer
---@param data_type integer
---@return string
function japi.EXGetAbilityDataString(abil, level, data_type) end

---EXSetAbilityDataString
---@param abil ability
---@param level integer
---@param data_type integer
---@param value string
---@return boolean
function japi.EXSetAbilityDataString(abil, level, data_type, value) end

-- YDWEEventDamageData

---EXGetEventDamageData
---@param edd_type integer
---@return integer
function japi.EXGetEventDamageData(edd_type) end

---EXSetEventDamage
---@param amount real
---@return boolean
function japi.EXSetEventDamage(amount) end

-- YDWEJapiEffect

---X轴坐标 [JAPI] [New!]
---@param e effect
---@return real
function japi.EXGetEffectX(e) end

---Y轴坐标 [JAPI] [New!]
---@param e effect
---@return real
function japi.EXGetEffectY(e) end

---高度 [JAPI] [New!]
---@param e effect
---@return real
function japi.EXGetEffectZ(e) end

---移动到坐标 [JAPI] [New!]
---@param e effect
---@param x real
---@param y real
function japi.EXSetEffectXY(e, x, y) end

---设置高度 [JAPI] [New!]
---@param e effect
---@param z real
function japi.EXSetEffectZ(e, z) end

---大小 [JAPI] [New!]
---@param e effect
---@return real
function japi.EXGetEffectSize(e) end

---设置大小 [JAPI] [New!]
---@param e effect
---@param size real
function japi.EXSetEffectSize(e, size) end

---绕X轴旋转 [JAPI] [New!]
---@param e effect
---@param angle real
function japi.EXEffectMatRotateX(e, angle) end

---绕Y轴旋转 [JAPI] [New!]
---@param e effect
---@param angle real
function japi.EXEffectMatRotateY(e, angle) end

---绕Z轴旋转 [JAPI] [New!]
---@param e effect
---@param angle real
function japi.EXEffectMatRotateZ(e, angle) end

---缩放 [JAPI] [New!]
---@param e effect
---@param x real
---@param y real
---@param z real
function japi.EXEffectMatScale(e, x, y, z) end

---重置变换 [JAPI] [New!]
---@param e effect
function japi.EXEffectMatReset(e) end

---设置动画速度 [JAPI] [New!]
---@param e effect
---@param speed real
function japi.EXSetEffectSpeed(e, speed) end

-- YDWEYDWEJapiOther

---EXDisplayChat
---@param p player
---@param chat_recipient integer
---@param message string
function japi.EXDisplayChat(p, chat_recipient, message) end

-- YDWEYDWEJapiScript

---EXExecuteScript
---@param script string
---@return string
function japi.EXExecuteScript(script) end

-- YDWEJapiUnit

---设置单位面向角度 [JAPI] [New!]
---@param u unit
---@param angle real
function japi.EXSetUnitFacing(u, angle) end

---EXPauseUnit
---@param u unit
---@param flag boolean
function japi.EXPauseUnit(u, flag) end

---设置单位的碰撞类型 [JAPI] [New!]
---@param enable boolean
---@param u unit
---@param t integer
function japi.EXSetUnitCollisionType(enable, u, t) end

---设置单位的移动类型 [JAPI] [New!]
---@param u unit
---@param t integer
function japi.EXSetUnitMoveType(u, t) end

-- X_ABILITY

---技能 - 开始冷却
---@param whichAbility ability
---@param cooldown real
---@return boolean
function japi.X_StartAbilityCooldown(whichAbility, cooldown) end

---技能 - 正在冷却中
---@param whichAbility ability
---@return boolean
function japi.X_IsAbilityInCooldown(whichAbility) end

---技能 - 结束冷却
---@param whichAbility ability
---@return boolean
function japi.X_EndAbilityCooldown(whichAbility) end

---技能 - 设置数据（整数）
---@param whichAbility ability
---@param dataType integer
---@param opt integer
---@param value integer
---@return boolean
function japi.X_SetAbilityDataInteger(whichAbility, dataType, opt, value) end

---技能 - 获取数据（整数）
---@param whichAbility ability
---@param dataType integer
---@param opt integer
---@return integer
function japi.X_GetAbilityDataInteger(whichAbility, dataType, opt) end

---技能 - 重置数据（整数）
---@param whichAbility ability
---@param dataType integer
---@param opt integer
---@return boolean
function japi.X_ResetAbilityDataInteger(whichAbility, dataType, opt) end

---技能 - 设置数据（实数）
---@param whichAbility ability
---@param dataType integer
---@param opt integer
---@param value real
---@return boolean
function japi.X_SetAbilityDataReal(whichAbility, dataType, opt, value) end

---技能 - 获取数据（实数）
---@param whichAbility ability
---@param dataType integer
---@param opt integer
---@return real
function japi.X_GetAbilityDataReal(whichAbility, dataType, opt) end

---技能 - 重置数据（实数）
---@param whichAbility ability
---@param dataType integer
---@param opt integer
---@return boolean
function japi.X_ResetAbilityDataReal(whichAbility, dataType, opt) end

---技能 - 设置数据（字符串）
---@param whichAbility ability
---@param dataType integer
---@param opt integer
---@param value string
---@return boolean
function japi.X_SetAbilityDataString(whichAbility, dataType, opt, value) end

---技能 - 获取数据（字符串）
---@param whichAbility ability
---@param dataType integer
---@param opt integer
---@return string
function japi.X_GetAbilityDataString(whichAbility, dataType, opt) end

---技能 - 重置数据（字符串）
---@param whichAbility ability
---@param dataType integer
---@param opt integer
---@return boolean
function japi.X_ResetAbilityDataString(whichAbility, dataType, opt) end

---技能 - 工程升级
---@param whichAbility ability
---@param id integer
---@param update_hero_ability boolean
---@return boolean
function japi.X_EngineeringUpgradeAbility(whichAbility, id, update_hero_ability) end

---技能 - 可以施法
---@param whichAbility ability
---@param ignore_special_condition boolean
---@param ignore_no_mana boolean
---@return integer
function japi.X_TestAbilityCanCast(whichAbility, ignore_special_condition, ignore_no_mana) end

---技能 - 满足科技需求
---@param whichAbility ability
---@return boolean
function japi.X_IsAbilityMeetsRequirements(whichAbility) end

-- X_AGENT

---Agent - 获取内部类型名称
---@param whichAgent handle
---@return string
function japi.X_GetAgentTypeName(whichAgent) end

---Agent - 获取内部类型ID
---@param whichAgent handle
---@return integer
function japi.X_GetAgentTypeID(whichAgent) end

---Agent - 删除
---@param whichAgent handle
---@return boolean
function japi.X_DestroyAgent(whichAgent) end

---Agent - 获取Tag
---@param whichAgent handle
---@return string
function japi.X_GetAgentTag(whichAgent) end

---Agent - 转换Tag
---@param tag string
---@return handle
function japi.X_GetAgentFromTag(tag) end

---Agent - 兼容类型
---@param whichAgent handle
---@param typeID integer
---@return boolean
function japi.X_AgentIsChild(whichAgent, typeID) end   

-- X_BUFF

---单位添加魔法效果
---@param target unit
---@param source unit
---@param typeID integer
---@param buffID integer
---@param level integer
---@param spell_steal_priority integer
---@param duration real
---@param data1 real
---@param data2 real
---@param data3 real
---@param data4 real
---@param data5 real
---@param data6 real
---@param data7 real
---@param data8 real
---@param data9 real
---@param data10 real
---@param data11 real
---@return boolean
function japi.X_UnitAddBuff(target, source, typeID, buffID, level, spell_steal_priority, duration, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11) end

---单位魔法效果 - 获取等级
---@param whichUnit unit
---@param buffID integer
---@return integer
function japi.X_GetUnitBuffLevel(whichUnit, buffID) end

-- X_BUFFBAR

---Buff 栏 - 调整数量
---@param row integer
---@param col integer
function japi.X_BuffBarResize(row, col) end

---Buff 栏 - 显示重复 buff
---@param flag boolean
function japi.X_SetBuffBarShowDuplicatedBuff(flag) end

-- X_COMMANDBAR

---技能栏 - 调整数量
---@param row integer
---@param col integer
function japi.X_CommandBarResize(row, col) end

---技能栏 - 显示 队友/敌人 的技能及冷却
---@param show_ally_ability boolean
---@param show_enemy_ability boolean
---@param show_ally_ability_cooldown boolean
---@param show_enemy_ability_cooldown boolean
function japi.X_CommandBarShowAbility(show_ally_ability, show_enemy_ability, show_ally_ability_cooldown, show_enemy_ability_cooldown) end

---技能栏 - 显示 单位 的技能及冷却
---@param whichUnit unit
---@param show_ability boolean
---@param show_ability_cooldown boolean
---@return boolean
function japi.X_CommandBarShowUnitAbility(whichUnit, show_ability, show_ability_cooldown) end

---技能栏 - 获取当前子菜单命令ID
---@return integer
function japi.X_GetCurrentSubMenuOrderID() end

-- X_COMMANDBUTTON

---命令按钮 - 显示数字冷却
---@param show_ability boolean
---@param show_item boolean
function japi.X_SetCommandButtonShowCooldown(show_ability, show_item) end

---命令按钮 - 显示快捷键
---@param show_ability boolean
---@param show_item boolean
function japi.X_SetCommandButtonShowHotkey(show_ability, show_item) end

---命令按钮 - 设置快捷键背景
---@param filepath string
function japi.X_SetCommandButtonHotkeyBackground(filepath) end

-- X_DESTRUCTABLE

---可破坏物 - 获取颜色值
---@param whichDestructable destructable
---@return integer
function japi.X_GetDestructableColor(whichDestructable) end

---可破坏物 - 设置颜色值
---@param whichDestructable destructable
---@param color integer
---@return boolean
function japi.X_SetDestructableColor(whichDestructable, color) end

---可破坏物 - 重置颜色值
---@param whichDestructable destructable
---@return boolean
function japi.X_ResetDestructableColor(whichDestructable) end

-- X_DIALOG

---对话框按钮 - 获取文本
---@param whichButton button
---@return string
function japi.X_GetDialogButtonText(whichButton) end

-- X_EFFECT

---特效 - 设置动画速度
---@param whichEffect effect
---@param timescale real
---@return boolean
function japi.X_SetEffectTimeScale(whichEffect, timescale) end

---特效 - 获取颜色值（红）
---@param whichEffect effect
---@param red integer
---@return boolean
function japi.X_SetEffectColorRed(whichEffect, red) end

---特效 - 获取颜色值（绿）
---@param whichEffect effect
---@param green integer
---@return boolean
function japi.X_SetEffectColorGreen(whichEffect, green) end

---特效 - 获取颜色值（蓝）
---@param whichEffect effect
---@param blue integer
---@return boolean
function japi.X_SetEffectColorBlue(whichEffect, blue) end

---特效 - 获取颜色值
---@param whichEffect effect
---@param color integer
---@return boolean
function japi.X_SetEffectColor(whichEffect, color) end

---特效 - 获取透明度
---@param whichEffect effect
---@param alpha integer
---@return boolean
function japi.X_SetEffectAlpha(whichEffect, alpha) end

---特效 - 获取颜色值（红）
---@param whichEffect effect
---@return integer
function japi.X_GetEffectColorRed(whichEffect) end

---特效 - 获取颜色值（绿）
---@param whichEffect effect
---@return integer
function japi.X_GetEffectColorGreen(whichEffect) end

---特效 - 获取颜色值（蓝）
---@param whichEffect effect
---@return integer
function japi.X_GetEffectColorBlue(whichEffect) end

---特效 - 获取颜色值
---@param whichEffect effect
---@return integer
function japi.X_GetEffectColor(whichEffect) end

---特效 - 获取透明度
---@param whichEffect effect
---@return integer
function japi.X_GetEffectAlpha(whichEffect) end

---特效 - 设置队伍颜色
---@param whichEffect effect
---@param color playercolor
---@return boolean
function japi.X_SetEffectTeamColor(whichEffect, color) end

---特效 - 更新智能坐标
---@param whichEffect effect
---@return boolean
function japi.X_UpdateEffectSmartPosition(whichEffect) end

---特效 - 播放动画
---@param whichEffect effect
---@param animation string
---@return boolean
function japi.X_SetEffectAnimation(whichEffect, animation) end

---特效 - 播放动画
---@param whichEffect effect
---@param animation string
---@param flag integer
---@return boolean
function japi.X_SetEffectAnimationEx(whichEffect, animation, flag) end

---特效 - 播放动画(序号)
---@param whichEffect effect
---@param index integer
---@return boolean
function japi.X_SetEffectAnimationByIndex(whichEffect, index) end

---特效 - 播放动画 (序号)
---@param whichEffect effect
---@param index integer
---@param flag integer
---@return boolean
function japi.X_SetEffectAnimationByIndexEx(whichEffect, index, flag) end

---特效 - 隐藏
---@param whichEffect effect
---@param hide boolean
---@return boolean
function japi.X_HideEffect(whichEffect, hide) end

---特效 - 立即删除
---@param whichEffect effect
---@return boolean
function japi.X_RemoveEffect(whichEffect) end

---特效 - 延迟立即删除
---@param whichEffect effect
---@param time real
---@return boolean
function japi.X_RemoveEffectTimed(whichEffect, time) end

---特效 - 设置始终渲染
---@param whichEffect effect
---@param flag boolean
---@return boolean
function japi.X_SetEffectAlwaysRender(whichEffect, flag) end

---特效 - 延迟删除
---@param whichEffect effect
---@param time real
---@return boolean
function japi.X_DieEffectTimed(whichEffect, time) end

---特效 - 复制 Sprite
---@param whichEffect effect
---@param pSprite integer
---@return boolean
function japi.X_EffectCopyFromSprite(whichEffect, pSprite) end

-- X_EFFECTGROUP

---特效组 - 创建
---@return X_EffectGroup
function japi.X_EffectGroupCreate() end

---特效组 - 获取特效数量
---@param whichEffectGroup X_EffectGroup
---@return integer
function japi.X_EffectGroupGetSize(whichEffectGroup) end

---特效组 - 第N个特效
---@param whichEffectGroup X_EffectGroup
---@param index integer
---@return effect
function japi.X_EffectGroupAt(whichEffectGroup, index) end

---特效组 - 清空
---@param whichEffectGroup X_EffectGroup
---@return integer
function japi.X_EffectGroupClear(whichEffectGroup) end

---特效组 - 添加特效
---@param whichEffectGroup X_EffectGroup
---@param whichEffect effect
---@param allowDuplicate boolean
---@return integer
function japi.X_EffectGroupAdd(whichEffectGroup, whichEffect, allowDuplicate) end

---特效组 - 移除特效
---@param whichEffectGroup X_EffectGroup
---@param whichEffect effect
---@param firstOnly boolean
---@return boolean
function japi.X_EffectGroupRemove(whichEffectGroup, whichEffect, firstOnly) end

---特效组 - 枚举范围内的特效
---@param whichEffectGroup X_EffectGroup
---@param x real
---@param y real
---@param range real
---@param clear boolean
---@param allowDuplicate boolean
---@return integer
function japi.X_EffectGroupEnumRange(whichEffectGroup, x, y, range, clear, allowDuplicate) end

---特效组 - 枚举矩形区域内的特效
---@param whichEffectGroup X_EffectGroup
---@param whichRect rect
---@param clear boolean
---@param allowDuplicate boolean
---@return integer
function japi.X_EffectGroupEnumRect(whichEffectGroup, whichRect, clear, allowDuplicate) end

---特效组 - 销毁
---@param whichEffectGroup X_EffectGroup
---@return boolean
function japi.X_EffectGroupDestroy(whichEffectGroup) end

---特效组 - 选取特效
---@return effect
function japi.X_GetEnumEffect() end

---特效组 - 遍历
---@param whichEffectGroup X_EffectGroup
---@param callback code
---@return integer
function japi.X_ForEffectGroup(whichEffectGroup, callback) end

---特效组 - 转换handle ID为特效组
---@param handleID integer
---@return X_EffectGroup
function japi.X_Handle2EffectGroup(handleID) end

-- X_FRAME

---函数 - 运行
---@param callback code
---@param async boolean
---@return boolean
function japi.X_ExecuteFuncByCode(callback, async) end

---函数 - 运行 (延迟)
---@param callback code
---@param delay real
---@param periodic boolean
---@param async boolean
---@return boolean
function japi.X_DelayedExecuteFuncByCode(callback, delay, periodic, async) end

-- X_GAME

---游戏 - 获取当前同步检验值
---@return integer
function japi.X_GetCurrentSyncCheckSum() end

---游戏 - 设置全局单位移动速度范围
---@param building_min real
---@param building_max real
---@param unit_min real
---@param unit_max real
---@param GC_building_min real
---@param GC_building_max real
---@param GC_unit_min real
---@param GC_unit_max real
---@param harvest_min real
---@param windwalk_max real
function japi.X_SetGlobalUnitMinMaxMoveSpeed(building_min, building_max, unit_min, unit_max, GC_building_min, GC_building_max, GC_unit_min, GC_unit_max, harvest_min, windwalk_max) end

---游戏 - 启用自动Dump游戏日志
---@return string
function japi.X_EnableAutoDumpGameLog() end

---游戏 - Dump游戏日志
---@return string
function japi.X_DumpGameLog() end

---游戏 - 启用同步日志
---@return string
function japi.X_EnableSyncLog() end

---游戏 - 忽略指定函数的同步日志
---@param func code
---@return boolean
function japi.X_SyncLogIgnoreFunction(func) end

---游戏 - 设置游戏常量食物上限
---@param value integer
function japi.X_SetGameConstantFoodCeiling(value) end

---游戏 - 启用崩溃时生成调试日志
function japi.X_EnableCrashDump() end

---游戏 - 设置玩家寻路限制
---@param whichPlayer player
---@param limit_1 integer
---@param limit_2 integer
---@param limit_3 integer
---@param limit_4 integer
---@return boolean
function japi.X_SetPlayerPathFindingLimit(whichPlayer, limit_1, limit_2, limit_3, limit_4) end

---游戏 - 设置攻击速度因子范围
---@param min real
---@param max real
function japi.X_SetMinMaxAttackSpeedFactor(min, max) end

---游戏 - 启用移动速度加成叠加
---@param flag boolean
function japi.X_SetMoveSpeedBonusesStack(flag) end

---游戏 - 禁止原生删除处于死亡状态的英雄
function japi.X_DisableRemoveExtraDeadHero() end

---游戏 - 测试目标允许
---@param whichWidget widget
---@param target_flags integer
---@param whichUnit unit
---@param playerID integer
---@return integer
function japi.X_TestWidgetTargetFlags(whichWidget, target_flags, whichUnit, playerID) end

---游戏 - 禁用攻速限制
function japi.X_DisableAttackSpeedLimit() end

---游戏 - 禁用加载结束按任意键继续
function japi.X_DisableLoadingPressAKey() end

-- X_GAMEUI

---游戏UI - 显示文本
---@param message string
---@param duration real
---@param where integer
---@param color integer
---@return boolean
function japi.X_DisplayMessage(message, duration, where, color) end

---游戏UI - 清空文本
---@param where integer
---@return boolean
function japi.X_ClearMessage(where) end

---游戏UI - 设置文本
---@param message string
---@param duration real
---@param where integer
---@param color integer
---@return boolean
function japi.X_SetMessage(message, duration, where, color) end

---游戏UI - 刷新信息栏
---@param now boolean
---@return boolean
function japi.X_RefreshInfoBar(now) end

---游戏UI - 刷新技能栏
---@param now boolean
---@return boolean
function japi.X_RefreshCommandBar(now) end

---游戏UI - 刷新英雄栏
---@param now boolean
---@return boolean
function japi.X_RefreshHeroBar(now) end

---游戏UI - 获取当前输入模式
---@return integer
function japi.X_GetCurrentInputMode() end

---游戏UI - 获取目标输入模式的技能ID
---@return integer
function japi.X_GetTargetModeAbilityID() end

---游戏UI - 获取目标输入模式的命令ID
---@return integer
function japi.X_GetTargetModeOrderID() end

---游戏UI - 获取目标输入模式的单位
---@return unit
function japi.X_GetTargetModeUnit() end

---游戏UI - 获取目标输入模式的当前指向目标单位
---@return unit
function japi.X_GetTargetModeTargetUnit() end

---游戏UI - 获取目标输入模式的当前指向目标物品
---@return item
function japi.X_GetTargetModeTargetItem() end

---游戏UI - 获取目标输入模式的当前指向目标可破坏物
---@return destructable
function japi.X_GetTargetModeTargetDestructable() end

---游戏UI - 命令错误转换到本地化字符串key
---@param order_error integer
---@return string
function japi.X_OrderErrorToStringKey(order_error) end

---游戏UI - 清空空格键转向点
---@return boolean
function japi.X_ClearCameraQuickPosition() end

---游戏UI - 清空镜头绑定的单位
---@return boolean
function japi.X_ClearCameraTargetController() end

---游戏UI - 解析物编标签字符串
---@param tag string
---@return string
function japi.X_ParseTags(tag) end

---游戏UI - 刷新大头像
---@param force_refresh boolean
function japi.X_RefreshPortrait(force_refresh) end

---游戏UI - 获取鼠标指向的widget
---@return widget
function japi.X_GetMouseFocusWidget() end

---游戏UI - 获取鼠标指向的单位
---@return unit
function japi.X_GetMouseFocusUnit() end

---游戏UI - 获取鼠标指向的可破坏物
---@return destructable
function japi.X_GetMouseFocusDestructable() end

---游戏UI - 获取鼠标指向的物品
---@return item
function japi.X_GetMouseFocusItem() end

---游戏UI - 获取鼠标指向的可追踪物
---@return trackable
function japi.X_GetMouseFocusTrackable() end

-- X_GROUP

---单位组 - 获取单位数量
---@param whichGroup group
---@return integer
function japi.X_GroupGetSize(whichGroup) end

---单位组 - 第N个单位
---@param whichGroup group
---@param index integer
---@return unit
function japi.X_GroupUnitAt(whichGroup, index) end

---单位组 - 枚举范围内的单位
---@param whichGroup group
---@param x real
---@param y real
---@param radius real
---@param clear boolean
---@param include_collision boolean
---@param exclude_flag integer
---@param limit integer
---@param unitID integer
---@param filter boolexpr
---@return integer
function japi.X_GroupEnumUnitsInRange(whichGroup, x, y, radius, clear, include_collision, exclude_flag, limit, unitID, filter) end

---单位组 - 添加编队单位到单位组
---@param whichGroup group
---@param whichPlayer player
---@param index integer
---@param clear boolean
---@return integer
function japi.X_GroupEnumPlayerControlGroup(whichGroup, whichPlayer, index, clear) end

-- X_HASHTABLE

---哈希表 - 读取句柄ID
---@param whichHashtable hashtable
---@param parentKey integer
---@param childKey integer
---@return integer
function japi.X_LoadHandleId(whichHashtable, parentKey, childKey) end

---哈希表 - 保存句柄ID
---@param whichHashtable hashtable
---@param parentKey integer
---@param childKey integer
---@param handleid integer
---@return boolean
function japi.X_SaveHandleId(whichHashtable, parentKey, childKey, handleid) end

---哈希表 - 保存句柄ID（扩展）
---@param whichHashtable hashtable
---@param parentKey integer
---@param childKey integer
---@param handleid integer
---@param handletype integer
---@return boolean
function japi.X_SaveHandleIdEx(whichHashtable, parentKey, childKey, handleid, handletype) end

---哈希表 - 设置哈希表大小限制
---@param max_count integer
function japi.X_SetHashtableLimit(max_count) end

-- X_HERO

---英雄 - 设置主属性
---@param whichUnit unit
---@param value integer
---@return boolean
function japi.X_SetHeroPrimaryAttribute(whichUnit, value) end

---英雄 - 获取主属性
---@param whichUnit unit
---@param include_bonus boolean
---@return integer
function japi.X_GetHeroPrimaryAttribute(whichUnit, include_bonus) end

---英雄 - 设置主属性类型
---@param whichUnit unit
---@param attribute_type integer
---@param keep_current_primary_bonus boolean
---@return boolean
function japi.X_SetHeroPrimaryAttributeType(whichUnit, attribute_type, keep_current_primary_bonus) end

---英雄 - 获取主属性类型
---@param whichUnit unit
---@return integer
function japi.X_GetHeroPrimaryAttributeType(whichUnit) end

---英雄 - 设置属性成长
---@param whichUnit unit
---@param attribute_type integer
---@param value real
---@param keep_current_bonus boolean
---@return boolean
function japi.X_SetHeroAttributePlus(whichUnit, attribute_type, value, keep_current_bonus) end

---英雄 - 获取属性成长
---@param whichUnit unit
---@param attribute_type integer
---@return real
function japi.X_GetHeroAttributePlus(whichUnit, attribute_type) end

-- X_INVENTORY

---物品栏 - 启用物品栏扩展
---@param max_size integer
---@return boolean
function japi.X_StartManageInventory(max_size) end

---物品栏 - 获取最大格子数
---@return integer
function japi.X_GetInventoryMaxSize() end

---物品栏 - 获取丢弃格子对应命令ID
---@param index integer
---@return integer
function japi.X_GetInventoryDropSlotOrderID(index) end

---物品栏 - 获取使用格子对应命令ID
---@param index integer
---@return integer
function japi.X_GetInventoryUseSlotOrderID(index) end

---物品栏 - 设置物品栏快捷键文本
---@param index integer
---@param text string
---@return boolean
function japi.X_SetInventoryHotkeyText(index, text) end

---物品栏 - 设置物品栏快捷键
---@param index integer
---@param hotkey integer
---@return boolean
function japi.X_SetInventoryHotkey(index, hotkey) end

-- X_ITEM

---物品 - 设置物品类型数据（整数）
---@param itemID integer
---@param dataType integer
---@param value integer
---@return boolean
function japi.X_SetItemTypeDataInteger(itemID, dataType, value) end

---物品 - 获取物品类型数据（整数）
---@param itemID integer
---@param dataType integer
---@return integer
function japi.X_GetItemTypeDataInteger(itemID, dataType) end

---物品 - 设置物品类型数据（实数）
---@param itemID integer
---@param dataType integer
---@param value real
---@return boolean
function japi.X_SetItemTypeDataReal(itemID, dataType, value) end

---物品 - 获取物品类型数据（实数）
---@param itemID integer
---@param dataType integer
---@return real
function japi.X_GetItemTypeDataReal(itemID, dataType) end

---物品 - 设置物品类型数据（字符串）
---@param itemID integer
---@param dataType integer
---@param value string
---@return boolean
function japi.X_SetItemTypeDataString(itemID, dataType, value) end

---物品 - 获取物品类型数据（字符串）
---@param itemID integer
---@param dataType integer
---@return string
function japi.X_GetItemTypeDataString(itemID, dataType) end

---物品 - 设置物品数据（整数）
---@param whichItem item
---@param dataType integer
---@param reserved integer
---@param value integer
---@return boolean
function japi.X_SetItemDataInteger(whichItem, dataType, reserved, value) end

---物品 - 获取物品数据（整数）
---@param whichItem item
---@param dataType integer
---@param reserved integer
---@return integer
function japi.X_GetItemDataInteger(whichItem, dataType, reserved) end

---物品 - 重置物品数据（整数）
---@param whichItem item
---@param dataType integer
---@param reserved integer
---@return boolean
function japi.X_ResetItemDataInteger(whichItem, dataType, reserved) end

---物品 - 设置物品数据（实数）
---@param whichItem item
---@param dataType integer
---@param reserved integer
---@param value real
---@return boolean
function japi.X_SetItemDataReal(whichItem, dataType, reserved, value) end

---物品 - 获取物品数据（实数）
---@param whichItem item
---@param dataType integer
---@param reserved integer
---@return real
function japi.X_GetItemDataReal(whichItem, dataType, reserved) end

---物品 - 重置物品数据（实数）
---@param whichItem item
---@param dataType integer
---@param reserved integer
---@return boolean
function japi.X_ResetItemDataReal(whichItem, dataType, reserved) end

---物品 - 设置物品数据（字符串）
---@param whichItem item
---@param dataType integer
---@param reserved integer
---@param value string
---@return boolean
function japi.X_SetItemDataString(whichItem, dataType, reserved, value) end

---物品 - 获取物品数据（字符串）
---@param whichItem item
---@param dataType integer
---@param reserved integer
---@return string
function japi.X_GetItemDataString(whichItem, dataType, reserved) end

---物品 - 重置物品数据（字符串）
---@param whichItem item
---@param dataType integer
---@param reserved integer
---@return boolean
function japi.X_ResetItemDataString(whichItem, dataType, reserved) end

---物品 - 开始冷却
---@param whichItem item
---@param cooldown real
---@return boolean
function japi.X_StartItemCooldown(whichItem, cooldown) end

---物品 - 结束冷却
---@param whichItem item
---@return boolean
function japi.X_EndItemCooldown(whichItem) end

---物品 - 获取持有物品的单位
---@param whichItem item
---@return unit
function japi.X_GetItemHolder(whichItem) end

---物品 - 物品是否在冷却中
---@param whichItem item
---@return boolean
function japi.X_IsItemInCooldown(whichItem) end

---物品 - 物品在指定单位是否在冷却中
---@param whichItem item
---@param whichUnit unit
---@return boolean
function japi.X_IsItemInUnitCooldown(whichItem, whichUnit) end

---物品 - 转换handle ID为物品
---@param handleID integer
---@return item
function japi.X_Handle2Item(handleID) end

---物品 - 获取物品的技能
---@param whichItem item
---@param index integer
---@return ability
function japi.X_GetItemAbility(whichItem, index) end

-- deprecated
---物品 - 设置颜色值（已弃用）
---@param whichItem item
---@param color integer
---@return boolean
function japi.X_SetItemColor(whichItem, color) end

---物品 - 获取颜色值（已弃用）
---@param whichItem item
---@return integer
function japi.X_GetItemColor(whichItem) end

---物品 - 重置颜色值（已弃用）
---@param whichItem item
---@return boolean
function japi.X_ResetItemColor(whichItem) end

---物品 - 设置贴图（已弃用）
---@param whichItem item
---@param value string
---@return boolean
function japi.X_SetItemArt(whichItem, value) end

---物品 - 获取贴图（已弃用）
---@param whichItem item
---@return string
function japi.X_GetItemOverrideArt(whichItem) end

---物品 - 重置贴图（已弃用）
---@param whichItem item
---@return boolean
function japi.X_ResetItemArt(whichItem) end

---物品 - 设置名称（已弃用）
---@param whichItem item
---@param value string
---@return boolean
function japi.X_SetItemName(whichItem, value) end

---物品 - 获取名称（已弃用）
---@param whichItem item
---@return string
function japi.X_GetItemOverrideName(whichItem) end

---物品 - 重置名称（已弃用）
---@param whichItem item
---@return boolean
function japi.X_ResetItemName(whichItem) end

---物品 - 设置提示信息（已弃用）
---@param whichItem item
---@param value string
---@return boolean
function japi.X_SetItemTip(whichItem, value) end

---物品 - 获取提示信息（已弃用）
---@param whichItem item
---@return string
function japi.X_GetItemOverrideTip(whichItem) end

---物品 - 重置提示信息（已弃用）
---@param whichItem item
---@return boolean
function japi.X_ResetItemTip(whichItem) end

---物品 - 设置扩展提示信息（已弃用）
---@param whichItem item
---@param value string
---@return boolean
function japi.X_SetItemUberTip(whichItem, value) end

---物品 - 获取扩展提示信息（已弃用）
---@param whichItem item
---@return string
function japi.X_GetItemOverrideUberTip(whichItem) end

---物品 - 重置扩展提示信息（已弃用）
---@param whichItem item
---@return boolean
function japi.X_ResetItemUberTip(whichItem) end

-- X_JASSVM

---Jass虚拟机 - 启用/禁用 字节码上限
---@param enable boolean
function japi.X_EnableOpcodeLimit(enable) end

---Jass虚拟机 - 启用/禁用 字节码计数
---@param enable boolean
function japi.X_EnableOpcodeCounter(enable) end

---Jass虚拟机 - 设置字节码行为
---@param enablelimit boolean
---@param enablecounter boolean
function japi.X_SetOpcodeBehavior(enablelimit, enablecounter) end

---X_DoGC
---@param callback code
---@return integer
function japi.X_DoGC(callback) end

---X_GetGCHandle
---@return handle
function japi.X_GetGCHandle() end

-- X_KK

---KK - 同步游戏数据 (立即)
---@param prefix string
---@param data string
---@return boolean
function japi.X_DzSyncDataImmediately(prefix, data) end

---KK - 获取用户ID
---@param whichPlayer player
---@return string
function japi.X_DzGetUserID(whichPlayer) end

-- X_MAP

---地图 - 获取数据 (字符串)
---@param data_type integer
---@param reserved integer
---@return string
function japi.X_GetMapPropertiesString(data_type, reserved) end

-- X_PLAYER

---玩家 - 获取当前选择的主单位
---@param whichPlayer player
---@return unit
function japi.X_GetPlayerSelectedMainUnit(whichPlayer) end

-- X_PROJECTILE

---投射物 - 发射箭矢
---@param source unit
---@param target widget
---@param model string
---@param team_color integer
---@param color integer
---@param x real
---@param y real
---@param z real
---@param scale real
---@param speed real
---@param attack_type attacktype
---@param damage_type damagetype
---@param weapon_type weapontype
---@param damage real
---@param arc real
---@param homing boolean
---@param can_miss boolean
---@param never_miss boolean
---@param attack boolean
---@param flags integer
---@return boolean
function japi.X_LaunchMissile(source, target, model, team_color, color, x, y, z, scale, speed, attack_type, damage_type, weapon_type, damage, arc, homing, can_miss, never_miss, attack, flags) end

---投射物 - 发射箭矢(弹射)
---@param source unit
---@param target widget
---@param model string
---@param team_color integer
---@param color integer
---@param x real
---@param y real
---@param z real
---@param scale real
---@param speed real
---@param attack_type attacktype
---@param damage_type damagetype
---@param weapon_type weapontype
---@param damage real
---@param arc real
---@param homing boolean
---@param can_miss boolean
---@param never_miss boolean
---@param attack boolean
---@param flags integer
---@param target_flags integer
---@param target_count integer
---@param bounce_range real
---@param damage_loss real
---@return boolean
function japi.X_LaunchMissileBounce(source, target, model, team_color, color, x, y, z, scale, speed, attack_type, damage_type, weapon_type, damage, arc, homing, can_miss, never_miss, attack, flags, target_flags, target_count, bounce_range, damage_loss) end

---投射物 - 发射箭矢(穿透)
---@param source unit
---@param target widget
---@param model string
---@param team_color integer
---@param color integer
---@param x real
---@param y real
---@param z real
---@param scale real
---@param speed real
---@param attack_type attacktype
---@param damage_type damagetype
---@param weapon_type weapontype
---@param damage real
---@param arc real
---@param homing boolean
---@param can_miss boolean
---@param never_miss boolean
---@param attack boolean
---@param flags integer
---@param target_flags integer
---@param damage_loss real
---@param distance real
---@param range real
---@return boolean
function japi.X_LaunchMissileLine(source, target, model, team_color, color, x, y, z, scale, speed, attack_type, damage_type, weapon_type, damage, arc, homing, can_miss, never_miss, attack, flags, target_flags, damage_loss, distance, range) end

---投射物 - 发射箭矢(溅射)
---@param source unit
---@param target widget
---@param model string
---@param team_color integer
---@param color integer
---@param x real
---@param y real
---@param z real
---@param scale real
---@param speed real
---@param attack_type attacktype
---@param damage_type damagetype
---@param weapon_type weapontype
---@param damage real
---@param arc real
---@param homing boolean
---@param can_miss boolean
---@param never_miss boolean
---@param attack boolean
---@param flags integer
---@param target_flags integer
---@param half_factor real
---@param quar_factor real
---@param full_area real
---@param half_area real
---@param quar_area real
---@return boolean
function japi.X_LaunchMissileSplash(source, target, model, team_color, color, x, y, z, scale, speed, attack_type, damage_type, weapon_type, damage, arc, homing, can_miss, never_miss, attack, flags, target_flags, half_factor, quar_factor, full_area, half_area, quar_area) end

---投射物 - 发射炮火
---@param source unit
---@param target widget
---@param target_x real
---@param target_y real
---@param model string
---@param team_color integer
---@param color integer
---@param x real
---@param y real
---@param z real
---@param scale real
---@param speed real
---@param attack_type attacktype
---@param damage_type damagetype
---@param weapon_type weapontype
---@param damage real
---@param arc real
---@param attack boolean
---@param flags integer
---@param min_distance real
---@param target_flags integer
---@param half_factor real
---@param quar_factor real
---@param full_area real
---@param half_area real
---@param quar_area real
---@return boolean
function japi.X_LaunchArtillery(source, target, target_x, target_y, model, team_color, color, x, y, z, scale, speed, attack_type, damage_type, weapon_type, damage, arc, attack, flags, min_distance, target_flags, half_factor, quar_factor, full_area, half_area, quar_area) end

---投射物 - 发射炮火(穿透)
---@param source unit
---@param target widget
---@param target_x real
---@param target_y real
---@param model string
---@param team_color integer
---@param color integer
---@param x real
---@param y real
---@param z real
---@param scale real
---@param speed real
---@param attack_type attacktype
---@param damage_type damagetype
---@param weapon_type weapontype
---@param damage real
---@param arc real
---@param attack boolean
---@param flags integer
---@param min_distance real
---@param target_flags integer
---@param half_factor real
---@param quar_factor real
---@param full_area real
---@param half_area real
---@param quar_area real
---@param damage_loss real
---@param distance real
---@param range real
---@return boolean
function japi.X_LaunchArtilleryLine(source, target, target_x, target_y, model, team_color, color, x, y, z, scale, speed, attack_type, damage_type, weapon_type, damage, arc, attack, flags, min_distance, target_flags, half_factor, quar_factor, full_area, half_area, quar_area, damage_loss, distance, range) end

---投射物 - 发射技能投射物(腐臭蜂群)
---@param source unit
---@param model string
---@param team_color integer
---@param color integer
---@param x real
---@param y real
---@param z real
---@param facing real
---@param distance real
---@param scale real
---@param speed real
---@param attack_type attacktype
---@param damage_type damagetype
---@param weapon_type weapontype
---@param damage real
---@param flags integer
---@param target_flags integer
---@param start_radius real
---@param end_radius real
---@param max_damage real
---@param buffID integer
---@return boolean
function japi.X_LaunchMissileCarrionSwarmEx(source, model, team_color, color, x, y, z, facing, distance, scale, speed, attack_type, damage_type, weapon_type, damage, flags, target_flags, start_radius, end_radius, max_damage, buffID) end

-- X_TERRAIN

---地形 - 获取Z轴
---@param x real
---@param y real
---@return real
function japi.X_GetTerrainZ(x, y) end

-- X_TEXTTAG

---漂浮文字 - 设置文本对齐
---@param whichTextTag texttag
---@param V integer
---@param H integer
---@return boolean
function japi.X_SetTextTagAlignment(whichTextTag, V, H) end

-- X_TIMER

---计时器 - 设置是否循环
---@param whichTimer timer
---@param periodic boolean
---@return boolean
function japi.X_TimerSetPeriodic(whichTimer, periodic) end

---计时器 - 设置超时
---@param whichTimer timer
---@param timeout real
---@return boolean
function japi.X_TimerSetTimeout(whichTimer, timeout) end

---计时器 - 恢复计时器
---@param whichTimer timer
---@return boolean
function japi.X_ResumeTimer(whichTimer) end

---计时器 - 暂停计时器
---@param whichTimer timer
---@return boolean
function japi.X_PauseTimer(whichTimer) end

---计时器 - 删除计时器
---@param whichTimer timer
---@return boolean
function japi.X_DestroyTimer(whichTimer) end

-- X_TRIGGER

---X_TriggerRemoveEvent
---@param whichTrigger trigger
---@param whichEvent event
---@return boolean
function japi.X_TriggerRemoveEvent(whichTrigger, whichEvent) end

---触发器 - 清除所有事件
---@param whichTrigger trigger
---@return boolean
function japi.X_TriggerClearEvents(whichTrigger) end

-- X_UNIT

---单位 - 是否无敌
---@param whichUnit unit
---@return boolean
function japi.X_IsUnitInvulnerable(whichUnit) end

---单位 - 是否显示血条
---@param whichUnit unit
---@return boolean
function japi.X_ShouldUnitShowHPBar(whichUnit) end

---单位 - 获取血条 UI 坐标 X
---@param whichUnit unit
---@return real
function japi.X_GetUnitHPBarX(whichUnit) end

---单位 - 获取血条 UI 坐标 Y
---@param whichUnit unit
---@return real
function japi.X_GetUnitHPBarY(whichUnit) end

---单位 - 转换 handle ID 为单位
---@param handleID integer
---@return unit
function japi.X_Handle2Unit(handleID) end

---单位 - 设置每秒生命恢复
---@param whichUnit unit
---@param value real
---@return boolean
function japi.X_SetUnitLifeRegen(whichUnit, value) end

---单位 - 获取每秒生命恢复
---@param whichUnit unit
---@return real
function japi.X_GetUnitLifeRegen(whichUnit) end

---单位 - 设置每秒魔法恢复
---@param whichUnit unit
---@param value real
---@return boolean
function japi.X_SetUnitManaRegen(whichUnit, value) end

---单位 - 获取每秒魔法恢复
---@param whichUnit unit
---@return real
function japi.X_GetUnitManaRegen(whichUnit) end

---单位 - 获取投射物发射坐标X
---@param whichUnit unit
---@return real
function japi.X_GetUnitPojectileLaunchX(whichUnit) end

---单位 - 获取投射物发射坐标Y
---@param whichUnit unit
---@return real
function japi.X_GetUnitPojectileLaunchY(whichUnit) end

---单位 - 获取投射物发射坐标Z
---@param whichUnit unit
---@return real
function japi.X_GetUnitPojectileLaunchZ(whichUnit) end

---单位 - 获取坐标Z
---@param whichUnit unit
---@return real
function japi.X_GetUnitZ(whichUnit) end

---单位 - 设置最低移动速度
---@param whichUnit unit
---@param value real
---@param ignore_polymorph boolean
---@return boolean
function japi.X_SetUnitMinSpeed(whichUnit, value, ignore_polymorph) end

---单位 - 设置最高移动速度
---@param whichUnit unit
---@param value real
---@param ignore_polymorph boolean
---@return boolean
function japi.X_SetUnitMaxSpeed(whichUnit, value, ignore_polymorph) end

---单位 - 设置魔法施放点
---@param whichUnit unit
---@param value real
---@return boolean
function japi.X_SetUnitCastPoint(whichUnit, value) end

---单位 - 获取魔法施放点
---@param whichUnit unit
---@return real
function japi.X_GetUnitCastPoint(whichUnit) end

---单位 - 设置魔法施放回复
---@param whichUnit unit
---@param value real
---@return boolean
function japi.X_SetUnitBackSwing(whichUnit, value) end

---单位 - 获取魔法施放回复
---@param whichUnit unit
---@return real
function japi.X_GetUnitBackSwing(whichUnit) end

---单位 - 杀死
---@param whichUnit unit
---@param killer unit
---@return boolean
function japi.X_KillUnit(whichUnit, killer) end

---单位 - 获取护甲
---@param whichUnit unit
---@param include_bonus boolean
---@return real
function japi.X_GetUnitDefense(whichUnit, include_bonus) end

---单位 - 添加物品到指定格子
---@param whichUnit unit
---@param whichItem item
---@param index integer
---@return boolean
function japi.X_UnitAddItemToSlot(whichUnit, whichItem, index) end

---单位 - 设置 XY 坐标
---@param whichUnit unit
---@param x real
---@param y real
---@return boolean
function japi.X_SetUnitXY(whichUnit, x, y) end

---单位 - 获取攻击加成
---@param whichUnit unit
---@param index integer
---@return integer
function japi.X_GetUnitAttackBonus(whichUnit, index) end

---单位 - 设置攻击最大目标数
---@param whichUnit unit
---@param index integer
---@param count integer
---@return boolean
function japi.X_SetUnitAttackTargetCount(whichUnit, index, count) end

---单位 - 造成伤害
---@param whichUnit unit
---@param target widget
---@param damage real
---@param wt weapontype
---@param at attacktype
---@param dt damagetype
---@param flag integer
---@param is_attack boolean
---@param killer unit
---@param extra_data integer
---@return boolean
function japi.X_UnitDamageTarget(whichUnit, target, damage, wt, at, dt, flag, is_attack, killer, extra_data) end

---单位 - 获取技能
---@param whichUnit unit
---@param ID integer
---@param check_code boolean
---@param check_alias boolean
---@param check_unit_ability boolean
---@param check_item_ability boolean
---@return ability
function japi.X_GetUnitAbility(whichUnit, ID, check_code, check_alias, check_unit_ability, check_item_ability) end

---单位 - 设置碰撞路径
---@param whichUnit unit
---@param for_us integer
---@param for_other integer
---@return boolean
function japi.X_SetUnitPathingMasks(whichUnit, for_us, for_other) end

---单位 - 设置数据 (整数)
---@param whichUnit unit
---@param data_type integer
---@param optional integer
---@param value integer
---@return boolean
function japi.X_SetUnitDataInteger(whichUnit, data_type, optional, value) end

---单位 - 获取数据 (整数)
---@param whichUnit unit
---@param data_type integer
---@param optional integer
---@return integer
function japi.X_GetUnitDataInteger(whichUnit, data_type, optional) end

---单位 - 重置数据 (整数)
---@param whichUnit unit
---@param data_type integer
---@param optional integer
---@return boolean
function japi.X_ResetUnitDataInteger(whichUnit, data_type, optional) end

---单位 - 设置数据 (实数)
---@param whichUnit unit
---@param data_type integer
---@param optional integer
---@param value real
---@return boolean
function japi.X_SetUnitDataReal(whichUnit, data_type, optional, value) end

---单位 - 获取数据 (实数)
---@param whichUnit unit
---@param data_type integer
---@param optional integer
---@return real
function japi.X_GetUnitDataReal(whichUnit, data_type, optional) end

---单位 - 重置数据 (实数)
---@param whichUnit unit
---@param data_type integer
---@param optional integer
---@return boolean
function japi.X_ResetUnitDataReal(whichUnit, data_type, optional) end

-- X_UNITABILITY

---单位技能 - 开始冷却
---@param whichUnit unit
---@param abilID integer
---@param cooldown real
---@return boolean
function japi.X_StartUnitAbilityCooldown(whichUnit, abilID, cooldown) end

---单位技能 - 冷却中
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_IsUnitAbilityInCooldown(whichUnit, abilID) end

---单位技能 - 结束冷却
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_EndUnitAbilityCooldown(whichUnit, abilID) end

---单位技能 - 设置目标允许
---@param whichUnit unit
---@param abilID integer
---@param value integer
---@return boolean
function japi.X_SetUnitAbilityTargetFlags(whichUnit, abilID, value) end

---单位技能 - 获取目标允许
---@param whichUnit unit
---@param abilID integer
---@return integer
function japi.X_GetUnitAbilityTargetFlags(whichUnit, abilID) end

---单位技能 - 重置目标允许
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityTargetFlags(whichUnit, abilID) end

---单位技能 - 设置魔法施放时间
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityCastTime(whichUnit, abilID, value) end

---单位技能 - 获取魔法施法时间
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityCastTime(whichUnit, abilID) end

---单位技能 - 重置魔法施放时间
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityCastTime(whichUnit, abilID) end

---单位技能 - 设置持续时间
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDuration(whichUnit, abilID, value) end

---单位技能 - 获取持续时间
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDuration(whichUnit, abilID) end

---单位技能 - 重置持续时间
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDuration(whichUnit, abilID) end

---单位技能 - 设置持续时间 (英雄)
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityHeroDuration(whichUnit, abilID, value) end

---单位技能 - 获取持续时间 (英雄)
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityHeroDuration(whichUnit, abilID) end

---单位技能 - 重置持续时间 (英雄)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityHeroDuration(whichUnit, abilID) end

---单位技能 - 设置魔法消耗
---@param whichUnit unit
---@param abilID integer
---@param value integer
---@return boolean
function japi.X_SetUnitAbilityManaCost(whichUnit, abilID, value) end

---单位技能 - 获取魔法消耗
---@param whichUnit unit
---@param abilID integer
---@return integer
function japi.X_GetUnitAbilityManaCost(whichUnit, abilID) end

---单位技能 - 重置魔法消耗
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityManaCost(whichUnit, abilID) end

---单位技能 - 设置魔法施放间隔
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityCooldown(whichUnit, abilID, value) end

---单位技能 - 获取魔法施放间隔
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityCooldown(whichUnit, abilID) end

---单位技能 - 重置魔法施放间隔
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityCooldown(whichUnit, abilID) end

---单位技能 - 设置影响区域
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityAreaOfEffect(whichUnit, abilID, value) end

---单位技能 - 获取影响区域
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityAreaOfEffect(whichUnit, abilID) end

---单位技能 - 重置影响区域
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAreaOfEffect(whichUnit, abilID) end

---单位技能 - 设置施法距离
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityRange(whichUnit, abilID, value) end

---单位技能 - 获取施法距离
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityRange(whichUnit, abilID) end

---单位技能 - 重置施法距离
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityRange(whichUnit, abilID) end

---单位技能 - 设置数据A
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDataA(whichUnit, abilID, value) end

---单位技能 - 获取数据A
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDataA(whichUnit, abilID) end

---单位技能 - 重置数据A
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDataA(whichUnit, abilID) end

---单位技能 - 设置数据B
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDataB(whichUnit, abilID, value) end

---单位技能 - 获取数据B
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDataB(whichUnit, abilID) end

---单位技能 - 重置数据B
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDataB(whichUnit, abilID) end

---单位技能 - 设置数据C
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDataC(whichUnit, abilID, value) end

---单位技能 - 获取数据C
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDataC(whichUnit, abilID) end

---单位技能 - 重置数据C
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDataC(whichUnit, abilID) end

---单位技能 - 设置数据D
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDataD(whichUnit, abilID, value) end

---单位技能 - 获取数据D
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDataD(whichUnit, abilID) end

---单位技能 - 重置数据D
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDataD(whichUnit, abilID) end

---单位技能 - 设置数据E
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDataE(whichUnit, abilID, value) end

---单位技能 - 获取数据E
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDataE(whichUnit, abilID) end

---单位技能 - 重置数据E
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDataE(whichUnit, abilID) end

---单位技能 - 设置数据F
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDataF(whichUnit, abilID, value) end

---单位技能 - 获取数据F
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDataF(whichUnit, abilID) end

---单位技能 - 重置数据F
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDataF(whichUnit, abilID) end

---单位技能 - 设置数据G
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDataG(whichUnit, abilID, value) end

---单位技能 - 获取数据G
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDataG(whichUnit, abilID) end

---单位技能 - 重置数据G
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDataG(whichUnit, abilID) end

---单位技能 - 设置数据H
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDataH(whichUnit, abilID, value) end

---单位技能 - 获取数据H
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDataH(whichUnit, abilID) end

---单位技能 - 重置数据H
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDataH(whichUnit, abilID) end

---单位技能 - 设置数据I
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityDataI(whichUnit, abilID, value) end

---单位技能 - 获取数据I
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityDataI(whichUnit, abilID) end

---单位技能 - 重置数据I
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityDataI(whichUnit, abilID) end

---单位技能 - 设置单位类型
---@param whichUnit unit
---@param abilID integer
---@param value integer
---@return boolean
function japi.X_SetUnitAbilityUnitID(whichUnit, abilID, value) end

---单位技能 - 获取单位类型
---@param whichUnit unit
---@param abilID integer
---@return integer
function japi.X_GetUnitAbilityUnitID(whichUnit, abilID) end

---单位技能 - 重置单位类型
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityUnitID(whichUnit, abilID) end

---单位技能 - 设置魔法效果
---@param whichUnit unit
---@param abilID integer
---@param index integer
---@param value integer
---@return boolean
function japi.X_SetUnitAbilityBuffID(whichUnit, abilID, index, value) end

---单位技能 - 获取魔法效果
---@param whichUnit unit
---@param abilID integer
---@param index integer
---@return integer
function japi.X_GetUnitAbilityBuffID(whichUnit, abilID, index) end

---单位技能 - 重置魔法效果
---@param whichUnit unit
---@param abilID integer
---@param index integer
---@return boolean
function japi.X_ResetUnitAbilityBuffID(whichUnit, abilID, index) end

---单位技能 - 重置魔法效果 (全部)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAllBuffID(whichUnit, abilID) end

---单位技能 - 设置区域持续效果
---@param whichUnit unit
---@param abilID integer
---@param index integer
---@param value integer
---@return boolean
function japi.X_SetUnitAbilityEffectID(whichUnit, abilID, index, value) end

---单位技能 - 获取区域持续效果
---@param whichUnit unit
---@param abilID integer
---@param index integer
---@return integer
function japi.X_GetUnitAbilityEffectID(whichUnit, abilID, index) end

---单位技能 - 重置区域持续效果
---@param whichUnit unit
---@param abilID integer
---@param index integer
---@return boolean
function japi.X_ResetUnitAbilityEffectID(whichUnit, abilID, index) end

---单位技能 - 重置区域持续效果 (全部)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAllEffectID(whichUnit, abilID) end

-- 下面这些只是和技能栏有关
---单位技能 - 设置技能栏图标
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@param value string
---@return boolean
function japi.X_SetUnitAbilityArt(whichUnit, abilID, orderID, value) end

---单位技能 - 获取技能栏覆盖的图标
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return string
function japi.X_GetUnitAbilityOverrideArt(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏图标
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return boolean
function japi.X_ResetUnitAbilityArt(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏图标 (全部)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAllArt(whichUnit, abilID) end

---单位技能 - 设置技能栏按钮坐标
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@param x integer
---@param y integer
---@return boolean
function japi.X_SetUnitAbilityPos(whichUnit, abilID, orderID, x, y) end

---单位技能 - 设置技能栏全部按钮坐标
---@param whichUnit unit
---@param abilID integer
---@param x integer
---@param y integer
---@return boolean
function japi.X_SetUnitAbilityAllPos(whichUnit, abilID, x, y) end

---单位技能 - 获取技能栏覆盖的按钮X
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return integer
function japi.X_GetUnitAbilityOverridePosX(whichUnit, abilID, orderID) end

---单位技能 - 获取技能栏覆盖的按钮Y
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return integer
function japi.X_GetUnitAbilityOverridePosY(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏按钮坐标
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return boolean
function japi.X_ResetUnitAbilityPos(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏按钮坐标 (全部)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAllPos(whichUnit, abilID) end

---单位技能 - 设置技能栏快捷键
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@param value integer
---@return boolean
function japi.X_SetUnitAbilityHotkey(whichUnit, abilID, orderID, value) end

---单位技能 - 设置技能栏全部快捷键
---@param whichUnit unit
---@param abilID integer
---@param value integer
---@return boolean
function japi.X_SetUnitAbilityAllHotkey(whichUnit, abilID, value) end

---单位技能 - 获取技能栏覆盖的快捷键
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return integer
function japi.X_GetUnitAbilityOverrideHotkey(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏快捷键
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return boolean
function japi.X_ResetUnitAbilityHotkey(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏快捷键 (全部)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAllHotkey(whichUnit, abilID) end

---单位技能 - 设置技能栏名称
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@param value string
---@return boolean
function japi.X_SetUnitAbilityName(whichUnit, abilID, orderID, value) end

---单位技能 - 获取技能栏覆盖的名称
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return string
function japi.X_GetUnitAbilityOverrideName(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏名称
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return boolean
function japi.X_ResetUnitAbilityName(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏名称 (全部)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAllName(whichUnit, abilID) end

---单位技能 - 设置技能栏提示
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@param value string
---@return boolean
function japi.X_SetUnitAbilityTip(whichUnit, abilID, orderID, value) end

---单位技能 - 获取技能栏覆盖的提示
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return string
function japi.X_GetUnitAbilityOverrideTip(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏提示
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return boolean
function japi.X_ResetUnitAbilityTip(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏提示 (全部)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAllTip(whichUnit, abilID) end

---单位技能 - 设置技能栏扩展提示
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@param value string
---@return boolean
function japi.X_SetUnitAbilityUberTip(whichUnit, abilID, orderID, value) end

---单位技能 - 获取技能栏覆盖的扩展提示
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return string
function japi.X_GetUnitAbilityOverrideUberTip(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏扩展提示
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return boolean
function japi.X_ResetUnitAbilityUberTip(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏扩展提示 (全部)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAllUberTip(whichUnit, abilID) end

---单位技能 - 设置技能栏数量
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@param value integer
---@return boolean
function japi.X_SetUnitAbilityCharges(whichUnit, abilID, orderID, value) end

---单位技能 - 获取技能栏覆盖的数量
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return integer
function japi.X_GetUnitAbilityOverrideCharges(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏数量
---@param whichUnit unit
---@param abilID integer
---@param orderID integer
---@return boolean
function japi.X_ResetUnitAbilityCharges(whichUnit, abilID, orderID) end

---单位技能 - 重置技能栏数量 (全部)
---@param whichUnit unit
---@param abilID integer
---@return boolean
function japi.X_ResetUnitAbilityAllCharges(whichUnit, abilID) end

---单位技能 - 设置魔法施放时间 (2)
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityChannelTime(whichUnit, abilID, value) end

---单位技能 - 获取魔法施放时间 (2)
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityChannelTime(whichUnit, abilID) end

---单位技能 - 设置魔法施放点
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityCastPoint(whichUnit, abilID, value) end

---单位技能 - 获取魔法施放点
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityCastPoint(whichUnit, abilID) end

---单位技能 - 设置魔法施放回复
---@param whichUnit unit
---@param abilID integer
---@param value real
---@return boolean
function japi.X_SetUnitAbilityBackSwing(whichUnit, abilID, value) end

---单位技能 - 获取魔法施放回复
---@param whichUnit unit
---@param abilID integer
---@return real
function japi.X_GetUnitAbilityBackSwing(whichUnit, abilID) end

---单位技能 - 工程升级
---@param whichUnit unit
---@param old_id integer
---@param new_id integer
---@param update_hero_ability boolean
---@return boolean
function japi.X_EngineeringUpgradeUnitAbility(whichUnit, old_id, new_id, update_hero_ability) end

---单位技能 - 可以施法
---@param whichUnit unit
---@param abilID integer
---@param ignore_special_condition boolean
---@param ignore_no_mana boolean
---@return integer
function japi.X_TestUnitAbilityCanCast(whichUnit, abilID, ignore_special_condition, ignore_no_mana) end

-- X_UTIL

---位操作 - 按位与
---@param a integer
---@param b integer
---@return integer
function japi.X_BitAnd(a, b) end

---位操作 - 按位或
---@param a integer
---@param b integer
---@return integer
function japi.X_BitOr(a, b) end

---位操作 - 按位异或
---@param a integer
---@param b integer
---@return integer
function japi.X_BitXor(a, b) end

---位操作 - 检查标识
---@param a integer
---@param b integer
---@return boolean
function japi.X_IsBitSet(a, b) end

---实用函数 - 强制转换整数为实数
---@param value integer
---@return real
function japi.X_CastI2R(value) end

---实用函数 - 强制转换实数为整数
---@param value real
---@return integer
function japi.X_CastR2I(value) end

---实用函数 - 转换(ARGB)为颜色
---@param a integer
---@param r integer
---@param g integer
---@param b integer
---@return integer
function japi.X_ConvertColor(a, r, g, b) end

---实用函数 - 复制颜色并替换红色
---@param color integer
---@param r integer
---@return integer
function japi.X_ReplaceColorR(color, r) end

---实用函数 - 复制颜色并替换绿色
---@param color integer
---@param g integer
---@return integer
function japi.X_ReplaceColorG(color, g) end

---实用函数 - 复制颜色并替换蓝色
---@param color integer
---@param b integer
---@return integer
function japi.X_ReplaceColorB(color, b) end

---实用函数 - 复制颜色并替换透明度
---@param color integer
---@param a integer
---@return integer
function japi.X_ReplaceColorA(color, a) end

---实用函数 - 获取颜色的红色
---@param color integer
---@return integer
function japi.X_GetColorR(color) end

---实用函数 - 获取颜色的绿色
---@param color integer
---@return integer
function japi.X_GetColorG(color) end

---实用函数 - 获取颜色的蓝色
---@param color integer
---@return integer
function japi.X_GetColorB(color) end

---实用函数 - 获取颜色的透明度
---@param color integer
---@return integer
function japi.X_GetColorA(color) end

---实用函数 - 转换物编targs字符串为目标允许
---@param targs string
---@return integer
function japi.X_ConvertTargetArgsStringToFlags(targs) end

---实用函数 - 转换字符串ID为整数ID
---@param fourCC string
---@return integer
function japi.X_FourCC(fourCC) end

---实用函数 - 转换整数ID为字符串ID
---@param fourCC integer
---@return string
function japi.X_FourCC2String(fourCC) end

---实用函数 - 获取系统运行时间
---@return integer
function japi.X_timeGetTime() end

-- X_VECTOR

---数组 (连续) - 创建
---@param async boolean
---@return X_Vector
function japi.X_VectorCreate(async) end

---数组 (连续) - 添加数值
---@param vector X_Vector
---@param value integer
---@return integer
function japi.X_VectorPushback(vector, value) end

---数组 (连续) - 存有数值
---@param vector X_Vector
---@param value integer
---@return boolean
function japi.X_VectorExist(vector, value) end

---数组 (连续) - 获取数值
---@param vector X_Vector
---@param index integer
---@return integer
function japi.X_VectorGet(vector, index) end

---数组 (连续) - 设置数值
---@param vector X_Vector
---@param index integer
---@param value integer
---@return boolean
function japi.X_VectorSet(vector, index, value) end

---数组 (连续) - 插入数值
---@param vector X_Vector
---@param index integer
---@param value integer
---@return boolean
function japi.X_VectorInsert(vector, index, value) end

---数组 (连续) - 删除索引
---@param vector X_Vector
---@param index integer
---@return boolean
function japi.X_VectorEraseIndex(vector, index) end

---数组 (连续) - 删除数值 (单次)
---@param vector X_Vector
---@param value integer
---@return boolean
function japi.X_VectorEraseValue(vector, value) end

---数组 (连续) - 删除数值 (全部)
---@param vector X_Vector
---@param value integer
---@return integer
function japi.X_VectorEraseAllValue(vector, value) end

---数组 (连续) - 清空
---@param vector X_Vector
---@return integer
function japi.X_VectorClear(vector) end

---数组 (连续) - 调整大小
---@param vector X_Vector
---@param size integer
---@return boolean
function japi.X_VectorResize(vector, size) end

---数组 (连续) - 压缩
---@param vector X_Vector
---@return boolean
function japi.X_VectorShrink(vector) end

---数组 (连续) - 反转
---@param vector X_Vector
---@return boolean
function japi.X_VectorReverse(vector) end

---数组 (连续) - 选取数值
---@return integer
function japi.X_VectorGetEnumValue() end

---数组 (连续) - 遍历
---@param vector X_Vector
---@param callback code
---@param async boolean
---@return integer
function japi.X_VectorForEach(vector, callback, async) end

---数组 (连续) - 删除
---@param vector X_Vector
---@return boolean
function japi.X_VectorDestroy(vector) end

---数组 (连续) - 预留大小
---@param vector X_Vector
---@param size integer
---@return boolean
function japi.X_VectorReserve(vector, size) end

---数组 (连续) - 获取大小
---@param vector X_Vector
---@return integer
function japi.X_VectorGetSize(vector) end

---数组 (连续) - 插入数组
---@param vector X_Vector
---@param index integer
---@param source_vector X_Vector
---@return integer
function japi.X_VectorInsertVector(vector, index, source_vector) end

---数组 (连续) - 转换 handle ID 为数组
---@param handleID integer
---@return X_Vector
function japi.X_Handle2Vector(handleID) end

-- X_ASYNCEVENT_HANDLERELEASE

---Handle释放事件 - 添加回调
---@param calllback code
function japi.X_TriggerRegisterHandleIDReleaseByCode(calllback) end

---Handle释放事件 - 获取释放的handle
---@return handle
function japi.X_GetHandleReleased() end

-- X_ASYNCEVENT_HEALTHBAR

---血条更新事件 - 添加回调
---@param callback code
function japi.X_TriggerRegisterHPBarUpdateEventByCode(callback) end

---血条更新事件 - 获取触发widget
---@return widget
function japi.X_GetHPBarUpdateEventWidget() end

---血条更新事件 - 获取触发单位
---@return unit
function japi.X_GetHPBarUpdateEventUnit() end

---血条更新事件 - 获取触发可破坏物
---@return destructable
function japi.X_GetHPBarUpdateEventDestructable() end

---血条更新事件 - 获取UI坐标X
---@return real
function japi.X_GetHPBarUpdateEventX() end

---血条更新事件 - 获取UI坐标Y
---@return real
function japi.X_GetHPBarUpdateEventY() end

---血条更新事件 - 获取UI宽度
---@return real
function japi.X_GetHPBarUpdateEventWidth() end

---血条更新事件 - 隐藏当前触发的UI
function japi.X_HideHPBarUpdateEventUI() end

---血条隐藏事件 - 添加回调
---@param callback code
function japi.X_TriggerRegisterHPBarHideEventByCode(callback) end

---血条隐藏事件 - 获取触发widget
---@return widget
function japi.X_GetHPBarHideEventWidget() end

---血条隐藏事件 - 获取触发单位
---@return unit
function japi.X_GetHPBarHideEventUnit() end

---血条隐藏事件 - 获取触发可破坏物
---@return destructable
function japi.X_GetHPBarHideEventDestructable() end

---血条更新结束事件 - 添加回调
---@param callback code
function japi.X_TriggerRegisterHPBarUpdateEndEventByCode(callback) end

-- X_ASYNCEVENT_MULTIBOARD

---多面板最小化事件 - 添加回调
---@param callback code
function japi.X_TriggerRegisterMultiboardMinimizeEventByCode(callback) end

---多面板最大化事件 - 添加回调
---@param callback code
function japi.X_TriggerRegisterMultiboardMaximizeEventByCode(callback) end

---隐藏/显示多面板事件 - 获取触发多面板
---@return multiboard
function japi.X_GetTriggerMultiboardWar3() end

-- X_ASYNCEVENT_SELECTION

---添加选择事件 - 添加回调
---@param callback code
function japi.X_TriggerRegisterAddSelectionByCode(callback) end

---取消选择事件 - 添加回调
---@param callback code
function japi.X_TriggerRegisterRemoveSelectionByCode(callback) end

---选择/取消选择事件 - 获取触发物品
---@return item
function japi.X_GetModifySelectionEventItem() end

---选择/取消选择事件 - 获取触发可破坏物
---@return destructable
function japi.X_GetModifySelectionEventDestructable() end

-- X_LowLevelJAPI_ANIM

---X_DisableAnimEvent
---@param eventID integer
---@param dataID integer
function japi.X_DisableAnimEvent(eventID, dataID) end

-- X_LowLevelJAPI_CAMERA

---界面 - 创建镜头
---@param frame integer
---@return integer
function japi.X_FrameCreateCamera(frame) end

---Camera - 绑定镜头到界面
---@param frame integer
---@param camera integer
---@return boolean
function japi.X_FrameSetCamera(frame, camera) end

---界面 - 获取镜头
---@param frame integer
---@return integer
function japi.X_FrameGetCamera(frame) end

---Camera - 设置目标点
---@param camera integer
---@param x real
---@param y real
---@param z real
---@return boolean
function japi.X_SetCameraTargetPosition(camera, x, y, z) end

---Camera - 设置目标点X
---@param camera integer
---@param value real
---@return boolean
function japi.X_SetCameraTargetPositionX(camera, value) end

---Camera - 设置目标点Y
---@param camera integer
---@param value real
---@return boolean
function japi.X_SetCameraTargetPositionY(camera, value) end

---Camera - 设置目标点Z
---@param camera integer
---@param value real
---@return boolean
function japi.X_SetCameraTargetPositionZ(camera, value) end

---Camera - 设置来源点
---@param camera integer
---@param x real
---@param y real
---@param z real
---@return boolean
function japi.X_SetCameraSourcePosition(camera, x, y, z) end

---Camera - 设置目标点X
---@param camera integer
---@param value real
---@return boolean
function japi.X_SetCameraSourcePositionX(camera, value) end

---Camera - 设置目标点Y
---@param camera integer
---@param value real
---@return boolean
function japi.X_SetCameraSourcePositionY(camera, value) end

---Camera - 设置目标点Z
---@param camera integer
---@param value real
---@return boolean
function japi.X_SetCameraSourcePositionZ(camera, value) end

---Camera - 设置距离
---@param camera integer
---@param value real
---@return boolean
function japi.X_SetCameraDistance(camera, value) end

---Camera - 设置 FarZ
---@param camera integer
---@param value real
---@return boolean
function japi.X_SetCameraFarZ(camera, value) end

---Camera - 设置 NearZ
---@param camera integer
---@param value real
---@return boolean
function japi.X_SetCameraNearZ(camera, value) end

-- X_LowLevelJAPI_FRAME

---界面 - 设置SpriteFrame的默认光照
---@param spriteframe integer
---@return boolean
function japi.X_SpriteFrameSetDefaultLight(spriteframe) end

---界面 - 删除 SimpleFrame
---@param simpleframe integer
---@return boolean
function japi.X_DestroySimpleFrame(simpleframe) end

---界面 - 创建 SimpleFontString
---@param parent integer
---@return integer
function japi.X_CreateSimpleFontString(parent) end

---界面 - 创建 SimpleTexture
---@param parent integer
---@return integer
function japi.X_CreateSimpleTexture(parent) end

---界面 - 设置 SimpleTexture 的透明模式
---@param simpletexture integer
---@param mode integer
---@return boolean
function japi.X_SimpleTextureSetAlphaMode(simpletexture, mode) end

---界面 - 设置 SimpleTexture 贴图坐标
---@param simpletexture integer
---@param top real
---@param left real
---@param bottom real
---@param right real
---@return boolean
function japi.X_SimpleTextureSetTexCoord(simpletexture, top, left, bottom, right) end

---界面 - 设置 SimpleRegion 颜色
---@param simpleregion integer
---@param color integer
---@return boolean
function japi.X_SimpleRegionSetVertexColor(simpleregion, color) end

---界面 - 重新绑定 SimpleRegion
---@param simpleregion integer
---@param simpleframe integer
---@param draw_layer integer
---@param show boolean
---@return boolean
function japi.X_SimpleRegionBindFrame(simpleregion, simpleframe, draw_layer, show) end

---界面 - 设置 SimpleFrame 透明度
---@param simpleframe integer
---@param alpha integer
---@return boolean
function japi.X_SimpleFrameSetAlpha(simpleframe, alpha) end

---界面 - 禁用/启用 SimpleFrame 渲染层
---@param simpleframe integer
---@param draw_layer integer
---@param enable boolean
---@return boolean
function japi.X_SimpleFrameEnableDrawLayer(simpleframe, draw_layer, enable) end

---单位 - 是否显示血条 (全局)
---@return boolean
function japi.X_ShouldShowHPBar() end

---界面 - 获取物品栏按钮
---@param index integer
---@return integer
function japi.X_GetInventoryBarButton(index) end

---界面 - 创建大头像界面
---@param parent integer
---@return integer
function japi.X_CreatePortraitButton(parent) end

---界面 - 设置 Portrait Button 的模型
---@param frame integer
---@param model string
---@param team_color integer
---@param keep_current_camera boolean
---@return boolean
function japi.X_PortraitButtonSetModel(frame, model, team_color, keep_current_camera) end

---界面 - 添加 Layer Style
---@param frame integer
---@param style integer
---@return boolean
function japi.X_LayerAddStyle(frame, style) end

---界面 - 删除 Layer Style
---@param frame integer
---@param style integer
---@return boolean
function japi.X_LayerRemoveStyle(frame, style) end

---界面 - 设置 Layer Style
---@param frame integer
---@param style integer
---@return boolean
function japi.X_LayerSetStyle(frame, style) end

---界面 - 获取 Layer 的 Style
---@param frame integer
---@return integer
function japi.X_LayerGetStyle(frame) end

---界面 - 移动命令按钮
---@param pCommandButton integer
---@param x real
---@param y real
---@param width real
---@param height real
---@param model_width real
---@param model_height real
---@param resize_cooldown boolean
---@param resize_autocast boolean
---@return boolean
function japi.X_MoveCommandButton(pCommandButton, x, y, width, height, model_width, model_height, resize_cooldown, resize_autocast) end

---界面 - 获取 Buff 栏
---@return integer
function japi.X_GetBuffBar() end

---界面 - 获取 Buff 栏按钮
---@param x integer
---@param y integer
---@return integer
function japi.X_GetBuffBarButton(x, y) end

---界面 - 获取 UnitTip
---@return integer
function japi.X_GetUnitTip() end

---界面 - 获取技能栏
---@return integer
function japi.X_GetCommandBar() end

---界面 - 获取 技能栏 按钮
---@param x integer
---@param y integer
---@return integer
function japi.X_GetCommandBarButton(x, y) end

---界面 - 清除全部锚点
---@param ui integer
---@param resize boolean
---@return boolean
function japi.X_FrameClearAllPoints(ui, resize) end

---界面 - 设置绝对位置
---@param ui integer
---@param point integer
---@param x real
---@param y real
---@param resize boolean
---@return boolean
function japi.X_FrameSetAbsPoint(ui, point, x, y, resize) end

---界面 - 设置相对位置
---@param ui integer
---@param point integer
---@param ui_relative integer
---@param point_relative integer
---@param x real
---@param y real
---@param resize boolean
---@return boolean
function japi.X_FrameSetPoint(ui, point, ui_relative, point_relative, x, y, resize) end
---界面 - 设置大小
---@param ui integer
---@param x real
---@param y real
---@param resize boolean
---@return boolean
function japi.X_FrameSetSize(ui, x, y, resize) end

---界面 - 获取区域的坐标点
---@param ui integer
---@param rect_point_type integer
---@return real
function japi.X_FrameGetRectPoint(ui, rect_point_type) end

---界面 - 添加文本阴影
---@param ui integer
---@param x real
---@param y real
---@param color integer
---@return boolean
function japi.X_FrameAddTextShadow(ui, x, y, color) end

---界面 - 复制文本阴影
---@param ui integer
---@param count integer
---@return boolean
function japi.X_FrameDuplicateTextShadow(ui, count) end

---界面 - 是否显示
---@param ui integer
---@return boolean
function japi.X_FrameIsVisible(ui) end

---界面 (特殊) - 获取 UnitTip 的名称 UI
---@param unit_tip integer
---@return integer
function japi.X_UnitTipGetNameFrame(unit_tip) end

---界面 (特殊) - 获取 UnitTip 的描述 UI
---@param unit_tip integer
---@return integer
function japi.X_UnitTipGetDescriptionFrame(unit_tip) end

---界面 (特殊) - 获取 UnitTip 的名称 UI
---@param unit_tip integer
---@return integer
function japi.X_UnitTipGetPlayerNameFrame(unit_tip) end

---界面 (特殊) - 重新调整 UnitTip 大小
---@param unit_tip integer
---@param show_name boolean
---@param show_description boolean
---@param show_player_name boolean
---@return boolean
function japi.X_UnitTipResize(unit_tip, show_name, show_description, show_player_name) end

---界面 (特殊) - 获取 CommandButton 的冷却文本 UI
---@param command_button integer
---@return integer
function japi.X_GetCommandButtonCooldownTextFrame(command_button) end

---界面 (特殊) - 获取 CommandButton 的热键文本 UI
---@param command_button integer
---@return integer
function japi.X_GetCommandButtonHotkeyTextFrame(command_button) end

---界面 (特殊) - 设置 Backdrop 贴图
---@param pBackdropFrame integer
---@param texture_type integer
---@param file string
---@param tile_background boolean
---@param blend boolean
---@return boolean
function japi.X_BackdropFrameSetTexture(pBackdropFrame, texture_type, file, tile_background, blend) end

---界面 (特殊) - 设置 Backdrop 角落贴图标志
---@param pBackdropFrame integer
---@param flag string
---@return boolean
function japi.X_BackdropFrameSetCornerFlag(pBackdropFrame, flag) end

---界面 (特殊) - 获取 计时器窗口 的 UI
---@param whichTimerDialog timerdialog
---@return integer
function japi.X_TimerDialogGetFrame(whichTimerDialog) end

---界面 (特殊) - 获取 多面板 的 UI
---@param whichMultiboard multiboard
---@return integer
function japi.X_MultiboardGetFrame(whichMultiboard) end

-- X_LowLevelJAPI_MODEL

---Model - 获取 sprite 的模型
---@param sprite integer
---@return integer
function japi.X_SpriteGetModel(sprite) end

---Model - 获取 CModelFrame 的模型
---@param modelframe integer
---@param index integer
---@return integer
function japi.X_ModelFrameGetModel(modelframe, index) end

---Model - 播放动画 (序号)
---@param model integer
---@param index integer
---@param flag integer
---@return boolean
function japi.X_SetModelAnimationByIndex(model, index, flag) end

---Model - 缩放 粒子2 大小
---@param model integer
---@param rate real
---@return boolean
function japi.X_ScaleModelParticle2Size(model, rate) end

---Model - 缩放绑定状态下的大小
---@param model integer
---@param scale_x real
---@param scale_y real
---@param scale_z real
---@return boolean
function japi.X_SetAttachedModelScale(model, scale_x, scale_y, scale_z) end

-- X_LowLevelJAPI_SPRITE

---Sprite - 获取CSpriteFrame的Sprite
---@param spriteframe integer
---@param index integer
---@return integer
function japi.X_SpriteFrameGetSprite(spriteframe, index) end

---Sprite - 获取单位的Sprite
---@param whichUnit unit
---@return integer
function japi.X_UnitGetSprite(whichUnit) end

---Sprite - 获取特效的Sprite
---@param whichEffect effect
---@return integer
function japi.X_EffectGetSprite(whichEffect) end

---Sprite - 获取可追踪物的Sprite
---@param whichTrackable trackable
---@return integer
function japi.X_TrackableGetSprite(whichTrackable) end

---Sprite - 获取物品的Sprite
---@param whichItem item
---@return integer
function japi.X_ItemGetSprite(whichItem) end

---Sprite - 获取可破坏物的Sprite
---@param whichDestructable destructable
---@return integer
function japi.X_DestructableGetSprite(whichDestructable) end

---Sprite - 是否有效
---@param sprite integer
---@return boolean
function japi.X_IsSpriteValid(sprite) end

---Sprite - 获取类型
---@param sprite integer
---@return integer
function japi.X_GetSpriteType(sprite) end

---Sprite - 获取Geoset数量
---@param sprite integer
---@return integer
function japi.X_GetSpriteGeosetCount(sprite) end

---Sprite - 设置X坐标
---@param sprite integer
---@param X real
---@return boolean
function japi.X_SetSpriteX(sprite, X) end

---Sprite - 获取X坐标
---@param sprite integer
---@return real
function japi.X_GetSpriteX(sprite) end

---Sprite - 设置Y坐标
---@param sprite integer
---@param Y real
---@return boolean
function japi.X_SetSpriteY(sprite, Y) end

---Sprite - 获取Y坐标
---@param sprite integer
---@return real
function japi.X_GetSpriteY(sprite) end

---Sprite - 设置Z坐标
---@param sprite integer
---@param Z real
---@return boolean
function japi.X_SetSpriteZ(sprite, Z) end

---Sprite - 获取Z坐标
---@param sprite integer
---@return real
function japi.X_GetSpriteZ(sprite) end

---Sprite - 设置大小
---@param sprite integer
---@param size real
---@return boolean
function japi.X_SetSpriteSize(sprite, size) end

---Sprite - 获取大小
---@param sprite integer
---@return real
function japi.X_GetSpriteSize(sprite) end

---Sprite - 绕X轴旋转
---@param sprite integer
---@param rotateX real
---@return boolean
function japi.X_SpriteMatrixRotateX(sprite, rotateX) end

---Sprite - 绕Y轴旋转
---@param sprite integer
---@param rotateY real
---@return boolean
function japi.X_SpriteMatrixRotateY(sprite, rotateY) end

---Sprite - 绕Z轴旋转
---@param sprite integer
---@param rotateZ real
---@return boolean
function japi.X_SpriteMatrixRotateZ(sprite, rotateZ) end

---Sprite - 缩放
---@param sprite integer
---@param scaleX real
---@param scaleY real
---@param scaleZ real
---@return boolean
function japi.X_SpriteMatrixScale(sprite, scaleX, scaleY, scaleZ) end

---Sprite - 重置
---@param sprite integer
---@return boolean
function japi.X_SpriteMatrixReset(sprite) end

---Sprite - 设置动画速度
---@param sprite integer
---@param size real
---@return boolean
function japi.X_SetSpriteTimeScale(sprite, size) end

---Sprite - 获取动画速度
---@param sprite integer
---@return real
function japi.X_GetSpriteTimeScale(sprite) end

---Sprite - 设置颜色
---@param sprite integer
---@param color integer
---@return boolean
function japi.X_SetSpriteColor(sprite, color) end

---Sprite - 设置透明度
---@param sprite integer
---@param alpha integer
---@return boolean
function japi.X_SetSpriteAlpha(sprite, alpha) end

---Sprite - 获取颜色
---@param sprite integer
---@return integer
function japi.X_GetSpriteColor(sprite) end

---Sprite - 获取透明度
---@param sprite integer
---@return integer
function japi.X_GetSpriteAlpha(sprite) end

---Sprite - 设置Geoset颜色
---@param sprite integer
---@param index integer
---@param color integer
---@return boolean
function japi.X_SetSpriteGeosetColor(sprite, index, color) end

---Sprite - 设置Geoset透明度
---@param sprite integer
---@param index integer
---@param alpha integer
---@return boolean
function japi.X_SetSpriteGeosetAlpha(sprite, index, alpha) end

---Sprite - 获取Geoset颜色
---@param sprite integer
---@param index integer
---@return integer
function japi.X_GetSpriteGeosetColor(sprite, index) end

---Sprite - 获取Geoset透明度
---@param sprite integer
---@param index integer
---@return integer
function japi.X_GetSpriteGeosetAlpha(sprite, index) end

---Sprite - 设置可替换贴图
---@param sprite integer
---@param path string
---@param index integer
---@return boolean
function japi.X_SetSpriteReplaceableTexture(sprite, path, index) end

---Sprite - 播放动画
---@param sprite integer
---@param animation string
---@return boolean
function japi.X_SetSpriteAnimation(sprite, animation) end

---Sprite - 播放动画
---@param sprite integer
---@param animation string
---@param flag integer
---@return boolean
function japi.X_SetSpriteAnimationEx(sprite, animation, flag) end

---Sprite - 播放动画(序号)
---@param sprite integer
---@param index integer
---@return boolean
function japi.X_SetSpriteAnimationByIndex(sprite, index) end

---Sprite - 播放动画 (序号)
---@param sprite integer
---@param index integer
---@param flag integer
---@return boolean
function japi.X_SetSpriteAnimationByIndexEx(sprite, index, flag) end

---Sprite - 缩放 粒子2 大小
---@param sprite integer
---@param scale real
---@return boolean
function japi.X_ScaleSpriteParticle2Size(sprite, scale) end

-- X_TRIGGEREVENT_LIB

---玩家单位事件 (指定条件)
---@param whichTrigger trigger
---@param whichPlayer player
---@param eventID integer
---@param filter boolexpr
---@return event
function japi.X_TriggerRegisterPlayerUnitEvent(whichTrigger, whichPlayer, eventID, filter) end

---玩家单位事件
---@param whichTrigger trigger
---@param whichPlayer player
---@param eventID integer
---@return event
function japi.X_TriggerRegisterPlayerUnitEventSimple(whichTrigger, whichPlayer, eventID) end

---触发单位
---@return unit
function japi.X_GetTriggerUnit() end

---触发玩家
---@return player
function japi.X_GetTriggerPlayer() end

-- X_TRIGGEREVENT_UNIT_ABILITY

---X_TriggerRegisterPlayerUnitAddAbilityEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitAddAbilityEvent(whichTrigger, whichPlayer) end

---X_TriggerRegisterPlayerUnitRemoveAbilityEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitRemoveAbilityEvent(whichTrigger, whichPlayer) end

---添加/删除技能事件 - 获取技能
---@return ability
function japi.X_GetModifyAbilityEventAbility() end

---添加/删除技能事件 - 获取技能ID
---@return integer
function japi.X_GetModifyAbilityEventAbilityID() end

---X_TriggerRegisterPlayerUnitAbilityBaseBuildSetDurationEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitAbilityBaseBuildSetDurationEvent(whichTrigger, whichPlayer) end

---研究/建造/升级/训练/复活 初始化时长事件 - 获取时长
---@return real
function japi.X_GetAbilityBaseBuildSetDurationEventDuration() end

---研究/建造/升级/训练/复活 初始化时长事件 - 设置时长
---@param duration real
---@return boolean
function japi.X_SetAbilityBaseBuildSetDurationEventDuration(duration) end

---研究/建造/升级/训练/复活 初始化时长事件 - 获取事件具体类型
---@return integer
function japi.X_GetAbilityBaseBuildSetDurationEventTargetEventType() end

---建造/升级/训练/复活 初始化时长事件 - 获取事件目标类型
---@return integer
function japi.X_GetAbilityBaseBuildSetDurationEventTargetID() end

---X_TriggerRegisterPlayerUnitStartAbilityCooldownEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitStartAbilityCooldownEvent(whichTrigger, whichPlayer) end

---X_TriggerRegisterPlayerUnitEndAbilityCooldownEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitEndAbilityCooldownEvent(whichTrigger, whichPlayer) end

---技能冷却事件 - 获取事件技能
---@return ability
function japi.X_GetAbilityCooldownEventAbility() end

---技能冷却事件 - 获取事件技能ID
---@return integer
function japi.X_GetAbilityCooldownEventAbilityID() end

-- X_TRIGGEREVENT_UNIT_ATTACK

---X_TriggerRegisterPlayerUnitAttackMissEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitAttackMissEvent(whichTrigger, whichPlayer) end

---攻击丢失事件 - 隐藏文本
---@param hide boolean
---@return boolean
function japi.X_SetAttackMissEventTextHidden(hide) end

---攻击丢失事件 - 文本可见性
---@return boolean
function japi.X_IsAttackMissEventTextHidden() end

---攻击丢失事件 - 目标
---@return widget
function japi.X_GetAttackMissEventTarget() end

---攻击丢失事件 - 目标 (单位)
---@return unit
function japi.X_GetAttackMissEventTargetUnit() end

---攻击丢失事件 - 目标 (物品)
---@return item
function japi.X_GetAttackMissEventTargetItem() end

---攻击丢失事件 - 目标 (可破坏物)
---@return destructable
function japi.X_GetAttackMissEventTargetDestructable() end

---X_TriggerRegisterPlayerUnitAttackLaunchEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitAttackLaunchEvent(whichTrigger, whichPlayer) end

---发动攻击事件 - 攻击索引
---@return integer
function japi.X_GetAttackLaunchEventWeaponIndex() end

---发动攻击事件 - 目标
---@return widget
function japi.X_GetAttackLaunchEventTarget() end

---发动攻击事件 - 目标 (单位)
---@return unit
function japi.X_GetAttackLaunchEventTargetUnit() end

---发动攻击事件 - 目标 (物品)
---@return item
function japi.X_GetAttackLaunchEventTargetItem() end

---发动攻击事件 - 目标(可破坏物)
---@return destructable
function japi.X_GetAttackLaunchEventTargetDestructable() end

---发动攻击事件 - 来源 X
---@return real
function japi.X_GetAttackLaunchEventSourceX() end

---发动攻击事件 - 来源 Y
---@return real
function japi.X_GetAttackLaunchEventSourceY() end

---发动攻击事件 - 目标 X
---@return real
function japi.X_GetAttackLaunchEventTargetX() end

---发动攻击事件 - 目标 Y
---@return real
function japi.X_GetAttackLaunchEventTargetY() end

---发动攻击事件 - 目标是否为点
---@return boolean
function japi.X_IsAttackLaunchEventPointTarget() end

---发动攻击事件 - 是否暴露攻击单位
---@return boolean
function japi.X_IsAttackLaunchEventExposeSource() end

---X_IsAttackLaunchEventCancelled
---@return boolean
function japi.X_IsAttackLaunchEventCancelled() end

---发动攻击事件 - 设置暴露视野
---@param expose boolean
---@return boolean
function japi.X_SetAttackLaunchEventExposeSource(expose) end

---发动攻击事件 - 取消当前攻击
---@param flag boolean
---@return boolean
function japi.X_SetAttackLaunchEventCancelled(flag) end

-- X_TRIGGEREVENT_UNIT_BUFF

---X_TriggerRegisterPlayerUnitRefreshBuffEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitRefreshBuffEvent(whichTrigger, whichPlayer) end

---魔法效果刷新事件 - 获取魔法效果ID
---@return integer
function japi.X_GetRefreshBuffEventBuffID() end

---魔法效果刷新事件 - 获取魔法效果
---@return buff
function japi.X_GetRefreshBuffEventBuff() end

-- X_TRIGGEREVENT_UNIT_CHANGEID

---X_TriggerRegisterPlayerUnitChangeIDEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitChangeIDEvent(whichTrigger, whichPlayer) end

-- X_TRIGGEREVENT_UNIT_DAMAGE

---X_TriggerRegisterPlayerUnitDamagingEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitDamagingEvent(whichTrigger, whichPlayer) end

---伤害事件 - 设置武器类型
---@param whichAttackType weapontype
---@return boolean
function japi.X_SetDamageEventWeaponType(whichAttackType) end

---X_TriggerRegisterPlayerUnitDamagedEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitDamagedEvent(whichTrigger, whichPlayer) end

---伤害事件 - 获取 事件数据
---@param damege_data_type integer
---@return integer
function japi.X_EXGetEventDamageData(damege_data_type) end

---伤害事件 - 设置伤害值
---@param amount real
---@return boolean
function japi.X_SetDamageEventDamageValue(amount) end

---伤害事件 - 设置攻击类型
---@param whichAttackType attacktype
---@return boolean
function japi.X_SetDamageEventAttackType(whichAttackType) end

---伤害事件 - 设置伤害类型
---@param whichAttackType damagetype
---@return boolean
function japi.X_SetDamageEventDamageType(whichAttackType) end

---伤害事件 - 获取 flag
---@return integer
function japi.X_GetDamageEventFlag() end

---伤害事件 - 获取 附加数据
---@return integer
function japi.X_GetDamageEventExtraData() end

-- X_TRIGGEREVENT_INVENTORY

---X_TriggerRegisterPlayerUnitUpdateInventoryEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitUpdateInventoryEvent(whichTrigger, whichPlayer) end

---X_TriggerRegisterPlayerUnitSwapItemSlotEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitSwapItemSlotEvent(whichTrigger, whichPlayer) end

---移动物品栏物品事件 - 获取来源格子ID
---@return integer
function japi.X_GetSwapItemSlotEventFromSlotID() end

---移动物品栏物品事件 - 获取目标格子ID
---@return integer
function japi.X_GetSwapItemSlotEventToSlotID() end

-- X_TRIGGEREVENT_UNIT_REINCARNATION

---X_TriggerRegisterPlayerUnitStartReincarnationEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitStartReincarnationEvent(whichTrigger, whichPlayer) end

---X_TriggerRegisterPlayerUnitEndReincarnationEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitEndReincarnationEvent(whichTrigger, whichPlayer) end

-- X_TRIGGEREVENT_UNIT_REMOVING

---X_TriggerRegisterPlayerUnitRemovingEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitRemovingEvent(whichTrigger, whichPlayer) end

-- X_TRIGGEREVENT_UNIT_UNLOAD

---X_TriggerRegisterPlayerUnitUnloadEvent
---@param whichTrigger trigger
---@param whichPlayer player
---@return event
function japi.X_TriggerRegisterPlayerUnitUnloadEvent(whichTrigger, whichPlayer) end

return japi
