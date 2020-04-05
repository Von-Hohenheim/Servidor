pokes = {

-- [[* Balanceamento em relação a diferença de status entre a 1 e 2º geração com excessão dos iniciais será de 0.5 a 2.0 de stats ]] --
-- [[* Agility: Min = 190, Max = 450]] --
-- [[* Explicação para não bugar sua mente, Primeiro é o pokemon base dos status ou seja aquele que foi baseado a alteração do segundo, vamos supor o chikorita foi baseado no status do bulbasaur ]] --
-- [[* OBS: A LISTA ESTÁ PELA ORDEM DE BASE DE BALANCEAMENTO NÃO DA POKEDEX.]] --
	
	
	['Bulbasaur'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 190, exp = 250, level = 20, wildLvl = 1, type = 'grass', type2 = 'poison'},

	['Ivysaur'] = {offense = 0.9, defense = 5.5, specialattack = 7.8, life = 1200, vitality = 6.8, agility = 200, exp = 450, level = 40, wildLvl = 1, type = 'grass', type2 = 'poison'},	
	
	['Venusaur'] = {offense = 1, defense = 8.7, specialattack = 8.8, life = 1800, vitality = 8, agility = 300, exp = 1800, level = 80, wildLvl = 1, type = 'grass', type2 = 'poison'},
	
	['Shiny Venusaur'] = {offense = 1, defense = 10, specialattack = 8, life = 1800, vitality = 8, agility = 300, exp = 1800, level = 100, wildLvl = 5, type = 'grass', type2 = 'poison'},

	['Charmander'] = {offense = 1, defense = 3, specialattack = 4, life = 700, vitality = 2.5, agility = 200, exp = 250, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Charmeleon'] = {offense = 1.2, defense = 5, specialattack = 8.3, life = 1000, vitality = 6.8, agility = 200, exp = 450, level = 40, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Charizard'] = {offense = 1.5, defense = 8.5, specialattack = 9.3, life = 1600, vitality = 8, agility = 300, exp = 1800, level = 80, wildLvl = 1, type = 'fire', type2 = 'flying'},
	
	['Shiny Charizard'] = {offense = 1.5, defense = 8.5, specialattack = 9.3, life = 1600, vitality = 8, agility = 300, exp = 1800, level = 100, wildLvl = 5, type = 'fire', type2 = 'flying'},
	
	['Squirtle'] = {offense = 0.5, defense = 4, specialattack = 3, life = 900, vitality = 2.5, agility = 190, exp = 250, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Wartortle'] = {offense = 0.7, defense = 6.5, specialattack = 7.3, life = 1400, vitality = 6.8, agility = 200, exp = 450, level = 40, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Blastoise'] = {offense = 0.9, defense = 9.2, specialattack = 8, life = 2000, vitality = 8, agility = 300, exp = 1800, level = 80, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Shiny Blastoise'] = {offense = 0.9, defense = 9.2, specialattack = 12, life = 2000, vitality = 8, agility = 300, exp = 1800, level = 100, wildLvl = 5, type = 'water', type2 = 'no type'},
	
	['Oddish'] = {offense = 0.4, defense = 2, specialattack = 1.8, life = 400, vitality = 3, agility = 200, exp = 100, level = 5, wildLvl = 1, type = 'grass', type2 = 'poison'},
	
	['Shiny Oddish'] = {offense = 0.4, defense = 2, specialattack = 1.8, life = 400, vitality = 3, agility = 200, exp = 100, level = 20, wildLvl = 5, type = 'grass', type2 = 'poison'},
	
	['Gloom'] = {offense = 0.5, defense = 5.9, specialattack = 4.2, life = 900, vitality = 5.5, agility = 115, exp = 250, level = 30, wildLvl = 1, type = 'grass', type2 = 'poison'},
		
	['Vileplume'] = {offense = 1, defense = 6.5, specialattack = 6.5, life = 1100, vitality = 7, agility = 200, exp = 750, level = 50, wildLvl = 1, type = 'grass', type2 = 'poison'},
		
	['Shiny Vileplume'] = {offense = 1, defense = 6, specialattack = 6.5, life = 1100, vitality = 5, agility = 200, exp = 750, level = 80, wildLvl = 5, type = 'grass', type2 = 'poison'},
	
	['Bellossom'] = {offense = 1, defense = 6.8, specialattack = 8.1, life = 1400, vitality = 7, agility = 200, exp = 900, level = 50, wildLvl = 1, type = 'grass', type2 = 'poison'},

	['Seel'] = {offense = 0.7, defense = 6, specialattack = 1.5, life = 1050, vitality = 3, agility = 200, exp = 350, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Dewgong'] = {offense = 1.2, defense = 7, specialattack = 7, life = 1800, vitality = 5.5, agility = 200, exp = 900, level = 60, wildLvl = 1, type = 'water', type2 = 'ice'},

	['Spearow'] = {offense = 0.7, defense = 5, specialattack = 1.5, life = 650, vitality = 2.4, agility = 200, exp = 100, level = 10, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Fearow'] = {offense = 1.3, defense = 8, specialattack = 6.8, life = 1600, vitality = 4.5, agility = 220, exp = 850, level = 50, wildLvl = 1.7, type = 'normal', type2 = 'flying'},
	
	['Shiny Fearow'] = {offense = 1.3, defense = 8, specialattack = 6.8, life = 1600, vitality = 4.5, agility = 220, exp = 850, level = 80, wildLvl = 5, type = 'normal', type2 = 'flying'},

	['Weedle'] = {offense = 0.5, defense = 3, specialattack = 1, life = 210, vitality = 3, agility = 150, exp = 100, level = 1, wildLvl = 1, type = 'bug', type2 = 'poison'},
	
	['Kakuna'] = {offense = 1, defense = 4.5, specialattack = 2.5, life = 900, vitality = 4, agility = 200, exp = 130, level = 12, wildLvl = 1, type = 'bug', type2 = 'poison'},
	
	['Beedrill'] = {offense = 1.3, defense = 5.5, specialattack = 6, life = 1170, vitality = 4.5, agility = 240, exp = 255, level = 30, wildLvl = 1, type = 'bug', type2 = 'poison'},
	
	['Shiny Beedrill'] = {offense = 1.3, defense = 5.5, specialattack = 6, life = 1170, vitality = 4.5, agility = 240, exp = 255, level = 50, wildLvl = 5, type = 'bug', type2 = 'poison'},

	['Caterpie'] = {offense = 0.5, defense = 3, specialattack = 1, life = 210, vitality = 3, agility = 180, exp = 100, level = 1, wildLvl = 1, type = 'bug', type2 = 'no type'},
	
	['Metapod'] = {offense = 1, defense = 4.5, specialattack = 2.5, life = 900, vitality = 3.9, agility = 170, exp = 120, level = 12, wildLvl = 1, type = 'bug', type2 = 'no type'},
	
	['Butterfree'] = {offense = 1.3, defense = 5.5, specialattack = 6, life = 1170, vitality = 4.5, agility = 240, exp = 255, level = 30, wildLvl = 1, type = 'bug', type2 = 'no type'},
		
	['Shiny Butterfree'] = {offense = 1.3, defense = 5.5, specialattack = 6, life = 1170, vitality = 4.5, agility = 240, exp = 255, level = 50, wildLvl = 5, type = 'bug', type2 = 'no type'},
	
	['Zubat'] = {offense = 0.5, defense = 3.5, specialattack = 1.5, life = 650, vitality = 4, agility = 200, exp = 80, level = 10, wildLvl = 1, type = 'poison', type2 = 'flying'},
	
	['Golbat'] = {offense = 1, defense = 6, specialattack = 6.4, life = 1150, vitality = 5, agility = 220, exp = 250, level = 35, wildLvl = 1, type = 'poison', type2 = 'flying'},

	['Crobat'] = {offense = 2.5, defense = 8, specialattack = 7.6, life = 1900, vitality = 7, agility = 250, exp = 1500, level = 80, wildLvl = 1, type = 'poison', type2 = 'flying'},
	
	['Shiny Zubat'] = {offense = 0.5, defense = 3.5, specialattack = 1.5, life = 650, vitality = 4, agility = 200, exp = 80, level = 30, wildLvl = 5, type = 'poison', type2 = 'flying'},
	
	['Shiny Golbat'] = {offense = 1, defense = 6, specialattack = 6.4, life = 1150, vitality = 5, agility = 220, exp = 250, level = 50, wildLvl = 5, type = 'poison', type2 = 'flying'},

	['Shiny Crobat'] = {offense = 2.5, defense = 8, specialattack = 7.6, life = 1900, vitality = 7, agility = 250, exp = 1500, level = 80, wildLvl = 5, type = 'poison', type2 = 'flying'},

	['Goldeen'] = {offense = 0.7, defense = 6, specialattack = 1.5, life = 450, vitality = 3, agility = 200, exp = 150, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},
		
	['Seaking'] = {offense = 1.3, defense = 7, specialattack = 6, life = 2000, vitality = 6.3, agility = 200, exp = 350, level = 35, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Pichu'] = {offense = 0.5, defense = 2.5, specialattack = 1.8, life = 700, vitality = 1.4, agility = 200, exp = 250, level = 10, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Pikachu'] = {offense = 0.7, defense = 5.4, specialattack = 3.2, life = 1400, vitality = 3.4, agility = 200, exp = 450, level = 20, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Raichu'] = {offense = 1.5, defense = 8, specialattack = 8.5, life = 2200, vitality = 7.7, agility = 220, exp = 1500, level = 75, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Shiny Raichu'] = {offense = 1.5, defense = 8, specialattack = 10, life = 2200, vitality = 7.7, agility = 220, exp = 1500, level = 100, wildLvl = 5, type = 'electric', type2 = 'no type'},

	['Cleffa'] = {offense = 0.5, defense = 4, specialattack = 3, life = 1200, vitality = 3.3, agility = 200, exp = 250, level = 15, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Clefairy'] = {offense = 0.9, defense = 6, specialattack = 6, life = 1550, vitality = 4.3, agility = 200, exp = 400, level = 40, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Clefable'] = {offense = 1, defense = 8, specialattack = 7, life = 3800, vitality = 7, agility = 200, exp = 1500, level = 70, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Pidgey'] = {offense = 0.7, defense = 4, specialattack = 3, life = 400, vitality = 2.4, agility = 200, exp = 100, level = 1, wildLvl = 1, type = 'normal', type2 = 'flying'},

	['Pidgeotto'] = {offense = 0.9, defense = 5.2, specialattack = 5, life = 1050, vitality = 3.5, agility = 350, exp = 250, level = 20, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Pidgeot'] = {offense = 1.6, defense = 7, specialattack = 9, life = 2100, vitality = 9, agility = 350, exp = 1100, level = 80, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Shiny Pidgeot'] = {offense = 1.6, defense = 9, specialattack = 9, life = 2100, vitality = 9, agility = 350, exp = 1100, level = 100, wildLvl = 5, type = 'normal', type2 = 'flying'},

	['Staryu'] = {offense = 0.9, defense = 4, specialattack = 1.5, life = 1400, vitality = 4, agility = 200, exp = 250, level = 20, wildLvl = 1, type = 'water', type2 = 'psychic'},

	['Starmie'] = {offense = 1.2, defense = 8, specialattack = 7, life = 2300, vitality = 6.7, agility = 200, exp = 650, level = 80, wildLvl = 1, type = 'water', type2 = 'psychic'},

	['Poliwag'] = {offense = 0.7, defense = 4, specialattack = 1.8, life = 300, vitality = 2, agility = 200, exp = 150, level = 5, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Poliwhirl'] = {offense = 0.9, defense = 8, specialattack = 5, life = 900, vitality = 4.5, agility = 200, exp = 250, level = 25, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Poliwrath'] = {offense = 8, defense = 7.5, specialattack = 6.5, life = 2300, vitality = 8, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'water', type2 = 'fighting'},

	['Politoed'] = {offense = 4, defense = 8, specialattack = 9, life = 1700, vitality = 5, agility = 200, exp = 1100, level = 70, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Shiny Politoed'] = {offense = 4, defense = 8, specialattack = 9, life = 1700, vitality = 5, agility = 200, exp = 1100, level = 70, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Mankey'] = {offense = 1.2, defense = 6, specialattack = 3.5, life = 550, vitality = 2.1, agility = 200, exp = 100, level = 10, wildLvl = 1, type = 'fighting', type2 = 'no type'},
	
	['Primeape'] = {offense = 5, defense = 7, specialattack = 7, life = 1950, vitality = 5, agility = 200, exp = 450, level = 50, wildLvl = 1, type = 'fighting', type2 = 'no type'},

	['Paras'] = {offense = 0.7, defense = 6, specialattack = 4.5, life = 500, vitality = 1.5, agility = 125, exp = 40, level = 1, wildLvl = 1, type = 'bug', type2 = 'grass'},
		
	['Parasect'] = {offense = 1.5, defense = 7, specialattack = 5, life = 1400, vitality = 4.3, agility = 200, exp = 250, level = 50, wildLvl = 1, type = 'bug', type2 = 'grass'},
	
	['Shiny Paras'] = {offense = 0.7, defense = 6, specialattack = 4.5, life = 500, vitality = 1.5, agility = 125, exp = 40, level = 20, wildLvl = 5, type = 'bug', type2 = 'grass'},
		
	['Shiny Parasect'] = {offense = 1.5, defense = 7, specialattack = 5, life = 1400, vitality = 4.3, agility = 200, exp = 250, level = 80, wildLvl = 5, type = 'bug', type2 = 'grass'},
	
	['Eevee'] = {offense = 0.9, defense = 8, specialattack = 2, life = 650, vitality = 4.5, agility = 200, exp = 450, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Flareon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Jolteon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Vaporeon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Espeon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'psychic', type2 = 'no type'},

	['Umbreon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'dark', type2 = 'no type'},

	['Shiny Flareon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Shiny Jolteon'] = {offense = 3, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'electric', type2 = 'no type'},
	
	['Shiny Vaporeon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'water', type2 = 'no type'},

	['Shiny Espeon'] = {offense = 2, defense = 8, specialattack = 10, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'psychic', type2 = 'no type'},

	['Shiny Umbreon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'dark', type2 = 'no type'},

	['Slowpoke'] = {offense = 0.7, defense = 4, specialattack = 3, life = 400, vitality = 2.6, agility = 180, exp = 100, level = 15, wildLvl = 1, type = 'water', type2 = 'psychic'},

	['Slowbro'] = {offense = 1.5, defense = 11, specialattack = 7, life = 2700, vitality = 4.5, agility = 200, exp = 250, level = 45, wildLvl = 1, type = 'water', type2 = 'psychic'},

--// ALL'S POKÉMONS FOSSEIS \\--
	
	['Omanyte'] = {offense = 0.9, defense = 7, specialattack = 3, life = 1050, vitality = 4.5, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'rock', type2 = 'water'},
	
	['Omastar'] = {offense = 2.1, defense = 9, specialattack = 8, life = 2500, vitality = 9.8, agility = 120, exp = 1100, level = 80, wildLvl = 1, type = 'rock', type2 = 'water'},
	
	['Kabuto'] = {offense = 0.9, defense = 7, specialattack = 3, life = 650, vitality = 4.2, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'rock', type2 = 'water'},
	
	['Kabutops'] = {offense = 2.1, defense = 9, specialattack = 8, life = 2500, vitality = 9.8, agility = 210, exp = 1100, level = 80, wildLvl = 1, type = 'rock', type2 = 'water'},	

	['Aerodactyl'] = {offense = 3, defense = 14, specialattack = 12, life = 4200, vitality = 22, agility = 330, exp = 2500, level = 120, wildLvl = 1, type = 'rock', type2 = 'flying'},

--// ALL'S POKÉMONS HIGH LEVEL \\--
	['Magmar'] = {offense = 1.5, defense = 8.3, specialattack = 8.7, life = 2500, vitality = 10, agility = 200, exp = 1800, level = 90, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Electabuzz'] = {offense = 1.5, defense = 8.3, specialattack = 8.7, life = 2500, vitality = 10, agility = 200, exp = 1800, level = 90, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Scyther'] = {offense = 2.1, defense = 8.2, specialattack = 7, life = 2500, vitality = 10.4, agility = 250, exp = 1800, level = 90, wildLvl = 1, type = 'bug', type2 = 'flying'},

	['Shiny Magmar'] = {offense = 1.5, defense = 8.3, specialattack = 8.7, life = 2500, vitality = 10, agility = 200, exp = 1800, level = 120, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Shiny Electabuzz'] = {offense = 1.5, defense = 8.3, specialattack = 8.7, life = 2500, vitality = 10, agility = 200, exp = 1800, level = 120, wildLvl = 5, type = 'electric', type2 = 'no type'},
	
	['Shiny Scyther'] = {offense = 2.1, defense = 9.5, specialattack = 7, life = 2500, vitality = 10.4, agility = 250, exp = 1800, level = 120, wildLvl = 5, type = 'bug', type2 = 'flying'},

	['Heracross'] = {offense = 2.1, defense = 6.5, specialattack = 9, life = 2700, vitality = 8.4, agility = 250, exp = 1800, level = 90, wildLvl = 1, type = 'bug', type2 = 'fighting'},	

	['Gyarados'] = {offense = 1.8, defense = 8.4, specialattack = 7.5, life = 2800, vitality = 11, agility = 200, exp = 1800, level = 100, wildLvl = 1, type = 'water', type2 = 'dragon'},
	
	['Shiny Gyarados'] = {offense = 1.8, defense = 8.4, specialattack = 7.5, life = 2800, vitality = 11, agility = 200, exp = 1800, level = 120, wildLvl = 5, type = 'water', type2 = 'dragon'},
	
	['Kangaskhan'] = {offense = 2.1, defense = 9, specialattack = 7.7, life = 2500, vitality = 9.7, agility = 195, exp = 1100, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Pinsir'] = {offense = 2, defense = 10, specialattack = 8, life = 2500, vitality = 8.1, agility = 200, exp = 650, level = 75, wildLvl = 1, type = 'bug', type2 = 'no type'},
	
	['Shiny Pinsir'] = {offense = 2, defense = 10, specialattack = 8, life = 2500, vitality = 8.1, agility = 200, exp = 650, level = 100, wildLvl = 5, type = 'bug', type2 = 'no type'},
	
	['Mr. Mime'] = {offense = 1.4, defense = 7.7, specialattack = 8.6, life = 3200, vitality = 8.7, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'psychic', type2 = 'no type'},	
		
	['Shiny Mr. Mime'] = {offense = 1.4, defense = 7.7, specialattack = 8.6, life = 3200, vitality = 8.7, agility = 200, exp = 650, level = 100, wildLvl = 5, type = 'psychic', type2 = 'no type'},	
	
	['Scizor'] = {offense = 1, defense = 12, specialattack = 9, life = 2800, vitality = 10, agility = 250, exp = 1450, level = 100, wildLvl = 1, type = 'bug', type2 = 'steel'},
		
	['Jynx'] = {offense = 1.3, defense = 8.2, specialattack = 8.2, life = 3200, vitality = 9.8, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'ice', type2 = 'psychic'},	
		
	['Shiny Jynx'] = {offense = 1.3, defense = 8.2, specialattack = 8.2, life = 3200, vitality = 9.8, agility = 200, exp = 1100, level = 120, wildLvl = 5, type = 'ice', type2 = 'psychic'},	

	['Mantine'] = {offense = 1.5, defense = 11, specialattack = 7, life = 2500, vitality = 7.5, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'water', type2 = 'flying'},
	
	['Kingdra'] = {offense = 3, defense = 8, specialattack = 8, life = 2000, vitality = 8, agility = 250, exp = 1300, level = 80, wildLvl = 1, type = 'water', type2 = 'dragon'},
		
	['Slowking'] = {offense = 1, defense = 8, specialattack = 11, life = 2500, vitality = 7, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'water', type2 = 'psychic'},

	['Wobbuffet'] = {offense = 1, defense = 10, specialattack = 8, life = 2500, vitality = 8, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'psychic', type2 = 'no type'},

	['Tyranitar'] = {offense = 2, defense = 9, specialattack = 7, life = 2800, vitality = 10, agility = 200, exp = 1650, level = 100, wildLvl = 1, type = 'ground', type2 = 'dark'},	

	['Steelix'] = {offense = 1.7, defense = 13, specialattack = 10, life = 2800, vitality = 10, agility = 200, exp = 1400, level = 100, wildLvl = 1, type = 'ground', type2 = 'steel'},
	
	['Shiny Tyranitar'] = {offense = 2, defense = 9, specialattack = 7, life = 2800, vitality = 10, agility = 200, exp = 1650, level = 120, wildLvl = 5, type = 'ground', type2 = 'dark'},	

	['Shiny Steelix'] = {offense = 1.7, defense = 13, specialattack = 10, life = 2800, vitality = 10, agility = 200, exp = 1400, level = 120, wildLvl = 5, type = 'ground', type2 = 'steel'},
	
	['Lapras'] = {offense = 1.2, defense = 9, specialattack = 8.8, life = 2500, vitality = 10, agility = 200, exp = 1100, level = 90, wildLvl = 1, type = 'water', type2 = 'ice'},
	
	['Snorlax'] = {offense = 1.5, defense = 10, specialattack = 6.5, life = 3000, vitality = 10, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Shiny Snorlax'] = {offense = 1.5, defense = 10, specialattack = 6.5, life = 3000, vitality = 10, agility = 200, exp = 1100, level = 120, wildLvl = 5, type = 'normal', type2 = 'no type'},

	['Ursaring'] = {offense = 3, defense = 8, specialattack = 9.5, life = 3000, vitality = 7, agility = 200, exp = 1400, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Miltank'] = {offense = 1, defense = 12, specialattack = 7, life = 2500, vitality = 8, agility = 250, exp = 1400, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Dragonite'] = {offense = 2.2, defense = 9, specialattack = 9.5, life = 4000, vitality = 12, agility = 200, exp = 1500, level = 100, wildLvl = 1, type = 'dragon', type2 = 'flying'},
		
	['Shiny Dragonite'] = {offense = 2.2, defense = 9, specialattack = 9.5, life = 4000, vitality = 12, agility = 200, exp = 1500, level = 120, wildLvl = 5, type = 'dragon', type2 = 'flying'},
	
	['Hitmonchan'] = {offense = 3, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 60, wildLvl = 1, type = 'fighting', type2 = 'no type'},
	
	['Hitmonlee'] = {offense = 3, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 60, wildLvl = 1, type = 'fighting', type2 = 'no type'},

	['Hitmontop'] = {offense = 3, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 60, wildLvl = 1, type = 'fighting', type2 = 'no type'},	
	
	['Shiny Hitmonchan'] = {offense = 5, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 80, wildLvl = 5, type = 'fighting', type2 = 'no type'},
	
	['Shiny Hitmonlee'] = {offense = 5, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 80, wildLvl = 5, type = 'fighting', type2 = 'no type'},

	['Shiny Hitmontop'] = {offense = 5, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 80, wildLvl = 5, type = 'fighting', type2 = 'no type'},	

	['Skarmory'] = {offense = 2, defense = 10, specialattack = 8.5, life = 2200, vitality = 9, agility = 350, exp = 1400, level = 90, wildLvl = 1, type = 'steel', type2 = 'flying'},
	
	['Sudowoodo'] = {offense = 1.8, defense = 10, specialattack = 15, life = 3000, vitality = 13, agility = 250, exp = 1300, level = 120, wildLvl = 1, type = 'rock', type2 = 'no type'},

	['Shiny Skarmory'] = {offense = 2, defense = 10, specialattack = 12, life = 2200, vitality = 9, agility = 350, exp = 1400, level = 100, wildLvl = 5, type = 'steel', type2 = 'flying'},
	
	['Shiny Sudowoodo'] = {offense = 1.8, defense = 12, specialattack = 15, life = 3000, vitality = 13, agility = 250, exp = 1300, level = 120, wildLvl = 5, type = 'rock', type2 = 'no type'},

	['Misdreavus'] = {offense = 1, defense = 7, specialattack = 11, life = 2500, vitality = 9, agility = 200, exp = 1300, level = 90, wildLvl = 1, type = 'ghost', type2 = 'no type'},	

	['Girafarig'] = {offense = 1.5, defense = 6, specialattack = 11, life = 3200, vitality = 7, agility = 250, exp = 850, level = 80, wildLvl = 1, type = 'normal', type2 = 'psychic'},

	['Blissey'] = {offense = 1.5, defense = 9, specialattack = 9, life = 3500, vitality = 9, agility = 200, exp = 450, level = 100, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Zapdos'] = {offense = 3, defense = 150, specialattack = 10, life = 30000, vitality = 13, agility = 500, exp = 1300, level = 200, wildLvl = 1, type = 'electric', type2 = 'no type'},

	['Moltres'] = {offense = 3, defense = 150, specialattack = 11, life = 30000, vitality = 9, agility = 500, exp = 1300, level = 200, wildLvl = 1, type = 'fire', type2 = 'no type'},	

	['Articuno'] = {offense = 3, defense = 150, specialattack = 11, life = 30000, vitality = 7, agility = 500, exp = 850, level = 200, wildLvl = 1, type = 'ice', type2 = 'no type'},
	
	['Mew'] = {offense = 3, defense = 150, specialattack = 11, life = 30000, vitality = 7, agility = 500, exp = 850, level = 200, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
	['Mewtwo'] = {offense = 3, defense = 150, specialattack = 11, life = 30000, vitality = 7, agility = 500, exp = 850, level = 200, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
--// FINALE THE ALL'S POKÉMONS HIGH LEVEL \\ --

	['Gastly'] = {offense = 0.9, defense = 4, specialattack = 2, life = 800, vitality = 3, agility = 200, exp = 250, level = 20, wildLvl = 1, type = 'ghost', type2 = 'poison'},
	
	['Haunter'] = {offense = 1.3, defense = 6, specialattack = 3, life = 1200, vitality = 5, agility = 200, exp = 450, level = 40, wildLvl = 1, type = 'ghost', type2 = 'poison'},
	
	['Gengar'] = {offense = 1.5, defense = 9, specialattack = 8, life = 2000, vitality = 7, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'ghost', type2 = 'poison'},	
	
	['Shiny Gengar'] = {offense = 1.5, defense = 13, specialattack = 10, life = 2000, vitality = 7, agility = 200, exp = 1100, level = 100, wildLvl = 5, type = 'ghost', type2 = 'poison'},	

	['Tauros'] = {offense = 1.2, defense = 9, specialattack = 5, life = 1500, vitality = 6, agility = 250, exp = 450, level = 50, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Shiny Tauros'] = {offense = 3, defense = 9, specialattack = 8, life = 1500, vitality = 6, agility = 250, exp = 450, level = 100, wildLvl = 5, type = 'normal', type2 = 'no type'},

	['Venonat'] = {offense = 0.8, defense = 6, specialattack = 4, life = 650, vitality = 2.3, agility = 200, exp = 100, level = 20, wildLvl = 1, type = 'bug', type2 = 'poison'},

	['Venomoth'] = {offense = 1.2, defense = 8, specialattack = 9, life = 1800, vitality = 6.5, agility = 200, exp = 450, level = 50, wildLvl = 1, type = 'bug', type2 = 'poison'},
	
	['Shiny Venonat'] = {offense = 0.8, defense = 6, specialattack = 4, life = 650, vitality = 2.3, agility = 200, exp = 100, level = 20, wildLvl = 5, type = 'bug', type2 = 'poison'},

	['Shiny Venomoth'] = {offense = 3, defense = 8, specialattack = 7, life = 1800, vitality = 9, agility = 200, exp = 450, level = 80, wildLvl = 5, type = 'bug', type2 = 'poison'},
	
	['Porygon'] = {offense = 1.7, defense = 8, specialattack = 7, life = 1200, vitality = 5.3, agility = 200, exp = 1100, level = 40, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Porygon2'] = {offense = 2, defense = 7, specialattack = 10, life = 2500, vitality = 7, agility = 250, exp = 1400, level = 80, wildLvl = 1, type = 'normal', type2 = 'psychic'},
	
	['Rattata'] = {offense = 0.2, defense = 6, specialattack = 2.5, life = 350, vitality = 3, agility = 190, exp = 35, level = 1, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Raticate'] = {offense = 1.5, defense = 7, specialattack = 3.5, life = 1950, vitality = 3.5, agility = 190, exp = 250, level = 30, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Shiny Rattata'] = {offense = 0.2, defense = 6, specialattack = 2.5, life = 350, vitality = 3, agility = 190, exp = 35, level = 20, wildLvl = 5, type = 'normal', type2 = 'no type'},

	['Shiny Raticate'] = {offense = 1.5, defense = 7, specialattack = 3.5, life = 1950, vitality = 3.5, agility = 190, exp = 250, level = 50, wildLvl = 5, type = 'normal', type2 = 'no type'},

	['Onix'] = {offense = 1.2, defense = 9, specialattack = 6.3, life = 2980, vitality = 7.2, agility = 200, exp = 750, level = 50, wildLvl = 1, type = 'rock', type2 = 'ground'},
	
	['Shiny Onix'] = {offense = 1.2, defense = 9, specialattack = 6.3, life = 2980, vitality = 7.2, agility = 200, exp = 750, level = 80, wildLvl = 5, type = 'rock', type2 = 'ground'},
	
	['Chansey'] = {offense = 1.5, defense = 9, specialattack = 7.8, life = 2500, vitality = 8.7, agility = 200, exp = 450, level = 60, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Psyduck'] = {offense = 0.7, defense = 6, specialattack = 2.5, life = 700, vitality = 2.6, agility = 200, exp = 100, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Golduck'] = {offense = 1.2, defense = 8.4, specialattack = 6.8, life = 1700, vitality = 6, agility = 210, exp = 650, level = 70, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Shellder'] = {offense = 0.9, defense = 4, specialattack = 1.2, life = 250, vitality = 2.3, agility = 175, exp = 250, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Cloyster'] = {offense = 1.2, defense = 9, specialattack = 5.5, life = 2400, vitality = 5.5, agility = 200, exp = 900, level = 60, wildLvl = 1, type = 'water', type2 = 'ice'},
	
	['Growlithe'] = {offense = 1, defense = 4.5, specialattack = 7, life = 1950, vitality = 5.5, agility = 200, exp = 250, level = 25, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Arcanine'] = {offense = 3, defense = 9, specialattack = 9.5, life = 3450, vitality = 8.6, agility = 200, exp = 1100, level = 90, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Shiny Growlithe'] = {offense = 1, defense = 4.5, specialattack = 7, life = 1950, vitality = 5.5, agility = 200, exp = 250, level = 30, wildLvl = 5, type = 'fire', type2 = 'no type'},

	['Shiny Arcanine'] = {offense = 3, defense = 9, specialattack = 9.5, life = 3450, vitality = 8.6, agility = 200, exp = 1100, level = 100, wildLvl = 5, type = 'fire', type2 = 'no type'},

	['Horsea'] = {offense = 0.7, defense = 7, specialattack = 1.5, life = 350, vitality = 3, agility = 200, exp = 100, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Seadra'] = {offense = 1.2, defense = 6.5, specialattack = 8, life = 1100, vitality = 6.5, agility = 200, exp = 350, level = 40, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Shiny Horsea'] = {offense = 0.7, defense = 7, specialattack = 1.5, life = 350, vitality = 3, agility = 200, exp = 100, level = 20, wildLvl = 5, type = 'water', type2 = 'no type'},
	
	['Shiny Seadra'] = {offense = 1.2, defense = 6.5, specialattack = 8, life = 1100, vitality = 6.5, agility = 200, exp = 350, level = 60, wildLvl = 5, type = 'water', type2 = 'no type'},

	['Vulpix'] = {offense = 0.9, defense = 4, specialattack = 5, life = 1050, vitality = 2.9, agility = 200, exp = 100, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Ninetales'] = {offense = 1.2, defense = 8, specialattack = 8.1, life = 2500, vitality = 5.6, agility = 250, exp = 650, level = 70, wildLvl = 1, type = 'fire', type2 = 'no type'},	

	['Shiny Ninetales'] = {offense = 1.2, defense = 8, specialattack = 8.1, life = 2500, vitality = 5.6, agility = 250, exp = 650, level = 80, wildLvl = 5, type = 'fire', type2 = 'no type'},	

	['Diglett'] = {offense = 0.8, defense = 6, specialattack = 3.5, life = 550, vitality = 2.5, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Dugtrio'] = {offense = 1.2, defense = 8, specialattack = 5, life = 2200, vitality = 3.5, agility = 180, exp = 450, level = 35, wildLvl = 1, type = 'ground', type2 = 'no type'},

	['Machop'] = {offense = 1.5, defense = 5, specialattack = 3.5, life = 950, vitality = 3.4, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'fighting', type2 = 'no type'},
	
	['Machoke'] = {offense = 3, defense = 7.2, specialattack = 5, life = 1800, vitality = 6.9, agility = 190, exp = 450, level = 45, wildLvl = 1, type = 'fighting', type2 = 'no type'},	
	
	['Machamp'] = {offense = 4, defense = 7.8, specialattack = 8, life = 2400, vitality = 9.8, agility = 200, exp = 1800, level = 80, wildLvl = 1, type = 'fighting', type2 = 'no type'},
	
	['Shiny Machamp'] = {offense = 3, defense = 7.8, specialattack = 8, life = 2400, vitality = 9.8, agility = 200, exp = 1800, level = 100, wildLvl = 5, type = 'fighting', type2 = 'no type'},

	['Sandshrew'] = {offense = 0.9, defense = 8, specialattack = 2, life = 650, vitality = 2.9, agility = 180, exp = 100, level = 20, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Sandslash'] = {offense = 1.7, defense = 8.4, specialattack = 6.2, life = 2400, vitality = 5.7, agility = 230, exp = 1100, level = 70, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Shiny Sandslash'] = {offense = 1.7, defense = 8.4, specialattack = 6.2, life = 2400, vitality = 5.7, agility = 230, exp = 1100, level = 100, wildLvl = 5, type = 'ground', type2 = 'no type'},

-- Other Pokemons Not Base Balanceament --

	['Ekans'] = {offense = 0.9, defense = 6, specialattack = 4, life = 400, vitality = 2.5, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'poison', type2 = 'no type'},

	['Arbok'] = {offense = 1.2, defense = 8, specialattack = 6.5, life = 1700, vitality = 4.6, agility = 190, exp = 450, level = 35, wildLvl = 1, type = 'poison', type2 = 'no type'},
	
	['Nidoran Male'] = {offense = 0.8, defense = 4, specialattack = 4, life = 450, vitality = 2.2, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'poison', type2 = 'no type'},
	
	['Nidoran Female'] = {offense = 0.7, defense = 4, specialattack = 4, life = 550, vitality = 2.1, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'poison', type2 = 'no type'},

	['Nidorino'] = {offense = 1.3, defense = 6, specialattack = 5.5, life = 1150, vitality = 3.1, agility = 182, exp = 250, level = 30, wildLvl = 1, type = 'poison', type2 = 'no type'},
	
	['Nidorina'] = {offense = 0.9, defense = 5.9, specialattack = 5.6, life = 1280, vitality = 3.4, agility = 180, exp = 250, level = 30, wildLvl = 1, type = 'poison', type2 = 'no type'},
	
	['Nidoking'] = {offense = 1.9, defense = 10, specialattack = 8.5, life = 2700, vitality = 8, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'poison', type2 = 'ground'},
	
	['Shiny Nidoking'] = {offense = 1.9, defense = 10, specialattack = 8.5, life = 2700, vitality = 8, agility = 200, exp = 650, level = 100, wildLvl = 5, type = 'poison', type2 = 'ground'},
	
	['Nidoqueen'] = {offense = 1.2, defense = 10, specialattack = 8.5, life = 2700, vitality = 8, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'poison', type2 = 'ground'},
--
	['Meowth'] = {offense = 0.8, defense = 6, specialattack = 4, life = 600, vitality = 2.1, agility = 180, exp = 100, level = 15, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Persian'] = {offense = 1.3, defense = 7.8, specialattack = 6.7, life = 2700, vitality = 3.7, agility = 200, exp = 250, level = 50, wildLvl = 1, type = 'normal', type2 = 'no type'},
--
	
	['Abra'] = {offense = 0.7, defense = 1.5, specialattack = 4, life = 1000, vitality = 3.0, agility = 120, exp = 250, level = 15, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
	['Shiny Abra'] = {offense = 0.7, defense = 1.5, specialattack = 4, life = 1000, vitality = 3.0, agility = 120, exp = 250, level = 30, wildLvl = 5, type = 'psychic', type2 = 'no type'},

	['Kadabra'] = {offense = 0.9, defense = 3, specialattack = 6, life = 1600, vitality = 6.5, agility = 130, exp = 450, level = 45, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
	['Alakazam'] = {offense = 1.8, defense = 4, specialattack = 10, life = 2000, vitality = 9, agility = 130, exp = 1100, level = 80, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
	['Shiny Alakazam'] = {offense = 1.8, defense = 4, specialattack = 13, life = 2000, vitality = 9, agility = 130, exp = 1100, level = 100, wildLvl = 5, type = 'psychic', type2 = 'no type'},
--	
	['Bellsprout'] = {offense = 0.9, defense = 2.8, specialattack = 1.8, life = 300, vitality = 3.2, agility = 112, exp = 100, level = 5, wildLvl = 1, type = 'grass', type2 = 'poison'},
	
	['Weepinbell'] = {offense = 1.2, defense = 6.2, specialattack = 5, life = 1100, vitality = 5.2, agility = 120, exp = 250, level = 30, wildLvl = 1, type = 'grass', type2 = 'poison'},
	
	['Victreebel'] = {offense = 1.8, defense = 8.4, specialattack = 7, life = 2200, vitality = 7.7, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'grass', type2 = 'poison'},
--
	['Tentacool'] = {offense = 1, defense = 2.5, specialattack = 1.5, life = 600, vitality = 3.5, agility = 170, exp = 350, level = 15, wildLvl = 1, type = 'water', type2 = 'poison'},
	
	['Tentacruel'] = {offense = 1.7, defense = 8, specialattack = 8, life = 2600, vitality = 9, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'water', type2 = 'poison'},

	['Shiny Tentacool'] = {offense = 1, defense = 2.5, specialattack = 1.5, life = 600, vitality = 3.5, agility = 170, exp = 350, level = 20, wildLvl = 5, type = 'water', type2 = 'poison'},
	
	['Shiny Tentacruel'] = {offense = 1.7, defense = 8, specialattack = 8, life = 2600, vitality = 9, agility = 200, exp = 1100, level = 100, wildLvl = 5, type = 'water', type2 = 'poison'},
--	
	['Geodude'] = {offense = 0.7, defense = 5, specialattack = 3, life = 600, vitality = 3.6, agility = 180, exp = 100, level = 15, wildLvl = 1, type = 'rock', type2 = 'ground'},
	
	['Graveler'] = {offense = 0.9, defense = 8, specialattack = 4.5, life = 1550, vitality = 6.3, agility = 190, exp = 450, level = 40, wildLvl = 1, type = 'rock', type2 = 'ground'},
	
	['Golem'] = {offense = 1.2, defense = 10, specialattack = 8, life = 2300, vitality = 8.5, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'rock', type2 = 'ground'},
	
	['Shiny Golem'] = {offense = 1.2, defense = 10, specialattack = 8, life = 2300, vitality = 8.5, agility = 200, exp = 650, level = 80, wildLvl = 5, type = 'rock', type2 = 'ground'},
--
	['Ponyta'] = {offense = 0.7, defense = 6, specialattack = 3, life = 650, vitality = 2.4, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Rapidash'] = {offense = 1.2, defense = 9, specialattack = 8, life = 2000, vitality = 7.5, agility = 320, exp = 650, level = 70, wildLvl = 1, type = 'fire', type2 = 'no type'},
--
	['Grimer'] = {offense = 0.7, defense = 5, specialattack = 3, life = 800, vitality = 2.7, agility = 150, exp = 100, level = 15, wildLvl = 1, type = 'poison', type2 = 'no type'},
		
	['Muk'] = {offense = 1.2, defense = 8, specialattack = 7, life = 2800, vitality = 8.7, agility = 190, exp = 1100, level = 90, wildLvl = 1, type = 'poison', type2 = 'no type'},

	['Shiny Grimer'] = {offense = 0.7, defense = 5, specialattack = 3, life = 800, vitality = 2.7, agility = 150, exp = 100, level = 30, wildLvl = 5, type = 'poison', type2 = 'no type'},
		
	['Shiny Muk'] = {offense = 1.2, defense = 11, specialattack = 7, life = 2800, vitality = 8.7, agility = 190, exp = 1100, level = 100, wildLvl = 5, type = 'poison', type2 = 'no type'},
--	
	['Magnemite'] = {offense = 0.9, defense = 4, specialattack = 3, life = 1200, vitality = 2.5, agility = 200, exp = 100, level = 15, wildLvl = 1, type = 'electric', type2 = 'steel'},
	
	['Magneton'] = {offense = 1.2, defense = 9, specialattack = 7, life = 1800, vitality = 4.5, agility = 170, exp = 650, level = 75, wildLvl = 1, type = 'electric', type2 = 'steel'},
	
	['Shiny Magneton'] = {offense = 1.2, defense = 11, specialattack = 8.5, life = 1800, vitality = 4.5, agility = 170, exp = 650, level = 80, wildLvl = 5, type = 'electric', type2 = 'steel'},
--
	["Farfetch'd"] = {offense = 1.6, defense = 8.6, specialattack = 7.2, life = 1800, vitality = 2.4, agility = 220, exp = 650, level = 45, wildLvl = 1, type = 'normal', type2 = 'flying'},

	["Shiny Farfetch'd"] = {offense = 1.6, defense = 8.6, specialattack = 7.2, life = 1800, vitality = 2.4, agility = 220, exp = 650, level = 80, wildLvl = 5, type = 'normal', type2 = 'flying'},
--
	['Doduo'] = {offense = 0.7, defense = 4, specialattack = 3, life = 600, vitality = 2.9, agility = 200, exp = 250, level = 15, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Dodrio'] = {offense = 0.6, defense = 8, specialattack = 6.3, life = 1500, vitality = 4.5, agility = 240, exp = 450, level = 50, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Shiny Dodrio'] = {offense = 2, defense = 8, specialattack = 6.3, life = 1500, vitality = 4.5, agility = 240, exp = 450, level = 80, wildLvl = 5, type = 'normal', type2 = 'flying'},
--
	['Drowzee'] = {offense = 0.9, defense = 4, specialattack = 3.1, life = 900, vitality = 2.7, agility = 180, exp = 250, level = 30, wildLvl = 1, type = 'psychic', type2 = 'no type'},
		
	['Hypno'] = {offense = 1.2, defense = 9, specialattack = 9, life = 1500, vitality = 6, agility = 200, exp = 650, level = 55, wildLvl = 1, type = 'psychic', type2 = 'no type'},
		
	['Shiny Hypno'] = {offense = 1.2, defense = 9, specialattack = 9, life = 1500, vitality = 6, agility = 200, exp = 650, level = 80, wildLvl = 5, type = 'psychic', type2 = 'no type'},
--
	['Krabby'] = {offense = 0.7, defense = 5, specialattack = 1.2, life = 550, vitality = 2.1, agility = 170, exp = 200, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},
		
	['Kingler'] = {offense = 1, defense = 9, specialattack = 6.2, life = 1500, vitality = 4.7, agility = 210, exp = 450, level = 50, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Shiny Krabby'] = {offense = 0.7, defense = 5, specialattack = 1.2, life = 550, vitality = 2.1, agility = 170, exp = 200, level = 30, wildLvl = 5, type = 'water', type2 = 'no type'},
		
	['Shiny Kingler'] = {offense = 1, defense = 9, specialattack = 6.2, life = 1500, vitality = 4.7, agility = 210, exp = 450, level = 80, wildLvl = 5, type = 'water', type2 = 'no type'},
--			
	['Voltorb'] = {offense = 0.7, defense = 5, specialattack = 2, life = 435, vitality = 2.1, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Electrode'] = {offense = 1.2, defense = 8, specialattack = 7, life = 1300, vitality = 4.6, agility = 190, exp = 450, level = 35, wildLvl = 1, type = 'electric', type2 = 'no type'},
		
	['Shiny Voltorb'] = {offense = 0.7, defense = 5, specialattack = 2, life = 435, vitality = 2.1, agility = 180, exp = 100, level = 30, wildLvl = 5, type = 'electric', type2 = 'no type'},
	
	['Shiny Electrode'] = {offense = 1.2, defense = 8, specialattack = 7, life = 1300, vitality = 4.6, agility = 190, exp = 450, level = 50, wildLvl = 5, type = 'electric', type2 = 'no type'},
--	
	['Exeggcute'] = {offense = 0.7, defense = 8, specialattack = 2, life = 550, vitality = 3.2, agility = 130, exp = 100, level = 10, wildLvl = 1, type = 'grass', type2 = 'psychic'},
		
	['Exeggutor'] = {offense = 1.2, defense = 8, specialattack = 10, life = 2500, vitality = 9, agility = 200, exp = 1100, level = 90, wildLvl = 1, type = 'grass', type2 = 'psychic'},
--
	['Cubone'] = {offense = 0.9, defense = 8, specialattack = 3, life = 600, vitality = 3, agility = 200, exp = 250, level = 20, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Marowak'] = {offense = 1.2, defense = 9, specialattack = 6, life = 1450, vitality = 6.5, agility = 200, exp = 650, level = 50, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Shiny Cubone'] = {offense = 0.9, defense = 8, specialattack = 3, life = 600, vitality = 3, agility = 200, exp = 250, level = 30, wildLvl = 5, type = 'ground', type2 = 'no type'},
	
	['Shiny Marowak'] = {offense = 1.2, defense = 12, specialattack = 6, life = 1450, vitality = 6.5, agility = 200, exp = 650, level = 80, wildLvl = 5, type = 'ground', type2 = 'no type'},
--	
	['Koffing'] = {offense = 0.7, defense = 9, specialattack = 3, life = 400, vitality = 3.5, agility = 190, exp = 100, level = 15, wildLvl = 1, type = 'poison', type2 = 'no type'},
		
	['Weezing'] = {offense = 1.2, defense = 8, specialattack = 5, life = 1400, vitality = 6, agility = 195, exp = 250, level = 50, wildLvl = 1, type = 'poison', type2 = 'no type'},
		
	['Shiny Weezing'] = {offense = 1.2, defense = 8, specialattack = 5, life = 1400, vitality = 6, agility = 195, exp = 250, level = 50, wildLvl = 5, type = 'poison', type2 = 'no type'},
--	
	['Rhyhorn'] = {offense = 0.9, defense = 9.5, specialattack = 3, life = 1150, vitality = 4.5, agility = 200, exp = 250, level = 30, wildLvl = 1, type = 'ground', type2 = 'rock'},
	
	['Rhydon'] = {offense = 1.6, defense = 10, specialattack = 9, life = 1800, vitality = 8, agility = 210, exp = 1100, level = 80, wildLvl = 1, type = 'ground', type2 = 'rock'},
	
	['Shiny Rhydon'] = {offense = 1.6, defense = 10, specialattack = 9, life = 1800, vitality = 8, agility = 210, exp = 1100, level = 80, wildLvl = 5, type = 'ground', type2 = 'rock'},
--
	['Tangela'] = {offense = 1, defense = 6.5, specialattack = 7, life = 1500, vitality = 7.5, agility = 200, exp = 650, level = 50, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Shiny Tangela'] = {offense = 1, defense = 6.5, specialattack = 7, life = 1500, vitality = 7.5, agility = 200, exp = 650, level = 80, wildLvl = 5, type = 'grass', type2 = 'no type'},

	['Lickitung'] = {offense = 1.2, defense = 8.5, specialattack = 6.6, life = 2100, vitality = 9, agility = 195, exp = 650, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Ditto'] = {offense = 1.2, defense = 8, specialattack = 5, life = 4550, vitality = 6, agility = 180, exp = 450, level = 1, wildLvl = 1, type = 'normal', type2 = 'no type'},	

	['Shiny Ditto'] = {offense = 1.2, defense = 8, specialattack = 5, life = 4550, vitality = 6, agility = 180, exp = 450, level = 1, wildLvl = 5, type = 'normal', type2 = 'no type'},		
--	
	['Magikarp'] = {offense = 0.1, defense = 1, specialattack = 0.5, life = 220, vitality = 2, agility = 50, exp = 50, level = 1, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Giant Magikarp'] = {offense = 2.1, defense = 9, specialattack = 8, life = 1950, vitality = 11.3, agility = 200, exp = 1100, level = 50, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Shiny Magikarp'] = {offense = 0.1, defense = 1, specialattack = 0.5, life = 220, vitality = 2, agility = 50, exp = 50, level = 1, wildLvl = 5, type = 'water', type2 = 'no type'},
	
	['Shiny Giant Magikarp'] = {offense = 2.1, defense = 9, specialattack = 8, life = 1950, vitality = 11.3, agility = 200, exp = 1100, level = 60, wildLvl = 5, type = 'water', type2 = 'no type'},
--	
	['Dratini'] = {offense = 0.9, defense = 6, specialattack = 3, life = 1650, vitality = 5, agility = 190, exp = 250, level = 20, wildLvl = 1, type = 'dragon', type2 = 'no type'},
	
	['Dragonair'] = {offense = 2, defense = 8, specialattack = 7, life = 1400, vitality = 8.2, agility = 215, exp = 650, level = 60, wildLvl = 1, type = 'dragon', type2 = 'no type'},

	['Shiny Dratini'] = {offense = 0.9, defense = 6, specialattack = 3, life = 1650, vitality = 5, agility = 190, exp = 250, level = 40, wildLvl = 5, type = 'dragon', type2 = 'no type'},
	
	['Shiny Dragonair'] = {offense = 2, defense = 8, specialattack = 7, life = 1400, vitality = 8.2, agility = 215, exp = 650, level = 80, wildLvl = 5, type = 'dragon', type2 = 'no type'},
	
------------------ BALANCEAMENTO POKÉMONS DA 2 GENERATION ----------------

	['Chikorita'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 190, exp = 350, level = 20, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Bayleef'] = {offense = 0.9, defense = 5.5, specialattack = 7, life = 1200, vitality = 6.8, agility = 200, exp = 550, level = 40, wildLvl = 1, type = 'grass', type2 = 'no type'},	
	
	['Meganium'] = {offense = 1, defense = 8.7, specialattack = 8.8, life = 1800, vitality = 8, agility = 300, exp = 2000, level = 80, wildLvl = 1, type = 'grass', type2 = 'no type'},
	
	['Shiny Meganium'] = {offense = 1, defense = 10, specialattack = 8.5, life = 2000, vitality = 8, agility = 300, exp = 2000, level = 100, wildLvl = 5, type = 'grass', type2 = 'no type'},

	['Cyndaquil'] = {offense = 1, defense = 3, specialattack = 4, life = 700, vitality = 2.5, agility = 200, exp = 350, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Quilava'] = {offense = 1.2, defense = 5, specialattack = 8.3, life = 1000, vitality = 6.8, agility = 200, exp = 550, level = 40, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Typhlosion'] = {offense = 1.5, defense = 13, specialattack = 9.5, life = 1500, vitality = 8, agility = 300, exp = 2000, level = 80, wildLvl = 1, type = 'fire', type2 = 'no type'},
		
	['Shiny Typhlosion'] = {offense = 1.5, defense = 13, specialattack = 9.5, life = 1500, vitality = 8, agility = 300, exp = 2000, level = 100, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Totodile'] = {offense = 0.5, defense = 4, specialattack = 3, life = 900, vitality = 2.5, agility = 190, exp = 350, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Croconaw'] = {offense = 0.7, defense = 6.5, specialattack = 7.3, life = 1400, vitality = 6.8, agility = 200, exp = 550, level = 40, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Feraligatr'] = {offense = 0.9, defense = 8, specialattack = 7.5, life = 2000, vitality = 8, agility = 250, exp = 2000, level = 80, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Shiny Feraligatr'] = {offense = 0.9, defense = 8, specialattack = 7.5, life = 2000, vitality = 8, agility = 250, exp = 2000, level = 100, wildLvl = 5, type = 'water', type2 = 'no type'},
	
	['Sentret'] = {offense = 1.5, defense = 4, specialattack = 2, life = 450, vitality = 3.6, agility = 250, exp = 300, level = 5, wildLvl = 1, type = 'grass', type2 = 'poison'},

	['Furret'] = {offense = 1.7, defense = 7, specialattack = 5, life = 750, vitality = 6.5, agility = 150, exp = 550, level = 30, wildLvl = 1, type = 'grass', type2 = 'poison'},

	['Hoppip'] = {offense = 0.5, defense = 4, specialattack = 2.2, life = 500, vitality = 4.7, agility = 200, exp = 300, level = 10, wildLvl = 1, type = 'grass', type2 = 'flying'},	

	['Skiploom'] = {offense = 1, defense = 6, specialattack = 5.5, life = 1200, vitality = 7.5, agility = 200, exp = 550, level = 40, wildLvl = 1, type = 'grass', type2 = 'flying'},	
		
	['Jumpluff'] = {offense = 1.2, defense = 8, specialattack = 7, life = 1700, vitality = 7.5, agility = 200, exp = 900, level = 50, wildLvl = 1, type = 'grass', type2 = 'flying'},		

	['Swinub'] = {offense = 1, defense = 7, specialattack = 6, life = 750, vitality = 3, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'ice', type2 = 'ground'},	

	['Piloswine'] = {offense = 2, defense = 10, specialattack = 9, life = 2800, vitality = 7, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'ice', type2 = 'ground'},

	['Hoothoot'] = {offense = 1, defense = 4, specialattack = 5, life = 750, vitality = 1.8, agility = 225, exp = 300, level = 20, wildLvl = 1, type = 'flying', type2 = 'psychic'},	

	['Noctowl'] = {offense = 2, defense = 6, specialattack = 8, life = 1550, vitality = 5.5, agility = 250, exp = 1200, level = 60, wildLvl = 1, type = 'flying', type2 = 'psychic'},
	
	['Spinarak'] = {offense = 1.0, defense = 6, specialattack = 2, life = 450, vitality = 6, agility = 220, exp = 400, level = 10, wildLvl = 1, type = 'bug', type2 = 'poison'},

	['Ariados'] = {offense = 2.0, defense = 8, specialattack = 4, life = 1700, vitality = 8, agility = 280, exp = 800, level = 70, wildLvl = 1, type = 'bug', type2 = 'poison'},	

	['Shiny Ariados'] = {offense = 2.0, defense = 8, specialattack = 4, life = 1700, vitality = 8, agility = 280, exp = 800, level = 80, wildLvl = 5, type = 'bug', type2 = 'poison'},	

	['Ledyba'] = {offense = 1.5, defense = 7, specialattack = 2.5, life = 450, vitality = 3, agility = 170, exp = 320, level = 20, wildLvl = 1, type = 'bug', type2 = 'flying'},

	['Ledian'] = {offense = 1.7, defense = 6.4, specialattack = 6, life = 900, vitality = 6, agility = 240, exp = 395, level = 30, wildLvl = 1, type = 'bug', type2 = 'flying'},
	
	['Yanma'] = {offense = 1.5, defense = 5.4, specialattack = 7, life = 2500, vitality = 5.5, agility = 280, exp = 650, level = 50, wildLvl = 1, type = 'bug', type2 = 'flying'},	

	['Chinchou'] = {offense = 1, defense = 6, specialattack = 2, life = 500, vitality = 4, agility = 200, exp = 450, level = 20, wildLvl = 1, type = 'water', type2 = 'electric'},

	['Lanturn'] = {offense = 1.6, defense = 7, specialattack = 7.5, life = 2100, vitality = 5, agility = 200, exp = 850, level = 80, wildLvl = 1, type = 'water', type2 = 'electric'},

	['Shiny Lanturn'] = {offense = 1.6, defense = 7, specialattack = 7.5, life = 2100, vitality = 5, agility = 200, exp = 850, level = 100, wildLvl = 5, type = 'water', type2 = 'electric'},

	['Togepi'] = {offense = 0.5, defense = 6, specialattack = 3, life = 1000, vitality = 4.3, agility = 200, exp = 250, level = 15, wildLvl = 1, type = 'normal', type2 = 'no type'},	
	
	['Togetic'] = {offense = 2, defense = 10, specialattack = 4, life = 2800, vitality = 4.3, agility = 200, exp = 800, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},	

	['Igglybuff'] = {offense = 0.8, defense = 3, specialattack = 2.5, life = 800, vitality = 3, agility = 200, exp = 300, level = 10, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Jigglypuff'] = {offense = 1.5, defense = 3, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 200, exp = 600, level = 40, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Wigglytuff'] = {offense = 2, defense = 8, specialattack = 8.5, life = 1800, vitality = 6.2, agility = 200, exp = 1100, level = 70, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Natu'] = {offense = 1, defense = 5, specialattack = 4, life = 650, vitality = 3.4, agility = 200, exp = 350, level = 10, wildLvl = 1, type = 'flying', type2 = 'psychic'},
	
	['Xatu'] = {offense = 1.3, defense = 7, specialattack = 7.0, life = 1600, vitality = 7, agility = 300, exp = 900, level = 80, wildLvl = 1, type = 'flying', type2 = 'psychic'},	
	
	['Shiny Xatu'] = {offense = 1.3, defense = 7, specialattack = 7.0, life = 1600, vitality = 7, agility = 300, exp = 900, level = 100, wildLvl = 5, type = 'flying', type2 = 'psychic'},	

	['Mareep'] = {offense = 1, defense = 4, specialattack = 3, life = 750, vitality = 4.8, agility = 200, exp = 1100, level = 20, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Flaaffy'] = {offense = 1.3, defense = 5, specialattack = 6, life = 1250, vitality = 6, agility = 200, exp = 900, level = 40, wildLvl = 1, type = 'electric', type2 = 'no type'},	

	['Ampharos'] = {offense = 4, defense = 9, specialattack = 9, life = 2500, vitality = 7, agility = 200, exp = 900, level = 80, wildLvl = 1, type = 'electric', type2 = 'no type'},	

	['Shiny Ampharos'] = {offense = 4, defense = 9, specialattack = 11, life = 2500, vitality = 7, agility = 200, exp = 900, level = 100, wildLvl = 5, type = 'electric', type2 = 'no type'},	

	['Murkrow'] = {offense = 1.5, defense = 6, specialattack = 8, life = 1500, vitality = 6, agility = 490, exp = 450, level = 50, wildLvl = 1, type = 'dark', type2 = 'flying'},

	['Azurill'] = {offense = 0.5, defense = 4.5, specialattack = 3.5, life = 700, vitality = 3.5, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},	
	
	['Marill'] = {offense = 1, defense = 5, specialattack = 4.5, life = 1400, vitality = 3, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Azumarill'] = {offense = 2, defense = 7, specialattack = 7.5, life = 1400, vitality = 5.7, agility = 200, exp = 850, level = 60, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Wooper'] = {offense = 0.7, defense = 7, specialattack = 2, life = 700, vitality = 5, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'water', type2 = 'ground'},	
		
	['Quagsire'] = {offense = 1.3, defense = 8, specialattack = 5, life = 2100, vitality = 6.5, agility = 200, exp = 850, level = 60, wildLvl = 1, type = 'water', type2 = 'ground'},	
		
	['Aipom'] = {offense = 1.5, defense = 8, specialattack = 6.5, life = 900, vitality = 4, agility = 200, exp = 400, level = 40, wildLvl = 1, type = 'normal', type2 = 'fighting'},

	['Sunkern'] = {offense = 0.5, defense = 6, specialattack = 2, life = 450, vitality = 2.5, agility = 200, exp = 200, level = 1, wildLvl = 1, type = 'bug', type2 = 'no type'},

	['Sunflora'] = {offense = 2, defense = 6.7, specialattack = 6, life = 1400, vitality = 7.3, agility = 200, exp = 450, level = 30, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Teddiursa'] = {offense = 1.5, defense = 6, specialattack = 4, life = 750, vitality = 5, agility = 200, exp = 450, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Stantler'] = {offense = 1.5, defense = 7, specialattack = 6, life = 1700, vitality = 7, agility = 250, exp = 750, level = 60, wildLvl = 1, type = 'normal', type2 = 'no type'},	
	
	['Shiny Stantler'] = {offense = 3.4, defense = 7, specialattack = 6, life = 1700, vitality = 7, agility = 250, exp = 650, level = 80, wildLvl = 5, type = 'normal', type2 = 'no type'},	
	
	['Pineco'] = {offense = 0.5, defense = 4, specialattack = 6, life = 750, vitality = 4, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'bug', type2 = 'no type'},

	['Forretress'] = {offense = 2, defense = 10, specialattack = 7, life = 1859, vitality = 7, agility = 200, exp = 850, level = 80, wildLvl = 1, type = 'bug', type2 = 'steel'},	

	['Dunsparce'] = {offense = 1, defense = 9, specialattack = 3, life = 750, vitality = 4, agility = 200, exp = 450, level = 30, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Gligar'] = {offense = 1, defense = 9, specialattack = 3, life = 750, vitality = 4, agility = 200, exp = 450, level = 30, wildLvl = 1, type = 'flying', type2 = 'ground'},
	
	['Shuckle'] = {offense = 3, defense = 11, specialattack = 3, life = 750, vitality = 3, agility = 200, exp = 450, level = 30, wildLvl = 1, type = 'bug', type2 = 'rock'},	
	
	['Snubbull'] = {offense = 2, defense = 4, specialattack = 3.5, life = 750, vitality = 4.5, agility = 200, exp = 350, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Granbull'] = {offense = 2, defense = 7, specialattack = 6.5, life = 1600, vitality = 6.5, agility = 200, exp = 850, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Qwilfish'] = {offense = 1, defense = 6, specialattack = 10, life = 1400, vitality = 7, agility = 210, exp = 750, level = 60, wildLvl = 1, type = 'water', type2 = 'poison'},
	
	['Corsola'] = {offense = 1, defense = 9, specialattack = 5, life = 1650, vitality = 6, agility = 200, exp = 650, level = 50, wildLvl = 1, type = 'water', type2 = 'rock'},	

	['Sneasel'] = {offense = 2, defense = 6, specialattack = 7, life = 1700, vitality = 5, agility = 200, exp = 850, level = 50, wildLvl = 1, type = 'dark', type2 = 'ice'},
	
	['Delibird'] = {offense = 1, defense = 5, specialattack = 6, life = 1500, vitality = 6, agility = 200, exp = 750, level = 40, wildLvl = 1, type = 'ice', type2 = 'no type'},	

	['Slugma'] = {offense = 1, defense = 6.5, specialattack = 8, life = 1250, vitality = 5.5, agility = 200, exp = 250, level = 25, wildLvl = 1, type = 'fire', type2 = 'no type'},	
	
	['Magcargo'] = {offense = 1.5, defense = 11, specialattack = 8.5, life = 2400, vitality = 9.5, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'fire', type2 = 'rock'},
		
	['Shiny Magcargo'] = {offense = 1.5, defense = 14, specialattack = 8.5, life = 2400, vitality = 10, agility = 200, exp = 1300, level = 100, wildLvl = 5, type = 'fire', type2 = 'rock'},
	
	['Remoraid'] = {offense = 0.7, defense = 7, specialattack = 1.5, life = 350, vitality = 3, agility = 200, exp = 200, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Octillery'] = {offense = 1, defense = 7.5, specialattack = 9, life = 1600, vitality = 7.5, agility = 200, exp = 250, level = 70, wildLvl = 1, type = 'water', type2 = 'no type'},	
	
	['Houndour'] = {offense = 1, defense = 6, specialattack = 6.5, life = 857, vitality = 3.5, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'fire', type2 = 'dark'},	

	['Houndoom'] = {offense = 2, defense = 7, specialattack = 8.5, life = 2537, vitality = 7, agility = 350, exp = 850, level = 80, wildLvl = 1, type = 'fire', type2 = 'dark'},		
	
	['Phanpy'] = {offense = 0.5, defense = 7, specialattack = 4.5, life = 450, vitality = 3.5, agility = 200, exp = 400, level = 10, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Donphan'] = {offense = 1.5, defense = 10, specialattack = 6, life = 1959, vitality = 6.5, agility = 200, exp = 750, level = 80, wildLvl = 1, type = 'ground', type2 = 'no type'},

	['Tyrogue'] = {offense = 2, defense = 5, specialattack = 3.5, life = 950, vitality = 3.4, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'fighting', type2 = 'no type'},

	['Smoochum'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 785, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'ice', type2 = 'psychic'},

	['Wynaut'] = {offense = 0.5, defense = 4.5, specialattack = 6.5, life = 785, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'psychic', type2 = 'no type'},	
	
	['Magby'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 785, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Elekid'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 785, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'electric', type2 = 'no type'},	

	['Larvitar'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 900, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'ground', type2 = 'dark'},

	['Pupitar'] = {offense = 1, defense = 9.5, specialattack = 5.5, life = 1300, vitality = 5, agility = 180, exp = 1400, level = 60, wildLvl = 1, type = 'ground', type2 = 'dark'},

	['Shiny Larvitar'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 900, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 5, type = 'ground', type2 = 'dark'},
	
	['Shiny Pupitar'] = {offense = 1, defense = 9.5, specialattack = 5.5, life = 1300, vitality = 5, agility = 180, exp = 1400, level = 60, wildLvl = 5, type = 'ground', type2 = 'dark'},

	['Kecleon'] = {offense = 2.5, defense = 8, specialattack = 8, life = 2856, vitality = 5.5, agility = 190, exp = 250, level = 100, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Smeargle'] = {offense = 2.5, defense = 8, specialattack = 8, life = 1500, vitality = 5.5, agility = 190, exp = 1500, level = 100, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Smeargle 1'] = {offense = 0.5, defense = 4, specialattack = 4, life = 500, vitality = 3.5, agility = 190, exp = 225, level = 10, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Smeargle 2'] = {offense = 0.7, defense = 5, specialattack = 4.5, life = 750, vitality = 4, agility = 190, exp = 450, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
		
	['Smeargle 3'] = {offense = 1.0, defense = 6, specialattack = 5, life = 1000, vitality = 4.5, agility = 190, exp = 550, level = 30, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 4'] = {offense = 1.2, defense = 6.5, specialattack = 5.5, life = 1250, vitality = 4, agility = 190, exp = 600, level = 40, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 5'] = {offense = 1.5, defense = 7, specialattack = 6, life = 1500, vitality = 4.5, agility = 190, exp = 750, level = 50, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 6'] = {offense = 1.7, defense = 7.5, specialattack = 6.5, life = 1750, vitality = 5, agility = 190, exp = 850, level = 6, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 7'] = {offense = 2, defense = 8, specialattack = 7, life = 2000, vitality = 5.5, agility = 190, exp = 1000, level = 70, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 8'] = {offense = 2.5, defense = 11, specialattack = 13, life = 2500, vitality = 6.5, agility = 190, exp = 1000, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
------------------ BALANCEAMENTO POKÉMONS DA 3 GENERATION ----------------
	['Treecko'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 190, exp = 550, level = 20, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Grovyle'] = {offense = 0.9, defense = 5.5, specialattack = 7, life = 1200, vitality = 6.8, agility = 200, exp = 850, level = 40, wildLvl = 1, type = 'grass', type2 = 'no type'},	
	
	['Sceptile'] = {offense = 1, defense = 8.7, specialattack = 8.8, life = 1800, vitality = 8, agility = 300, exp = 2500, level = 80, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Torchic'] = {offense = 1, defense = 3, specialattack = 4, life = 700, vitality = 2.5, agility = 200, exp = 550, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Combusken'] = {offense = 1.2, defense = 5, specialattack = 8.3, life = 1000, vitality = 6.8, agility = 200, exp = 850, level = 40, wildLvl = 1, type = 'fire', type2 = 'fighting'},
	
	['Blaziken'] = {offense = 1.7, defense = 13, specialattack = 9.5, life = 1500, vitality = 8, agility = 300, exp = 2500, level = 80, wildLvl = 1, type = 'fire', type2 = 'fighting'},
	
	['Mudkip'] = {offense = 0.5, defense = 4, specialattack = 3, life = 900, vitality = 2.5, agility = 190, exp = 550, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Marshtomp'] = {offense = 0.7, defense = 6.5, specialattack = 7.3, life = 1400, vitality = 6.8, agility = 200, exp = 850, level = 40, wildLvl = 1, type = 'water', type2 = 'ground'},

	['Swampert'] = {offense = 0.9, defense = 8, specialattack = 7.5, life = 2000, vitality = 8, agility = 250, exp = 2500, level = 80, wildLvl = 1, type = 'water', type2 = 'ground'},
		
	['Poochyena'] = {offense = 1, defense = 5, specialattack = 7, life = 1500, vitality = 7, agility = 200, exp = 1000, level = 20, wildLvl = 2, type = 'dark', type2 = 'no type'},

	['Mightyena'] = {offense = 1, defense = 8, specialattack = 10, life = 3200, vitality = 9, agility = 200, exp = 2200, level = 80, wildLvl = 2, type = 'dark', type2 = 'no type'},
	
	['Zigzagoon'] = {offense = 0.8, defense = 5, specialattack = 4, life = 1200, vitality = 4.5, agility = 250, exp = 750, level = 20, wildLvl = 2, type = 'normal', type2 = 'no type'},

	['Linoone'] = {offense = 1.3, defense = 6, specialattack = 7.5, life = 1700, vitality = 7.5, agility = 400, exp = 1200, level = 40, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Wurmple'] = {offense = 0.8, defense = 6, specialattack = 4, life = 650, vitality = 2.3, agility = 200, exp = 750, level = 10, wildLvl = 2, type = 'bug', type2 = 'poison'},

	['Silcoon'] = {offense = 1, defense = 9, specialattack = 2.5, life = 900, vitality = 3.9, agility = 170, exp = 1300, level = 25, wildLvl = 2, type = 'bug', type2 = 'poison'},
	
	['Cascoon'] = {offense = 1, defense = 9, specialattack = 2.5, life = 900, vitality = 3.9, agility = 170, exp = 1300, level = 25, wildLvl = 2, type = 'bug', type2 = 'poison'},
		
	['Beautifly'] = {offense = 1.7, defense = 8, specialattack = 9, life = 2400, vitality = 6.5, agility = 300, exp = 1800, level = 60, wildLvl = 2, type = 'bug', type2 = 'poison'},

	['Dustox'] = {offense = 1, defense = 10, specialattack = 7, life = 2400, vitality = 8.5, agility = 300, exp = 1800, level = 60, wildLvl = 2, type = 'bug', type2 = 'psychic'},

	['Lotad'] = {offense = 1, defense = 4, specialattack = 5, life = 750, vitality = 3.5, agility = 300, exp = 1000, level = 20, wildLvl = 2, type = 'water', type2 = 'grass'},
	
	['Lombre'] = {offense = 1.2, defense = 7, specialattack = 8, life = 1440, vitality = 7, agility = 300, exp = 1500, level = 40, wildLvl = 2, type = 'water', type2 = 'grass'},

	['Ludicolo'] = {offense = 1.5, defense = 8.5, specialattack = 9, life = 2354, vitality = 9.5, agility = 300, exp = 2300, level = 80, wildLvl = 2, type = 'water', type2 = 'grass'},
		
	['Seedot'] = {offense = 0.5, defense = 5, specialattack = 7, life = 1000, vitality = 3.5, agility = 200, exp = 1000, level = 20, wildLvl = 2, type = 'grass', type2 = 'no type'},

	['Nuzleaf'] = {offense = 1, defense = 6, specialattack = 10, life = 1400, vitality = 7, agility = 200, exp = 1500, level = 40, wildLvl = 2, type = 'grass', type2 = 'dark'},	
	
	['Shiftry'] = {offense = 1.5, defense = 7.5, specialattack = 9, life = 1700, vitality = 8, agility = 300, exp = 2300, level = 80, wildLvl = 2, type = 'grass', type2 = 'dark'},
		
	['Nincada'] = {offense = 0.5, defense = 4, specialattack = 2, life = 350, vitality = 3, agility = 180, exp = 650, level = 20, wildLvl = 2, type = 'bug', type2 = 'poison'},
	
	['Ninjask'] = {offense = 1.7, defense = 5, specialattack = 6.5, life = 3200, vitality = 5, agility = 400, exp = 3000, level = 100, wildLvl = 2, type = 'bug', type2 = 'flying'},
	
	['Shedinja'] = {offense = 0.5, defense = 5.0, specialattack = 6, life = 2500, vitality = 5, agility = 250, exp = 1300, level = 60, wildLvl = 2, type = 'bug', type2 = 'ghost'},
	
	['Taillow'] = {offense = 1, defense = 4, specialattack = 5, life = 750, vitality = 5, agility = 250, exp = 750, level = 30, wildLvl = 2, type = 'normal', type2 = 'flying'},
	
	['Swellow'] = {offense = 1.7, defense = 8, specialattack = 9, life = 2600, vitality = 8, agility = 350, exp = 2000, level = 80, wildLvl = 2, type = 'normal', type2 = 'flying'},
	
	['Shroomish'] = {offense = 1, defense = 5, specialattack = 2, life = 850, vitality = 3.5, agility = 200, exp = 700, level = 10, wildLvl = 2, type = 'grass', type2 = 'no type'},
		
	['Breloom'] = {offense = 3, defense = 5, specialattack = 12, life = 2600, vitality = 9, agility = 250, exp = 2400, level = 80, wildLvl = 2, type = 'grass', type2 = 'fighting'},
	
	['Spinda'] = {offense = 1, defense = 9, specialattack = 3, life = 1100, vitality = 4, agility = 200, exp = 1200, level = 30, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Wingull'] = {offense = 0.7, defense = 5, specialattack = 3.1, life = 750, vitality = 6, agility = 200, exp = 650, level = 30, wildLvl = 2, type = 'water', type2 = 'flying'},
	
	['Pelipper'] = {offense = 1.3, defense = 8, specialattack = 6.1, life = 2800, vitality = 9, agility = 220, exp = 2000, level = 80, wildLvl = 2, type = 'water', type2 = 'flying'},
	
	['Surskit'] = {offense = 0.5, defense = 5, specialattack = 5, life = 650, vitality = 6, agility = 200, exp = 550, level = 20, wildLvl = 2, type = 'bug', type2 = 'water'},
	
	['Masquerain'] = {offense = 1.5, defense = 8, specialattack = 6.1, life = 1800, vitality = 8, agility = 220, exp = 1300, level = 80, wildLvl = 2, type = 'bug', type2 = 'flying'},
		
	['Wailmer'] = {offense = 1, defense = 7, specialattack = 7, life = 3500, vitality = 11, agility = 300, exp = 1700, level = 70, wildLvl = 2, type = 'water', type2 = 'no type'},

	['Wailord'] = {offense = 1, defense = 12, specialattack = 10, life = 5500, vitality = 12, agility = 300, exp = 3500, level = 100, wildLvl = 2, type = 'water', type2 = 'no type'},
		
	['Skitty'] = {offense = 1.3, defense = 6, specialattack = 6, life = 750, vitality = 5, agility = 250, exp = 750, level = 20, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Delcatty'] = {offense = 1.5, defense = 7, specialattack = 8, life = 1600, vitality = 7, agility = 250, exp = 1800, level = 60, wildLvl = 2, type = 'normal', type2 = 'no type'},

	['Baltoy'] = {offense = 0.9, defense = 8, specialattack = 4.5, life = 650, vitality = 4.5, agility = 200, exp = 1000, level = 20, wildLvl = 2, type = 'ground', type2 = 'psychic'},
	
	['Claydol'] = {offense = 1.5, defense = 7, specialattack = 9.5, life = 2200, vitality = 8.5, agility = 230, exp = 2400, level = 80, wildLvl = 2, type = 'ground', type2 = 'psychic'},

	['Torkoal'] = {offense = 1.5, defense = 11, specialattack = 7.5, life = 2800, vitality = 10.5, agility = 250, exp = 2700, level = 100, wildLvl = 2, type = 'fire', type2 = 'no type'},
		
	['Barboach'] = {offense = 0.9, defense = 6.2, specialattack = 7, life = 750, vitality = 3.5, agility = 200, exp = 1500, level = 20, wildLvl = 2, type = 'water', type2 = 'ground'},
	
	['Whiscash'] = {offense = 1, defense = 7.5, specialattack = 9.5, life = 1800, vitality = 7, agility = 300, exp = 2000, level = 60, wildLvl = 2, type = 'water', type2 = 'ground'},
		
	['Luvdisc'] = {offense = 1.5, defense = 6, specialattack = 7.5, life = 1300, vitality = 4.5, agility = 250, exp = 1200, level = 20, wildLvl = 2, type = 'water', type2 = 'no type'},		
	
	['Corphish'] = {offense = 1.5, defense = 7.2, specialattack = 5, life = 800, vitality = 3.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Crawdaunt'] = {offense = 2, defense = 9.5, specialattack = 6.5, life = 1900, vitality = 8.5, agility = 300, exp = 2500, level = 80, wildLvl = 2, type = 'water', type2 = 'dark'},
	
	['Feebas'] = {offense = 0.1, defense = 1, specialattack = 0.4, life = 785, vitality = 2, agility = 110, exp = 100, level = 1, wildLvl = 1, type = 'water', type2 = 'no type'},
		
	['Carvanha'] = {offense = 2, defense = 6, specialattack = 5, life = 750, vitality = 4.5, agility = 250, exp = 750, level = 20, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Sharpedo'] = {offense = 1.8, defense = 7.5, specialattack = 8.5, life = 1400, vitality = 6.5, agility = 250, exp = 1900, level = 60, wildLvl = 2, type = 'water', type2 = 'dark'},
		
	['Trapinch'] = {offense = 0.7, defense = 5, specialattack = 5, life = 850, vitality = 3.5, agility = 200, exp = 850, level = 20, wildLvl = 2, type = 'ground', type2 = 'no type'},
	
	['Vibrava'] = {offense = 1.3, defense = 7, specialattack = 6.5, life = 1250, vitality = 5.5, agility = 200, exp = 1300, level = 40, wildLvl = 2, type = 'ground', type2 = 'dragon'},

	['Flygon'] = {offense = 1.7, defense = 9.5, specialattack = 8.5, life = 1850, vitality = 8.5, agility = 300, exp = 2600, level = 80, wildLvl = 2, type = 'ground', type2 = 'dragon'},
	
	['Makuhita'] = {offense = 1.5, defense = 5, specialattack = 6.5, life = 650, vitality = 4.5, agility = 200, exp = 1300, level = 20, wildLvl = 2, type = 'fighting', type2 = 'no type'},

	['Hariyama'] = {offense = 3.5, defense = 8, specialattack = 9, life = 2800, vitality = 6.5, agility = 250, exp = 2450, level = 80, wildLvl = 2, type = 'fighting', type2 = 'no type'},	
	
	['Electrike'] = {offense = 1.5, defense = 6.5, specialattack = 8.5, life = 1200, vitality = 4.5, agility = 200, exp = 1350, level = 20, wildLvl = 2, type = 'electric', type2 = 'no type'},
	
	['Manectric'] = {offense = 2, defense = 7, specialattack = 10.5, life = 2300, vitality = 7.5, agility = 250, exp = 2500, level = 80, wildLvl = 2, type = 'electric', type2 = 'no type'},	

	['Numel'] = {offense = 1.5, defense = 6, specialattack = 5, life = 1450, vitality = 4.5, agility = 200, exp = 250, level = 25, wildLvl = 2, type = 'fire', type2 = 'rock'},	
	
	['Camerupt'] = {offense = 2.5, defense = 8.5, specialattack = 9, life = 2400, vitality = 7.5, agility = 200, exp = 2500, level = 80, wildLvl = 2, type = 'fire', type2 = 'ground'},

--- CONFIGURAÇÕES REFERENTE AO LEVEL ESTÁ CORRETO ---
	
	['Spheal'] = {offense = 1, defense = 4.5, specialattack = 3.5, life = 750, vitality = 3.5, agility = 200, exp = 1200, level = 30, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Sealeo'] = {offense = 1.5, defense = 6.5, specialattack = 6.5, life = 1650, vitality = 5.5, agility = 200, exp = 2400, level = 60, wildLvl = 2, type = 'water', type2 = 'ice'},
	
	['Walrein'] = {offense = 1.7, defense = 9, specialattack = 10, life = 2200, vitality = 7.5, agility = 250, exp = 3600, level = 85, wildLvl = 2, type = 'water', type2 = 'ice'},
				
	['Cacnea'] = {offense = 1.5, defense = 5.5, specialattack = 5.5, life = 750, vitality = 4.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'grass', type2 = 'no type'},
	
	['Cacturn'] = {offense = 1.5, defense = 7.5, specialattack = 9.5, life = 1900, vitality = 8.5, agility = 250, exp = 2400, level = 80, wildLvl = 2, type = 'grass', type2 = 'dark'},
	
	['Snorunt'] = {offense = 1, defense = 4.5, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 250, exp = 1300, level = 30, wildLvl = 2, type = 'ice', type2 = 'no type'},
	
	['Glalie'] = {offense = 1.5, defense = 6.5, specialattack = 10.5, life = 2500, vitality = 7, agility = 250, exp = 2400, level = 80, wildLvl = 2, type = 'ice', type2 = 'no type'},
	
	['Spoink'] = {offense = 1, defense = 6, specialattack = 4, life = 1100, vitality = 6.5, agility = 200, exp = 1400, level = 30, wildLvl = 2, type = 'psychic', type2 = 'no type'},
		
	['Grumpig'] = {offense = 1.5, defense = 8.5, specialattack = 7.5, life = 2500, vitality = 10.5, agility = 250, exp = 3150, level = 80, wildLvl = 2, type = 'psychic', type2 = 'no type'},
	
	['Plusle'] = {offense = 0.5, defense = 5, specialattack = 5.5, life = 1350, vitality = 4.5, agility = 250, exp = 1400, level = 30, wildLvl = 2, type = 'electric', type2 = 'no type'},

	['Minun'] = {offense = 0.5, defense = 5, specialattack = 5.5, life = 1350, vitality = 4.5, agility = 250, exp = 1400, level = 30, wildLvl = 2, type = 'electric', type2 = 'no type'},
	
	['Mawile'] = {offense = 1.5, defense = 5, specialattack = 8.5, life = 2800, vitality = 8.5, agility = 250, exp = 2800, level = 80, wildLvl = 2, type = 'steel', type2 = 'no type'},

	['Meditite'] = {offense = 1.5, defense = 4, specialattack = 5, life = 1400, vitality = 4.5, agility = 250, exp = 1400, level = 30, wildLvl = 2, type = 'fighting', type2 = 'psychic'},
	
	['Medicham'] = {offense = 2.5, defense = 9, specialattack = 8.5, life = 2500, vitality = 7.5, agility = 250, exp = 2600, level = 80, wildLvl = 2, type = 'fighting', type2 = 'psychic'},
	
	['Swablu'] = {offense = 1, defense = 5, specialattack = 5, life = 580, vitality = 5.5, agility = 250, exp = 1600, level = 30, wildLvl = 2, type = 'normal', type2 = 'flying'},
		
	['Duskull'] = {offense = 0.5, defense = 4, specialattack = 4.5, life = 700, vitality = 5.5, agility = 200, exp = 750, level = 40, wildLvl = 2, type = 'ghost', type2 = 'no type'},
	
	['Dusclops'] = {offense = 1, defense = 6, specialattack = 6.5, life = 1350, vitality = 7.5, agility = 200, exp = 1600, level = 70, wildLvl = 2, type = 'ghost', type2 = 'no type'},

	['Budew'] = {offense = 0.5, defense = 3, specialattack = 4.5, life = 800, vitality = 6.5, agility = 200, exp = 2500, level = 10, wildLvl = 2, type = 'grass', type2 = 'poison'},
	
	['Roselia'] = {offense = 1, defense = 6, specialattack = 6, life = 1200, vitality = 6.5, agility = 200, exp = 2500, level = 30, wildLvl = 2, type = 'grass', type2 = 'poison'},

	['Roserade'] = {offense = 1.5, defense = 7.5, specialattack = 8, life = 1450, vitality = 7.5, agility = 200, exp = 2500, level = 80, wildLvl = 2, type = 'grass', type2 = 'poison'},
	
	['Slakoth'] = {offense = 1, defense = 4, specialattack = 3.5, life = 550, vitality = 2.1, agility = 200, exp = 850, level = 20, wildLvl = 2, type = 'fighting', type2 = 'no type'},
	
	['Vigoroth'] = {offense = 1.5, defense = 6, specialattack = 5.5, life = 1100, vitality = 2.1, agility = 200, exp = 1600, level = 50, wildLvl = 2, type = 'fighting', type2 = 'no type'},
	
	['Gulpin'] = {offense = 1, defense = 4.5, specialattack = 5.5, life = 1300, vitality = 5.5, agility = 200, exp = 1300, level = 30, wildLvl = 2, type = 'poison', type2 = 'no type'},
		
	['Swalot'] = {offense = 1.5, defense = 11, specialattack = 11, life = 2700, vitality = 8.5, agility = 250, exp = 2600, level = 80, wildLvl = 2, type = 'poison', type2 = 'no type'},

	['Whismur'] = {offense = 0.5, defense = 5.5, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'normal', type2 = 'no type'},

	['Loudred'] = {offense = 1, defense = 7.5, specialattack = 6, life = 1700, vitality = 5.5, agility = 200, exp = 2400, level = 50, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Exploud'] = {offense = 1.5, defense = 8.5, specialattack = 8, life = 2500, vitality = 8, agility = 200, exp = 3550, level = 80, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Clamperl'] = {offense = 2, defense = 6, specialattack = 5, life = 650, vitality = 4.5, agility = 250, exp = 1200, level = 20, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Huntail'] = {offense = 1.5, defense = 6, specialattack = 7, life = 1750, vitality = 7.5, agility = 250, exp = 1800, level = 60, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Gorebyss'] = {offense = 1.5, defense = 6, specialattack = 7, life = 1550, vitality = 7.5, agility = 250, exp = 1800, level = 60, wildLvl = 2, type = 'water', type2 = 'no type'},
		
	['Shuppet'] = {offense = 0.5, defense = 3, specialattack = 6.5, life = 700, vitality = 5.5, agility = 200, exp = 750, level = 30, wildLvl = 2, type = 'ghost', type2 = 'no type'},
	
	['Banette'] = {offense = 1, defense = 5.5, specialattack = 7.5, life = 1350, vitality = 7.5, agility = 200, exp = 1650, level = 70, wildLvl = 2, type = 'ghost', type2 = 'no type'},

	['Sableye'] = {offense = 1, defense = 5.5, specialattack = 8.5, life = 1350, vitality = 6, agility = 200, exp = 1700, level = 60, wildLvl = 2, type = 'ghost', type2 = 'no type'},
	
	['Seviper'] = {offense = 1, defense = 6, specialattack = 9, life = 2750, vitality = 7.5, agility = 250, exp = 2700, level = 80, wildLvl = 2, type = 'poison', type2 = 'no type'},
	
	['Zangoose'] = {offense = 2, defense = 6, specialattack = 8, life = 2500, vitality = 6.5, agility = 250, exp = 2700, level = 80, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Relicanth'] = {offense = 1, defense = 8, specialattack = 5, life = 1700, vitality = 8, agility = 250, exp = 2500, level = 50, wildLvl = 2, type = 'rock', type2 = 'water'},
	
	['Aron'] = {offense = 1, defense = 4, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 200, exp = 1200, level = 30, wildLvl = 2, type = 'rock', type2 = 'steel'},
	
	['Lairon'] = {offense = 1.5, defense = 5.5, specialattack = 6.5, life = 1700, vitality = 6.5, agility = 200, exp = 2500, level = 60, wildLvl = 2, type = 'rock', type2 = 'steel'},
	
	['Aggron'] = {offense = 2, defense = 7.5, specialattack = 9, life = 2500, vitality = 7.5, agility = 200, exp = 3450, level = 100, wildLvl = 2, type = 'rock', type2 = 'steel'},
				
	['Volbeat'] = {offense = 2.5, defense = 4.5, specialattack = 5.5, life = 1400, vitality = 6.5, agility = 200, exp = 1400, level = 40, wildLvl = 2, type = 'bug', type2 = 'no type'},

	['Illumise'] = {offense = 1, defense = 4.5, specialattack = 7, life = 1400, vitality = 6.5, agility = 250, exp = 2450, level = 40, wildLvl = 2, type = 'bug', type2 = 'no type'},
	
	['Lileep'] = {offense = 1, defense = 5, specialattack = 5, life = 800, vitality = 4.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'rock', type2 = 'grass'},
	
	['Anorith'] = {offense = 0.5, defense = 6, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'rock', type2 = 'bug'},
			
	['Ralts'] = {offense = 0.5, defense = 4.5, specialattack = 5, life = 1000, vitality = 3.0, agility = 200, exp = 1250, level = 20, wildLvl = 2, type = 'psychic', type2 = 'no type'},

	['Kirlia'] = {offense = 1.5, defense = 6.5, specialattack = 6.5, life = 1800, vitality = 6.5, agility = 200, exp = 2450, level = 60, wildLvl = 2, type = 'psychic', type2 = 'no type'},	
				
	['Bagon'] = {offense = 0.5, defense = 4.5, specialattack = 5, life = 1000, vitality = 3.0, agility = 200, exp = 1250, level = 20, wildLvl = 2, type = 'dragon', type2 = 'no type'},

	['Shelgon'] = {offense = 1.5, defense = 6.5, specialattack = 6.5, life = 1800, vitality = 6.5, agility = 200, exp = 2450, level = 60, wildLvl = 2, type = 'dragon', type2 = 'no type'},
				
	['Beldum'] = {offense = 0.5, defense = 4.5, specialattack = 5, life = 1000, vitality = 3.0, agility = 200, exp = 1250, level = 20, wildLvl = 2, type = 'psychic', type2 = 'steel'},

	['Metang'] = {offense = 1.5, defense = 6.5, specialattack = 6.5, life = 1800, vitality = 6.5, agility = 200, exp = 2450, level = 60, wildLvl = 2, type = 'psychic', type2 = 'steel'},

	['Lucario'] = {offense = 3, defense = 7, specialattack = 8.5, life = 1800, vitality = 7.5, agility = 200, exp = 2450, level = 60, wildLvl = 2, type = 'fighting', type2 = 'steel'},

	['Shiny Lucario'] = {offense = 3, defense = 11, specialattack = 8.5, life = 1800, vitality = 7.5, agility = 200, exp = 2450, level = 60, wildLvl = 5, type = 'fighting', type2 = 'steel'},

---------------------- // BOSS 3º GENERATION AND RARE POKÉMON // --------------	

	['Magmortar'] = {offense = 3, defense = 18, specialattack = 8, life = 3500, vitality = 14, agility = 300, exp = 20000, level = 150, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Electivire'] = {offense = 3, defense = 18, specialattack = 8, life = 3500, vitality = 14, agility = 300, exp = 20000, level = 150, wildLvl = 5, type = 'electric', type2 = 'no type'},
 
	['Milotic'] = {offense = 1.5, defense = 15, specialattack = 6.5, life = 4000, vitality = 16, agility = 350, exp = 20000, level = 150, wildLvl = 5, type = 'water', type2 = 'no type'},
			
 	['Absol'] = {offense = 1.5, defense = 13, specialattack = 11, life = 3000, vitality = 13, agility = 300, exp = 20000, level = 150, wildLvl = 5, type = 'dark', type2 = 'no type'},
		
	['Metagross'] = {offense = 2, defense = 18, specialattack = 10, life = 3500, vitality = 13.5, agility = 275, exp = 20000, level = 150, wildLvl = 5, type = 'psychic', type2 = 'steel'},
	
	['Salamence'] = {offense = 2, defense = 15, specialattack = 10, life = 3500, vitality = 15.5, agility = 275, exp = 20000, level = 150, wildLvl = 5, type = 'dragon', type2 = 'flying'},

	['Tangrowth'] = {offense = 2, defense = 15.5, specialattack = 9, life = 4000, vitality = 15, agility = 250, exp = 20000, level = 150, wildLvl = 5, type = 'grass', type2 = 'no type'},

	['Rhyperior'] = {offense = 2, defense = 17, specialattack = 10, life = 3500, vitality = 13, agility = 200, exp = 20000, level = 150, wildLvl = 5, type = 'rock', type2 = 'ground'},

	['Dusknoir'] = {offense = 1, defense = 12, specialattack = 13, life = 3500, vitality = 15, agility = 250, exp = 20000, level = 150, wildLvl = 5, type = 'ghost', type2 = 'no type'},
		
	['Slaking'] = {offense = 5, defense = 13, specialattack = 11, life = 3500, vitality = 15, agility = 300, exp = 20000, level = 150, wildLvl = 5, type = 'normal', type2 = 'no type'},
--
    ['Castform']	= {offense = 2.5, defense = 4.5, specialattack = 6.5, life = 4500, vitality = 6.5, agility = 200, exp = 1400, level = 80, wildLvl = 2, type = 'normal', type2 = 'no type'},

    ['Castform Fire']	= {offense = 2.5, defense = 4.5, specialattack = 6.5, life = 4500, vitality = 6.5, agility = 200, exp = 1400, level = 80, wildLvl = 2, type = 'fire', type2 = 'no type'},

    ['Castform Ice']	= {offense = 2.5, defense = 4.5, specialattack = 6.5, life = 4500, vitality = 6.5, agility = 200, exp = 1400, level = 80, wildLvl = 2, type = 'ice', type2 = 'no type'},

    ['Castform Water']	= {offense = 2.5, defense = 4.5, specialattack = 6.5, life = 4500, vitality = 6.5, agility = 200, exp = 1400, level = 80, wildLvl = 2, type = 'water', type2 = 'no type'},

 	['Kecleon'] = {offense = 1, defense = 9, specialattack = 3, life = 2300, vitality = 4, agility = 200, exp = 1800, level = 40, wildLvl = 2, type = 'normal', type2 = 'no type'},
							
--	['Lunatone'] = {offense = 2, defense = 10, specialattack = 10.5, life = 3200, vitality = 8.5, agility = 250, exp = 7000, level = 150, wildLvl = 2, type = 'ground', type2 = 'psychic'},
	
--	['Solrock'] = {offense = 2, defense = 10, specialattack = 10.5, life = 3200, vitality = 8.5, agility = 250, exp = 7000, level = 150, wildLvl = 2, type = 'ground', type2 = 'psychic'},

--	['Cradily'] = {offense = 1.5, defense = 8, specialattack = 10, life = 2500, vitality = 8.5, agility = 200, exp = 3600, level = 100, wildLvl = 2, type = 'rock', type2 = 'grass'},

 	['Altaria'] = {offense = 1.5, defense = 7.5, specialattack = 9.5, life = 2600, vitality = 9.5, agility = 250, exp = 3800, level = 80, wildLvl = 2, type = 'normal', type2 = 'dragon'},

--	['Armaldo'] = {offense = 2, defense = 10, specialattack = 8.5, life = 3000, vitality = 8.5, agility = 200, exp = 3600, level = 100, wildLvl = 2, type = 'rock', type2 = 'bug'},
		
	['Gardevoir'] = {offense = 2, defense = 8.5, specialattack = 12, life = 4000, vitality = 8.5, agility = 250, exp = 3100, level = 100, wildLvl = 2, type = 'psychic', type2 = 'no type'},
	
	['Tropius'] = {offense = 2, defense = 10, specialattack = 8.5, life = 3200, vitality = 8.5, agility = 250, exp = 4000, level = 100, wildLvl = 2, type = 'grass', type2 = 'flying'},

-- // POKEMON'S TOWER \\ --
	
	['Big Porygon'] = {offense = 5, defense = 5, specialattack = 5, life = 15000, vitality = 16.5, agility = 450, exp = 1450, level = 100, wildLvl = 2.5, type = 'psychic', type2 = 'no type'},
		
	['Shiny Scizor'] = {offense = 4, defense = 15, specialattack = 12, life = 6000, vitality = 16.5, agility = 350, exp = 1450, level = 100, wildLvl = 5, type = 'bug', type2 = 'steel'},
	
	['Shiny Salamence'] = {offense = 2, defense = 12, specialattack = 6, life = 4500, vitality = 8.5, agility = 275, exp = 7500, level = 150, wildLvl = 5, type = 'dragon', type2 = 'flying'},

	['Shiny Magmortar'] = {offense = 3, defense = 13, specialattack = 8, life = 5500, vitality = 12, agility = 300, exp = 7500, level = 150, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Shiny Electivire'] = {offense = 3, defense = 14, specialattack = 10, life = 5500, vitality = 14, agility = 300, exp = 7500, level = 150, wildLvl = 5, type = 'electric', type2 = 'no type'},

-- Armadilhas / Trap and SummonNpc --
	
	['Hunter'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 7500, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hunterf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 7500, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Aporygon'] = {offense = 0.6, defense = 4.1, specialattack = 5, life = 3500, vitality = 4.6, agility = 0, exp = 92, level = 20, wildLvl = 5, type = 'rock', type2 = 'no type'},				
	
	['Abporygon'] = {offense = 0.6, defense = 4.1, specialattack = 5, life = 3500, vitality = 4.6, agility = 0, exp = 92, level = 20, wildLvl = 5, type = 'rock', type2 = 'no type'},				
	
	['Hoodeasy'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 15000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodeasyf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 15000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodmedium'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 20000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodmediumf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 20000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodhard'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 25000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodhardf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 25000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodexpert'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 30000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodexpertf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 30000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodlendary'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 50000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodlendaryf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 50000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},

	
}
