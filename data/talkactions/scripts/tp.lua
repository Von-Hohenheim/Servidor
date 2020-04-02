local config = {
battle = false
}

function onSay(cid, words, param, channel)

local time = getPlayerStorageValue(cid, 12539) - os.time()

	if config.battle and getCreatureCondition(cid, CONDITION_INFIGHT) then
		doPlayerSendCancel(cid, "Você esta em battle!!")
		return true
	end
  
	if getPlayerStorageValue(cid, 878781) == 1 then      --pvp
		doPlayerSendCancel(cid, "You can't do that in the Pvp")
		return true
    end 
	  
	if getPlayerStorageValue(cid, 245678) >= 1 then     
		doPlayerSendCancel(cid, "Você não pode usar o comando enquanto estiver na Quest Clones.")
		return true
    end 
	
	if time < 1 then
	
		if getPlayerInTower(cid) then
			setPlayerStorageValue(cid, 252525, -1)
			removeCondTower(cid)	
		end

		
		if getPlayerInGolden(cid) then
			removeConditionArena(cid)
		end
		
		setPlayerStorageValue(cid, 201001, -1)
		setPlayerStorageValue(cid, 244787, -1)
		setPlayerStorageValue(cid, 252526, -1)
		setPlayerStorageValue(cid, 2154601, -1)	
		setPlayerStorageValue(cid, 154585, -1)
		setPlayerStorageValue(cid, 123124, -1)
		setPlayerStorageValue(cid, 141416, -1)
		setPlayerStorageValue(cid, 141417, -1)
		setPlayerStorageValue(cid, 200050, -1)
		setPlayerStorageValue(cid, 2154600, -1)
		setPlayerStorageValue(cid, 2154601, -1)
		setPlayerStorageValue(cid, 1654987, -1)
		
       doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
       doSendMagicEffect(getThingPos(cid), 21)
	   setPlayerStorageValue(cid, 12539,os.time() + 15 * 60 )
    else
		doPlayerSendCancel(cid, "Você precisa esperar "..time.." segundo"..(time > 1 and "s" or "").." para usar esse comando novamente.")
	end	
	
return true
end