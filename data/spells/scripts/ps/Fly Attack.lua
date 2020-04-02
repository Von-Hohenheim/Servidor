function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Fly Attack")

return true
end