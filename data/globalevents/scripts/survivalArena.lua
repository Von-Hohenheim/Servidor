function onTimer()

	setGlobalStorageValue(254600, 1)
	setGlobalStorageValue(254601, 1)
	addEvent(setGlobalStorageValue, 5 * 60 * 1000, 254601, -1)
	doBroadcastMessage("[Survival Arena]: O evento ir� come�ar em 5 minutos, voc� � forte o suficiente para participar?")			
	addEvent(doBroadcastMessage, 1 * 60 * 1000, "[Survival Arena]: O evento ir� come�ar em 4 minutos, voc� � forte o suficiente para participar?")
	addEvent(doBroadcastMessage, 2 * 60 * 1000, "[Survival Arena]: O evento ir� come�ar em 3 minutos, voc� � forte o suficiente para participar?")
	addEvent(doBroadcastMessage, 3 * 60 * 1000, "[Survival Arena]: O evento ir� come�ar em 2 minutos, voc� � forte o suficiente para participar?")
	addEvent(doBroadcastMessage, 4 * 60 * 1000, "[Survival Arena]: O evento ser� fechado em 1 minuto.")		
	return true	
end