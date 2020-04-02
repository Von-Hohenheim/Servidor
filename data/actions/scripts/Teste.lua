function getAllItemsFromContainer(container)
    local containers = {}
    local items = {}
 
    local sitem = container
    if sitem.uid > 0 then
        if isContainer(sitem.uid) then
            table.insert(containers, sitem.uid)
        elseif not(id) or id == sitem.itemid then
            table.insert(items, sitem)
        end
    end
 
    while #containers > 0 do
        for k = (getContainerSize(containers[1]) - 1), 0, -1 do
            local tmp = getContainerItem(containers[1], k)
            if isContainer(tmp.uid) then
                table.insert(containers, tmp.uid)
            elseif not(id) or id == tmp.itemid then
                table.insert(items, tmp)
            end
        end
        table.remove(containers, 1)
    end
 
    return items
end

function onUse(cid, item, frompos, item2, topos)
	local data = getAllItemsFromContainer(item)
	local str = ""
	if #data > 0 then
	for i, v in pairs(data) do
		str = str.."|"..v.itemid.."*"..v.uid.."*"..v.type
	end
	print(str)
	end
	return false
end