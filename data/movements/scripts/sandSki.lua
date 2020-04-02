function onStepIn(cid, item, position, fromPosition)
  if(isPlayer(cid)) and not isRiderOrFlyOrSurf(cid) then

    local newtype = getPlayerSex(cid) == 0 and 2050 or 2049

	if isBiking(cid) then
		cancelBike(cid)
		doRegainSpeed(cid)		
	end
	
    if getPlayerItemCount(cid, 19215) >= 1 then --19215
      doChangeSpeed(cid, -getCreatureSpeed(cid))
      doChangeSpeed(cid, 1500) 
      doSetCreatureOutfit(cid, {lookType = newtype}, -1)
    end
  end
  if isWild(cid) or isSummon(cid) then
            poketype1 = pokes[getCreatureName(cid)].type       
            poketype2 = pokes[getCreatureName(cid)].type2 
            if poketype1 == "ground" or poketype2 == "ground" then
            doChangeSpeed(cid,(-getCreatureSpeed(cid))+400)
            elseif poketype1 == "psychic" or poketype2 == "psychic" then			
            doChangeSpeed(cid,(-getCreatureSpeed(cid))+350)
            else
            doChangeSpeed(cid,(-getCreatureSpeed(cid))+295)
            end
  end
  return true
end

function onStepOut(cid, item, position, fromPosition)
	if not isRiderOrFlyOrSurf(cid) then
	    if (not isMega(cid)) and (not isSummon(cid)) and (not isWild(cid)) then -- tava removendo addon, outfit do mega, etc
		 doRemoveCondition(cid, CONDITION_OUTFIT)
		end 
		--doChangeSpeed(cid,(-getCreatureSpeed(cid))+250)
		doChangeSpeed(cid,(-getCreatureSpeed(cid))+400) -- 300
		if isPlayer(cid) then
		 doRegainSpeed(cid)
	    end
	end
	return true
end