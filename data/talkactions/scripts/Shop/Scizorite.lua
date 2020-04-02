function onSay(cid, words, param)
 
local diamond = 2149
local price = 8
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "Voce precisa de ".. price .." emeralds para comprar o Scizorite.") and true
end

if getPlayerItemCount(cid, diamond) > price then

doPlayerAddItem(cid,15784,1)

doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "Scizorite!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Voce comprou o Scizorite com sucesso!")
return true
end
end