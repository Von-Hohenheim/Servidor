a = {
ITEM = {2145, 1}
}
function onSay(cid, words, param, channel)
if(getPlayerSex(cid) >= 2) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You cannot change your gender.")
  return
end

if getPlayerItemCount(cid, a.ITEM[1]) >= a.ITEM[2] then

doPlayerSetSex(cid, getPlayerSex(cid) == PLAYERSEX_FEMALE and PLAYERSEX_MALE or PLAYERSEX_FEMALE)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have changed your gender!")
doSendMagicEffect(getThingPosition(cid), CONST_ME_MAGIC_RED)
doPlayerRemoveItem(cid, a.ITEM[1], a.ITEM[2])
else
doSendMagicEffect(getCreaturePosition(cid), 2)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Desculpe mas você não tem Diamonds suficientes para trocar de sexo.")
  return true
end

local c = {
  {3, 1, false, 6, 1},
  {3, 2, false, 6, 2},
  {6, 1, false, 3, 1},
  {6, 2, false, 3, 2}
}
for i = 1, #c do
  if canPlayerWearOutfitId(cid, c[i][1], c[i][2]) then
   doPlayerRemoveOutfitId(cid, c[i][1], c[i][2])
   c[i][3] = true
  end
end


for i = 1, #c do
  if c[i][3] == true then
   doPlayerAddOutfitId(cid, c[i][4], c[i][5])
  end
end

return true
end