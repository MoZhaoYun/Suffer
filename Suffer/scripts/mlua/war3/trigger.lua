local common = mJass.common
local japi = mJass.japi

-- War3玩家单位事件
mWar3.PlayerUnitEventEx = {
    Damaged = 0x134,                      -- 接受伤害
    Damaging = 0x13B,                     -- 接受伤害（计算护甲前）
    AttackMiss = 0x1000,                  -- 攻击丢失
    AttackLaunch = 0x1001,                -- 发动攻击
    UpdateInventory = 0x1002,             -- 更新物品栏
    AddAbility = 0x1003,                  -- 添加技能
    RemoveAbility = 0x1004,               -- 删除技能
    Removing = 0x1005,                    -- 即将被删除
    AbilityBaseBuildSetDuration = 0x1006, -- 研究/建造/升级/训练/复活 初始化时长
    ChangeID = 0x1007,                    -- 更改ID
    SwapItemSlot = 0x1008,                -- 移动物品栏里的物品
    StartAbilityCooldown = 0x1009,        -- 开始技能CD
    EndAbilityCooldown = 0x100A,          -- 结束技能CD
    Unload = 0x100B,                      -- 被运输机卸载
    StartReincarnation = 0x100C,          -- 开始重生
    EndReincarnation = 0x100D,            -- 结束重生
    RefreshBuff = 0x100E,                 -- 刷新魔法效果
}

---创建触发器
---@return trigger War3触发器
function mWar3.CreateTrigger()
    return common.CreateTrigger()
end

---触发器注册玩家单位事件
---@param trg trigger War3触发器
---@param player player War3玩家
---@param event_id integer War3玩家单位事件ID
---@return event War3事件
function mWar3.TriggerRegisterPlayerUnitEventEx(trg, player, event_id)
    return japi.X_TriggerRegisterPlayerUnitEvent(trg, player, event_id, nil)
end

---触发器注册玩家单位事件
---@param trg trigger War3触发器
---@param player player War3玩家
---@param player_unit_event playerunitevent War3玩家单位事件
---@return event War3事件
function mWar3.TriggerRegisterPlayerUnitEvent(trg, player, player_unit_event)
    return common.TriggerRegisterPlayerUnitEvent(trg, player, player_unit_event, nil)
end

---触发器注册任意单位进入不规则矩形区域事件
---@param trg trigger War3触发器
---@param region region War3不规则矩形区域
---@return event War3事件
function mWar3.TriggerRegisterAnyUnitEnterRegion(trg, region)
    return common.TriggerRegisterEnterRegion(trg, region, nil)
end

---触发器添加动作
---@param trg trigger War3触发器
---@param callback fun() 回调函数
---@return triggeraction War3触发器动作
function mWar3.TriggerAddAction(trg, callback)
    return common.TriggerAddAction(trg, callback)
end
