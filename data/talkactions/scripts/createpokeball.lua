function onSay(cid, words, param)

local typess = {
[1] = "normal",
[2] = "great",
[3] = "super",
[4] = "ultra"
}

if param == "" then
doPlayerSendCancel(cid, 'Command needs parameters, function structure: "/cb [Pokemon Name], [boost], [Gender]".')
return 0
end

local t = string.explode(param, ",")

local name = ""
local gender = 0
local btype = typess[math.random(1, 4)]                --"normal"
local typeee = typess[math.random(1, 4)]
		
	if t[1] == "shiny mr" or t[1] == "shiny mr. mime" then
		createBall(cid, "Shiny Mr. Mime", 0)
		return true
	end
	
	if t[1] == "shiny giant magikarp" then
		createBall(cid, "Shiny Giant Magikarp", 0)
		return true
	end
	
	if t[1] == "smeargle" or t[1] == "Smeargle" then
		createBall(cid, "Smeargle 1", 0)
		return true
	end	

if t[1] then
	local n = string.explode(t[1], " ")
	local str = string.sub(n[1], 1, 1)
	local sta = string.sub(n[1], 2, string.len(n[1]))
	name = ""..string.upper(str)..""..string.lower(sta)..""
	if n[2] then
	str = string.sub(n[2], 1, 1)
	sta = string.sub(n[2], 2, string.len(n[2]))
	name = name.." "..string.upper(str)..""..string.lower(sta)..""
	end
	if not pokes[name] then
	doPlayerSendCancel(cid, "Sorry, a pokemon with the name "..name.." doesn't exists.")
	return true
	end
print(""..name.." ball has been created by "..getPlayerName(cid)..".")
end

	createBall(cid, name, t[2])
return 1
end

function createBall(cid, name, boost)
local mypoke = pokes[name]
local happy = 255

local item = doCreateItemEx(2219)
doItemSetAttribute(item, "ball", "poke")
doSetAttributesBallsByPokeName(cid, item, name)

if boost and tonumber(boost) > 0 and tonumber(boost) <= 250 then
   doItemSetAttribute(item, "boost", tonumber(boost))
end

doItemSetAttribute(item, "happy", happy)

if name == "Shiny Hitmonchan" or name == "Hitmonchan" then
   doItemSetAttribute(item, "hands", 0)
end

if name == "Ditto" then
	doItemSetAttribute(item, "memory", "without")	
elseif name == "Shiny Ditto" then
	doItemSetAttribute(item, "memory", 2)	
end

if name == "Smeargle 1" or name == "Smeargle" then
   doItemSetAttribute(item, "SmeargleID", 1)
elseif name == "Smeargle 2" or name == "Smeargle2" then 
   doItemSetAttribute(item, "SmeargleID", 2)
elseif name == "Smeargle 3" or name == "Smeargle3" then 
   doItemSetAttribute(item, "SmeargleID", 3)
elseif name == "Smeargle 4" or name == "Smeargle4" then 
   doItemSetAttribute(item, "SmeargleID", 4)
elseif name == "Smeargle 5" or name == "Smeargle5" then 
   doItemSetAttribute(item, "SmeargleID", 5)
elseif name == "Smeargle 6" or name == "Smeargle6" then 
   doItemSetAttribute(item, "SmeargleID", 6)
elseif name == "Smeargle 7" or name == "Smeargle7" then 
   doItemSetAttribute(item, "SmeargleID", 7)
elseif name == "Smeargle 8" or name == "Smeargle8" then 
   doItemSetAttribute(item, "SmeargleID", 8)
end   
   
doItemSetAttribute(item, "description", "Contains a "..name..".")
doItemSetAttribute(item, "fakedesc", "Contains a "..name..".")

local x = pokeballs[name:lower()] or pokeballs[doCorrectString(name)]
	    doPlayerAddItemEx(cid, item, true)		
	    doTransformItem(item, x.on)	
end

