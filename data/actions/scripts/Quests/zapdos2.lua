function onUse (cid,item,frompos,item2,topos)

local p1 = getThingPosWithDebug(cid) p1.x = p1.x+1 
local p2 = getThingPosWithDebug(cid) p2.x = p2.x+1 p2.y = p2.y+1

        UID_DO_BAU = 7021                    
        STORAGE_VALUE = 7021      
		
        local questLvl = 20       

		
    if getPlayerLevel(cid) >= questLvl then   
        if item.uid == UID_DO_BAU then
         queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
            if queststatus == -1 then
			    if getPlayerStorageValue(cid,7020) >= 1 then -- storage da carga elétrica
		         doSendMagicEffect({x=1729, y=862, z=9}, 11)	  
                 setPlayerStorageValue(cid,7020,-1)				
                 addEvent(doTeleportThing, 250, cid, {x=1727, y=860, z=8})				 
--                 setPlayerStorageValue(cid,STORAGE_VALUE,1)				 
    --           doPlayerAddExperience(cid, 2000000)            
	--		     doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
                else
				 doSendMagicEffect(getThingPosWithDebug(cid), 307)	
                 doPlayerSendTextMessage(cid,22,"Está pedra mágica precisa de uma grande carga elétrica para funcionar.") 
                end				 
            else
            doPlayerSendTextMessage(cid,22,"Contate um adm.")    
            end
        end
    else
     doPlayerSendCancel(cid,'Volte no level '..questLvl.."+")  
    end
	
return 1
end