function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Venom Fangs")

return true
end