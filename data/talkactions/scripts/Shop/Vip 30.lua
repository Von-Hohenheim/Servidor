function onSay(cid, words, param)
 
local diamond = 2149
local price = 4
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "Voce precisa de ".. price .." emeralds para comprar Vip 30 Days") and true
end

if getPlayerItemCount(cid, diamond) > price then

doPlayerAddPremiumDays(cid,30)

doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "VIP!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Voce comprou VIP 30 Days com sucesso!")
return true
end
end