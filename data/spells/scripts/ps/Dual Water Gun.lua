function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Dual Water Gun")

return true
end