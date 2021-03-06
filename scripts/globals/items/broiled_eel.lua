-----------------------------------------
-- ID: 4588
-- Item: Broiled Eel
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -3
-- Evasion 5
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,4588);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEX, 4);
    target:addMod(dsp.mod.MND, -3);
    target:addMod(dsp.mod.EVA, 5);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.DEX, 4);
    target:delMod(dsp.mod.MND, -3);
    target:delMod(dsp.mod.EVA, 5);
end;
