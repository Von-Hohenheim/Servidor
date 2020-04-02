function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Arm Thrust")

return true
end