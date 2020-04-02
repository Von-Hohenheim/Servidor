function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Rage of Punches")

return true
end