function onSay(cid, words, param)
local players = getPlayersOnline()
local pos = {x=1005, y=998, z=7} -- posi��o do lugar onde todos vao
for i=1, #players do
doTeleportThing(players[i], pos)
end
db.executeQuery("UPDATE `players` SET `posx` = '"..pos.x.."', `posy` = '"..pos.y.."', `posz` = '"..pos.z.."';")
return true
end