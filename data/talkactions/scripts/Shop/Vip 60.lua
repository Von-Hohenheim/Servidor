function onSay(cid, words, param)
 
local diamond = 2149
local price = 7
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "Voce precisa de ".. price .." emeralds para comprar Vip 60 Days") and true
end

if getPlayerItemCount(cid, diamond) > price then

doPlayerAddPremiumDays(cid,60)

doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "VIP!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Voce comprou VIP 60 Days com sucesso!")
return true
end
end