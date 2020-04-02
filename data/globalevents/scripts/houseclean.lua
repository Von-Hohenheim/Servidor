function onTimer()
	
	local days = 31*24*60*60 -- 21 dias
	
	doSaveServer()
	
	local query = db.getResult("SELECT `owner`,`id` FROM `houses`;")
	
	if (query:getID() ~= -1) then
		
		while true do
			
			local own,houseid = query:getDataInt("owner"),query:getDataInt("id")
			local qry = db.getResult("SELECT `lastlogin` FROM `players` WHERE `id` = "..own)
			
			if(qry:getID() ~= -1) then		
				last = tonumber(qry:getDataInt("lastlogin"))	
				if last < os.time() - days then
					setHouseOwner(houseid, NO_OWNER_PHRASE,true)		
				end
			end
			
			local qry2 = db.getResult("SELECT `account_id` FROM `players` WHERE `id` = "..own)
			
			if(qry2:getID() ~= -1) then
				aid = tonumber(qry2:getDataInt("account_id"))
				local qry3 = db.getResult("SELECT `premdays` FROM `accounts` WHERE `id` = "..aid)
				if(qry3:getID() ~= -1) then
					premiumDays = tonumber(qry3:getDataInt("premdays"))
					if premiumDays < 1 then					
						setHouseOwner(houseid, NO_OWNER_PHRASE,true)					
					end
				end
			end
			
			if not(query:next()) then
				break
			end
			
		end
		
		query:free()
		
	end
	
	return true
	
end