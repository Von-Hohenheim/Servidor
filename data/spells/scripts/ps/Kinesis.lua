function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Kinesis")

return true
end