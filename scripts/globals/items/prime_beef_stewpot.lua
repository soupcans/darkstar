-----------------------------------------
-- ID: 5548
-- Item: Prime Beef Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- TODO: Group Effect
-- HP +10% Cap 75
-- MP +15
-- Strength +2
-- Agility +1
-- Mind +1
-- HP Recovered while healing +7
-- MP Recovered while healing +2
-- Attack 18% Cap 60
-- Evasion +6
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5548);
end;

function onEffectGain(target, effect)
    target:addMod(dsp.mod.FOOD_HPP, 10);
    target:addMod(dsp.mod.FOOD_HP_CAP, 75);
    target:addMod(dsp.mod.MP, 15);
    target:addMod(dsp.mod.STR, 2);
    target:addMod(dsp.mod.AGI, 1);
    target:addMod(dsp.mod.MND, 1);
    target:addMod(dsp.mod.HPHEAL, 7);
    target:addMod(dsp.mod.MPHEAL, 2);
    target:addMod(dsp.mod.FOOD_ATTP, 18);
    target:addMod(dsp.mod.FOOD_ATT_CAP, 60);
    target:addMod(dsp.mod.EVA, 6);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_HPP, 10);
    target:delMod(dsp.mod.FOOD_HP_CAP, 75);
    target:delMod(dsp.mod.MP, 15);
    target:delMod(dsp.mod.STR, 2);
    target:delMod(dsp.mod.AGI, 1);
    target:delMod(dsp.mod.MND, 1);
    target:delMod(dsp.mod.HPHEAL, 7);
    target:delMod(dsp.mod.MPHEAL, 2);
    target:delMod(dsp.mod.FOOD_ATTP, 18);
    target:delMod(dsp.mod.FOOD_ATT_CAP, 60);
    target:delMod(dsp.mod.EVA, 6);
end;
