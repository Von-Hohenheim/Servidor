function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Force Palm")

return true
end