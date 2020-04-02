function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Shadow Wave")

return true
end