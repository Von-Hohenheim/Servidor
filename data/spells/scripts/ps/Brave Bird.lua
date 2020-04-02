function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Brave Bird")

return true
end