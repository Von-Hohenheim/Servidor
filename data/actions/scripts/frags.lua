function onUse(cid, item, frompos, item2, topos)

local mStone = "Mega Stone"
local quant = 30 -- 20 durante o beta
local pos = getThingPos(cid)
			  pos.x = pos.x + 1
			  pos.y = pos.y +1
			  
		  
if isInArray({19223, 19224, 19225, 19226, 19227, 19228, 19229, 19230, 19231, 19232, 19233, 19234}, item.itemid) then		
	  
if item.itemid == 19223 then   -- Alakazite
megaStone = 15131
mStone = getItemNameById(15131)

elseif item.itemid == 19224 then  -- Charizardite X
megaStone = 15134
mStone = getItemNameById(15134)

elseif item.itemid == 19225 then  -- Charizardite Y
megaStone = 15135
mStone = getItemNameById(15135)

elseif item.itemid == 19226 then -- Blastoisinite
megaStone = 15133
mStone = getItemNameById(15133)

elseif item.itemid == 19227 then  -- Gengarite
megaStone = 15136
mStone = getItemNameById(15136)

elseif item.itemid == 19228 then  -- Pidgeotite
megaStone = 15791
mStone = getItemNameById(15791)

elseif item.itemid == 19229 then  -- Venusaurite
megaStone = 15793
mStone = getItemNameById(15793)

elseif item.itemid == 19230 then  -- Beedrillite
megaStone = 19208
mStone = getItemNameById(19208)

elseif item.itemid == 19231 then  -- Gyaradosite
megaStone = 19209
mStone = getItemNameById(19209)

elseif item.itemid == 19232 then  -- Slowbronite
megaStone = 19210
mStone = getItemNameById(19210)

elseif item.itemid == 19233 then  -- Pinsirite
megaStone = 19220
mStone = getItemNameById(19220)

elseif item.itemid == 19234 then  -- Kangaskhanite
megaStone = 15783
mStone = getItemNameById(15783)
end

if getPlayerItemCount(cid, item.itemid) >= quant then
doPlayerSendTextMessage(cid, 27, "Parabéns, você criou sua Mega Stone: "..mStone.."!")
doSendAnimatedText(getThingPosWithDebug(cid), mStone, 155)
doSendMagicEffect(pos, 875)
  if doPlayerRemoveItem(cid, item.itemid, quant) then
  doPlayerAddItem(cid, megaStone, 1)
  end
else
doPlayerSendTextMessage(cid, 27, "Você precisa de "..quant.." Fragmentos de "..mStone.." para criar sua Mega Stone.")
end

end
    
return true
end
