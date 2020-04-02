function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Slack Off")

return true
end