-----------------------------------
-- Area: Qulun Dome
--  NPC: Door
-- Involved in Mission: Limit Break 3
-- !pos 299.999 37.864 47.067 148
-----------------------------------
package.loaded["scripts/zones/Qulun_Dome/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Qulun_Dome/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (npc:getAnimation() == 9) then
        if (player:getZPos() < 46) then
            if (player:hasKeyItem(dsp.ki.SILVER_BELL) and player:hasKeyItem(dsp.ki.CORUSCANT_ROSARY) and player:hasKeyItem(dsp.ki.BLACK_MATINEE_NECKLACE)) then
                player:messageSpecial(THE_3_ITEMS_GLOW_FAINTLY,dsp.ki.SILVER_BELL,dsp.ki.CORUSCANT_ROSARY,dsp.ki.BLACK_MATINEE_NECKLACE);
                npc:openDoor(20); -- retail timed
            else
                player:messageSpecial(IT_SEEMS_TO_BE_LOCKED_BY_POWERFUL_MAGIC);
            end
        else
            player:messageSpecial(CANNOT_BE_OPENED_FROM_THIS_SIDE);
        end
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;