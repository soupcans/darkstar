-----------------------------------------
-- ID: 4342
-- Item: steamed_crab
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Vitality 3
-- Defense % 27 (cap 65)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4342);
end;

function onEffectGain(target, effect)
    target:addMod(dsp.mod.VIT, 3);
    target:addMod(dsp.mod.FOOD_DEFP, 27);
    target:addMod(dsp.mod.FOOD_DEF_CAP, 65);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.VIT, 3);
    target:delMod(dsp.mod.FOOD_DEFP, 27);
    target:delMod(dsp.mod.FOOD_DEF_CAP, 65);
end;
