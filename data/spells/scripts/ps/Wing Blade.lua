function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Wing Blade")

return true
end