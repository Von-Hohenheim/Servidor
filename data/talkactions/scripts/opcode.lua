function onSay(cid, words, param, channel)
local t = string.explode(param, ",")

	if not t then return true end

		doSendPlayerExtendedOpcode(cid, t[1], t[2])
	return true
end