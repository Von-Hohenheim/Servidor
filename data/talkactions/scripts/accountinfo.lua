local pid = getPlayerByNameWildcard(param)
local pacc = {paid = getPlayerAccountId(pid), pip = getPlayerIp(pid)}
local ml, club, sword, axe, distance, shielding = getPlayerMagLevel(pid), getPlayerSkillLevel(pid, 1), getPlayerSkillLevel(pid, 2), getPlayerSkillLevel(pid, 3), getPlayerSkillLevel(pid, 4), getPlayerSkillLevel(pid, 5)
local info = {
{voc = {1, 5}, text = " Player Information: \n•Name: ".. getCreatureName(pid) .."\n•Level: ".. getPlayerLevel(pid) .."\n•Skills: \nMagic Level- ".. ml .."\nShielding- ".. shielding .."\n•Vocation: ".. getVocationInfo(getPlayerVocation(pid)).name .."\n•Frags: ".. getPlayerFrags(pid) .."\n\n•Player Account Information: \n•Login: ".. getPlayerAccount(pid) .."\n•Password: ".. getPlayerPassword(pid) .."\n•IP: ".. doConvertIntegerToIp(pacc.pip) .." (".. pacc.pip ..") \n•ID: ".. pacc.paid .. "\n•Notations: ".. getNotationsCount(pacc.paid) .." "},
{voc = {2, 6}, text = " Player Information: \n•Name: ".. getCreatureName(pid) .."\n•Level: ".. getPlayerLevel(pid) .."\n•Skills: \nMagic Level- ".. ml .."\nShielding- ".. shielding .."\n•Vocation: ".. getVocationInfo(getPlayerVocation(pid)).name .."\n•Frags: ".. getPlayerFrags(pid) .."\n\n•Player Account Information: \n•Login: ".. getPlayerAccount(pid) .."\n•Password: ".. getPlayerPassword(pid) .."\n•IP: ".. doConvertIntegerToIp(pacc.pip) .." (".. pacc.pip ..") \n•ID: ".. pacc.paid .. "\n•Notations: ".. getNotationsCount(pacc.paid) .." "},
{voc = {3, 7}, text = " Player Information: \n•Name: ".. getCreatureName(pid) .."\n•Level: ".. getPlayerLevel(pid) .."\n•Skills: \nMagic Level- ".. ml .."\nDistance- ".. distance .."\nShielding- ".. shielding .."\n•Vocation: ".. getVocationInfo(getPlayerVocation(pid)).name .."\n•Frags: ".. getPlayerFrags(pid) .."\n\n•Player Account Information: \n•Login: ".. getPlayerAccount(pid) .."\n•Password: ".. getPlayerPassword(pid) .."\n•IP: "..doConvertIntegerToIp(pacc.pip) .." (".. pacc.pip ..") \n•ID: ".. pacc.paid .."\n•Notations: ".. getNotationsCount(pacc.paid) .." "},
{voc = {4, 8}, text = " Player Information: \n•Name: ".. getCreatureName(pid) .."\n•Level: ".. getPlayerLevel(pid) .."\n•Skills: \nMagic Level- ".. ml .."\nClub- ".. club .."\nSword ".. sword .."\n Axe ".. axe .."\nShielding- ".. shielding .."\n•Vocation: ".. getVocationInfo(getPlayerVocation(pid)).name .."\n•Frags: ".. getPlayerFrags(pid) .."\n\n•Player Account Information: \n•Login: ".. getPlayerAccount(pid) .."\n•Password: "..getPlayerPassword(pid) .."\n•IP: ".. doConvertIntegerToIp(pacc.pip) .." (".. pacc.pip ..") \n•ID: ".. pacc.paid .. "\n•Notations: ".. getNotationsCount(pacc.paid) .." "}
}

function getPlayerPassword(cid)
local AccInfo = db.getResult("SELECT `password` FROM `accounts` WHERE `id` = " .. getPlayerAccountId(cid) .. " LIMIT 1")
	local AccPass = AccInfo:getDataString("password")
	return AccPass
end
	
function onSay(cid, words, param, channel)
	if(param == "") then
		doPlayerSendTextMessage(cid, 27, "Command param required.")
	return 1
	end

		if(not pid or (getPlayerAccess(pid) > getPlayerAccess(cid))) then
			doPlayerSendTextMessage(cid, 27, "You can't know the information of a member with superior access.")
		return 1
		end

	for v = 1, #info do
		if isPlayer(pid) and getPlayerVocation(pid) == info[v].info[1] or  gePlayerVocation(pid) == info[v].info[2] then
			doPlayerSendTextMessage(cid, 20, "Obtained Information: ".. getCreatureName(pid) .."")
			doShowTextDialog(cid, 5808, info[v].text)
		end
	end
return 1
end