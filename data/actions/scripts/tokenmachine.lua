function onUse(cid, item, frompos, itemEx, topos)
	if item.itemid == 16177 then
	   doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_PLAYER_SHOW_TRADE_HELD, "open")
	   return true
	end
end