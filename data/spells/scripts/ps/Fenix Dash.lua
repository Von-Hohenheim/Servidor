function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Fenix Dash")

return true
end