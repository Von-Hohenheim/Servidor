function onSay(cid, words, param, channel)

	if getPlayerItemCount(cid, 2145) >= 18 then
		doPlayerRemoveItem(cid, 2145, 18)
		doPlayerAddPremiumDays(cid, 60)
		return true
	end
	
return true
end
