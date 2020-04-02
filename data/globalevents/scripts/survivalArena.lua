function onTimer()

	setGlobalStorageValue(254600, 1)
	setGlobalStorageValue(254601, 1)
	addEvent(setGlobalStorageValue, 5 * 60 * 1000, 254601, -1)
	doBroadcastMessage("[Survival Arena]: O evento irá começar em 5 minutos, você é forte o suficiente para participar?")			
	addEvent(doBroadcastMessage, 1 * 60 * 1000, "[Survival Arena]: O evento irá começar em 4 minutos, você é forte o suficiente para participar?")
	addEvent(doBroadcastMessage, 2 * 60 * 1000, "[Survival Arena]: O evento irá começar em 3 minutos, você é forte o suficiente para participar?")
	addEvent(doBroadcastMessage, 3 * 60 * 1000, "[Survival Arena]: O evento irá começar em 2 minutos, você é forte o suficiente para participar?")
	addEvent(doBroadcastMessage, 4 * 60 * 1000, "[Survival Arena]: O evento será fechado em 1 minuto.")		
	return true	
end