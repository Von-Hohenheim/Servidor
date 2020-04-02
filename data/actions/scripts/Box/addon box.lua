local Addons = {19245, 19246, 19249, 19250, 19251, 19252, 19253, 19255, 19256, 19257, 19258, 19260} 
function onUse(cid, item, frompos, item2, topos)
	local level = 20 
	if item.itemid == 19244 then -- id da box
		if getPlayerLevel(cid) >= level then
			local w = math.random (1,#Addons)
			doPlayerAddItem(cid, Addons[w])
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Usted Abrio un Addon Box y Gano >>> ["..getItemNameById(Addons[w]).."] <<<")
			doRemoveItem(item.uid, 1)
		else
			doPlayerSendCancel(cid,"Necesita ser level "..level.."")
		end 
		return true 
	end
end
