function onSay(cid, words, param, channel)

 local pbAura = getPlayerSlotItem(cid, 8).uid
 local pokeBallName = getItemAttribute(pbAura, "ball")
 
 local premierAuras = {
[1] = 'skull aura',
[2] = 'love aura',
[3] = 'green aura',
[4] = 'yellow aura',
[5] = 'white aura',
[6] = 'gray aura',
[7] = 'cyan aura',
[8] = 'purple',
[9] = 'orange aura',
[10] = 'circulo verde aura',
[11] = 'volcanic aura',
[12] = 'circulo roxo aura',
[13] = 'seavell aura',
[14] = 'naturia aura',
[15] = 'orebound aura',
[16] = 'wingeon aura',
[17] = 'skull aura',
[18] = 'love aura',
[19] = 'red aura',
[20] = 'blue aura',
}
	
	msgAuraX = premierAuras[math.random(1, 20)] 
	local dAura, eAura = msgAuraX:find('(.-) aura')
	auraFinalY = string.sub(msgAuraX, dAura -1, eAura - 5)
  
 if getPlayerSlotItem(cid, 8).uid <= 0 then
		doPlayerSendTextMessage(cid, 27, "Desculpe mas você não possui pokemon no slot principal!")
		return true
		end
 
 if #getCreatureSummons(cid) >= 1 then 
     doPlayerSendTextMessage(cid, 27, "Retorne seu pokemon para a ball!")
     return true
     end   
	 
  
--   if getItemAttribute(pbAura, "premierAura") and getItemAttribute(pbAura, "premierAura") ~= "" then
-- doItemSetAttribute(pbAura, "premierAura", auraFinalY)
-- doPlayerSendTextMessage(cid, 27, "Você trocou sua premier aura para "..auraFinalY)
--   else

-- print("?: "..pokeBallName)

 if pokeBallName == "premier" then
 doItemSetAttribute(pbAura, "aura", auraFinalY)
 doPlayerSendTextMessage(cid, 27, "Você trocou sua premier aura para "..auraFinalY)
 else
 doPlayerSendTextMessage(cid, 27, "O pokemon no slot não possui a premier aura.")
 end
 
 
--   end
 
 
return true
end