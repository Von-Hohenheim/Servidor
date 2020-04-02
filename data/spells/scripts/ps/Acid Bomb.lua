function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Acid Bomb")

return true
end