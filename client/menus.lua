
-- target

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("RooksBarDuty", vector3(20.03, 6449.8, 31.26), 1, 1.2, {
		name = "RooksBarDuty",
		heading = 227,
		debugPoly = false,
		minZ=30.0,
		maxZ=33.0,
	}, {
		options = {
		    {  
			event = "qb-rooksbar:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "rooksbar",
		    },
		},
		distance = 1.5
	})

		exports['qb-target']:AddBoxZone("drink_tray", vector3(17.0, 6451.81, 31.72), 1.05, 1.0, {
			name = "drink_tray",
			heading = 133.0,
			debugPoly = false,
			minZ=30.0,
			maxZ=33.0,
		}, {
			options = {
			    {
				event = "qb-rooksbar:Tray",
				icon = "far fa-clipboard",
				label = "Tray",
			    },
			},
			distance = 1.5
		})

	exports['qb-target']:AddBoxZone("rooksdrinks", vector3(16.13, 6452.57, 31.33), 2.2, 0.6, {
	    name="rooksdrinks",
	    heading=131,
	    debugPoly=false,
	    minZ=30.0,
	    maxZ=33.0,
	    }, {
		options = {
		    {
			event = "nh-context:DrinkMenu",
			icon = "fas fa-filter",
			label = "Make Some Drinks",
			job = "rooksbar",
		    },
		},
		distance = 1.5
	    })

        exports['qb-target']:AddBoxZone("rooksdrinks2", vector3(18.24, 6450.63, 31.71), 1.15, 0.7, {
            name="rooksdrinks2",
            heading=131,
            debugPoly=false,
            minZ=30.0,
            maxZ=33.0,
            }, {
                options = {
                    {
                        event = "nh-context:DrinkMenu",
                        icon = "fas fa-filter",
                        label = "Make Some Drinks",
                        job = "rooksbar",
                    },
                },
                distance = 1.5
            })


         exports['qb-target']:AddBoxZone("fridge", vector3(13.86, 6455.47, 31.5), 1.6, 1, {
            name="fridge",
            heading=317,
            debugPoly=false,
            minZ=30.0,
            maxZ=33.0,
        }, {
                options = {
                    {
                        event = "nh-context:OrderMenu",
                        icon = "fas fa-laptop",
                        label = "Order Ingredients!",
                        job = "rooksbar",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("rooksdisplay", vector3(16.97, 6454.03, 31.33), 4.6, 1.2, {
            name="rooksdisplay",
            heading=310,
            debugPoly=false,
            minZ=30.0,
            maxZ=33.0,
        }, {
                options = {
                    {
                        event = "qb-rooksbar:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = "rooksbar",
                    },
                },
                distance = 1.5
            })

        exports['qb-target']:AddBoxZone("RooksBar_register", vector3(18.15, 6452.92, 31.41), 0.5, 0.4, {
            name="RooksBar_register",
            debugPoly=false,
            heading=312,
            minZ=31.0,
            maxZ=33.0,
        }, {
                options = {
                    {
                        event = "qb-rooksbar:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "rooksbar",
                    },
                },
                distance = 1.5
            })
end)


-- NH - Context --

RegisterNetEvent('nh-context:DrinkMenu', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Available Drinks |",
            txt = "",
        },
        {
            id = 1,
            header = "• Gin Tonic",
            txt = "Gin , Tonic",
            params = {
                event = "qb-rooksbar:GinTonic"
            }
        },
        {
            id = 2,
            header = "• New Western Dry",
            txt = "Gin , Tonic , Lime",
            params = {
                event = "qb-rooksbar:NewWesternDry"
            }
        },
        {
            id = 3,
            header = "• Old Tom",
            txt = "Gin , Gin , Tonic",
            params = {
                event = "qb-rooksbar:OldTom"
            }
        },
        {
            id = 4,
            header = "• Cedar Ridge",
            txt = "Whiskey , Water",
            params = {
                event = "qb-rooksbar:CedarRidge"
            }
        },
        {
            id = 5,
            header = "• Corn",
            txt = "Whiskey , Water , Lime",
            params = {
                event = "qb-rooksbar:Corn"
            }
        },
        {
            id = 6,
            header = "• Green Island",
            txt = "Rum , Gin , Lime",
            params = {
                event = "qb-rooksbar:GreenIsland"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)


RegisterNetEvent('nh-context:OrderMenu', function(data)
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 0,
            header = "| Fridge |",
            txt = "",
        },
        {
            id = 1,
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-rooksbar:shop"
            }
        },
        {
            id = 2,
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-rooksbar:Storage2"
            }
        },
        {
            id = 3,
            header = "Close (ESC)",
            txt = "",
        },
    })
end)

-- Bill Stuff --
RegisterNetEvent("qb-rooksbar:bill")
AddEventHandler("qb-rooksbar:bill", function()
    local bill = exports["nh-keyboard"]:KeyboardInput({
        header = "Create Receipt",
        rows = {
            {
                id = 0,
                txt = "Server ID"
            },
            {
                id = 1,
                txt = "Amount"
            }
        }
    })
    if bill ~= nil then
        if bill[1].input == nil or bill[2].input == nil then 
            return 
        end
        TriggerServerEvent("qb-rooksbar:bill:player", bill[1].input, bill[2].input)
    end
end)

