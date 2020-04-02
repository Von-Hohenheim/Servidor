function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Ground Elevation")

return true
end