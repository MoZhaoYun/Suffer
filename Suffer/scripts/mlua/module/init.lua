-- 模块
mModule = {}
-- 游戏
mModule.game = {}

require 'mlua.module.timer'   -- 计时器模块
require 'mlua.module.trigger' -- 触发器模块
require 'mlua.module.event'   -- 事件模块
require 'mlua.module.frame'   -- 界面模块
require 'mlua.module.unit'    -- 单位模块

mJass.log.info '模块加载完毕'
