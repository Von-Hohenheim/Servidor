function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Constric Prison")

return true
end