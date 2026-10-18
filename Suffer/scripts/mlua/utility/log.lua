-- 地图版本
local version = table.concat({
    mMap.version.major,
    mMap.version.minor,
    mMap.version.patch
}, mMap.version.link_char)

-- 日志文件名称
local file_name = ('%s.log'):format(os.date("%Y-%m-%d-%H-%M-%S"))

-- 日志文件路径
mJass.log.path = table.concat({
    'log',
    mMap.author.name,
    mMap.name,
    version,
    file_name
}, '\\')

-- 日志等级
local log_levels = { 'trace', 'debug', 'info', 'warn', 'error', 'fatal' }

-- 未发布版本
if not mMap.release then
    -- 日志输出也输出到控制台
    mStandard.log = mJass.log
    for _, level in ipairs(log_levels) do
        local std_log = mJass.log[level]
        mJass.log[level] = function(...)
            print(('[%s]'):format(level:lower()), ...)
            std_log(...)
        end
    end
end

mJass.log.info '日志模块加载完毕'
