local japi = mJass.japi

---设置伤害事件的伤害值
---@param damage number 伤害值
---@return boolean 是否成功设置
function mWar3.SetDamageEventDamage(damage)
    return japi.X_SetDamageEventDamageValue(damage)
end

---设置攻击事件是否取消
---@param cancel boolean 是否取消
---@return boolean 是否成功设置
function mWar3.SetAttackLaunchEventCancel(cancel)
    return japi.X_SetAttackLaunchEventCancelled(cancel)
end
