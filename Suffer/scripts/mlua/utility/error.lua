local war3 = MWar3
local log = MJass.log
local tostring = tostring
local debug_traceback = debug.traceback

if not MStandard.runtime then
    MStandard.runtime = {}
end
MStandard.runtime.error_handle = MJass.runtime.error_handle
local error_times = {}  -- 记录错误信息的时间戳，避免重复触发
MJass.runtime.error_handle = function (message)
    local time = os.time()

    if not error_times[message] or time - error_times[message] >= 10 then
        error_times[message] = time
        war3.DisplayTextToPlayerEx(war3.GetLocalPlayer(), 0, 0, tostring(message), 60)
    end

    local out_message = ('%s\n%s'):format(message, debug_traceback())

    print(out_message)
    log.error(out_message)
end

log.info('错误处理模块加载完毕')
