function onSay(cid, words, param)
 
local diamond = 2149
local price = 10
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "Voce precisa de ".. price .." emeralds para comprar o Slowbronite X.") and true
end

if getPlayerItemCount(cid, diamond) > price then

doPlayerAddItem(cid,17136,1)

doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "Slowbronite X!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Voce comprou o Slowbronite X com sucesso!")
return true
end
end