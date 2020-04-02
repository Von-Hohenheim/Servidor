local helds = {
{ids = {15559, 15566, 15573, 15580, 15587, 15594, 15601, 15608, 15615, 15622, 15629, 17315, 17343, 17336, 17322, 17329, 17203, 15636, 17217, 17301, 17375, 17376, 17374, 17377, 17373, 17357, 17308, 17210}, price = 10000000}, --100k
{ids = {15560, 15567, 15574, 15581, 15588, 15595, 15602, 15609, 15616, 15623, 15630, 17316, 17344, 17337, 17323, 17330, 17204, 15637, 17218, 17302, 17358, 17309, 17211}, price = 22000000}, -- 220k
{ids = {15561, 15568, 15575, 15582, 15589, 15596, 15603, 15610, 15617, 15624, 15631, 17317, 17345, 17338, 17324, 17331, 17205, 15638, 17219, 17303, 17359, 17310, 17212, 17367}, price = 37000000}, -- 370k
{ids = {15562, 15569, 15576, 15583, 15590, 15597, 15604, 15611, 15618, 15625, 15632, 17318, 17339, 17325, 17332, 17206, 15639, 17220, 17304, 17360, 17347, 17311, 17213}, price = 100000000}, -- 1kk
{ids = {15563, 15570, 15577, 15584, 15591, 15598, 15605, 15612, 15619, 15626, 15633, 17319, 17346, 17340, 17326, 17333, 17207, 15640, 17221, 17305, 17361, 17312, 17214, 15643, 17372, 17365, 17370, 17368}, price = 150000000}, -- 1.5kk
{ids = {15564, 15571, 15578, 15585, 15592, 15599, 15606, 15613, 15620, 15627, 15634, 17320, 17348, 17341, 17327, 17334, 17208, 15641, 17222, 17306, 17362, 17313, 17215}, price = 200000000}, -- 2kk
{ids = {15565, 15572, 15579, 15586, 15593, 15600, 15607, 15614, 15621, 15628, 15635, 17321, 17349, 17342, 17328, 17335, 17209, 15642, 17223, 17307, 17363, 17314, 17216, 17369, 17364, 17366}, price = 250000000}, -- 2.5kk
}

function onUse(cid, item, frompos, item2, topos) 
	
	local needDirection = getDirectionTo(getCreaturePosition(cid), frompos)
	doCreatureSetLookDir(cid, needDirection)
	local machine_pos = {x=frompos.x-1,y=frompos.y,z=frompos.z}
	local helds_ = {}
	local machine = getTileItemById(machine_pos, 16178)
	if machine and isContainer(machine.uid) then
		local held_item = getContainerItem(machine.uid, 0)
		local held_item1 = getContainerItem(machine.uid, 1)
		local held_item2 = getContainerItem(machine.uid, 2)
		if held_item.itemid > 0 and held_item1.itemid > 0 and held_item2.itemid > 0 then
			for p, h in pairs(helds) do
				local uids = {}
				for i=1,#h.ids do 
					if #uids < 3 then
						if held_item.itemid == h.ids[i] then
							table.insert(uids,held_item.uid)
						end
						if held_item1.itemid == h.ids[i] then
							table.insert(uids,held_item1.uid)
						end
						if held_item2.itemid == h.ids[i] then
							table.insert(uids,held_item2.uid)
						end
					end
					if #uids == 3 then
						table.insert(helds_,{tier=p,uid=uids,price=h.price})
						uids = {}
					end
				end
			end
		end
	end
	local sendMsg_fail = false
	local msg_fail = "Não foi possível fazer a fusão verifique os held's colocados."
	if #helds_ > 0 then
		for p, h in pairs(helds_) do
			if doPlayerRemoveMoney(cid,h.price) == true then
				local new_held = h.tier < 7 and h.tier+1 or 7
				local rheld = math.random(1, #helds[new_held].ids)
				doPlayerAddItem(cid,helds[new_held].ids[rheld])
				doSendMsg(cid, "Você criou um novo Held item.")
				for z, v in pairs(h.uid) do
					if v then
						doRemoveItem(v,1)
					end
				end
			else
				sendMsg_fail = true
				msg_fail = "Você precisa de $".. h.price/100 .."."
			end
		end
	end
	if #helds_ == 0 or sendMsg_fail then
		doPlayerSendCancel(cid,msg_fail)
		doSendMagicEffect(getThingPos(cid), 2)
	end
	
	return true
end