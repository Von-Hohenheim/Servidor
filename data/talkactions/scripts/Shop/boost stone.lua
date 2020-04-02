function onSay(cid, words, param)
 
local diamond = 2149
local price = 1
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "Voce precisa de ".. price .." PokeCOin para comprar Boost Stone X5.") and true
end

if getPlayerItemCount(cid, diamond) > price then

doPlayerAddItem(cid,12618,5)

doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "Boost Stone X5!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Voce comprou o 5 Boost Stones com sucesso!")
return true
end
end