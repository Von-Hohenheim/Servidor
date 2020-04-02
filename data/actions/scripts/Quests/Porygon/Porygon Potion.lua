function onUse(cid, item, fromPosition, item2, toPosition)

	if isInArray({11947}, item2.itemid) then
		if getPlayerStorageValue(cid, 43217986) < 100 then
			if getPlayerStorageValue(cid, 43217986) == -1 then
				setPlayerStorageValue(cid, 43217986, 2)
			else
				setPlayerStorageValue(cid, 43217986, getPlayerStorageValue(cid, 43217986)+1)				
				doSendMsg(cid, "Você coletou ["..getPlayerStorageValue(cid, 43217986).."] essencia de porygon.")
				doSendMagicEffect(getThingPos(item2.uid), 1)
				doRemoveItem(item2.uid, 1)
			end
		else
			doSendMsg(cid, "O frasco já está cheio!")			
		end
	end

local area = {fromx = 1091, fromy = 354, fromz = 8, tox = 1193, toy = 433, toz= 8}	

	if item2.itemid == 1387 then   -- ground
		if getPlayerStorageValue(cid, 43217986) >= 100 then 
			if #getPlayersInArea(area) < 1 then
				if getPlayerStorageValue(cid, 50926) ~= 1 then
					doTeleportThing(cid, {x = 1109, y = 414, z = 8})
					setPlayerStorageValue(cid, 465456700, getPlayerStorageValue(cid, 465456700)+1)		
					setPlayerStorageValue(cid, 465456701, 1) -- proteção para não usar o card	
					setPlayerStorageValue(cid, 2525252525, 1)				
					setPlayerStorageValue(cid, 43217986, 0)					
					doBroadcastMessage("[Big Porygon]: Perigo! O jogador "..getCreatureName(cid).." invadiu nosso mundo, queridos suditos mate-o!")
				else
					doRemoveItem(item.uid, 1)	
					doSendMsg(cid, "Você não pode mais entrar no mundo porygon!")
				end
			else
				doSendMsg(cid, "Já tem um jogador na quest, aguarde!")		
			end
		else
			doSendMsg(cid, "Faltam ["..(100-getPlayerStorageValue(cid, 43217986)).."] essencias!")
		end
	end		
	
return true
end