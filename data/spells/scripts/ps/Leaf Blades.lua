function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Leaf Blades")

return true
end