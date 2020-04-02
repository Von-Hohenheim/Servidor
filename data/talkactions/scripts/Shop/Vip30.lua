function onSay(cid, words, param, channel)

	if getPlayerItemCount(cid, 2145) >= 10 then
		doPlayerRemoveItem(cid, 2145, 10)
		doPlayerAddPremiumDays(cid, 30)
		return true
	end
	
return true
end
