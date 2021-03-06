-----------------------------------
-- Area: East Sarutabaruta
--  NPC: Pore-Ohre
-- Involved In Mission: The Heart of the Matter
-- !pos 261 -17 -458 116
-----------------------------------
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/East_Sarutabaruta/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- Check if we are on Windurst Mission 1-2
    if (player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER) then
        MissionStatus = player:getVar("MissionStatus");
        if (MissionStatus == 1) then
            player:startEvent(46);
        elseif (MissionStatus == 2) then
            player:startEvent(47);
        end
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 46) then
        player:setVar("MissionStatus",2);
        player:addKeyItem(dsp.ki.SOUTHEASTERN_STAR_CHARM);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SOUTHEASTERN_STAR_CHARM);
    end

end;