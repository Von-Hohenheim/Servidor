function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Cold Storm")

return true
end