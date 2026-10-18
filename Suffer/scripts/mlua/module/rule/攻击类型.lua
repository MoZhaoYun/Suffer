local common = mJass.common

-- 攻击类型
local attack_type = {}

-- 武器类型
local weapon_types = {
    ['金属轻砍'] = common.WEAPON_TYPE_METAL_LIGHT_CHOP,
    ['金属中砍'] = common.WEAPON_TYPE_METAL_MEDIUM_CHOP,
    ['金属重砍'] = common.WEAPON_TYPE_METAL_HEAVY_CHOP,
    ['金属轻切'] = common.WEAPON_TYPE_METAL_LIGHT_SLICE,
    ['金属中切'] = common.WEAPON_TYPE_METAL_MEDIUM_SLICE,
    ['金属重切'] = common.WEAPON_TYPE_METAL_HEAVY_SLICE,
    ['金属中击'] = common.WEAPON_TYPE_METAL_MEDIUM_BASH,
    ['金属重击'] = common.WEAPON_TYPE_METAL_HEAVY_BASH,
    ['金属中刺'] = common.WEAPON_TYPE_METAL_MEDIUM_STAB,
    ['金属重刺'] = common.WEAPON_TYPE_METAL_HEAVY_STAB,
    ['木头轻切'] = common.WEAPON_TYPE_WOOD_LIGHT_SLICE,
    ['木头中切'] = common.WEAPON_TYPE_WOOD_MEDIUM_SLICE,
    ['木头重切'] = common.WEAPON_TYPE_WOOD_HEAVY_SLICE,
    ['木头轻击'] = common.WEAPON_TYPE_WOOD_LIGHT_BASH,
    ['木头中击'] = common.WEAPON_TYPE_WOOD_MEDIUM_BASH,
    ['木头重击'] = common.WEAPON_TYPE_WOOD_HEAVY_BASH,
    ['木头轻刺'] = common.WEAPON_TYPE_WOOD_LIGHT_STAB,
    ['木头中刺'] = common.WEAPON_TYPE_WOOD_MEDIUM_STAB,
    ['利爪轻切'] = common.WEAPON_TYPE_CLAW_LIGHT_SLICE,
    ['利爪中切'] = common.WEAPON_TYPE_CLAW_MEDIUM_SLICE,
    ['利爪重切'] = common.WEAPON_TYPE_CLAW_HEAVY_SLICE,
    ['斧头中砍'] = common.WEAPON_TYPE_AXE_MEDIUM_CHOP,
    ['岩石重击'] = common.WEAPON_TYPE_ROCK_HEAVY_BASH,
}

-- 攻击类型声音
attack_type.sound = weapon_types

---丢失
---@param data table 数据
local function lose(data)
    print('lose')
end

---闪避
---@param data table 数据
local function miss(data)
    print('miss')
end

---近战
---@param attacker munit 攻击者
---@param attack_target munit 攻击目标
attack_type['近战'] = function(attacker, attack_target)
    -- 数据
    local data = {
        attacker = attacker,
        attack_target = attack_target,
        attack = attacker['攻击'],
        defense = attack_target['防御'],
    }

    if attacker:event_dispatch('单位-攻击', data) then
        lose(data) -- 丢失
        return
    end

    if attack_target:event_dispatch('单位-被攻击', data) then
        miss(data) -- 闪避
        return
    end

    local defense_ratio = 1 - 100 / (100 + data.defense) -- 防御比例
    local damage = data.attack * (1 - defense_ratio)     -- 伤害

    print('--------------------------------')
    print('攻击：', data.attack)
    print('防御：', data.defense)
    print('防御比例：', defense_ratio)
    print('伤害：', damage)
    print('--------------------------------')

    -- 声音
    attacker:attack_sound(attack_target)
end

return attack_type
