function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Rapid Spin")

return true
end