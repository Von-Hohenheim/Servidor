function onSay(cid, words, param)
 
local diamond = 2149
local price = 7
local unique = false
local boost = 0
local config = nil

if getPlayerItemCount(cid, diamond) < price then
return doPlayerSendTextMessage(cid, 20, "Voce precisa de ".. price .." PokeCoin para comprar Misterioso Held Box T7.") and true
end

if getPlayerItemCount(cid, diamond) > price then

doPlayerAddItem(cid,17137,1)

doPlayerRemoveItem(cid, diamond, price)
doSendAnimatedText(getThingPos(cid), "Misterioso Held Box T7!", math.random(1, 255))
doPlayerSendTextMessage(cid, 20, "Voce comprou Misterioso Held Box T7! com sucesso!")
return true
end
end