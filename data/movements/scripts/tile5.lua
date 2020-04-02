function onStepIn(cid, itemid, position, fromPosition)
local config = {
msgDenied = "Voce ja fez essa quest ou ainda nao fez as outras",
msgWelcome = "Voce entrou na quest!!."
}
local pos = {x= 1062, y= 1046, z= 7} -- coordenadas para onde o player vai
 
if getPlayerStorageValue(cid, 40004) - os.time() <= 0 then
doTeleportThing(cid, fromPosition, true)
doTeleportThing(cid, pos, true)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgDenied)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
return TRUE
end
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msgWelcome)
return TRUE
end
