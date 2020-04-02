function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Shadow Mist")

return true
end