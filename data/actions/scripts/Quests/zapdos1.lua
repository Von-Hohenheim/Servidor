function onUse (cid,item,frompos,item2,topos)

local p1 = getThingPosWithDebug(cid) p1.x = p1.x+1 
local p2 = getThingPosWithDebug(cid) p2.x = p2.x+1 p2.y = p2.y+1

        UID_DO_BAU = 7020                    
        STORAGE_VALUE = 7020      
		
        local questLvl = 20       

		
    if getPlayerLevel(cid) >= questLvl then   
        if item.uid == UID_DO_BAU then
         queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
                if queststatus == -1 then
		         doSendMagicEffect(getThingPosWithDebug(cid), 11)	
                 doPlayerSendTextMessage(cid,22,"Você recebeu uma grande carga elétrica!")   
                 setPlayerStorageValue(cid,STORAGE_VALUE,1)				 
    --           doPlayerAddExperience(cid, 2000000)            
	--		     doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
    --           doTeleportThing(cid, {x=651, y=1211, z=7})	       
                else
                 doPlayerSendTextMessage(cid,22,"Você já está carregado.")    
                end
        end
    else
     doPlayerSendCancel(cid,'Volte no level '..questLvl.."+")  
    end
	
return 1
end