-- 19278 memory ditto
-- 19279 upgrade memory ditto
-- 19280 memory shiny ditto

local poke = {
	[19278] = "Ditto",
	[19279] = "Ditto",
	[19280] = "Shiny Ditto",
}

function onUse(cid, item, frompos, item2, topos)

    if not isPokeball(item2.itemid) then
		doPlayerSendCancel(cid, "Você deve usar este memory em um "..poke[item.itemid]..".")
		return true
	end
	
	local pokename = isInArray({"Ditto", "Shiny Ditto"}, getItemAttribute(item2.uid, "poke")) and getItemAttribute(item2.uid, "poke") or getItemAttribute(item2.uid, "copyName")
	
	if not isInArray({"Ditto", "Shiny Ditto"}, pokename) then
		doPlayerSendCancel(cid, "Você deve usar este memory em um "..poke[item.itemid]..".")
		return true
	end
	
	if pokename ~= poke[item.itemid] then
		doPlayerSendCancel(cid, "Você deve usar este memory em um "..poke[item.itemid]..".")
		return true
	end
	
	if getItemAttribute(item2.uid, "memory") == 3 then
		doPlayerSendCancel(cid, "Seu "..poke[item.itemid].." já tem full slots no memory.")
		return true		
	end
	
	if	item.itemid == 19278 then
		doItemSetAttribute(item2.uid, "memory", 2)
		doPlayerSendTextMessage(cid, 20, "Parabéns! Você acaba de adicionar um memory de 2 slots em seu Ditto!")
	elseif item.itemid == 19279 then
		if getItemAttribute(item2.uid, "memory") == 2 then
			doItemSetAttribute(item2.uid, "memory", 3)
			doPlayerSendTextMessage(cid, 20, "Parabéns! Você acaba de melhorar o memory de 2 slots para 3 slots em seu Ditto!")
		else
			doPlayerSendCancel(cid, "Este Ditto precisa ter 2 slots no memory atual.")
			return true
		end
	else
		doItemSetAttribute(item2.uid, "memory", 3)
		doPlayerSendTextMessage(cid, 20, "Parabéns! Você acaba de adicionar um memory de 3 slots em seu Shiny Ditto!")
	end
	doRemoveItem(item.uid, 1)
	return true
end
