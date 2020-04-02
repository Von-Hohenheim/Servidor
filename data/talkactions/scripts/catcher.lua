function onSay(cid, words, param, channel)

 if isGod(cid) then
  if getPlayerStorageValue(cid, 394672) >= 1 then
  setPlayerStorageValue(cid, 394672, -1)
  doPlayerSendTextMessage(cid, 27, "GOD Catch DESATIVADO!")  
  else
  setPlayerStorageValue(cid, 394672, 1)
  doPlayerSendTextMessage(cid, 27, "GOD Catch ATIVADO!")  
  end
 end
 
return true
end