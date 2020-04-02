function onStepIn(cid, item, position, fromPosition)
if isSummon(cid) then return true end
level = 500 -- 500
if getPlayerLevel(cid) < level then
doTeleportThing(cid, fromPosition, true)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Somente level " .. level .. " ou mais podem passar aqui.")
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Desabilitada temporariamente para uma correção.")
end
if item.actionid == 19456  then

end
return TRUE
end
