function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Shadow Sneak")

return true
end