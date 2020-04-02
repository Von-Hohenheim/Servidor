function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Detect.lua")

return true
end