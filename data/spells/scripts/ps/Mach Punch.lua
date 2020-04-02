function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Mach Punch")

return true
end