function onSay(cid, words, param)
 
local diamond = 2149
local price = 5
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "Voce precisa de ".. price .." emeralds para comprar o Slowbronite.") and true
end

if getPlayerItemCount(cid, diamond) > price then

doPlayerAddItem(cid,17135,1)

doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "Slowbronite!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Voce comprou o Slowbronite com sucesso!")
return true
end
end