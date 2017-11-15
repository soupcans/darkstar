-----------------------------------------
-- ID: 5318
-- Toolbag Kodo
-- When used, you will obtain one stack of Kodo
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
    return result;
end;

function onItemUse(target)
    target:addItem(1191,99);
end;

