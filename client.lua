-- client.lua — кидаешь на GitHub
-- Подтягивается автоматически загрузчиком

print("[VISUAL] Загружаю визуал...")

-- ====== Цвет карты ======
hook.Add("RenderScreenspaceEffects", "visual_colormod", function()
    DrawColorModify({
        ["$pp_colour_addr"] = 0,
        ["$pp_colour_addg"] = 0,
        ["$pp_colour_addb"] = 0,
        ["$pp_colour_brightness"] = 0.05,
        ["$pp_colour_contrast"] = 1.1,
        ["$pp_colour_colour"] = 0.85, -- чуть desaturate
        ["$pp_colour_mulr"] = 0,
        ["$pp_colour_mulg"] = 0,
        ["$pp_colour_mulb"] = 0
    })
end)

-- ====== Партиклы при попадании в игрока ======
hook.Add("EntityTakeDamage", "visual_particles", function(ent, dmginfo)
    if not ent:IsPlayer() then return end
    
    local pos = ent:GetPos() + Vector(0, 0, 50)
    local effectData = EffectData()
    effectData:SetOrigin(pos)
    effectData:SetMagnitude(1)
    effectData:SetScale(1)
    effectData:SetRadius(10)
    util.Effect("BloodImpact", effectData)
end)

-- ====== Положение рук ======
hook.Add("CalcViewModelView", "visual_hands", function(wep, vm, oldEye, oldAng, pos, ang)
    -- смещаем viewmodel чуть вниз и вперёд
    local offset = Vector(2, 0, -2)
    offset = LocalToWorld(offset, Angle(0,0,0), pos, ang)
    return offset, ang
end)

print("[VISUAL] Всё загружено!")
