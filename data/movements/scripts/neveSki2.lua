function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid)) and not isRiderOrFlyOrSurf(cid) then
		
		if isBiking(cid) then
			cancelBike(cid)
			doRegainSpeed(cid)	
		end
		
		local newtype = getPlayerSex(cid) == 0 and 1408 or 1407
		
		if getPlayerItemCount(cid, 19219) >= 1 then	
			newtype = getPlayerSex(cid) == 0 and 2052 or 2051
			doChangeSpeed(cid, -getCreatureSpeed(cid))
			doChangeSpeed(cid, 3000)
			doSetCreatureOutfit(cid, {lookType = newtype}, -1)
		else	
			if getPlayerItemCount(cid, 19212) >= 1 and getPlayerItemCount(cid, 19213) >= 1 and getPlayerItemCount(cid, 19214) >= 1 then --19215
				doChangeSpeed(cid, -getCreatureSpeed(cid))
				doChangeSpeed(cid, 2000)
				doSetCreatureOutfit(cid, {lookType = newtype}, -1)
			end
		end
	end
	
	if isWild(cid) or isSummon(cid) then
		poketype1 = pokes[getCreatureName(cid)].type 
		poketype2 = pokes[getCreatureName(cid)].type2 
		if poketype1 == "ice" or poketype2 == "ice" then
			doChangeSpeed(cid,(-getCreatureSpeed(cid))+760)
		elseif poketype1 == "dragon" or poketype2 == "dragon" then			
			doChangeSpeed(cid,(-getCreatureSpeed(cid))+660)
		else
			doChangeSpeed(cid,(-getCreatureSpeed(cid))+400)
		end
	end
	return true
end

function onStepOut(cid, item, position, fromPosition)
	if not isRiderOrFlyOrSurf(cid) and not isBiking(cid) then
		if (not isMega(cid)) and (not isSummon(cid)) and (not isWild(cid)) then -- tava removendo addon, outfit do mega, etc
			doRemoveCondition(cid, CONDITION_OUTFIT)
		end 
		doChangeSpeed(cid,(-getCreatureSpeed(cid))+400)
		if isPlayer(cid) then
			doRegainSpeed(cid)
		end
	end
	return true
end