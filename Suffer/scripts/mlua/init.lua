-- Jass
MJass = {
    common  = require 'jass.common',
    console = require 'jass.console',
    log     = require 'jass.log',
    runtime = require 'jass.runtime',
}

-- 地图
MMap = {
    Release = false, -- 地图是否为发布版本
    name    = '苦难', -- 地图名称
    -- 地图作者
    author  = {
        name = '莫招烟云', -- 地图作者名称
    },
    -- 地图版本
    version = {
        major = 1,      -- 地图的主要版本号
        minor = 0,      -- 地图的次要版本号
        patch = 0,      -- 地图的修订版本号
        link_char = '-' -- 地图的版本连接符号
    }
}

-- 游戏
MGame = {
    face_default = 270  -- 默认面向角度
}

-- 标准
MStandard = {}

if not MMap.Release then
    -- 未发布版本，默认打开控制台
    MJass.runtime.console = true
end

-- 处理handle的安全等级
MJass.runtime.handle_level = 0

-- 禁止Sleep操作的函数
MJass.runtime.sleep = false

-- 捕获崩溃
MJass.runtime.catch_crash = true

-- 监听指定端口
-- MJass.runtime.debugger = 9527

-- 包路径
package.path = package.path .. ';' .. [[scripts\?.lua]]

-- 重写print函数
MStandard.print = print
local console = MJass.console
print = function(...)
    console.write((('[%.3f]'):format(os.clock())), ...)
end

require 'mlua.utility.log'      -- 加载日志模块
require 'mlua.library.init'     -- 加载库模块
require 'mlua.war3.init'        -- 加载War3模块
require 'mlua.utility.error'    -- 加载错误处理模块
require 'mlua.utility.reactive' -- 加载响应式模块

MJass.log.info 'Mlua 框架加载完毕'
