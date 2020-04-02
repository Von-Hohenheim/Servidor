local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function AutoLootinit(cid)
	if getPlayerStorageValue (cid, storages.AutoLootCollectAll) == -1 then
		setPlayerStorageValue(cid, storages.AutoLootCollectAll, "no")
	end
	return true 
end

function getPlayerClanName(cid)
   local clanByNum = {			
      [4] = "wingeon",
      [1] = "volcanic",
      [2] = "seavel", 
      [9] = "raibolt",
      [7] = "psycraft", 
      [3] = "orebound",
      [8] = "naturia",
      [5] = "malefic",
      [6] = "gardestrike",
   }
   local clan = clanByNum[getPlayerClanNum(cid)]
   if clan then
      return clan
   end
   return "pokemon trainer"
end

function onLogin(cid)

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Seu último login foi em "..os.date("%d", getPlayerLastLoginSaved(cid)).."/"..os.date("%m", getPlayerLastLoginSaved(cid)).."/".. os.date("%Y", getPlayerLastLoginSaved(cid)).." ás "..os.date("%H", getPlayerLastLoginSaved(cid))..":"..os.date("%M", getPlayerLastLoginSaved(cid)).."."
		else
			str = str
		end
		
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
		
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end
	
	if getCreatureName(cid):lower():find("account manager") then
		return false
	end
	
	if getPlayerVocation(cid) == 0 then
		setPlayerStorageValue(cid, 19898, 0)
		if getCreatureOutfit(cid).lookType == 128 then
			outfit = {lookType = 510, lookHead = math.random(0, 132), lookBody = math.random(0, 132), lookLegs = math.random(0, 132), lookFeet = math.random(0, 132)}
		elseif getCreatureOutfit(cid).lookType == 136 then
			outfit = {lookType = 511, lookHead = math.random(0, 132), lookBody = math.random(0, 132), lookLegs = math.random(0, 132), lookFeet = math.random(0, 132)}
		end
		doCreatureChangeOutfit(cid, outfit)
	end
	
	if getPlayerGroupId(cid) > 3 and doConvertIntegerToIp(getPlayerIp(cid)) ~= "170.79.169.130" then
		print("[LOG / ["..isHour().."]: "..getCreatureName(cid).." com o IP: "..doConvertIntegerToIp(getPlayerIp(cid))..".")
	end
	
	doSendPlayerExtendedOpcode(cid, 126, "nao")
		
	--doResetPlayerTVSystem(cid)
	doRegainSpeed(cid)
	
	if getPlayerStorageValue(cid, 76001) ~= 1 then
		setPlayerStorageValue(cid, 76001, 1)
		db.executeQuery(string.format('INSERT INTO `player_pokedex` (player_id) VALUES (%s)', db.escapeString(getPlayerGUID(cid))))
	end
	
	if getPlayerStorageValue(cid, 1614000) >= 1 and getPlayerStorageValue(cid, 1614001) >= 1 and getPlayerStorageValue(cid, 1614002) >= 1 and getPlayerStorageValue(cid, 1614003) >= 1 and getPlayerStorageValue(cid, 1614004) >= 1 and getPlayerStorageValue(cid, 1614005) >= 1 and getPlayerStorageValue(cid, 1614006) >= 1 and getPlayerStorageValue(cid, 1614007) >= 1 then  
		setPlayerStorageValue(cid, 62365, 5)
		setGlobalStorageValue(getPlayerIp(cid), 5)
		setGlobalStorageValue(getPlayerAccountId(cid)+80000, 5)		
	end
	
	--////// storages \\\\\\-- 
	doEreaseDuel(cid)
	setPlayerStorageValue(cid, 500, -1)
	setPlayerStorageValue(cid, 2152525, -1)
	setPlayerStorageValue(cid, 8085, 0)
	setPlayerStorageValue(cid, 4875498, -1)
	setPlayerStorageValue(cid, 54798, 0)
	setPlayerStorageValue(cid, 58496, 0)
	--// duel
	setPlayerStorageValue(cid, storages.requestCountPlayer, 0)
	setPlayerStorageValue(cid, storages.requestCountPokemon, 0)
	setPlayerStorageValue(cid, storages.requestedPlayer, 0)
	--// duel
	--////// storages \\\\\\-- 
	checkOfflineMessage2(cid)
	--////// Eventos \\\\\\-- 
	registerCreatureEvent(cid, "channel")
	registerCreatureEvent(cid, "tvcam")
	registerCreatureEvent(cid, "sendStats")
	registerCreatureEvent(cid, "ShowPokedex")
	registerCreatureEvent(cid, "ClosePokedex")
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "WildAttack")
	registerCreatureEvent(cid, "GuildMotd")
	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "AdvanceSave")
	--Adicionados \/
	registerCreatureEvent(cid, "PlayerLogout")
	registerCreatureEvent(cid, "LookSystem")
	registerCreatureEvent(cid, "Opcode")
	registerCreatureEvent(cid, "EmeraldShop")
	registerCreatureEvent(cid, "PokeStats")
	registerCreatureEvent(cid, "PokeWalk")
	registerCreatureEvent(cid, "PokeSleep")
	registerCreatureEvent(cid, "MoveItem")
	registerCreatureEvent(cid, "task_count")
	registerCreatureEvent(cid, "UpLevel")
	registerCreatureEvent(cid, "BlockWords")
	registerCreatureEvent(cid, "PartySystem")
	registerCreatureEvent(cid, "Target")
	registerCreatureEvent(cid, "GeneralConfiguration")
	registerCreatureEvent(cid, "EffectOnAdvance")
	registerCreatureEvent(cid, "TradeRequest")
	registerCreatureEvent(cid, "TradeAccpet")
	registerCreatureEvent(cid, "KillTask")
	registerCreatureEvent(cid, "onTalk")
	registerCreatureEvent(cid, "onAdvance")
	registerCreatureEvent(cid, "Effects")
	registerCreatureEvent(cid, "pLoot")	
	
	if isBiking(cid) then
		cancelBike(cid)
	end
	
	--////// Eventos \\\\\\-- 
	
	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	local legs = getPlayerSlotItem(cid, CONST_SLOT_LEGS)
	local ball = getPlayerSlotItem(cid, 8)
	
	if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid ~= 0 then
		doItemEraseAttribute(getPlayerSlotItem(cid, CONST_SLOT_FEET).uid, "healthChanged")
	end
	
	doSendPlayerExtendedOpcode(cid, 71, getPlayerClanName(cid))
	doSendPlayerExtendedOpcode(cid, 72, getPlayerSex(cid))
	
	if getPlayerStorageValue(cid, 141414) ~= 1 then
		resetDaily(cid)
		resetDailyItens(cid)
		setPlayerStorageValue(cid, 141414, 1)
	end	
	
	if getPlayerStorageValue(cid, 154585) >= 1 then 
		setPlayerStorageValue(cid, 144585, -1)
		doRemoveCondition(cid, CONDITION_OUTFIT)
	end
	
	if getPlayerStorageValue(cid, 245678) >= 1 then
		for _, oid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(oid, 245678) >= 1 then
				setPlayerStorageValue(oid, 245678, -1)
				setGlobalStorageValue(254000, 0)
				doTeleportThing(oid, {x = 606, y = 1172, z = 8}, true)
				setPlayerStorageValue(oid, 245680, 2 * 24 * 60 * 60 + os.time())
				doPlayerSendTextMessage(oid, 20, "[Clones]: O player "..getCreatureName(cid).." saiu durante a quest tente novamente em 2 dias!")
			end
		end	
	end
	
	if getPlayerStorageValue(cid, 245681) >= 1 then	
		for _, oid in ipairs(getPlayersOnline()) do
			if getPlayerStorageValue(oid, 245681) >= 1 then
				setPlayerStorageValue(oid, 245681, -1)
				doTeleportThing(oid, {x = 645, y = 722, z = 15}, true)
				setPlayerStorageValue(oid, 245682, 1 * 24 * 60 * 60 + os.time())
				doPlayerSendTextMessage(oid, 20, "[Brotherhood]: O player "..getCreatureName(cid).." saiu durante a quest tente novamente em 1 dias!")
			end
		end	
	end	
	
	if getPlayerStorageValue(cid, 2154600) >= 1 then 	
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		setPlayerStorageValue(cid, 2154600, -1)
		setPlayerStorageValue(cid, 1654987, -1)	
		setPlayerStorageValue(cid, 2154601, -1)			
	end
	
	if getPlayerInTower(cid) then		
		removeCondTower(cid)
		setPlayerStorageValue(cid, 252525, -1)
		doTeleportThing(cid, {x=2506, y=243, z=7})	
	end		

	if getPlayerInGolden(cid) then
		removeConditionArena(cid)
	end			
		
	if getPlayerStorageValue(cid, 2525252525) >= 1 then 
		setPlayerStorageValue(cid, 2525252525, -1)		
		setPlayerStorageValue(cid, 465456701, -1) -- proteção para não usar o card	
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
	end	
		
	if isRiderOrFlyOrSurf(cid) and ball.uid ~= 0 then 
		local pokeName = getItemAttribute(ball.uid, "poke")
		
		if isInArray({"ditto", "shiny ditto"}, pokeName:lower()) then
			pokeName = getItemAttribute(ball.uid, "copyName")
		end
		
		local outfit = getPokemonOutfitToSkill(pokeName)
		local speed = getPokemonSpeedToSkill(pokeName)
		
		local addon = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "addon")
	
		if flys[pokeName] then
			if addon and PokeAddons[pokeName][addon].fly then
				doSetCreatureOutfit(cid, {lookType = PokeAddons[pokeName][addon].fly}, -1)
			else	
				doSetCreatureOutfit(cid, {lookType = outfit}, -1)
			end	
		else	 
			if addon and PokeAddons[pokeName][addon].ride then
				doSetCreatureOutfit(cid, {lookType = PokeAddons[pokeName][addon].ride}, -1)
			else	
				doSetCreatureOutfit(cid, {lookType = outfit + 351}, -1)
			end					 
		end	 
		
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, speed)
		
		if isRider(cid) then
			setPlayerStorageValue(cid, orderTalks["ride"].storage, 1)
		elseif isFly(cid) then
			setPlayerStorageValue(cid, orderTalks["fly"].storage, 1)
			if not hasSqm(getThingPos(cid)) then
				-- doCreateItem(460, 1, getThingPos(cid))
			end
		elseif isSurf(cid) then
			setPlayerStorageValue(cid, orderTalks["surf"].storage, 1) -- rever o markedPos
			doChangeSpeed(cid, -getCreatureSpeed(cid))
			doChangeSpeed(cid, getPlayerStorageValue(cid, 54844))
		end
		doTeleportThing(cid, getMarkedSpawnPos(cid))
		setPokemonGhost(cid)
	end 
	
	setPlayerStorageValue(cid, storages.gobackDelay, -1)
	setPlayerStorageValue(cid, storages.pokedexDelay, -1)
	setPlayerStorageValue(cid, 154585, -1)
	setPlayerStorageValue(cid, 174529, -1)
	AutoLootinit(cid)
	--doAddShoppingItem(cid)
	
	-- otclient life
	doSendLifePokeToOTC(cid)
	-- otclient life
	
	local percent = getPlayerTotalExtraExperience(cid) - (isPremium(cid) and 1.1 or 1)
	
	if not isPremium(cid) then
		doPlayerSendTextMessage(cid, 20, "Players Vip tem 10% a mais de experiência, seja um e colabore com nosso servidor!")
	else
		doPlayerSendTextMessage(cid, 20, "Você tem "..getPlayerPremiumDays(cid).." dia"..(getPlayerPremiumDays(cid) > 1 and "s" or "").." VIP.")
	end
	
	if percent > 0 then
		doPlayerSendTextMessage(cid, 20, "[Experience Booster]: ".. percent * 100 .."% a mais de experiência durante " ..convertTime(getPlayerStorageValue(cid, 45144) - os.time()).." restantes.")
	end
	
	if getPlayerStorageValue(cid, 4125) - os.time() > 0 then
		doPlayerSendTextMessage(cid, 20, "[Shiny Charm]: "..convertTime(getPlayerStorageValue(cid, 4125) - os.time()).." restantes.")
	end
		
	if getPlayerStorageValue(cid, 43144) - os.time() > 1 then
		doPlayerSendTextMessage(cid, 20, "[Clan Booster]: "..convertTime(getPlayerStorageValue(cid, 43144) - os.time()).." restantes.")
	end
	
	if getPlayerStorageValue(cid, 9134) ~= -1 then
		doPlayerSendTextMessage(cid, 20, "Você mudou seu antigo nome ("..getPlayerStorageValue(cid, 9134)..") para ("..getCreatureName(cid)..") com êxito.")
		setPlayerStorageValue(cid, 9134, -1)	
	end
	
	return true
end