-- Jass
mJass = {
    common  = require 'jass.common',
    console = require 'jass.console',
    japi    = require 'jass.japi',
    log     = require 'jass.log',
    runtime = require 'jass.runtime',
}

-- 地图
mMap = {
    release = false, -- 地图是否为发布版本
    name = '苦难', -- 地图名称
    -- 地图作者
    author = {
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
mGame = {
    face_default = 270 -- 默认面向角度
}

-- 标准
mStandard = {}

-- 未发布版本
if not mMap.release then
    -- 打开控制台
    mJass.runtime.console = true
end

-- 处理handle的安全等级
mJass.runtime.handle_level = 0

-- 禁止Sleep操作的函数
mJass.runtime.sleep = false

-- 捕获崩溃
mJass.runtime.catch_crash = true

-- 监听指定端口
-- mJass.runtime.debugger = 9527

-- 包路径
package.path = package.path .. [[;scripts\?.lua;]]

-- 重写print函数
mStandard.print = print
local console_write = mJass.console.write
local os_clock = os.clock
print = function(...)
    console_write(('[%.3f]'):format(os_clock()), ...)
end

require 'mlua.utility.log'   -- 加载日志模块
require 'mlua.utility.error' -- 加载错误处理模块

require 'mlua.library.init'  -- 加载基库模块
require 'mlua.war3.init'     -- 加载War3模块

require 'mlua.module.init'   -- 加载模块

mJass.log.info 'mlua脚本加载完毕'
