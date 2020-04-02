local Balls = {2394, 2391, 2393, 2392, 15672, 15673, 15674, 15675, 15676, 15677, 15678, 15679, 156780, 15681, 15682}
 
function onUse(cid, item, frompos, item2, topos)
		if item.itemid == 19266 then 
			 local w = math.random (1, #Balls)
			 local countBalls = math.random(1, 27)
			 doPlayerAddItem(cid, Balls[w], countBalls)
			 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Você abriu um Blue Present e ganhou >>> ["..countBalls.." "..getItemNameById(Balls[w]).."s] <<<")
			 doRemoveItem(item.uid, 1)			
		end
	return true 
end
