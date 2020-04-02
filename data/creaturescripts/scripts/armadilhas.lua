function onTarget(cid, target)

	if isWild(cid) and getCreatureName(cid) == "Aporygon" then
		while getCreatureLookDirection(cid) ~= SOUTH do
			doCreatureSetLookDirection(cid, SOUTH)
			print("teste")
		end
	end
	
return true
end