function onSay(cid, words, param, channel)

local cfg = {
				storage = 20109, stoRoom = 78502, extended = 31,		
				area1 = {fromx = 1926, fromy = 288, fromz = 14, tox = 2143, toy = 500, toz= 14}, tele = {x = 2032, y = 426, z = 14}, 
				area2 = {fromx = 2158, fromy = 286, fromz = 14, tox = 2360, toy = 496, toz= 14}, tele1 = {x = 2249, y = 422, z = 14},
				area3 = {fromx = 2382, fromy = 277, fromz = 14, tox = 2581, toy = 506, toz= 14}, tele2 = {x = 2470, y = 432, z = 14},	
				area4 = {fromx = 2605, fromy = 269, fromz = 14, tox = 2824, toy = 481, toz= 14}, tele3 = {x = 2697, y = 409, z = 14},						
				createTower = {
						{monster = "Venusaur", pos = {x = 2052, y = 426, z = 14}},
						{monster = "Meganium", pos = {x = 2063, y = 434, z = 14}},
						{monster = "Victreebel", pos = {x = 2075, y = 427, z = 14}},
						{monster = "Vileplume", pos = {x = 2089, y = 431, z = 14}},
						{monster = "Bellossom", pos = {x = 2084, y = 419, z = 14}},	
						{monster = "Venusaur", pos = {x = 2075, y = 409, z = 14}},
						{monster = "Meganium", pos = {x = 2075, y = 409, z = 14}},
						{monster = "Victreebel", pos = {x = 2089, y = 401, z = 14}},
						{monster = "Vileplume", pos = {x = 2076, y = 393, z = 14}},
						{monster = "Meganium", pos = {x = 2100, y = 391, z = 14}},	
						{monster = "Venusaur", pos = {x = 2105, y = 403, z = 14}},
						{monster = "Forretress", pos = {x = 2002, y = 464, z = 14}},
						{monster = "Heracross", pos = {x = 2016, y = 464, z = 14}},
						{monster = "Pinsir", pos = {x = 2031, y = 463, z = 14}},
						{monster = "Scyther", pos = {x = 2015, y = 456, z = 14}},	
						{monster = "Scyther", pos = {x = 2024, y = 445, z = 14}},
						{monster = "Scyther", pos = {x = 2040, y = 440, z = 14}},
						{monster = "Ledian", pos = {x = 2055, y = 442, z = 14}},
						{monster = "Forretress", pos = {x = 2055, y = 455, z = 14}},
						{monster = "Scyther", pos = {x = 2053, y = 464, z = 14}},	
						{monster = "Pinsir", pos = {x = 2050, y = 481, z = 14}},
						{monster = "Heracross", pos = {x = 2065, y = 474, z = 14}},
						{monster = "Scizor", pos = {x = 2072, y = 465, z = 14}},
						{monster = "Scizor", pos = {x = 2090, y = 467, z = 14}},			
						{monster = "Muk", pos = {x = 2104, y = 468, z = 14}},
						{monster = "Weezing", pos = {x = 2104, y = 484, z = 14}},	
						{monster = "Venomoth", pos = {x = 2099, y = 458, z = 14}},
						{monster = "Venomoth", pos = {x = 2114, y = 464, z = 14}},
						{monster = "Nidoking", pos = {x = 2124, y = 454, z = 14}},
						{monster = "Nidoking", pos = {x = 2112, y = 444, z = 14}},
						{monster = "Nidoqueen", pos = {x = 2127, y = 439, z = 14}},	
						{monster = "Nidoqueen", pos = {x = 2131, y = 429, z = 14}},
						{monster = "Arbok", pos = {x = 2145, y = 428, z = 14}},
						{monster = "Muk", pos = {x = 2124, y = 417, z = 14}},
						{monster = "Weezing", pos = {x = 2144, y = 414, z = 14}},
						{monster = "Muk", pos = {x = 2136, y = 421, z = 14}},	
						{monster = "Venomoth", pos = {x = 2116, y = 419, z = 14}},
						{monster = "Venomoth", pos = {x = 2117, y = 407, z = 14}},
						{monster = "Weezing", pos = {x = 2113, y = 394, z = 14}},
						{monster = "Muk", pos = {x = 2128, y = 398, z = 14}},				
						{monster = "Golem", pos = {x = 2069, y = 409, z = 14}},
						{monster = "Rhydon", pos = {x = 2063, y = 398, z = 14}},	
						{monster = "Onix", pos = {x = 2057, y = 392, z = 14}},
						{monster = "Sudowoodo", pos = {x = 2052, y = 382, z = 14}},
						{monster = "Steelix", pos = {x = 2043, y = 374, z = 14}},
						{monster = "Golem", pos = {x = 2105, y = 382, z = 14}},
						{monster = "Rhydon", pos = {x = 2102, y = 372, z = 14}},	
						{monster = "Sudowoodo", pos = {x = 2093, y = 364, z = 14}},
						{monster = "Golem", pos = {x = 2108, y = 356, z = 14}},
						{monster = "Rhydon", pos = {x = 2120, y = 349, z = 14}},
						{monster = "Steelix", pos = {x = 2130, y = 340, z = 14}},
						{monster = "Magmar", pos = {x = 2103, y = 305, z = 14}},			
						{monster = "Charizard", pos = {x = 2113, y = 317, z = 14}},	
						{monster = "Ninetales", pos = {x = 2105, y = 332, z = 14}},
						{monster = "Typhlosion", pos = {x = 2081, y = 337, z = 14}},
						{monster = "Magmar", pos = {x = 2074, y = 324, z = 14}},
						{monster = "Ninetales", pos = {x = 2069, y = 347, z = 14}},
						{monster = "Typhlosion", pos = {x = 2064, y = 334, z = 14}},			
						{monster = "Charizard", pos = {x = 2052, y = 329, z = 14}},	
						{monster = "Rapidash", pos = {x = 2038, y = 324, z = 14}},
						{monster = "Charizard", pos = {x = 2025, y = 333, z = 14}},
						{monster = "Rapidash", pos = {x = 2019, y = 345, z = 14}},
						{monster = "Typhlosion", pos = {x = 2023, y = 356, z = 14}},
						{monster = "Alakazam", pos = {x = 2023, y = 367, z = 14}},			
						{monster = "Hypno", pos = {x = 2032, y = 379, z = 14}},	
						{monster = "Xatu", pos = {x = 2022, y = 392, z = 14}},
						{monster = "Feraligatr", pos = {x = 1996, y = 377, z = 14}},
						{monster = "Blastoise", pos = {x = 1977, y = 372, z = 14}},
						{monster = "Mantine", pos = {x = 1952, y = 374, z = 14}},
						{monster = "Gyarados", pos = {x = 1963, y = 382, z = 14}},			
						{monster = "Corsola", pos = {x = 1961, y = 393, z = 14}},	
						{monster = "Blastoise", pos = {x = 1977, y = 402, z = 14}},
						{monster = "Feraligatr", pos = {x = 1969, y = 418, z = 14}},
						{monster = "Gyarados", pos = {x = 1978, y = 427, z = 14}},
						{monster = "Blastoise", pos = {x = 1957, y = 426, z = 14}},
						{monster = "Feraligatr", pos = {x = 1974, y = 439, z = 14}},			
						{monster = "Corsola", pos = {x = 1980, y = 455, z = 14}},	
						{monster = "Gyarados", pos = {x = 1972, y = 473, z = 14}},
						{monster = "Blastoise", pos = {x = 1991, y = 463, z = 14}}	
						},
				createTower1 = {			
						{monster = "Venusaur", pos = {x = 2267, y = 422, z = 14}},
						{monster = "Meganium", pos = {x = 2278, y = 425, z = 14}},
						{monster = "Victreebel", pos = {x = 2290, y = 438, z = 14}},
						{monster = "Vileplume", pos = {x = 2296, y = 422, z = 14}},
						{monster = "Bellossom", pos = {x = 2309, y = 428, z = 14}},	
						{monster = "Venusaur", pos = {x = 2303, y = 417, z = 14}},
						{monster = "Meganium", pos = {x = 2293, y = 407, z = 14}},
						{monster = "Victreebel", pos = {x = 2312, y = 401, z = 14}},
						{monster = "Vileplume", pos = {x = 2293, y = 387, z = 14}},
						{monster = "Meganium", pos = {x = 2308, y = 385, z = 14}},	
						{monster = "Venusaur", pos = {x = 2319, y = 392, z = 14}},
						{monster = "Forretress", pos = {x = 2219, y = 459, z = 14}},
						{monster = "Heracross", pos = {x = 2235, y = 460, z = 14}},
						{monster = "Pinsir", pos = {x = 2248, y = 459, z = 14}},
						{monster = "Scyther", pos = {x = 2232, y = 451, z = 14}},	
						{monster = "Scyther", pos = {x = 2241, y = 442, z = 14}},
						{monster = "Scyther", pos = {x = 2256, y = 436, z = 14}},
						{monster = "Ledian", pos = {x = 2273, y = 437, z = 14}},
						{monster = "Forretress", pos = {x = 2273, y = 452, z = 14}},
						{monster = "Scyther", pos = {x = 2269, y = 464, z = 14}},	
						{monster = "Pinsir", pos = {x = 2269, y = 480, z = 14}},
						{monster = "Heracross", pos = {x = 2282, y = 470, z = 14}},
						{monster = "Scizor", pos = {x = 2291, y = 461, z = 14}},
						{monster = "Scizor", pos = {x = 2308, y = 463, z = 14}},			
						{monster = "Muk", pos = {x = 2320, y = 459, z = 14}},
						{monster = "Weezing", pos = {x = 2321, y = 478, z = 14}},	
						{monster = "Venomoth", pos = {x = 2332, y = 459, z = 14}},
						{monster = "Venomoth", pos = {x = 2336, y = 451, z = 14}},
						{monster = "Nidoking", pos = {x = 2352, y = 450, z = 14}},
						{monster = "Nidoking", pos = {x = 2341, y = 444, z = 14}},
						{monster = "Nidoqueen", pos = {x = 2328, y = 440, z = 14}},	
						{monster = "Nidoqueen", pos = {x = 2341, y = 434, z = 14}},
						{monster = "Arbok", pos = {x = 2358, y = 433, z = 14}},
						{monster = "Muk", pos = {x = 2342, y = 419, z = 14}},
						{monster = "Weezing", pos = {x = 2362, y = 410, z = 14}},
						{monster = "Muk", pos = {x = 2341, y = 411, z = 14}},	
						{monster = "Venomoth", pos = {x = 2334, y = 403, z = 14}},
						{monster = "Venomoth", pos = {x = 2335, y = 389, z = 14}},
						{monster = "Weezing", pos = {x = 2347, y = 394, z = 14}},
						{monster = "Muk", pos = {x = 2323, y = 401, z = 14}},			
						{monster = "Golem", pos = {x = 2281, y = 401, z = 14}},
						{monster = "Rhydon", pos = {x = 2282, y = 391, z = 14}},	
						{monster = "Onix", pos = {x = 2271, y = 384, z = 14}},
						{monster = "Sudowoodo", pos = {x = 2265, y = 374, z = 14}},
						{monster = "Steelix", pos = {x = 2271, y = 363, z = 14}},
						{monster = "Golem", pos = {x = 2322, y = 378, z = 14}},
						{monster = "Rhydon", pos = {x = 2317, y = 366, z = 14}},	
						{monster = "Sudowoodo", pos = {x = 2308, y = 359, z = 14}},
						{monster = "Golem", pos = {x = 2326, y = 353, z = 14}},
						{monster = "Rhydon", pos = {x = 2337, y = 344, z = 14}},
						{monster = "Steelix", pos = {x = 2347, y = 337, z = 14}},
						{monster = "Magmar", pos = {x = 2319, y = 301, z = 14}},			
						{monster = "Charizard", pos = {x = 2330, y = 316, z = 14}},	
						{monster = "Ninetales", pos = {x = 2321, y = 329, z = 14}},
						{monster = "Typhlosion", pos = {x = 2305, y = 332, z = 14}},
						{monster = "Magmar", pos = {x = 2291, y = 319, z = 14}},
						{monster = "Ninetales", pos = {x = 2290, y = 340, z = 14}},
						{monster = "Typhlosion", pos = {x = 2284, y = 329, z = 14}},			
						{monster = "Charizard", pos = {x = 2270, y = 325, z = 14}},	
						{monster = "Rapidash", pos = {x = 2260, y = 320, z = 14}},
						{monster = "Charizard", pos = {x = 2244, y = 326, z = 14}},
						{monster = "Rapidash", pos = {x = 2236, y = 338, z = 14}},
						{monster = "Typhlosion", pos = {x = 2240, y = 353, z = 14}},
						{monster = "Alakazam", pos = {x = 2238, y = 366, z = 14}},			
						{monster = "Hypno", pos = {x = 2240, y = 388, z = 14}},	
						{monster = "Xatu", pos = {x = 2228, y = 372, z = 14}},
						{monster = "Feraligatr", pos = {x = 2209, y = 373, z = 14}},
						{monster = "Blastoise", pos = {x = 2192, y = 369, z = 14}},
						{monster = "Mantine", pos = {x = 2180, y = 372, z = 14}},
						{monster = "Gyarados", pos = {x = 2168, y = 371, z = 14}},			
						{monster = "Corsola", pos = {x = 2179, y = 384, z = 14}},	
						{monster = "Blastoise", pos = {x = 2172, y = 397, z = 14}},
						{monster = "Feraligatr", pos = {x = 2191, y = 396, z = 14}},
						{monster = "Gyarados", pos = {x = 2185, y = 409, z = 14}},
						{monster = "Blastoise", pos = {x = 2191, y = 425, z = 14}},
						{monster = "Feraligatr", pos = {x = 2192, y = 444, z = 14}},			
						{monster = "Corsola", pos = {x = 2197, y = 458, z = 14}},	
						{monster = "Gyarados", pos = {x = 2185, y = 470, z = 14}},
						{monster = "Blastoise", pos = {x = 2214, y = 458, z = 14}}	
						},
				createTower2 = {
						{monster = "Venusaur", pos = {x = 2489, y = 431, z = 14}},
						{monster = "Meganium", pos = {x = 2500, y = 440, z = 14}},
						{monster = "Victreebel", pos = {x = 2512, y = 448, z = 14}},
						{monster = "Vileplume", pos = {x = 2510, y = 434, z = 14}},
						{monster = "Bellossom", pos = {x = 2526, y = 437, z = 14}},	
						{monster = "Venusaur", pos = {x = 2523, y = 427, z = 14}},
						{monster = "Meganium", pos = {x = 2513, y = 418, z = 14}},
						{monster = "Victreebel", pos = {x = 2526, y = 412, z = 14}},
						{monster = "Vileplume", pos = {x = 2540, y = 405, z = 14}},
						{monster = "Meganium", pos = {x = 2523, y = 398, z = 14}},	
						{monster = "Venusaur", pos = {x = 2514, y = 397, z = 14}},
						{monster = "Forretress", pos = {x = 2443, y = 470, z = 14}},
						{monster = "Heracross", pos = {x = 2455, y = 470, z = 14}},
						{monster = "Pinsir", pos = {x = 2470, y = 468, z = 14}},
						{monster = "Scyther", pos = {x = 2454, y = 457, z = 14}},	
						{monster = "Scyther", pos = {x = 2467, y = 450, z = 14}},
						{monster = "Scyther", pos = {x = 2481, y = 444, z = 14}},
						{monster = "Ledian", pos = {x = 2493, y = 447, z = 14}},
						{monster = "Forretress", pos = {x = 2493, y = 464, z = 14}},
						{monster = "Scyther", pos = {x = 2491, y = 475, z = 14}},	
						{monster = "Pinsir", pos = {x = 2488, y = 490, z = 14}},
						{monster = "Heracross", pos = {x = 2502, y = 480, z = 14}},
						{monster = "Scizor", pos = {x = 2513, y = 471, z = 14}},
						{monster = "Scizor", pos = {x = 2531, y = 473, z = 14}},			
						{monster = "Muk", pos = {x = 2542, y = 471, z = 14}},
						{monster = "Weezing", pos = {x = 2542, y = 487, z = 14}},	
						{monster = "Venomoth", pos = {x = 2556, y = 468, z = 14}},
						{monster = "Venomoth", pos = {x = 2565, y = 460, z = 14}},
						{monster = "Nidoking", pos = {x = 2548, y = 451, z = 14}},
						{monster = "Nidoking", pos = {x = 2562, y = 445, z = 14}},
						{monster = "Nidoqueen", pos = {x = 2570, y = 435, z = 14}},	
						{monster = "Nidoqueen", pos = {x = 2584, y = 432, z = 14}},
						{monster = "Arbok", pos = {x = 2560, y = 428, z = 14}},
						{monster = "Muk", pos = {x = 2582, y = 420, z = 14}},
						{monster = "Weezing", pos = {x = 2556, y = 414, z = 14}},
						{monster = "Muk", pos = {x = 2555, y = 401, z = 14}},	
						{monster = "Venomoth", pos = {x = 2543, y = 411, z = 14}},
						{monster = "Venomoth", pos = {x = 2566, y = 405, z = 14}},
						{monster = "Weezing", pos = {x = 2569, y = 471, z = 14}},
						{monster = "Muk", pos = {x = 2577, y = 460, z = 14}},
--						
						{monster = "Golem", pos = {x = 2504, y = 414, z = 14}},
						{monster = "Rhydon", pos = {x = 2500, y = 404, z = 14}},	
						{monster = "Onix", pos = {x = 2493, y = 396, z = 14}},
						{monster = "Sudowoodo", pos = {x = 2491, y = 375, z = 14}},
						{monster = "Steelix", pos = {x = 2481, y = 383, z = 14}},
						{monster = "Golem", pos = {x = 2542, y = 389, z = 14}},
						{monster = "Rhydon", pos = {x = 2542, y = 378, z = 14}},	
						{monster = "Sudowoodo", pos = {x = 2530, y = 371, z = 14}},
						{monster = "Golem", pos = {x = 2544, y = 363, z = 14}},
						{monster = "Rhydon", pos = {x = 2557, y = 355, z = 14}},
						{monster = "Steelix", pos = {x = 2569, y = 347, z = 14}},
--						
						{monster = "Magmar", pos = {x = 2542, y = 311, z = 14}},			
						{monster = "Charizard", pos = {x = 2551, y = 323, z = 14}},	
						{monster = "Ninetales", pos = {x = 2546, y = 338, z = 14}},
						{monster = "Typhlosion", pos = {x = 2528, y = 341, z = 14}},
						{monster = "Magmar", pos = {x = 2512, y = 331, z = 14}},
						{monster = "Ninetales", pos = {x = 2512, y = 349, z = 14}},
						{monster = "Typhlosion", pos = {x = 2498, y = 337, z = 14}},			
						{monster = "Charizard", pos = {x = 2486, y = 330, z = 14}},	
						{monster = "Rapidash", pos = {x = 2470, y = 334, z = 14}},
						{monster = "Charizard", pos = {x = 2461, y = 343, z = 14}},
						{monster = "Rapidash", pos = {x = 2460, y = 353, z = 14}},
						{monster = "Typhlosion", pos = {x = 2461, y = 365, z = 14}},
--						
						{monster = "Alakazam", pos = {x = 2460, y = 376, z = 14}},			
						{monster = "Hypno", pos = {x = 2470, y = 385, z = 14}},	
						{monster = "Xatu", pos = {x = 2460, y = 398, z = 14}},
--						
						{monster = "Feraligatr", pos = {x = 2433, y = 383, z = 14}},
						{monster = "Blastoise", pos = {x = 2416, y = 377, z = 14}},
						{monster = "Mantine", pos = {x = 2402, y = 382, z = 14}},
						{monster = "Gyarados", pos = {x = 2389, y = 380, z = 14}},			
						{monster = "Corsola", pos = {x = 2401, y = 391, z = 14}},	
						{monster = "Blastoise", pos = {x = 2393, y = 403, z = 14}},
						{monster = "Feraligatr", pos = {x = 2412, y = 409, z = 14}},
						{monster = "Gyarados", pos = {x = 2412, y = 426, z = 14}},
						{monster = "Blastoise", pos = {x = 2396, y = 432, z = 14}},
						{monster = "Feraligatr", pos = {x = 2413, y = 438, z = 14}},			
						{monster = "Corsola", pos = {x = 2430, y = 431, z = 14}},	
						{monster = "Gyarados", pos = {x = 2413, y = 453, z = 14}},
						{monster = "Blastoise", pos = {x = 2417, y = 471, z = 14}}	
						},
				createTower3 = {
						{monster = "Venusaur", pos = {x = 2715, y = 409, z = 14}},
						{monster = "Meganium", pos = {x = 2727, y = 417, z = 14}},
						{monster = "Victreebel", pos = {x = 2737, y = 426, z = 14}},
						{monster = "Vileplume", pos = {x = 2738, y = 411, z = 14}},
						{monster = "Bellossom", pos = {x = 2755, y = 415, z = 14}},	
						{monster = "Venusaur", pos = {x = 2748, y = 401, z = 14}},
						{monster = "Meganium", pos = {x = 2745, y = 387, z = 14}},
						{monster = "Victreebel", pos = {x = 2762, y = 391, z = 14}},
						{monster = "Vileplume", pos = {x = 2741, y = 374, z = 14}},
						{monster = "Meganium", pos = {x = 2757, y = 373, z = 14}},	
						{monster = "Venusaur", pos = {x = 2769, y = 380, z = 14}},
--
						{monster = "Forretress", pos = {x = 2670, y = 447, z = 14}},
						{monster = "Heracross", pos = {x = 2684, y = 447, z = 14}},
						{monster = "Pinsir", pos = {x = 2698, y = 446, z = 14}},
						{monster = "Scyther", pos = {x = 2681, y = 436, z = 14}},	
						{monster = "Scyther", pos = {x = 2694, y = 427, z = 14}},
						{monster = "Scyther", pos = {x = 2707, y = 422, z = 14}},
						{monster = "Ledian", pos = {x = 2723, y = 426, z = 14}},
						{monster = "Forretress", pos = {x = 2717, y = 438, z = 14}},
						{monster = "Scyther", pos = {x = 2712, y = 451, z = 14}},	
						{monster = "Pinsir", pos = {x = 2728, y = 454, z = 14}},
						{monster = "Heracross", pos = {x = 2716, y = 465, z = 14}},
						{monster = "Scizor", pos = {x = 2739, y = 448, z = 14}},
						{monster = "Scizor", pos = {x = 2756, y = 450, z = 14}},
--						
						{monster = "Muk", pos = {x = 2771, y = 451, z = 14}},
						{monster = "Weezing", pos = {x = 2769, y = 465, z = 14}},	
						{monster = "Venomoth", pos = {x = 2784, y = 445, z = 14}},
						{monster = "Venomoth", pos = {x = 2802, y = 437, z = 14}},
						{monster = "Nidoking", pos = {x = 2785, y = 432, z = 14}},
						{monster = "Nidoking", pos = {x = 2777, y = 419, z = 14}},
						{monster = "Nidoqueen", pos = {x = 2794, y = 420, z = 14}},	
						{monster = "Nidoqueen", pos = {x = 2809, y = 411, z = 14}},
						{monster = "Arbok", pos = {x = 2792, y = 407, z = 14}},
						{monster = "Muk", pos = {x = 2809, y = 397, z = 14}},
						{monster = "Weezing", pos = {x = 2789, y = 392, z = 14}},
						{monster = "Muk", pos = {x = 2781, y = 402, z = 14}},	
						{monster = "Venomoth", pos = {x = 2776, y = 392, z = 14}},
						{monster = "Venomoth", pos = {x = 2770, y = 380, z = 14}},
						{monster = "Weezing", pos = {x = 2783, y = 384, z = 14}},
						{monster = "Muk", pos = {x = 2793, y = 379, z = 14}},
--						
						{monster = "Golem", pos = {x = 2733, y = 392, z = 14}},
						{monster = "Rhydon", pos = {x = 2727, y = 384, z = 14}},	
						{monster = "Onix", pos = {x = 2733, y = 374, z = 14}},
						{monster = "Sudowoodo", pos = {x = 2721, y = 374, z = 14}},
						{monster = "Steelix", pos = {x = 2718, y = 363, z = 14}},
						{monster = "Golem", pos = {x = 2769, y = 366, z = 14}},
						{monster = "Rhydon", pos = {x = 2767, y = 354, z = 14}},	
						{monster = "Sudowoodo", pos = {x = 2759, y = 346, z = 14}},
						{monster = "Golem", pos = {x = 2776, y = 339, z = 14}},
						{monster = "Rhydon", pos = {x = 2786, y = 330, z = 14}},
						{monster = "Steelix", pos = {x = 2797, y = 322, z = 14}},
--						
						{monster = "Magmar", pos = {x = 2768, y = 289, z = 14}},			
						{monster = "Charizard", pos = {x = 2777, y = 301, z = 14}},	
						{monster = "Ninetales", pos = {x = 2773, y = 316, z = 14}},
						{monster = "Typhlosion", pos = {x = 2758, y = 318, z = 14}},
						{monster = "Magmar", pos = {x = 2739, y = 307, z = 14}},
						{monster = "Ninetales", pos = {x = 2741, y = 324, z = 14}},
						{monster = "Typhlosion", pos = {x = 2731, y = 330, z = 14}},			
						{monster = "Charizard", pos = {x = 2729, y = 317, z = 14}},	
						{monster = "Rapidash", pos = {x = 2716, y = 311, z = 14}},
						{monster = "Charizard", pos = {x = 2701, y = 307, z = 14}},
						{monster = "Rapidash", pos = {x = 2688, y = 319, z = 14}},
						{monster = "Typhlosion", pos = {x = 2688, y = 338, z = 14}},
--						
						{monster = "Alakazam", pos = {x = 2688, y = 353, z = 14}},			
						{monster = "Hypno", pos = {x = 2689, y = 375, z = 14}},	
						{monster = "Xatu", pos = {x = 2677, y = 360, z = 14}},
--						
						{monster = "Feraligatr", pos = {x = 2659, y = 360, z = 14}},
						{monster = "Blastoise", pos = {x = 2642, y = 355, z = 14}},
						{monster = "Mantine", pos = {x = 2629, y = 360, z = 14}},
						{monster = "Gyarados", pos = {x = 2616, y = 357, z = 14}},			
						{monster = "Corsola", pos = {x = 2628, y = 369, z = 14}},	
						{monster = "Blastoise", pos = {x = 2619, y = 383, z = 14}},
						{monster = "Feraligatr", pos = {x = 2642, y = 381, z = 14}},
						{monster = "Gyarados", pos = {x = 2633, y = 398, z = 14}},
						{monster = "Blastoise", pos = {x = 2647, y = 407, z = 14}},
						{monster = "Feraligatr", pos = {x = 2636, y = 420, z = 14}},			
						{monster = "Corsola", pos = {x = 2646, y = 436, z = 14}},	
						{monster = "Gyarados", pos = {x = 2635, y = 456, z = 14}},
						{monster = "Blastoise", pos = {x = 2656, y = 450, z = 14}}	
						}
			}
	
	if not cfg then return true end
	
		if getPlayerStorageValue(cid, cfg.storage) ~= 1 then
			setPlayerStorageValue(cid, cfg.storage, 1)		
			doSendPlayerExtendedOpcode(cid, cfg.extended, "Tower")
			addEvent(setPlayerStorageValue, 15 * 1000 , cid, cfg.storage, -1)			
		else
			if getTowerChance(cid) >= 1 and getPlayerStorageValue(cid, cfg.stoRoom) >= 1 then
				if #getPlayersInArea(cfg.area1) < 1 then
					doTeleportThing(cid, cfg.tele)
						for _, monstro in pairs(cfg.createTower) do
							monster = doCreateMonster(cid, monstro.monster, monstro.pos, false)
							addEvent(doEditPoke, 5, monster, 3, 7, 7, 2.5)
						end
					setPlayerStorageValue(cid, cfg.storage, -1)	
					removeTowerChance(cid, 1)
				elseif #getPlayersInArea(cfg.area2) < 1 then
					doTeleportThing(cid, cfg.tele1)
						for _, monstro in pairs(cfg.createTower1) do
							monster1 = doCreateMonster(cid, monstro.monster, monstro.pos, false)
							addEvent(doEditPoke, 5, monster1, 3, 7, 7, 2.5)							
						end
					setPlayerStorageValue(cid, cfg.storage, -1)	
					removeTowerChance(cid, 1)
				elseif #getPlayersInArea(cfg.area3) < 1 then
					doTeleportThing(cid, cfg.tele2)
						for _, monstro in pairs(cfg.createTower2) do
							monster2 = doCreateMonster(cid, monstro.monster, monstro.pos, false)
							addEvent(doEditPoke, 5, monster2, 3, 7, 7, 2.5)	
						end
					setPlayerStorageValue(cid, cfg.storage, -1)	
					removeTowerChance(cid, 1)	
				elseif #getPlayersInArea(cfg.area4) < 1 then
					doTeleportThing(cid, cfg.tele3)
						for _, monstro in pairs(cfg.createTower3) do
							monster3 = doCreateMonster(cid, monstro.monster, monstro.pos, false)
							addEvent(doEditPoke, 5, monster3, 3, 7, 7, 2.5)	
						end
					setPlayerStorageValue(cid, cfg.storage, -1)	
					removeTowerChance(cid, 1)		
				else
					doSendPlayerExtendedOpcode(cid, 31, "NoRoom")
				end					
			else
				doSendPlayerExtendedOpcode(cid, cfg.extended, "Tower2")
				setPlayerStorageValue(cid, cfg.storage, -1)					
		end
	end	
	
	return true
end
