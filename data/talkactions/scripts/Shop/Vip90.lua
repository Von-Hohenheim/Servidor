function onSay(cid, words, param, channel)

	if getPlayerItemCount(cid, 2145) >= 25 then
		doPlayerRemoveItem(cid, 2145, 25)
		doPlayerAddPremiumDays(cid, 90)
		return true
	end
	
return true
end
