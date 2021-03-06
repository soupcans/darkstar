-----------------------------------
-- Area: Qulun Dome
--  NPC: Door
-- Involved in Mission: Magicite
-- !pos 60 24 -2 148
-----------------------------------
package.loaded["scripts/zones/Qulun_Dome/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Qulun_Dome/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.SILVER_BELL) and player:hasKeyItem(dsp.ki.CORUSCANT_ROSARY) and player:hasKeyItem(dsp.ki.BLACK_MATINEE_NECKLACE)) then
        if (player:getZPos() < -7.2) then
            player:startEvent(51);
        else
            player:startEvent(50);
        end
    else
        player:messageSpecial(IT_SEEMS_TO_BE_LOCKED_BY_POWERFUL_MAGIC);
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

    if ((csid == 50 or csid == 51) and option == 1) then
        player:messageSpecial(THE_3_ITEMS_GLOW_FAINTLY,dsp.ki.SILVER_BELL,dsp.ki.CORUSCANT_ROSARY,dsp.ki.BLACK_MATINEE_NECKLACE);
    end

end;