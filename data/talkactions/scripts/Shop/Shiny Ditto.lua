function onSay(cid, words, param, channel)

	if getPlayerItemCount(cid, 2145) >= 80 then
		local ball = createBall(cid, "Shiny Ditto", 0, false)
		doItemSetAttribute(ball, "memory", 2)		
		doPlayerRemoveItem(cid, 2145, 80)
		return true
	end
	
return true
end
