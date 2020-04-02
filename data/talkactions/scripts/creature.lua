function onSay(cid, words, param, quant, channel)
	local func = doCreateMonster
	local npc = false
	if(words:sub(2, 2) == "n") then
		func = doCreateNpc
		npc = true
	end

	local pid = cid
	local t = string.explode(param, ",")
	t[1] = doCorrectString(t[1])
	--if not pokes[t[1]] and not npc then
	  -- doSendMsg(cid, "O pokemon (" .. t[1] .. ") não existe.")
	  -- return true
	--end
	
	local position = getCreaturePosition(pid)
	local effect = CONST_ME_MAGIC_RED
	
   local quant = t[2] or t[3]	
    quant = tonumber(quant)	
	
	if(quant == '' or quant == nil) then
          local ret = func(t[1], position, false)
	elseif quant > 0 and quant <= 80 then
	      local ret = func(t[1], position, false)
		  for i = 1, quant do
		  addEvent(doCreateMonster, i * 120, t[1], position, false)
		 end
    end
		
	
	if(tonumber(ret) == nil) then
		effect = CONST_ME_POFF
		doPlayerSendDefaultCancel(cid, (ret == false and RETURNVALUE_NOTPOSSIBLE or RETURNVALUE_NOTENOUGHROOM))
	end
   --  print("~~~~~ "..t[1].." sumonado por "..getPlayerName(cid)..". ~~~~~")
	doSendMagicEffect(position, effect)
	return true
end