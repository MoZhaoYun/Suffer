local common = mJass.common

---对目标造成伤害
---@param damager unit War3单位
---@param damage_target widget War3物体
---@param damage number 伤害值
---@param is_attack boolean 是否普通攻击
---@param is_range boolean 是否远程攻击
---@param attack_type? attacktype 攻击类型，默认为法术
---@param damage_type? damagetype 伤害类型，默认为普通
---@param weapon_type? weapontype 武器类型，默认为无
---@return boolean 是否成功造成伤害
function mWar3.DamageTarget(damager, damage_target, damage, is_attack, is_range, attack_type, damage_type, weapon_type)
    if not attack_type then attack_type = common.ATTACK_TYPE_NORMAL end
    if not damage_type then damage_type = common.DAMAGE_TYPE_NORMAL end
    if not weapon_type then weapon_type = common.WEAPON_TYPE_WHOKNOWS end
    return common.UnitDamageTarget(damager, damage_target, damage, is_attack, is_range, attack_type, damage_type,
        weapon_type)
end
