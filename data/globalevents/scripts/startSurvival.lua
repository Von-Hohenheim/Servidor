function onThink(cid, interval, lastExecution)
	
	if getGlobalStorageValue(214689) == 1 then
		addEvent(function()
				 startGolden()	
			end, 3 * 60 * 1000)
	else
		startGolden()
	end
    return true
end  