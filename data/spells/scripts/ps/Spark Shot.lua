function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Spark Shot")

return true
end