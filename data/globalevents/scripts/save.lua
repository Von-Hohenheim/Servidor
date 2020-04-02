local config = {
	broadcast = {120, 60, 30, 5}, -- 60
	shallow = "no",
	delay = 60, --120
	events = 60
}

config.shallow = getBooleanFromString(config.shallow)

local function executeSave(seconds)
	if(seconds > 0) then
		addEvent(executeSave, config.events * 1200, seconds - config.events)
	else
		doSaveServer(config.shallow)
	end
end

function onThink(interval)
	if(table.maxn(config.broadcast) == 0) then
		doSaveServer(config.shallow)
	else
		executeSave(config.delay)
	end

	return true
end
