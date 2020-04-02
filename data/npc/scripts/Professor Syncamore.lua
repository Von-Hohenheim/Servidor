local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function doBuyPokemonWithCasinoCoins(cid, poke) npcHandler:onSellpokemon(cid) end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function getPlayerAllTowerItens(cid)
	if getPlayerItemCount(cid, 12163) >= 1000 and getPlayerItemCount(cid, 12161) >= 1000 and getPlayerItemCount(cid, 19500) >= 1500 and getPlayerItemCount(cid, 19501) >= 2000 and getPlayerItemCount(cid, 19540) >= 200 and getPlayerItemCount(cid, 15092) >= 100 and getPlayerItemCount(cid, 15098) >= 100 and getPlayerItemCount(cid, 15094) >= 100 and getPlayerItemCount(cid, 19536) >= 50 then
		return true
	end
	return false
end

function doRemoveItensTower(cid)
	doPlayerRemoveItem(cid, 12163, 1000)
	doPlayerRemoveItem(cid, 12161, 1000)
	doPlayerRemoveItem(cid, 19500, 1500)
	doPlayerRemoveItem(cid, 19501, 2000)
	doPlayerRemoveItem(cid, 19540, 200)
	doPlayerRemoveItem(cid, 15092, 100)
	doPlayerRemoveItem(cid, 15098, 100)
	doPlayerRemoveItem(cid, 15094, 100)
	doPlayerRemoveItem(cid, 19536, 50)
	return true
end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then
return false
end

if (msgcontains(msg, 'Embedded Tower') or msgcontains(msg, 'embedded tower')) then

	if getPlayerStorageValue(cid, 509001) >= 1 then
		selfSay("Não preciso mais de sua ajuda, você agora pode explorar a Embedded Tower!")	
		return true
	end

	if getPlayerStorageValue(cid, 659875) == -1 then 
		 selfSay("Antes de tudo preciso checar se eis forte o suficiente para poder entrar lá, você poderia trazer-me {50x Giant Ruby}, {100x Sharpe Leave}, {100x Pawn}, {100x Crimson Feather}, {200x Linearly Guided Hypnosis}, {2000x enchanted gem}, {2000x Rubber Ball}, {1500x Earth Ball}, {1000x Seed}, {1000x water gem}?", cid)
		 talkState[cid] = 1
	else
		 selfSay("Você já fez seus pedidos?", cid)
		 talkState[cid] = 2
	end

elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[cid] == 1 and getPlayerStorageValue(cid, 659875) == -1 then

	  if getPlayerAllTowerItens(cid) then
	
		doRemoveItensTower(cid)
		selfSay("É dito uma lenda à qual a antiga civilização pokémon adorava 3 grandes deuses que trariam prosperidade, hoje são representado-os pelas {Pedra Sagrada da Floresta}, {Pedra Sagrada da Terra} e a {Pedra Sagrada do Mar}, volte quando feito seus {pedidos}!", cid)
		setPlayerStorageValue(cid, 659875, 1)
	  
	  else
	 
         selfSay("Lembre-se, os itens são {50x Giant Ruby}, {100x Sharpe Leave}, {100x Pawn}, {100x Crimson Feather}, {200x Linearly Guided Hypnosis}, {2000x enchanted gem}, {2000x Rubber Ball}, {1500x Earth Ball}, {1000x Seed}, {1000x water gem}...", cid)
         talkState[cid] = 0
         return true
      end
   
elseif msgcontains(msg, 'pedidos') and getPlayerStorageValue(cid, 659875) == 1 then
       selfSay("Você já fez seus pedidos?", cid)
       talkState[cid] = 2
       
elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[cid] == 2 and getPlayerStorageValue(cid, 659875) == 1 then

		if getPlayerStorageValue(cid, 60900) >= 1 and getPlayerStorageValue(cid, 60901) >= 1 and getPlayerStorageValue(cid, 60902) >= 1 then
			setPlayerStorageValue(cid, 509001, 1)
			setPlayerStorageValue(cid, 78501, 1)
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