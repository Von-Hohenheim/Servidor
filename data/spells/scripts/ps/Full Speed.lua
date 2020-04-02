function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Full Speed")

return true
end