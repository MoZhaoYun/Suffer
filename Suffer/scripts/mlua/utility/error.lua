local log = mJass.log
local debug_traceback = debug.traceback

-- 重写mJass.runtime.error_handle函数
mStandard.runtime = { error_handle = mJass.runtime.error_handle }
mJass.runtime.error_handle = function(message)
    log.error(('%s\n%s'):format(message, debug_traceback()))
end

log.info('错误处理模块加载完毕')
