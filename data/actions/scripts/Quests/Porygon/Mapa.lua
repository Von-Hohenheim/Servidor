function onUse(cid, item, fromPosition, itemEx, toPosition)

	doSendPlayerExtendedOpcode(cid, 65, true)
	return true
end