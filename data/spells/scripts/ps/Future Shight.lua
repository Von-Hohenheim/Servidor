function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Future Shight")

return true
end