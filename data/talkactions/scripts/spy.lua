function getItemsInContainer(cont, sep)
local text = ""
local tsep = ""
local count = ""

	for i= 1, sep do
		tsep = tsep..""
	end

	tsep = tsep..""
	
	for i=0, getContainerSize(cont.uid)-1 do
		local item = getContainerItem(cont.uid, i)
			if isContainer(item.uid) == FALSE then	
				if item.type > 0 then
					count = "\n Count: "..item.type..""
				end
				
				if item.type == 0 then
					count = "\n Count: N/A"
				end
				
				text = text.."\n• Name: "..tsep..getItemNameById(item.itemid).." "..count
			else
			
				if getContainerSize(item.uid) > 0 then
					text = text.."\n\n- Extra Bag:"
					text = text..getItemsInContainer(item, sep+2)
				end
			end
	end
	
	return text
end

function onSay(cid, words, param, channel)
	
	if(param == "") then
		doPlayerSendCancel(cid, "You will need put a name.")
		return true
	end
	
local slotName = {"2", "3", "Backpack", "4", "5", "6", "7", "8", "9", "1"}
local player = getPlayerByNameWildcard(param)

	if isPlayer(player) == true then
	local text = getPlayerName(player).." actual equip:\n" 
		for i= 3, 4 do
			text = text.."\n"
			local item = getPlayerSlotItem(player, i)
				if item.itemid > 0 then
					if isContainer(item.uid) == true then
						text = text..slotName[i]..": "..getItemNameById(item.itemid)..getItemsInContainer(item, 1)
					end
				else
					text = text..slotName[i]..": Empty"
				end
			end
				doShowTextDialog(cid, 6579, text)
		else
			doPlayerSendCancel(cid, "This player are offline.")
	end
	
return true
end