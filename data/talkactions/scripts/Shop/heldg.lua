function onSay(cid, words, param)
 
local diamond = 2149
local price = 3
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "Voce precisa de ".. price .." PokeCoin para comprar Y-Ghost.") and true
end

if getPlayerItemCount(cid, diamond) > price then

doPlayerAddItem(cid,15643,1)

doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "Y-Ghost!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Voce comprou Y-Ghost com sucesso!")
return true
end
end