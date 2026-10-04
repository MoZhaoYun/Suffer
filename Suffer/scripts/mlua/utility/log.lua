-- 地图版本
local version = table.concat({
    MMap.version.major,
    MMap.version.minor,
    MMap.version.patch
}, MMap.version.link_char)

-- 日志文件名称
local file_name = os.date("%Y-%m-%d-%H-%M-%S") .. '.log'

-- 日志文件路径
MJass.log.path = table.concat({
    'log',
    MMap.author.name,
    MMap.name,
    version,
    file_name
}, '\\')

-- 日志等级
local log_levels = { 'trace', 'debug', 'info', 'warn', 'error', 'fatal' }

if not MMap.Release then
    -- 未发布版本，默认日志输出也输出到控制台
    local standard = MStandard
    standard.log = MJass.log
    for _, log_level in ipairs(log_levels) do
        local std_log_func = MJass.log[log_level]
        MJass.log[log_level] = function(...)
            print(('[%s]'):format(log_level:lower()), ...)
            std_log_func(...)
        end
    end
end

MJass.log.info '日志模块加载完毕'
