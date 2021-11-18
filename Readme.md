Rewritten
# A Burgershot for QBCore Framework



## Insert into @qb-smallresources --> server --> consumables.lua
```
--Burgershot

--Drinks
QBCore.Functions.CreateUseableItem("gin-tonic", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("new-western-dry", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("old-tom", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("cedar-ridge", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("corn", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)

QBCore.Functions.CreateUseableItem("green-island", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", source, item.name)
    end
end)
```



## Insert into @qb-smallresources --> config.lua
```
Consumeables = {


--Alcohol
    ["gin-tonic"] = math.random(20, 40),
    ["new-western-dry"] = math.random(20, 40),
    ["old-tom"] = math.random(20, 40),
    ["cedar-ridge"] = math.random(20, 40),
    ["corn"] = math.random(20, 40),
    ["green-island"] = math.random(20, 40),

} 
```

## Insert into @qb-core - Shared.lua

```
QBShared.Items = {
-- Rooks Bar
-- alcohol
	["gin-tonic"] 				 = {["name"] = "gin-tonic", 			 	["label"] = "Gin Tonic", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "whiskey.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Makes You Feel Better."},
	["new-western-dry"] 			 = {["name"] = "new-western-dry", 			 	["label"] = "New Western Dry", 				["weight"] = 250, 		["type"] = "item", 		["image"] = "whiskey.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Makes You Feel Better."},
	["old-tom"] 				 = {["name"] = "old-tom", 			 	["label"] = "Old Tom", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "whiskey.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Makes You Feel Better."},
	["cedar-ridge"] 		 = {["name"] = "-cedar-ridge", 			["label"] = "Cedar Ridge", 			["weight"] = 250, 		["type"] = "item", 		["image"] = "whiskey.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Makes You Feel Better."},
	["corn"] 		 	 = {["name"] = "corn", 				["label"] = "Corn", 			["weight"] = 250, 		["type"] = "item", 			["image"] = "whiskey.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Makes You Feel Better."},
	["green-island"] 				 = {["name"] = "green-island", 			 	  	["label"] = "Green Island", 				["weight"] = 250, 		["type"] = "item", 			["image"] = "whiskey.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Makes You Feel Better."},
		-- Drinks
	
	
--Ingredients
	["gin"] 				 	 = {["name"] = "gin", 			 	  	["label"] = "Gin", 			["weight"] = 125, 		["type"] = "item", 					["image"] = "bs_bun.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["tonic"] 				 = {["name"] = "tonic", 			 	  	["label"] = "Tonic", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty.png", 		    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["rum"] 				 = {["name"] = "rum", 			 	["label"] = "Rum", 				["weight"] = 125, 		["type"] = "item", 			["image"] = "bs_lettuce.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
	["lime"] 				 	 = {["name"] = "lime", 			 		["label"] = "Lime", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty_raw.png", 	        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},

}

```

```
QBShared.Jobs = {
    ["rooksbar"] = {
		label = "Rooks Bar",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Help",
                payment = 0
            },
			['1'] = {
                name = "Boss",
				isboss = true,
                payment = 0
            },
        },
	},
}		
```



## Insert into @qb-bossmenu - config.lua
```
['rooksbar'] = vector3(-1192.04, -902.476, 13.998),
```
