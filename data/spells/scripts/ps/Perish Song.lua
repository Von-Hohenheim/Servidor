function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Perish Song")

return true
end