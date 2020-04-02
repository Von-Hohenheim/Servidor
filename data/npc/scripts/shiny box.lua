local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function doBuyPokemonWithCasinoCoins(cid, poke) npcHandler:onSellpokemon(cid) end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then
return false
end

   local need = {
    --  {id = 12161, qt = 1000}, --water gem
     -- {id = 19500, qt = 1500}, --earth ball
     -- {id = 13785, qt = 500}, --enchanted gem	
     -- {id = 19540, qt = 200}, --Linearly Guided	
      {id = 2160, qt = 50}, --Giant Ruby	  
   }

if (msgcontains(msg, 'Embedded Tower') or msgcontains(msg, 'embedded tower')) then

	if getPlayerStorageValue(cid, 50901) >= 1 then
		selfSay("Não preciso mais de sua ajuda, pode explorar a Embedded Tower")	
		return true
	end

	if getPlayerStorageValue(cid, 659875) == -1 then 
		 selfSay("Antes de tudo preciso checar se eis forte o suficiente para poder entrar lá, você poderia trazer-me {100x Sharp Leave}, {100x Pawn}, {100x Crimson Feather}, {2000x Rubber Ball}, {1500x Earth Ball}, {1000x Seed}?", cid)
		 talkState[cid] = 1
	else
		 selfSay("Você já fez seus pedidos?", cid)
		 talkState[cid] = 2
	end

elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[cid] == 1 and getPlayerStorageValue(cid, 659875) == -1 then

	  if getPlayerItemCount(cid, need[1].id) >= need[1].qt then
		
		for i = 1, #need do
          doPlayerRemoveItem(cid, need[i].id, need[i].qt)
		end
	  
		selfSay("É dito uma lenda à qual a antiga civilização pokémon adorava 3 grandes deuses que trariam prosperidade, hoje são representado-os pelas {Pedra Sagrada da Floresta}, {Pedra Sagrada da Terra} e a {Pedra Sagrada do Mar}, volte quando feito seus {pedidos}!", cid)
		setPlayerStorageValue(cid, 659875, 1)
	  
	  else
	 
         selfSay("Lembre-se, os itens são {100x Sharp Leave}, {100x Pawn}, {100x Crimson Feather}, {2000x Rubber Ball}, {1500x Earth Ball}, {1000x Seed}...", cid)
         talkState[cid] = 0
         return true
      end
   
elseif msgcontains(msg, 'pedidos') and getPlayerStorageValue(cid, 659875) == 1 then
       selfSay("Você já fez seus pedidos?", cid)
       talkState[cid] = 2
       
elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[cid] == 2 and getPlayerStorageValue(cid, 659875) == 1 then

		if getPlayerStorageValue(cid, 60900) >= 1 and getPlayerStorageValue(cid, 60901) >= 1 and getPlayerStorageValue(cid, 60902) >= 1 then
			setPlayerStorageValue(cid, 50901, 1)
			selfSay("Pronto agora você pode acessar a tower!", cid)
			talkState[talkUser] = 0		
		else
			selfSay("Você não fez seus pedidos às 3x pedras sagradas;", cid)
			talkState[talkUser] = 0	
		end
    
elseif (msgcontains(msg, 'no') or msgcontains(msg, 'nao')) then
     selfSay("So good bye...", cid)
     talkState[cid] = 0
     return false 
end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())