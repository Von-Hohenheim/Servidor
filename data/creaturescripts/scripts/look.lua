local NPCBattle = {
	["Brock"] = {artig = "He is", cidbat = "Pewter"},
	["Misty"] = {artig = "She is", cidbat = "Cerulean"}, 
	["Blaine"] = {artig = "He is", cidbat = "Cinnabar"},
	["Sabrina"] = {artig = "She is", cidbat = "Saffron"}, --alterado v1.9 \/ peguem tudo!
	["Kira"] = {artig = "She is", cidbat = "Viridian"},
	["Koga"] = {artig = "He is", cidbat = "Fushcia"},
	["Erika"] = {artig = "She is", cidbat = "Celadon"},
	["Surge"] = {artig = "He is", cidbat = "Vermilion"},
}

local shinys = {
	["Shiny Abra"] = "Dark Abra",
	["Shiny Onix"] = "Crystal Onix",
	["Shiny Gyarados"] = "Red Gyarados",
	["Shiny Charizard"] = "Elder Charizard",
	["Shiny Venusaur"] = "Ancient Venusaur",
	["Shiny Blastoise"] = "Ancient Blastoise",
	["Shiny Farfetch'd"] = "Elite Farfetch'd",
	["Shiny Hitmonlee"] = "Elite Hitmonlee",
	["Shiny Himonchan"] = "Elite Hitmonchan",
	["Shiny Snorlax"] = "Big Snorlax",
}


function onLook(cid, thing, position, lookDistance)
	
	local str = {}
	local isTrade = false
	if lookDistance == 0 then isTrade = true end -- trade lookDistanc end
	
	if not isCreature(thing.uid) then
		
		if thing.itemid == 1431 then
			return true
		end
	
		local iname = getItemInfo(thing.itemid)
		local house = getHouseFromPos(position)
		if house and getItemNameById(thing.itemid):find("door") then
		
			if getHouseOwner(house) ~= 0 then
				if not getPlayerNameByGUID(getHouseOwner(house)) then
					setHouseOwner(house, NO_OWNER_PHRASE,true)
				end
			end
		
			local article = thing.type > 1 and thing.type.." " or getItemArticleById(thing.itemid)..(getItemArticleById(thing.itemid) == "" and "" or " ")
			local plural = getItemPluralNameById(thing.itemid) == "" and getItemNameById(thing.itemid).."s" or getItemPluralNameById(thing.itemid)
			local desc = getItemSpecialDescription(thing.uid) == "" and "" or getItemSpecialDescription(thing.uid).." "
			local str = "You see "..(article)..""..(thing.type > 1 and plural or getItemNameById(thing.itemid))..".\nO nome dessa casa é '"..getHouseName(house).."'."
			
			if getHouseOwner(house) ~= 0 then
				str = str.." ".. getPlayerNameByGUID( getHouseOwner(house) ).." é dono dessa casa."
			else
				str = str.." Ninguém é dono dessa casa. \nEla custa "..(getHousePrice(house)/100000).."k."
			end
			if getPlayerAccess(cid) > 2 then
				str = str.."\nItemID: ["..(thing.itemid).."]"
				if thing.actionid > 0 then
					str = str..", ActionID: ["..(thing.actionid).."]"
				end
				if thing.uid < 65536 then
					str = str..", UniqueID: ["..(thing.uid).."]"
				end
				str = str..".\nPosition: [X: "..(getThingPos(thing.uid).x).."] [Y: "..(getThingPos(thing.uid).y).."] [Z: "..(getThingPos(thing.uid).z).."]."
			end
			return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, str) and false
		elseif isPokeball(thing.itemid) and getItemAttribute(thing.uid, "poke") then
			local isDittoBall = isInArray({"Ditto", "Shiny Ditto"}, getItemAttribute(thing.uid, "poke")) and true or false
			unLock(thing.uid)
			local lock = getItemAttribute(thing.uid, "lock") 
			local pokename = isDittoBall and getItemAttribute(thing.uid, "copyName") or getItemAttribute(thing.uid, "poke")
			local heldx = getItemAttribute(thing.uid, "xHeldItem")
			local heldy = getItemAttribute(thing.uid, "yHeldItem")
			local megaID = getItemAttribute(thing.uid, "megaID")
			
			local pokeBallName = getItemAttribute(thing.uid, "ball")
			if not pokeBallName then doItemSetAttribute(thing.uid, "ball", "poke") pokeBallName = "Poke" end
			
		 
			if isGod(cid) then table.insert(str, "ItemID[".. thing.itemid .."] ".." ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n") end
			table.insert(str, "You see ".. doCorrectString(pokeBallName) .."ball.") 
			if getItemAttribute(thing.uid, "unique") then 
				table.insert(str, " It's an unique item.") 
			end
			if getItemAttribute(thing.uid, "unique") then 
				table.insert(str, " It's an unique item.") 
			end
			
			local smeargle = false
			local article = getArticle(pokename)
		 
			if pokename:find("Smeargle") then
				freeSpaces = getFreeSpacesSmeargleBall(thing.uid, getItemAttribute(thing.uid, "SmeargleID"))
				table.insert(str, (freeSpaces > 0 and ".\n [" .. freeSpaces .. "] Skatchs vazios" or (smeargle and ".\n Skatchs completos") or ""))
			end
			
			table.insert(str, "\nIt contains "..getArticle(pokename).." "..pokename.. ((isDittoBall and pokename ~= "Ditto") and " (Ditto)" or "") .. ".\n") 
			if lock and lock > 0 then
				table.insert(str, "It will unlock in ".. os.date("%d/%m/%y %X", lock)..".\n") 
			end
			
			if not getItemAttribute(thing.uid, "memory") and pokename == "Shiny Ditto" then
				doItemSetAttribute(thing.uid, "memory", 3)
			end
			
			if getItemAttribute(thing.uid, "memory") and getItemAttribute(thing.uid, "memory") ~= "without" then
				table.insert(str, "This pokemon has a memory with "..getItemAttribute(thing.uid, "memory").." slots.\n") 
			end
			
			local heldName, heldTier = "", ""
			local heldYName, heldYTier = "", ""
			
			if heldx or heldy then
				if heldx then heldName, heldTier = string.explode(heldx, "|")[1], string.explode(heldx, "|")[2] end
				if heldy then heldYName, heldYTier = string.explode(heldy, "|")[1], string.explode(heldy, "|")[2] end
			end
			
			local boost = getItemAttribute(thing.uid, "boost") or 0
			local boostHeld = 0
			
			if heldName == "X-Boost" then
				boostHeld = heldBoost[tonumber(heldTier)]
			end
			
			if boost > 0 then
				table.insert(str, "Boost level: +"..boost - boostHeld.." "..(boostHeld > 0 and "(+"..boostHeld..")" or "")..".\n")
			end
			
			if getItemAttribute(thing.uid, "addon") then
				table.insert(str, "Addon: "..getItemAttribute(thing.uid, "addon")..".\n")
			end
			
			if getItemAttribute(thing.uid, "nick") then
				table.insert(str, "It's nickname is: "..getItemAttribute(thing.uid, "nick")..".\n")
			end
			
			if getItemAttribute(thing.uid, "aura") == "particle" then
				table.insert(str, "Aura: Particle.\n")
			end
			
			local heldString = heldName .. " (tier: " .. (heldTier or heldx) .. ")"
			local heldYString = heldYName .. (not isInArray({"Mega", "GHOST"}, heldYTier) and " (tier: " .. heldYTier .. ")" or "")
			if heldx and heldy then
				table.insert(str, "Holding: " .. heldString .. " and " .. heldYString .. ". \n")
			elseif heldx then
				table.insert(str, "Holding: "..heldString..". \n")
			elseif heldy then
				table.insert(str, "Holding: "..heldYString ..". \n")
			end
			
			if getPokeballPrice(thing) ~= -1 and not pokename:find("Shiny") and not pokename:find("Castform") then
				table.insert(str, "Price: $"..getPokeballPrice(thing)..".")
			else
				table.insert(str, "Price: Unseable.")
			end	
			
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
			return false
			
		elseif getItemAttribute(thing.uid, "pokeName") and string.find(getItemAttribute(thing.uid, "pokeName"), "fainted") then 
			local lootName = getItemAttribute(thing.uid, "pokeName")
			if isGod(cid) then table.insert(str, "ItemID[".. thing.itemid .."] ".." ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n") end
			
			
			table.insert(str, "You see a "..string.lower(lootName)..". ") 
			if isContainer(thing.uid) then
				table.insert(str, "(Vol: "..getContainerCap(thing.uid)..")")
			end
			if getItemAttribute(thing.uid, "corpseowner") then
				if getItemAttribute(thing.uid, "corpseowner") == "asçdlkasçldkaçslkdçaskdçaslkdçlsakdçkaslç" then
					table.insert(str, "\nSuicidou-se.")
				else
					table.insert(str, "\nEle foi morto por: ("..getItemAttribute(thing.uid, "corpseowner")..")")
				end
			end
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
			return false
			
		elseif isContainer(thing.uid) then --containers
			
			if isGod(cid) then table.insert(str, "ItemID[".. thing.itemid .."] ".." ClientID: ["..getItemInfo(thing.itemid).clientId.."].\n") end
			
			if getItemAttribute(thing.uid, "iname") then
				table.insert(str, "You see "..iname.article.." "..iname.name..". (Vol:"..getContainerCap(thing.uid)..").")
				table.insert(str, getItemAttribute(thing.uid, "iname")..".")
			else 
				table.insert(str, "You see "..iname.article.." "..iname.name..". (Vol:"..getContainerCap(thing.uid)..").")
			end
			if getPlayerGroupId(cid) >= 4 and getPlayerGroupId(cid) <= 6 then
				table.insert(str, "\nItemID: ["..thing.itemid.."]") 
				local pos = getThingPos(thing.uid)
				table.insert(str, "\nPosition: [X: "..pos.x.."][Y: "..pos.y.."][Z: "..pos.z.."]") 
			end
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
			return false
			
		else
			
			if isGod(cid) then 
				
				table.insert(str, "ItemID[".. thing.itemid .."].\n") 
				
			end
			
			local p = getThingPos(thing.uid)
			
			table.insert(str, "You see ")
			if thing.type > 1 then
				table.insert(str, thing.type.." "..iname.plural..".\n")
			else
				table.insert(str, iname.article.." "..iname.name..".\n")
			end
			
			table.insert(str, ""..getItemInfo(thing.itemid).description.."")
			
			if thing.actionid == 6000 then
				sendMsgToPlayer(cid, MESSAGE_INFO_DESCR, "Essa é a Pedra Sagrada da Floresta.")
				return false
			elseif thing.actionid == 6001 then
				sendMsgToPlayer(cid, MESSAGE_INFO_DESCR, "Essa é a Pedra Sagrada da Terra.")
				return false
			elseif thing.actionid == 6002 then
				sendMsgToPlayer(cid, MESSAGE_INFO_DESCR, "Essa é a Pedra Sagrada do Mar.")
				return false
			end
			
			if getItemAttribute(thing.uid, "dono") then
				table.insert(str, "\n Proprietário: "..getItemAttribute(thing.uid, "dono")..".")				
			end
			
			if getItemAttribute(thing.uid, "unique") or isInArray(uniqueItems, thing.itemid) then
				table.insert(str, " It's an unique item.")
			else
				if thing.itemid == 12416 then
					table.insert(str, "\n"..((thing.type > 1 ) and ("Estás moedas equivalem") or ("Está moeda equivale")).." a $".. thing.type * 0.01 ..".")
				elseif thing.itemid == 2148 then
					table.insert(str, "\n"..((thing.type > 1 ) and ("Estás cédulas equivalem") or ("Está cédula equivale")).." a $".. thing.type ..".")
				elseif thing.itemid == 2152 then
					table.insert(str, "\n"..((thing.type > 1 ) and ("Estás cédulas equivalem") or ("Está cédula equivale")).." a $".. (thing.type) / 10 .."k.")
				elseif thing.itemid == 2160 then
					local value = thing.type
					if value < 100 then
						value = (value * 10) .. "k"
					else
						value = value/100 .. "kk"
					end
					table.insert(str, "\n"..((thing.type > 1 ) and ("Estás cédulas equivalem") or ("Está cédula equivale")).." a $".. value ..".")
				elseif thing.itemid == 18828 then
					local value = thing.type
					if value < 100 then
						value = (value * 1) .. "kk"
					else
						value = value/100 .. "kkk"
					end
					table.insert(str, "\n"..((thing.type > 1 ) and ("Estás cédulas equivalem") or ("Está cédula equivale")).." a $".. value ..".")
				elseif priceItemsList[iname.name] then
					table.insert(str, "\nPrice: $".. (priceItemsList[iname.name].price * thing.type)..".")
				end
			end	

			if getItemAttribute(thing.uid, "ChanceCard") then
				table.insert(str, "\n Chance: ["..getChanceCard(thing.uid).."]")
			end			
			
			if getPlayerGroupId(cid) >= 4 then
				table.insert(str, "\nItemID: ["..thing.itemid.."]")
				table.insert(str, "\nPosition: ["..p.x.."]["..p.y.."]["..p.z.."]")
			end
		end
		if isGod(cid) then
			if thing.actionid > 0 then
				table.insert(str, "\nActionID: ["..(thing.actionid).."]")
			end
			table.insert(str, "\nClientID: ["..getItemInfo(thing.itemid).clientId.."]")
		end
		sendMsgToPlayer(cid, MESSAGE_INFO_DESCR, table.concat(str))
		return false
	end
	
	if not isPlayer(thing.uid) and not isMonster(thing.uid) then --outros npcs
		table.insert(str, "You see "..getCreatureName(thing.uid)..".")
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
		return false
	end
	
	if isPlayer(thing.uid) then --player
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, getPlayerDesc(cid, thing.uid, false)) 
		return false
	end
	
	if not isSummon(thing.uid) and not isNpc(getCreatureMaster(thing.uid)) then   --monstros
		local pname = getCreatureName(thing.uid)
			table.insert(str, "You see a wild "..string.lower(pname)..".\n")
		if isGod(cid) then
			table.insert(str, "Hit Points: "..getCreatureHealth(thing.uid).." / "..getCreatureMaxHealth(thing.uid)..".\n")
			table.insert(str, "Looktype: ".. getCreatureOutfit(thing.uid).lookType ..".")
		end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
		return false
		
	elseif (isSummon(thing.uid) or isNpc(getCreatureMaster(thing.uid)))and not isPlayer(thing.uid) then --summons
		
		local boostlevel = getItemAttribute(getPlayerSlotItem(getCreatureMaster(thing.uid), 8).uid, "boost") or 0
		local isDittoBall = isInArray({"Ditto", "Shiny Ditto"}, getItemAttribute(getPlayerSlotItem(getCreatureMaster(thing.uid), 8).uid, "poke")) and true or false
		if getCreatureMaster(thing.uid) == cid then
			local myball = getPlayerSlotItem(cid, 8).uid
			table.insert(str, "You see your "..doCorrectString(getCreatureName(thing.uid)).. (isDittoBall and " (Ditto)" or "") ..".\n")
			if boostlevel > 0 then
				table.insert(str, "\nBoost level: +"..boostlevel..".")
			end
			if isGod(cid) then
				table.insert(str, "Hit Points: "..getCreatureHealth(thing.uid).." / "..getCreatureMaxHealth(thing.uid)..".\n")
				table.insert(str, "Looktype: ".. getCreatureOutfit(thing.uid).lookType ..".")
			end 
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
		else
			local health = "\nHit points: "..getCreatureHealth(thing.uid).."/"..getCreatureMaxHealth(thing.uid).."."
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You see a "..doCorrectString(getCreatureName(thing.uid)).. (isDittoBall and " (Ditto)" or "") ..".\nIt belongs to "..getCreatureName(getCreatureMaster(thing.uid)).."." .. (isGod(cid) and health .. "\nLooktype: ".. getCreatureOutfit(thing.uid).lookType .."." or "") )
		end
		return false
	end
	return true
end