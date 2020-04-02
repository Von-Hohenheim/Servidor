function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Stored Pwer")

return true
end