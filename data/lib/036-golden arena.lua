local arena = {

	["Golden"] = {	
		z= 6, -- andar da arena para criação dos monsteres
		TopLeft = {x = 1262,y = 1639}, -- área superior esquerda da arena.
		BottomRight = {x = 1341,y = 1686}, -- área inferior a direita da arena.
		ExitArena = {x = 1302, y = 1675, z = 7}, -- Lugar da saida da golden.
		Teleport = {x = 1303, y = 1662, z = 6}, -- área do mapa onde o player será teleportado.
		ArenaPlayers = {fromx = 1262, fromy = 1639, fromz = 6, tox = 1341, toy = 1686, toz= 6}, -- área onde será checado se tem players
		ArenaUpper = {x = 1262, y = 1639, z = 6}, -- igual ao TopLeft
		ArenaLower = {x = 1341, y = 1686, z = 6}, -- Igual ao BottomRight
		Storage = {
			254660, -- Storage referente ao player atacar e receber pontos.
			2154601, -- Não poder usar fly, ride ou surf.
			254661 -- Storage referente a checagem do player in golden.
		},
		pokemon = {
			{"Caterpie", "Weedle", "Pidgey", "Rattata", "Oddish", "Paras"}, -- área referente ao pokémons cada {} é uma wave.
			{"Poliwag", "Bellsprout", "Magikarp", "Togepi", "Hoppip", "Sunkern"},
			{"Metapod", "Horsea", "Kakuna", "Spearow", "Sentret", "Ekans"},
			{"Ledyba", "Nidoranfe", "Spinarak", "Nidoranma", "Chinchou", "Zubat"},
			{"Diglett", "Pineco", "Mankey", "Slugma", "Abra", "Swinub"},
			{"Tentacool", "Remoraid", "Geodude", "Slowpoke", "Magnemite", "Nincada"},
			{"Doduo", "Grimer", "Shellder", "Krabby", "Voltorb", "Exeggcute"},
			{"Koffing", "Pineco", "Spinarak", "Remoraid", "Zubat", "Togepi"},
			{"Bulbasaur", "Pichu", "Charmander", "Cleffa", "Squirtle", "Igglybuff"},
			{"Pidgeotto", "Mareep", "Sandshrew", "Marill", "Vulpix", "Wooper"},
			{"Venonat", "Houndour", "Meowth", "Phanpy", "Psyduck", "Machop"},
			{"Ponyta", "Seel", "Gastly", "Cubone", "Staryu", "Eevee"},
			{"Omanyte", "Kabuto", "Chikorita", "Cyndaquil", "Totodile", "Hoothoot"},
			{"Butterfree", "Magby", "Beedril", "Elekid", "Larvitar", "Raticate"},
			{"Nidorina", "Nidorino", "Gloom", "Growlithe", "Poliwhirl", "Weepinbell"},
			{"Drowzee", "Rhyhorn", "Dratini", "Natu", "Skiploom", "Sunflora"},
			{"Dunsparce", "Snubbull", "Teddiursa", "Tyrogue", "Smoochum", "Elekid"},
			{"Ivysaur", "Charmeleon", "Wartortle", "Furret", "Ledian", "Ariados"},
			{"Arbok", "Flaaffy", "Clefairy", "Jigglypuff", "Gligar", "Golbat"},
			{"Shuckle", "Dugtrio", "Delibird", "Kadabra", "Machoke", "Graveler"},
			{"Haunter", "Kingler", "Electrode", "Seadra", "Seaking", "Porygon"},
			{"Bayleef", "Quilava", "Croconaw", "Haunter", "Kadabra", "Porygon"},
			{"Fearow", "Tauros", "Pikachu", "Bellossom", "Vileplume", "Jumpluff"},
			{"Parasect", "Yanma", "Murkrow", "Sneasel", "Farfetch'd", "Slowbro"},
			{"Primeape", "Persian", "Venomoth", "Corsola", "Stantler", "Dodrio"},
			{"Onix", "Hypno", "Marowak", "Weezing", "Tangela", "Pikachu"},
			{"Dewgong", "Hitmontop", "Cloyster", "Pupitar", "Hitmonlee", "Hitmonchan"},
			{"Shedinja", "Lickitung", "Chansey", "Vaporeon", "Jolteon", "Flareon"},
			{"Dragonair", "Noctowl", "Azumarill", "Quagsire", "Espeon", "Umbreon"},
			{"Sandslash", "Mr. Mime", "Nidoking", "Octillery", "Wigglytuff", "Golduck"},
			{"Nidoqueen", "Golem", "Politoed", "Clefable", "Poliwrath", "Victreebel"},
			{"Venusaur", "Porygon2", "Charizard", "Blastoise", "Miltank", "Pidgeot"},
			{"Raichu", "Ninetales", "Alakazam", "Machamp", "´Tentacruel", "Magneton"},
			{"Muk", "Gengar", "Rhydon", "Kanghaskan", "Starmie", "Jynx"},
			{"Omastar", "Kabutops", "Meganium", "Typhlosion", "Feraligatr", "Crobat"},
			{"Lanturn", "Togetic", "Xatu", "Ampharos", "Girafarig", "Forretress"},
			{"Granbull", "Magcargo", "Piloswine", "Donphan", "Meganium", "Jynx"},
			{"Arcanine", "Rapidash", "Exeguttor", "Scyther", "Magmar", "Electabuzz"},
			{"Pinsir", "Gyarados", "Snorlax", "Dragonite", "Lapras", "Sudowoodo"},
			{"Slowking", "Misdreavus", "Wobbuffet", "Steelix", "Scizor", "Heracross"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Tyranitar", "Castform", "Tropius", "Absol", "Kingdra", "Dragonite"},
			{"Slowking", "Arcanine", "Jynx", "Gengar", "Kanghaskan", "Alakazam"},
			{"Blissey", "Gyarados", "Misdreavus", "Snorlax", "Wobbuffet", "Sudowoodo"},
			{"Gyarados", "Kangaskhan", "Slowking", "Scizor", "Dragonite", "Arcanine"},
			{"Scyther", "Jynx", "Aerodactyl", "Snorlax", "Wobbuffet", "Tyranitar"},
			{"Kabutops", "Omastar", "Kingdra", "Electabuzz", "Magmar", "Lapras"},
			{"Alakazam", "Tentacruel", "Stantler", "Skarmory", "Xatu", "Houndoom"},
			{"Machamp", "Venusaur", "Typhlosion", "Feraligatr", "Girafarig", "Misdreavus"},
			{"Scyther", "Misdreavus", "Skarmory", "Kangaskhan", "Mr.Mime", "Lapras"},
			{"Venusaur", "Porygon2", "Charizard", "Blastoise", "Miltank", "Pidgeot"},
			{"Raichu", "Ninetales", "Alakazam", "Machamp", "´Tentacruel", "Magneton"},
			{"Slowking", "Misdreavus", "Wobbuffet", "Steelix", "Scizor", "Heracross"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Scyther", "Misdreavus", "Skarmory", "Kangaskhan", "Mr.Mime", "Lapras"},
			{"Venusaur", "Porygon2", "Charizard", "Blastoise", "Miltank", "Pidgeot"},
			{"Lanturn", "Togetic", "Xatu", "Ampharos", "Girafarig", "Forretress"},
			{"Granbull", "Magcargo", "Piloswine", "Donphan", "Meganium", "Jynx"},
			{"Blissey", "Gyarados", "Misdreavus", "Snorlax", "Wobbuffet", "Sudowoodo"},
			{"Gyarados", "Kangaskhan", "Slowking", "Scizor", "Dragonite", "Arcanine"},
			{"Charizard", "Venusaur", "Blastoise", "Feraligatr", "Thyplosion", "Meganium"},
			{"Skarmory", "Jynx", "Wobbuffet", "Ursaring", "Gengar", "Sudowoodo"},
			{"Golem", "Machamp", "Arcanine", "Stelix", "Tyranitar", "Dragonite"},
			{"Tyranitar", "Castform", "Tropius", "Absol", "Kingdra", "Dragonite"},
			{"Slowking", "Arcanine", "Jynx", "Gengar", "Kanghaskan", "Alakazam"},
			{"Blissey", "Gyarados", "Misdreavus", "Snorlax", "Wobbuffet", "Sudowoodo"},
			{"Gyarados", "Kangaskhan", "Slowking", "Scizor", "Dragonite", "Arcanine"},
			{"Scyther", "Jynx", "Aerodactyl", "Snorlax", "Wobbuffet", "Tyranitar"},
			{"Kabutops", "Omastar", "Kingdra", "Electabuzz", "Magmar", "Lapras"},
			{"Slowking", "Misdreavus", "Wobbuffet", "Steelix", "Scizor", "Heracross"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Scyther", "Misdreavus", "Skarmory", "Kangaskhan", "Mr.Mime", "Lapras"},
			{"Venusaur", "Porygon2", "Charizard", "Blastoise", "Miltank", "Pidgeot"},
			{"Lanturn", "Togetic", "Xatu", "Ampharos", "Girafarig", "Forretress"},
			{"Granbull", "Magcargo", "Piloswine", "Donphan", "Meganium", "Jynx"},
			{"Blissey", "Gyarados", "Misdreavus", "Snorlax", "Wobbuffet", "Sudowoodo"},
			{"Gyarados", "Kangaskhan", "Slowking", "Scizor", "Dragonite", "Arcanine"},
			{"Charizard", "Venusaur", "Blastoise", "Feraligatr", "Thyplosion", "Meganium"},
			{"Snorlax", "Scizor", "Slowking", "Kingdra", "Magmar", "Blissey"},
			{"Misdreavus", "Kabutops", "Alakazam", "Gyarados", "Electabuzz", "Houndoom"},
			{"Smeargle7", "Machamp", "Gengar", "Rhydon", "Jynx", "Feraligatr"},
			{"Togetic", "Crobat", "Muk", "Blastoise", "Raichu", "Magmar"},
			{"Porygon2", "Smeargle7", "Ampharos", "Forretress", "Piloswine", "Donphan"},
			{"Xatu", "Girafarig", "Mr. Mime", "Scyther", "Mantine", "Gyarados"},
			{"Lanturn", "Tyranitar", "Typhlosion", "Feraligatr", "Arcanine", "Exeggutor"},
			{"Kingdra", "Skarmory", "Ursaring", "Wobbuffet", "Lapras", "Rapidash"},
			{"Ampharos", "Blissey", "Steelix", "Scizor", "Misdreavus", "Houndoom"},
			{"Snorlax", "Scizor", "Slowking", "Kingdra", "Magmar", "Blissey"},
			{"Misdreavus", "Kabutops", "Alakazam", "Gyarados", "Electabuzz", "Houndoom"},
			{"Smeargle7", "Machamp", "Gengar", "Rhydon", "Jynx", "Feraligatr"},
			{"Togetic", "Crobat", "Muk", "Blastoise", "Raichu", "Magmar"},
			{"Xatu", "Girafarig", "Mr. Mime", "Scyther", "Mantine", "Gyarados"},
			{"Lanturn", "Tyranitar", "Typhlosion", "Feraligatr", "Arcanine", "Exeggutor"},
			{"Kingdra", "Skarmory", "Ursaring", "Wobbuffet", "Lapras", "Rapidash"},
			{"Venusaur", "Blissey", "Steelix", "Scizor", "Misdreavus", "Houndoom"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Scyther", "Misdreavus", "Skarmory", "Kangaskhan", "Mr.Mime", "Lapras"},
			{"Mr.Mime", "Chansey", "Rhydon", "Pinsir", "Lapras", "Aerodactyl"},
			{"Skarmory", "Jynx", "Wobbuffet", "Ursaring", "Gengar", "Sudowoodo"},
			{"Sceptile", "Blaziken", "Swampert", "Shiftry", "Ludicolo", "Swellow"},
			{"Ninjask", "Exploud", "Medicham", "Mawile", "Manectric", "Camerupt"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Flygon", "Zangoose", "Altaria", "Seviper", "Crawdaunt", "Kecleon"},
			{"Claydol", "Banette", "Metang", "Glalie", "Lucario", "Breloom"},
			{"Mightyena", "Flygon", "Swampert", "Blaziken", "Lucario", "Manectric"},
			{"Abomasnow", "Zangoose", "Flygon", "Glalie", "Metang", "Camerupt"},
			{"Kangaskhan", "Flygon", "Metang", "Gyarados", "Feraligatr", "Mantine"},
			{"Cacturn", "Mightyena", "Miltank", "Meganium", "Shifrty", "Swellow"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Tyranitar", "Abomasnow", "Glalie", "Mawile", "Gengar", "Alakazam"},
			{"Flygon", "Lapras", "Swellow", "Camerupt", "Blissey", "Aerodactyl"},
			{"Feraligatr", "Venusaur", "Mantine", "Altaria", "Shiftry", "Blaziken"},
			{"Medicham", "Exploud", "Typhlosion", "Skarmory", "Kanghaskan", "Breloom"},
			{"Abomasnow", "Walrein", "Glalie", "Zangoose", "Ninjask", "Ludicolo"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Cacturn", "Mightyena", "Miltank", "Meganium", "Shifrty", "Swellow"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Flygon", "Lapras", "Swellow", "Camerupt", "Blissey", "Aerodactyl"},
			{"Feraligatr", "Venusaur", "Mantine", "Altaria", "Shiftry", "Blaziken"},
			{"Medicham", "Exploud", "Typhlosion", "Skarmory", "Kanghaskan", "Breloom"},
			{"Charizard", "Venusaur", "Blastoise", "Feraligatr", "Thyplosion", "Meganium"},
			{"Snorlax", "Scizor", "Slowking", "Kingdra", "Magmar", "Blissey"},
			{"Misdreavus", "Kabutops", "Alakazam", "Gyarados", "Electabuzz", "Houndoom"},
			{"Smeargle7", "Machamp", "Gengar", "Rhydon", "Jynx", "Feraligatr"},
			{"Kingdra", "Skarmory", "Ursaring", "Wobbuffet", "Lapras", "Rapidash"},
			{"Venusaur", "Blissey", "Steelix", "Scizor", "Misdreavus", "Houndoom"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Scyther", "Misdreavus", "Skarmory", "Kangaskhan", "Mr.Mime", "Lapras"},
			{"Mr.Mime", "Chansey", "Rhydon", "Pinsir", "Lapras", "Aerodactyl"},
			{"Skarmory", "Jynx", "Wobbuffet", "Ursaring", "Gengar", "Sudowoodo"},
			{"Slowking", "Misdreavus", "Wobbuffet", "Steelix", "Scizor", "Heracross"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Scyther", "Misdreavus", "Skarmory", "Kangaskhan", "Mr.Mime", "Lapras"},
			{"Venusaur", "Porygon2", "Charizard", "Blastoise", "Miltank", "Pidgeot"},
			{"Medicham", "Exploud", "Typhlosion", "Skarmory", "Kanghaskan", "Breloom"},
			{"Abomasnow", "Walrein", "Glalie", "Zangoose", "Ninjask", "Ludicolo"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Cacturn", "Mightyena", "Miltank", "Meganium", "Shifrty", "Swellow"},
			{"Kangaskhan", "Flygon", "Metang", "Gyarados", "Feraligatr", "Mantine"},
			{"Cacturn", "Mightyena", "Miltank", "Meganium", "Shifrty", "Swellow"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Tyranitar", "Abomasnow", "Glalie", "Mawile", "Gengar", "Alakazam"},
			{"Sceptile", "Blaziken", "Swampert", "Shiftry", "Ludicolo", "Swellow"},
			{"Ninjask", "Exploud", "Medicham", "Mawile", "Manectric", "Camerupt"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Flygon", "Zangoose", "Altaria", "Seviper", "Crawdaunt", "Kecleon"},
			{"Claydol", "Banette", "Metang", "Glalie", "Lucario", "Breloom"},
			{"Charizard", "Venusaur", "Blastoise", "Feraligatr", "Thyplosion", "Meganium"},
			{"Skarmory", "Jynx", "Wobbuffet", "Ursaring", "Gengar", "Sudowoodo"},
			{"Golem", "Machamp", "Arcanine", "Stelix", "Tyranitar", "Dragonite"},
			{"Xatu", "Girafarig", "Mr. Mime", "Scyther", "Mantine", "Gyarados"},
			{"Lanturn", "Tyranitar", "Typhlosion", "Feraligatr", "Arcanine", "Exeggutor"},
			{"Kingdra", "Skarmory", "Ursaring", "Wobbuffet", "Lapras", "Rapidash"},
			{"Ampharos", "Blissey", "Steelix", "Scizor", "Misdreavus", "Houndoom"},
			{"Snorlax", "Scizor", "Slowking", "Kingdra", "Magmar", "Blissey"},
			{"Misdreavus", "Kabutops", "Alakazam", "Gyarados", "Electabuzz", "Houndoom"},
			{"Smeargle7", "Machamp", "Gengar", "Rhydon", "Jynx", "Feraligatr"},
			{"Togetic", "Crobat", "Muk", "Blastoise", "Raichu", "Magmar"},
			{"Xatu", "Girafarig", "Mr. Mime", "Scyther", "Mantine", "Gyarados"},
			{"Flygon", "Lapras", "Swellow", "Camerupt", "Blissey", "Aerodactyl"},
			{"Feraligatr", "Venusaur", "Mantine", "Altaria", "Shiftry", "Blaziken"},
			{"Medicham", "Exploud", "Typhlosion", "Skarmory", "Kanghaskan", "Breloom"},
			{"Charizard", "Venusaur", "Blastoise", "Feraligatr", "Thyplosion", "Meganium"},
			{"Snorlax", "Scizor", "Slowking", "Kingdra", "Magmar", "Blissey"},
			{"Misdreavus", "Kabutops", "Alakazam", "Gyarados", "Electabuzz", "Houndoom"},
			{"Smeargle7", "Machamp", "Gengar", "Rhydon", "Jynx", "Feraligatr"},
			{"Kingdra", "Skarmory", "Ursaring", "Wobbuffet", "Lapras", "Rapidash"},
			{"Venusaur", "Blissey", "Steelix", "Scizor", "Misdreavus", "Houndoom"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Scyther", "Misdreavus", "Skarmory", "Kangaskhan", "Mr.Mime", "Lapras"},
			{"Mr.Mime", "Chansey", "Rhydon", "Pinsir", "Lapras", "Aerodactyl"},
			{"Skarmory", "Jynx", "Wobbuffet", "Ursaring", "Gengar", "Sudowoodo"},
			{"Slowking", "Misdreavus", "Wobbuffet", "Steelix", "Scizor", "Heracross"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Ninjask", "Exploud", "Medicham", "Mawile", "Manectric", "Camerupt"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Flygon", "Zangoose", "Altaria", "Seviper", "Crawdaunt", "Kecleon"},
			{"Claydol", "Banette", "Metang", "Glalie", "Lucario", "Breloom"},
			{"Mightyena", "Flygon", "Swampert", "Blaziken", "Lucario", "Manectric"},
			{"Abomasnow", "Zangoose", "Flygon", "Glalie", "Metang", "Camerupt"},
			{"Kangaskhan", "Flygon", "Metang", "Gyarados", "Feraligatr", "Mantine"},
			{"Pinsir", "Gyarados", "Snorlax", "Dragonite", "Lapras", "Sudowoodo"},
			{"Slowking", "Misdreavus", "Wobbuffet", "Steelix", "Scizor", "Heracross"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Tyranitar", "Castform", "Tropius", "Absol", "Kingdra", "Dragonite"},
			{"Slowking", "Arcanine", "Jynx", "Gengar", "Kanghaskan", "Alakazam"},
			{"Blissey", "Gyarados", "Misdreavus", "Snorlax", "Wobbuffet", "Sudowoodo"},
			{"Gyarados", "Kangaskhan", "Slowking", "Scizor", "Dragonite", "Arcanine"},
			{"Scyther", "Jynx", "Aerodactyl", "Snorlax", "Wobbuffet", "Tyranitar"},
			{"Kabutops", "Omastar", "Kingdra", "Electabuzz", "Magmar", "Lapras"},
			{"Tyranitar", "Abomasnow", "Glalie", "Mawile", "Gengar", "Alakazam"},
			{"Flygon", "Lapras", "Swellow", "Camerupt", "Blissey", "Aerodactyl"},
			{"Feraligatr", "Venusaur", "Mantine", "Altaria", "Shiftry", "Blaziken"},
			{"Medicham", "Exploud", "Typhlosion", "Skarmory", "Kanghaskan", "Breloom"},
			{"Abomasnow", "Walrein", "Glalie", "Zangoose", "Ninjask", "Ludicolo"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Cacturn", "Mightyena", "Miltank", "Meganium", "Shifrty", "Swellow"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Flygon", "Lapras", "Swellow", "Camerupt", "Blissey", "Aerodactyl"},
			{"Shiny Marowak", "Shiny Tentacruel", "Shiny Hitmonlee", "Shiny Hitmonchan", "Shiny Hitmontop", "Shiny Lucario"},
			{"Shiny Xatu", "Shiny Crobat", "Shiny Politoed", "Shiny Lanturn", "Shiny Marowak", "Shiny Magcargo"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Tauros", "Shiny Charizard", "Shiny Venusaur", "Shiny Pidgeot", "Shiny Magneton", "Shiny Ariados"},
			{"Shiny Lucario", "Shiny Pidgeot", "Shiny Blastoise", "Shiny Venomoth", "Shiny Xatu", "Shiny Espeon"},
			{"Shiny Gengar", "Shiny Muk", "Shiny Feraligatr", "Shiny Tentacruel", "Shiny Lanturn", "Shiny Electrode"},
			{"Shiny Pupitar", "Shiny Pinsir", "Shiny Ampharos", "Shiny Tangela", "Shiny Arcanine", "Shiny Politoed"},
			{"Shiny Dragonair", "Shiny Mr.Mime", "Shiny Raichu", "Shiny Meganium", "Shiny Crobat", "Shiny Ninetales"},
			{"Smeargle 8", "Shiny Gengar", "Shiny Marowak", "Shiny Magcargo", "Shiny Ariados", "Shiny Dodrio"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Tauros", "Shiny Charizard", "Shiny Venusaur", "Shiny Pidgeot", "Shiny Magneton", "Shiny Ariados"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},
			{"Shiny Marowak", "Shiny Tentacruel", "Shiny Hitmonlee", "Shiny Hitmonchan", "Shiny Hitmontop", "Shiny Lucario"},
			{"Shiny Xatu", "Shiny Crobat", "Shiny Politoed", "Shiny Lanturn", "Shiny Marowak", "Shiny Magcargo"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Lucario", "Shiny Pidgeot", "Shiny Blastoise", "Shiny Venomoth", "Shiny Xatu", "Shiny Espeon"},
			{"Shiny Gengar", "Shiny Muk", "Shiny Feraligatr", "Shiny Tentacruel", "Shiny Lanturn", "Shiny Electrode"},
			{"Shiny Pupitar", "Shiny Pinsir", "Shiny Ampharos", "Shiny Tangela", "Shiny Arcanine", "Shiny Politoed"},
			{"Shiny Dragonair", "Shiny Mr.Mime", "Shiny Raichu", "Shiny Meganium", "Shiny Crobat", "Shiny Ninetales"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Tauros", "Shiny Charizard", "Shiny Venusaur", "Shiny Pidgeot", "Shiny Magneton", "Shiny Ariados"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},
			{"Shiny Marowak", "Shiny Tentacruel", "Shiny Hitmonlee", "Shiny Hitmonchan", "Shiny Hitmontop", "Shiny Lucario"},
			{"Shiny Xatu", "Shiny Crobat", "Shiny Politoed", "Shiny Lanturn", "Shiny Marowak", "Shiny Magcargo"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Lucario", "Shiny Pidgeot", "Shiny Blastoise", "Shiny Venomoth", "Shiny Xatu", "Shiny Espeon"},
			{"Shiny Gengar", "Shiny Muk", "Shiny Feraligatr", "Shiny Tentacruel", "Shiny Lanturn", "Shiny Electrode"},
			{"Shiny Pupitar", "Shiny Pinsir", "Shiny Ampharos", "Shiny Tangela", "Shiny Arcanine", "Shiny Politoed"},
			{"Shiny Dragonair", "Shiny Mr.Mime", "Shiny Raichu", "Shiny Meganium", "Shiny Crobat", "Shiny Ninetales"},
			{"Shiny Marowak", "Shiny Tentacruel", "Shiny Hitmonlee", "Shiny Hitmonchan", "Shiny Hitmontop", "Shiny Lucario"},
			{"Shiny Xatu", "Shiny Crobat", "Shiny Politoed", "Shiny Lanturn", "Shiny Marowak", "Shiny Magcargo"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Tauros", "Shiny Charizard", "Shiny Venusaur", "Shiny Pidgeot", "Shiny Magneton", "Shiny Ariados"},
			{"Shiny Lucario", "Shiny Pidgeot", "Shiny Blastoise", "Shiny Venomoth", "Shiny Xatu", "Shiny Espeon"},
			{"Shiny Gengar", "Shiny Muk", "Shiny Feraligatr", "Shiny Tentacruel", "Shiny Lanturn", "Shiny Electrode"},
			{"Shiny Pupitar", "Shiny Pinsir", "Shiny Ampharos", "Shiny Tangela", "Shiny Arcanine", "Shiny Politoed"},
			{"Shiny Dragonair", "Shiny Mr.Mime", "Shiny Raichu", "Shiny Meganium", "Shiny Crobat", "Shiny Ninetales"},
			{"Smeargle 8", "Shiny Gengar", "Shiny Marowak", "Shiny Magcargo", "Shiny Ariados", "Shiny Dodrio"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Tauros", "Shiny Charizard", "Shiny Venusaur", "Shiny Pidgeot", "Shiny Magneton", "Shiny Ariados"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},
			{"Tyranitar", "Castform", "Tropius", "Absol", "Kingdra", "Dragonite"},
			{"Slowking", "Arcanine", "Jynx", "Gengar", "Kanghaskan", "Alakazam"},
			{"Blissey", "Gyarados", "Misdreavus", "Snorlax", "Wobbuffet", "Sudowoodo"},
			{"Gyarados", "Kangaskhan", "Slowking", "Scizor", "Dragonite", "Arcanine"},
			{"Scyther", "Jynx", "Aerodactyl", "Snorlax", "Wobbuffet", "Tyranitar"},
			{"Kabutops", "Omastar", "Kingdra", "Electabuzz", "Magmar", "Lapras"},
			{"Slowking", "Misdreavus", "Wobbuffet", "Steelix", "Scizor", "Heracross"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Scyther", "Misdreavus", "Skarmory", "Kangaskhan", "Mr.Mime", "Lapras"},
			{"Venusaur", "Porygon2", "Charizard", "Blastoise", "Miltank", "Pidgeot"},
			{"Lanturn", "Togetic", "Xatu", "Ampharos", "Girafarig", "Forretress"},
			{"Granbull", "Magcargo", "Piloswine", "Donphan", "Meganium", "Jynx"},
			{"Blissey", "Gyarados", "Misdreavus", "Snorlax", "Wobbuffet", "Sudowoodo"},
			{"Gyarados", "Kangaskhan", "Slowking", "Scizor", "Dragonite", "Arcanine"},
			{"Charizard", "Venusaur", "Blastoise", "Feraligatr", "Thyplosion", "Meganium"},
			{"Snorlax", "Scizor", "Slowking", "Kingdra", "Magmar", "Blissey"},
			{"Misdreavus", "Kabutops", "Alakazam", "Gyarados", "Electabuzz", "Houndoom"},
			{"Smeargle7", "Machamp", "Gengar", "Rhydon", "Jynx", "Feraligatr"},
			{"Togetic", "Crobat", "Muk", "Blastoise", "Raichu", "Magmar"},
			{"Porygon2", "Smeargle7", "Ampharos", "Forretress", "Piloswine", "Donphan"},
			{"Xatu", "Girafarig", "Mr. Mime", "Scyther", "Mantine", "Gyarados"},
			{"Lanturn", "Tyranitar", "Typhlosion", "Feraligatr", "Arcanine", "Exeggutor"},
			{"Kingdra", "Skarmory", "Ursaring", "Wobbuffet", "Lapras", "Rapidash"},
			{"Ampharos", "Blissey", "Steelix", "Scizor", "Misdreavus", "Houndoom"},
			{"Snorlax", "Scizor", "Slowking", "Kingdra", "Magmar", "Blissey"},
			{"Misdreavus", "Kabutops", "Alakazam", "Gyarados", "Electabuzz", "Houndoom"},
			{"Smeargle7", "Machamp", "Gengar", "Rhydon", "Jynx", "Feraligatr"},
			{"Togetic", "Crobat", "Muk", "Blastoise", "Raichu", "Magmar"},
			{"Xatu", "Girafarig", "Mr. Mime", "Scyther", "Mantine", "Gyarados"},
			{"Lanturn", "Tyranitar", "Typhlosion", "Feraligatr", "Arcanine", "Exeggutor"},
			{"Kingdra", "Skarmory", "Ursaring", "Wobbuffet", "Lapras", "Rapidash"},
			{"Venusaur", "Blissey", "Steelix", "Scizor", "Misdreavus", "Houndoom"},
			{"Ursaring", "Mantine", "Skarmory", "Houndoom", "Kingdra", "Blissey"},
			{"Scyther", "Misdreavus", "Skarmory", "Kangaskhan", "Mr.Mime", "Lapras"},
			{"Mr.Mime", "Chansey", "Rhydon", "Pinsir", "Lapras", "Aerodactyl"},
			{"Skarmory", "Jynx", "Wobbuffet", "Ursaring", "Gengar", "Sudowoodo"},
			{"Sceptile", "Blaziken", "Swampert", "Shiftry", "Ludicolo", "Swellow"},
			{"Ninjask", "Exploud", "Medicham", "Mawile", "Manectric", "Camerupt"},
			{"Swalot", "Cacturn", "Mightyena", "Wobbuffet", "Manectric", "Crawdaunt"},
			{"Flygon", "Zangoose", "Altaria", "Seviper", "Crawdaunt", "Kecleon"},
			{"Claydol", "Banette", "Metang", "Glalie", "Lucario", "Breloom"},
			{"Mightyena", "Flygon", "Swampert", "Blaziken", "Lucario", "Manectric"},
			{"Abomasnow", "Zangoose", "Flygon", "Glalie", "Metang", "Camerupt"},
			{"Kangaskhan", "Flygon", "Metang", "Gyarados", "Feraligatr", "Mantine"},	
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Lucario", "Shiny Pidgeot", "Shiny Blastoise", "Shiny Venomoth", "Shiny Xatu", "Shiny Espeon"},
			{"Shiny Gengar", "Shiny Muk", "Shiny Feraligatr", "Shiny Tentacruel", "Shiny Lanturn", "Shiny Electrode"},
			{"Shiny Pupitar", "Shiny Pinsir", "Shiny Ampharos", "Shiny Tangela", "Shiny Arcanine", "Shiny Politoed"},
			{"Shiny Dragonair", "Shiny Mr.Mime", "Shiny Raichu", "Shiny Meganium", "Shiny Crobat", "Shiny Ninetales"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Tauros", "Shiny Charizard", "Shiny Venusaur", "Shiny Pidgeot", "Shiny Magneton", "Shiny Ariados"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},
			{"Shiny Marowak", "Shiny Tentacruel", "Shiny Hitmonlee", "Shiny Hitmonchan", "Shiny Hitmontop", "Shiny Lucario"},
			{"Shiny Xatu", "Shiny Crobat", "Shiny Politoed", "Shiny Lanturn", "Shiny Marowak", "Shiny Magcargo"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Lucario", "Shiny Pidgeot", "Shiny Blastoise", "Shiny Venomoth", "Shiny Xatu", "Shiny Espeon"},
			{"Shiny Gengar", "Shiny Muk", "Shiny Feraligatr", "Shiny Tentacruel", "Shiny Lanturn", "Shiny Electrode"},
			{"Shiny Pupitar", "Shiny Pinsir", "Shiny Ampharos", "Shiny Tangela", "Shiny Arcanine", "Shiny Politoed"},
			{"Shiny Dragonair", "Shiny Mr.Mime", "Shiny Raichu", "Shiny Meganium", "Shiny Crobat", "Shiny Ninetales"},
			{"Shiny Marowak", "Shiny Tentacruel", "Shiny Hitmonlee", "Shiny Hitmonchan", "Shiny Hitmontop", "Shiny Lucario"},
			{"Shiny Xatu", "Shiny Crobat", "Shiny Politoed", "Shiny Lanturn", "Shiny Marowak", "Shiny Magcargo"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Tauros", "Shiny Charizard", "Shiny Venusaur", "Shiny Pidgeot", "Shiny Magneton", "Shiny Ariados"},
			{"Shiny Lucario", "Shiny Pidgeot", "Shiny Blastoise", "Shiny Venomoth", "Shiny Xatu", "Shiny Espeon"},
			{"Shiny Gengar", "Shiny Muk", "Shiny Feraligatr", "Shiny Tentacruel", "Shiny Lanturn", "Shiny Electrode"},
			{"Shiny Pupitar", "Shiny Pinsir", "Shiny Ampharos", "Shiny Tangela", "Shiny Arcanine", "Shiny Politoed"},
			{"Shiny Dragonair", "Shiny Mr.Mime", "Shiny Raichu", "Shiny Meganium", "Shiny Crobat", "Shiny Ninetales"},
			{"Smeargle 8", "Shiny Gengar", "Shiny Marowak", "Shiny Magcargo", "Shiny Ariados", "Shiny Dodrio"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},
			{"Shiny Machamp", "Shiny Typhlosion", "Shiny Magcargo", "Smeargle 8", "Elite Farfetch'd", "Shiny Stantler"},
			{"Shiny Tauros", "Shiny Charizard", "Shiny Venusaur", "Shiny Pidgeot", "Shiny Magneton", "Shiny Ariados"},
			{"Shiny Snorlax", "Shiny Scyther", "Shiny Jynx", "Shiny Alakazam", "Shiny Electabuzz", "Shiny Gyarados"},
			{"Smeargle 8", "Shiny Snorlax", "Shiny Jynx", "Shiny Muk", "Shiny Pinsir", "Shiny Magmar"},			
		},
	},
}

-- setMonsterWave("Golden",1, 5)
function addSurvivalPoints(cid, count)
	return setPlayerStorageValue(cid, 254787, tonumber(getPlayerStorageValue(cid, 254787) + count))
end

function removeSurvivalPoints(cid, count)
	return setPlayerStorageValue(cid, 254787, tonumber(getPlayerStorageValue(cid, 254787) - count))
end

function getSurvivalPoints(cid)
	return getPlayerStorageValue(cid, 254787)
end

function doTeleportArena(cid)
	if not isCreature(cid) then return false end
	for a, b in pairs(arena) do
		doTeleportThing(cid, b.Teleport)
		for i = 1, #b.Storage do
			setPlayerStorageValue(cid, b.Storage[i], 1)
		end
	end
	return true
end

function removeConditionArena(cid)
	for a, b in pairs(arena) do
		doTeleportThing(cid, b.ExitArena)
		for i = 1, #b.Storage do
			setPlayerStorageValue(cid, b.Storage[i], -1)
		end
	end
	return true
end

function getPlayerInGolden(cid)
	if getPlayerStorageValue(cid, 254661) >= 1 then
		return true
	end
	return false
end

function creatureInSurvival(upper, lower, remove, clean) 
	for x = upper.x - 1, lower.x + 1 do
		for y = upper.y - 1, lower.y + 1 do                                         
		local pos = {x = x, y = y, z = upper.z}
		local m = getTopCreature(pos).uid
			if remove ~= false and m ~= 0 and (ehMonstro(m) and not isInArray({"Aporygon", "Abporygon"}, getCreatureName(m))) then 
				doRemoveCreature(m) 
			end
			if clean ~= false and hasTile(pos) then 
				doCleanTile(pos, false) 
			end 
		end
	end
end

function removeNpcInArea(upper, lower, remove, clean) 
	for x = upper.x - 1, lower.x + 1 do
		for y = upper.y - 1, lower.y + 1 do                                         
		local pos = {x = x, y = y, z = upper.z}
		local m = getTopCreature(pos).uid
			if remove ~= false and m ~= 0 and ehNPC(m) then 
				doRemoveCreature(m) 
			end
			if clean ~= false and hasTile(pos) then 
				doCleanTile(pos, false) 
			end 
		end
	end
end

function setBonusWild(cid, bonus)

	if not isCreature(cid) then return false end
	addEvent(function()
			if not isShiny(cid) then		
				setPlayerStorageValue(cid, 1001, getOffense(cid) * tonumber(bonus))
				setPlayerStorageValue(cid, 1002, getDefense(cid) * tonumber(bonus))
				setPlayerStorageValue(cid, 1005, getSpecialAttack(cid) * tonumber(bonus))
			end
		end, 1500)
		
	return true
end

function startGolden()
	if getGlobalStorageValue(254600) >= 1 then
		for a, b in pairs(arena) do
			if #getPlayersInArea(b.ArenaPlayers) >= 1 then
				local wave = getGlobalStorageValue(214689) <= 1 and 1 or getGlobalStorageValue(214689)
				setGlobalStorageValue(214689, wave + 1)
				doBroadcastMessage("[Survival Arena]: A wave ["..wave.."] irá começar em 2 minutos.")
				addEvent(setMonsterWave, 2 * 60 * 1000, "Golden", wave, 25 + math.floor(wave * 1.2), 1 + (wave * 0.10))
			else
				setGlobalStorageValue(254600, 0)
				setGlobalStorageValue(214689, 0)
				creatureInSurvival(b.ArenaUpper, b.ArenaLower, true, true)
				doBroadcastMessage("[Survival Arena]: Evento finalizado até a próxima!")
			end
		end
	end
end

function setMonsterWave(arenaName, wave, count, multi)
	
	local this_wave = arena[arenaName].pokemon[wave]

	if not arena[arenaName] then	
		return false
	end
	
	if not this_wave then
		return false
	end
	
	for i = 1, count, 1 do
		EX = math.random(arena[arenaName].TopLeft.x,arena[arenaName].BottomRight.x)
		EY = math.random(arena[arenaName].TopLeft.y,arena[arenaName].BottomRight.y)
	
		local position = {x = EX, y = EY, z = arena[arenaName].z}

		if isWalkable(position) and getTopCreature(position).uid == 0 then		
			local monster = doCreateMonster(this_wave[math.random(1,#this_wave)], position)
			setBonusWild(monster, multi)
		else
			for l = 0, 0, 0 do
				position.x = math.random(arena[arenaName].TopLeft.x,arena[arenaName].BottomRight.x)
				position.y = math.random(arena[arenaName].TopLeft.y,arena[arenaName].BottomRight.y)
				if isWalkable(position) and getTopCreature(position).uid == 0 then		
					local monster = doCreateMonster(this_wave[math.random(1,#this_wave)], position)
					setBonusWild(monster, multi)
					break
				end
			end
		end
	end
end
