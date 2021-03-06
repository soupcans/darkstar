-----------------------------------------
-- ID: 18995
-- Item: Murgleis
-----------------------------------------
require("scripts/globals/msg");
require("scripts/globals/status");
require("scripts/globals/weaponskills");
require("scripts/globals/weaponskillids");
-----------------------------------

local NAME_WEAPONSKILL = "AFTERMATH_MURGLEIS";
local NAME_EFFECT_LOSE = "AFTERMATH_LOST_MURGLEIS";

-- https://www.bg-wiki.com/bg/Mythic_Aftermath
local aftermathTable = {};

-- Murgleis (75)
aftermathTable[18995] =
{
    {   -- Tier 1
        duration = 180,
        mods =
        {
            { id = dsp.mod.MACC, power = function(tp) return math.floor(tp / 100); end }
        }
    },
    {   -- Tier 2
        duration = 180,
        mods =
        {
            { id = dsp.mod.MATT, power = function(tp) return math.floor(tp / 100); end }
        }
    },
    {   -- Tier 3
        duration = 120,
        mods =
        {
            { id = dsp.mod.MYTHIC_OCC_ATT_TWICE, power = function(tp) return 40; end }
        }
    }
};

-- Murgleis (80)
aftermathTable[19064] =
{
    {   -- Tier 1
        duration = 270,
        mods =
        {
            { id = dsp.mod.MACC, power = function(tp) return math.floor(3 * tp / 200); end }
        }
    },
    {   -- Tier 2
        duration = 270,
        mods =
        {
            { id = dsp.mod.MATT, power = function(tp) return math.floor(tp / 50 - 20); end }
        }
    },
    {   -- Tier 3
        duration = 180,
        mods =
        {
            { id = dsp.mod.MYTHIC_OCC_ATT_TWICE, power = function(tp) return 60; end }
        }
    }
};
aftermathTable[19084] = aftermathTable[19064]; -- Murgleis (85)
aftermathTable[19616] = aftermathTable[19064]; -- Murgleis (90)

-- Murgleis (95)
aftermathTable[19714] =
{
    {   -- Tier 1
        duration = 270,
        mods =
        {
            { id = dsp.mod.MACC, power = function(tp) return math.floor(tp / 50 + 10); end }
        }
    },
    {   -- Tier 2
        duration = 120,
        mods =
        {
            { id = dsp.mod.MATT, power = function(tp) return math.floor(tp / 50 - 10); end }
        }
    },
    {   -- Tier 3
        duration = 180,
        mods =
        {
            { id = dsp.mod.MYTHIC_OCC_ATT_TWICE, power = function(tp) return 40; end },
            { id = dsp.mod.MYTHIC_OCC_ATT_THRICE, power = function(tp) return 20; end }
        }
    }
};
aftermathTable[19823] = aftermathTable[19714]; -- Murgleis (99)
aftermathTable[19952] = aftermathTable[19714]; -- Murgleis (99/II)
aftermathTable[20647] = aftermathTable[19714]; -- Murgleis (119)
aftermathTable[20648] = aftermathTable[19714]; -- Murgleis (119/II)
aftermathTable[20686] = aftermathTable[19714]; -- Murgleis (119/III)

function onWeaponskill(user, target, wsid, tp, action)
    if (wsid == dsp.ws.DEATH_BLOSSOM) then -- Death Blossom onry
        if (shouldApplyAftermath(user, tp)) then
            local itemId = user:getEquipID(dsp.slot.MAIN);
            if (aftermathTable[itemId]) then
                -- Apply the effect and add mods
                addMythicAftermathEffect(user, tp, aftermathTable[itemId]);
                -- Add a listener for when aftermath wears (to remove mods)
                user:addListener("EFFECT_LOSE", NAME_EFFECT_LOSE, aftermathLost);
            end
        end
    end
end

function aftermathLost(target, effect)
    if (effect:getType() == dsp.effect.AFTERMATH) then
        local itemId = target:getEquipID(dsp.slot.MAIN);
        if (aftermathTable[itemId]) then
            -- Remove mods
            removeMythicAftermathEffect(target, effect, aftermathTable[itemId]);
            -- Remove the effect listener
            target:removeListener(NAME_EFFECT_LOSE);
        end
    end
end

function onItemCheck(player, param, caster)
    if (param == ITEMCHECK_EQUIP) then
        player:addListener("WEAPONSKILL_USE", NAME_WEAPONSKILL, onWeaponskill);
    elseif (param == ITEMCHECK_UNEQUIP) then
        -- Make sure we clean up the effect and mods
        if (player:hasStatusEffect(dsp.effect.AFTERMATH)) then
            aftermathLost(player, player:getStatusEffect(dsp.effect.AFTERMATH));
        end
        player:removeListener(NAME_WEAPONSKILL);
    end
    
    return 0;
end