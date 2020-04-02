function onStartup()

	setGlobalStorageValue(254600, 0)
	setGlobalStorageValue(254601, 0)
	setGlobalStorageValue(214689, 0)
	setGlobalStorageValue(245679, 0)
	setGlobalStorageValue(254000, 0)
	db.executeQuery("UPDATE `players` SET `online` = 0 WHERE `world_id` = " .. getConfigValue('worldId') .. ";")
	return true
end