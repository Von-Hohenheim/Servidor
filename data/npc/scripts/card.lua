local config = {owner = nil, attacking = nil, lastAttack = nil, started = nil, lastPos = nil, lastTarget = nil} -- não editar
local combatConfig = {
	['Mew'] = {
		basicAttack = {name = "teste", range = 1, attackSpeed = 2, shoot = nil}, 
		spells = {{name = "Thunder Shock", cd = 80, chance = 35, range = 1, lastUse = nil}},--não editar o lastUse
		time = 30 * 60 -- tempo para o npc ser removido em segundos
	}
}

function searchTarget(cid)
	local targetList = {}
	local spectators = getSpectators(getCreaturePosition(cid), 11, 11, false)
	if spectators ~= nil then
		if #spectators > 0 then
			for i, v in pairs(spectators) do
				if isWild(v) or (isSummon(v) and isNpc(getCreatureMaster(v)) and not isPlayer(v) and getCreatureSummons(cid)[1] ~= v)  then
					table.insert(targetList, v)
				end
			end
		end
	end
	if #targetList > 0 then
		return targetList
	else
		return false
	end
end

function getClosestTarget(cid)
	local closest = 15
	local id = 0
	local targets = searchTarget(cid)
	if targets ~= false then 
		for i, v in pairs(targets) do
			local dist = getNpcDistanceTo(v)
			if dist <= closest then
				closest = dist
				id = v
			end
		end
	end
	return id
end

function getFollowTarget(cid)
	local target = getClosestTarget(cid)
	local follow = nil
	if target > 0 and isCreature(target) then
		follow = target
	else
		follow = cid
	end
	return follow
end


function onThink() 
	local npcId = getNpcId()
	local focus = getNpcFocus()
	local combat = combatConfig[getNpcName()]
	selfCanIdle(false)
	if isPlayer(focus) and config.owner ~= focus then
		config.owner = focus
	end
	if isPlayer(config.owner) then
		if config.started == nil then
			config.started = os.time()
		end
		
		if os.time() >= config.started+combat.time then
			doRemoveCreature(npcId)
		end
		
		if isRiderOrFlyOrSurf(config.owner) then
			doRemoveCreature(npcId)
		end

		if isCreature(npcId) and getDistanceBetween(getCreaturePosition(config.owner), getCreaturePosition(npcId)) > 6 then
			doTeleportThing(npcId, getClosestFreeTile(config.owner, getCreaturePosition(config.owner)), false)
		end
		
		if isMonster(config.attacking) and isNpc(npcId) then
			selfAttackedCreature(config.attacking)
			if config.lastAttack == nil or (os.time() >= config.lastAttack+combat.basicAttack.attackSpeed) then
				if isCreature(npcId) and isCreature(config.attacking) and getDistanceBetween(getCreaturePosition(npcId), getCreaturePosition(config.attacking)) <= combat.basicAttack.range then
					if combat.basicAttack.range > 1 then
						if combat.basicAttack.shoot ~= nil then
							doSendDistanceShoot(getCreaturePosition(npcId), getCreaturePosition(config.attacking), combat.basicAttack.shoot)
						end
					end
					doCreatureCastSpell(npcId, combat.basicAttack.name)
					config.lastAttack = os.time()
				end
			end
			if isCreature(npcId) and isCreature(config.attacking) then
				for i, v in pairs(combat.spells) do
					if getDistanceBetween(getCreaturePosition(npcId), getCreaturePosition(config.attacking)) <= v.range then
						local chance = math.random(100)
						if chance < v.chance and (v.lastUse == nil or (os.time() >= v.lastUse+v.cd or v.lastUse == nil)) then
							doCreatureCastSpell(npcId, v.name)
							v.lastUse = os.time()
						end
					end
				end
			end
		end
		config.attacking = getFollowTarget(getNpcMaster(npcId))
	else
		doRemoveCreature(npcId)
	end
end

function onCreatureAppear(cid) 
end

function onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
end