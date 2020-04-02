function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Will-O-Wisp")

return true
end