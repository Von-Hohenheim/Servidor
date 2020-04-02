local Stones = {11441, 11442, 11443, 11444, 11445, 11446, 11447, 11448, 11450, 11451, 11452, 11453, 11454} 

function onUse(cid, item, frompos, item2, topos)
	if item.itemid == 19265 then -- id da box
			local w = math.random (1,#Stones)
			doPlayerAddItem(cid, Stones[w], math.random(1, 3))
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Você abriu um Yellow Present e ganhou >>> ["..getItemNameById(Stones[w]).."] <<<")
			doRemoveItem(item.uid, 1)	
	end
	return true 
end
