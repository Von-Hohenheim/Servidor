local msgs = {"use ", ""}

function doAlertReady(cid, id, movename, n, cd)
	if not isCreature(cid) then return true end
	local myball = getPlayerSlotItem(cid, 8)
	if myball.itemid > 0 and getItemAttribute(myball.uid, cd) == "cd:"..id.."" then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getPokeballName(myball.uid).." - "..movename.." (m"..n..") is ready!")
	return true
	end
	local p = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)
	if not p or #p <= 0 then return true end
	for a = 1, #p do
		if getItemAttribute(p[a], cd) == "cd:"..id.."" then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getPokeballName(p[a]).." - "..movename.." (m"..n..") is ready!")
		return true
		end
	end
end

function onSay(cid, words, param, channel)


	if param ~= "" then return true end
	if string.len(words) > 3 then return true end

	if #getCreatureSummons(cid) == 0 then
		doPlayerSendCancel(cid, "You need a pokemon to use moves.")
		return 0
	end
                      --alterado v1.5
local mypoke = getCreatureSummons(cid)[1]
local item = getPlayerSlotItem(cid, 8)

	if getCreatureCondition(cid, CONDITION_EXHAUST) then return true end
	
	if getCreatureName(mypoke) == "Evolution" then return true end
	local name = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")
	local copy = getItemAttribute(item.uid, "copyName") or ""
	
	if isInArray({"ditto", "shiny ditto"}, copy:lower()) then
	   return true
	end
	
    if getItemAttribute(item.uid, "copyName") then -- ditto system
        name = getItemAttribute(item.uid, "copyName")
	elseif  isMega(mypoke) then  --alterado v1.9
	    name = getPlayerStorageValue(mypoke, storages.isMega)
    end  
	
local it = string.sub(words, 2, 3)
		---------- Edição para o Smeargle System
		if name:find("Smeargle") and getItemAttribute(item.uid, "sketch" .. it) then
			name = getItemAttribute(item.uid, "sketch" .. it)
		end
	
		local target = getCreatureTarget(cid)
		if name:find("Smeargle") and isCreature(target) and getPlayerStorageValue(cid, 55006) ~= 1 then
			
			local BlockMoves = {"Rollout", "Shredder Team", "Invisible", "Fear", "Kecleon Camouflage", "Air Vortex", "Super Wing", "Hypnosis", "Flying Kick", "Fire Fist", "Earthquake", "Poison Gast"}		
			local targetName = getCreatureName(target)
			local smeargleID = string.sub(getPlayerStorageValue(mypoke, storages.SmeargleID), 9, 10)
			
			if targetName == "Smeargle" then
				doSendMsg(cid, "Você não pode copiar o m".. it .." de um Smeargle.")
			   return true
			end
			
			if it == "1" then
				moveToCopy = movestable[targetName].move1
			elseif it == "2" then
				moveToCopy = movestable[targetName].move2
			elseif it == "3" then
				moveToCopy = movestable[targetName].move3
			elseif it == "4" then
				moveToCopy = movestable[targetName].move4
			elseif it == "5" then
				moveToCopy = movestable[targetName].move5
			elseif it == "6" then
				moveToCopy = movestable[targetName].move6
			elseif it == "7" then
				moveToCopy = movestable[targetName].move7
			elseif it == "8" then
				moveToCopy = movestable[targetName].move8
			elseif it == "9" then
				moveToCopy = movestable[targetName].move9
			end
		
			if tonumber(smeargleID) < tonumber(it) then
				doSendMsg(cid, "Seu smeargle não tem o Skatch " .. it .. ".")
			return true
			elseif moveToCopy == nil then
				doSendMsg(cid, "Este pokemon não tem o move" .. it .. "!")
			return true
			elseif moveToCopy.passive and moveToCopy.passive == "sim" then
				doSendMsg(cid, "Você não pode copiar passivas para seu Smeargle.")	
			return true
			end
		
			if isInArray(BlockMoves, moveToCopy.name) then
				return doPlayerSendCancel(cid, "Você não pode pode copiar esse moveset")	
			end

			local spellAttr = getItemAttribute(item.uid, "sketch" .. it)
				  if not spellAttr then 
					if getPlayerStorageValue(cid, 156493) >= 1 then
						doItemSetAttribute(item.uid, "sketch" .. it, targetName)
						doItemSetAttribute(item.uid, "sketchName" .. it, moveToCopy.name)
						doSendMsg(cid, "Você acaba de copiar a spell " .. moveToCopy.name .. " para seu Smeargle.")
						doSendMagicEffect(getThingPos(mypoke), 376)
						doUpdateMoves(cid)
					else
						doPlayerSendCancel(cid, "Você precisa liberar a proteção do Smeargle")
					end
				  return true
				  end
		end
		---------- Edição para o Smeargle System
	if not movestable[name] then 
		doPlayerSendCancel(cid, "Este pokémon não tem spell.")
		return true 
	end

	local move = movestable[name].move1

	if getPlayerStorageValue(mypoke, 212123) >= 1 then
	   cdzin = "cm_move"..it..""
	else
	   cdzin = "move"..it..""       --alterado v1.5
	end

	if it == "2" then
		move = movestable[name].move2
	elseif it == "3" then
		move = movestable[name].move3
	elseif it == "4" then
		move = movestable[name].move4
	elseif it == "5" then
		move = movestable[name].move5
	elseif it == "6" then
		move = movestable[name].move6
	elseif it == "7" then
		move = movestable[name].move7
	elseif it == "8" then
		move = movestable[name].move8
	elseif it == "9" then
		move = movestable[name].move9
	elseif it == "10" then
		move = movestable[name].move10
	elseif it == "11" then
		move = movestable[name].move11
	elseif it == "12" then
		move = movestable[name].move12
	elseif it == "13" then
		move = movestable[name].move13
	end

	local heldy = getItemAttribute(item.uid, "yHeldItem")
	if not move or (string.find(move.name, "- ") and not (heldy and string.find(heldy, "MEGA"))) then
		doPlayerSendCancel(cid, "Your pokemon doesn't recognize this move.")
	return true
	end
	
--	if not string.find(move.name, "Mega") then
	if not string.find(move.name, "MegaZ -") then
		if getPlayerLevel(cid) < move.level then
		   doPlayerSendCancel(cid, "You need be atleast level "..move.level.." to use this move.")
		   return true
		end
	
		local coold = getCD(getPlayerSlotItem(cid, 8).uid, cdzin)
			
		if coold > 0 and coold < (move.cd + 2) then
			doPlayerSendCancel(cid, "You have to wait "..coold.." seconds to use "..move.name.." again.")
			return true
		end
		
		if getPlayerStorageValue(mypoke, 5000001) >= 1 then   --alterado v1.6
			return true
		end			

		if getTileInfo(getThingPos(mypoke)).protection then
			doPlayerSendCancel(cid, "Your pokemon cannot use moves while in protection zone.")
		return true
		end
		
	   if getPlayerStorageValue(mypoke, 3894) >= 1 then
		  return doPlayerSendCancel(cid, "You can't attack because you is with fear") --alterado v1.3
	   end
	end
	  
	if (move.name == "Team Slice" or move.name == "Team Claw") and #getCreatureSummons(cid) < 2 then       
	    doPlayerSendCancel(cid, "Your pokemon need be in a team for use this move!")
    return true
    end
	
	if move.passive and move.passive == "sim" then
		return true
	end      

if move.target == 1 then

	if not isCreature(getCreatureTarget(cid)) then
	doPlayerSendCancel(cid, "You don\'t have any targets.")
	return 0
	end

	if getCreatureCondition(getCreatureTarget(cid), CONDITION_INVISIBLE) then
	return 0
	end

	if getCreatureHealth(getCreatureTarget(cid)) <= 0 then
	doPlayerSendCancel(cid, "Your have already defeated your target.")
	return 0
	end

	if not isCreature(getCreatureSummons(cid)[1]) then
	return true
	end

	if getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid))) > move.dist then
	doPlayerSendCancel(cid, "Get closer to the target to use this move.")
	return 0
	end

	if not isSightClear(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), false) then
	return 0
	end
end
	
        if isSleeping(mypoke) or isSilence(mypoke) then  --alterado v1.5
			doPlayerSendCancel(cid, "Sorry you can't do that right now.")
			return 0
		else
	
			local heldx = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "xHeldItem") or ""
			local heldName, heldTier = string.explode(heldx, "|")[1] or "", string.explode(heldx, "|")[2] or ""		
			if heldx then
				if heldName == "X-Cooldown" then -- do Cooldown
					setCD(getPlayerSlotItem(cid, 8).uid, cdzin, math.floor(move.cd * heldCooldown[tonumber(heldTier)]))
				end
				setCD(getPlayerSlotItem(cid, 8).uid, cdzin, move.cd)
			else
				setCD(getPlayerSlotItem(cid, 8).uid, cdzin, move.cd)
			end			
		end
		 
	if string.find(move.name, "- ") then
	  doCreatureSay(cid, ""..getPokeName(mypoke)..", mega evolução!", TALKTYPE_ORANGE_1)
	else
	  doCreatureSay(cid, ""..getPokeName(mypoke)..", "..msgs[math.random(#msgs)]..""..move.name.."!", TALKTYPE_ORANGE_1)
	end
	
    local summons = getCreatureSummons(cid) --alterado v1.6

	--addEvent(doAlertReady, move.cd * 1000, cid, newid, move.name, it, cdzin)
	
	for i = 2, #summons do
       if isCreature(summons[i]) then
          docastspell(summons[i], move.name)        --alterado v1.6
       end
    end 

    docastspell(mypoke, move.name)
	doCreatureAddCondition(cid, playerexhaust)

	if useKpdoDlls then
		doUpdateCooldowns(cid)
	end

return 0
end