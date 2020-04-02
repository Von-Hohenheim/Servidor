function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Static Field")

return true
end