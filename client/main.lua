local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
isLoggedIn = true

local onDuty = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	if PlayerData.job.onduty then
	    if PlayerData.job.name == "rooksbar" then
		TriggerServerEvent("QBCore:ToggleDuty")
	    end
	end
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    if PlayerData.job.name == 'rooksbar' then
    	onDuty = duty
    end
end)

Citizen.CreateThread(function()
    RooksBar = AddBlipForCoord(17.15, 6452.53, 31.55)
    SetBlipSprite (RooksBar, 310)
    SetBlipDisplay(RooksBar, 4)
    SetBlipScale  (RooksBar, 0.75)
    SetBlipAsShortRange(RooksBar, true)
    SetBlipColour(RooksBar, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Rooks Bar")
    EndTextCommandSetBlipName(RooksBar)
end) 

RegisterNetEvent("qb-rooksbar:Duty")
AddEventHandler("qb-rooksbar:Duty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-rooksbar:Alc")
AddEventHandler("qb-rooksbar:Alc", function()
    TriggerEvent("inventory:client:SetCurrentStash", "alctray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "alctray", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-rooksbar:Lager")
AddEventHandler("qb-rooksbar:Lager", function()
    TriggerEvent("inventory:client:SetCurrentStash", "alcstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "alcstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-rooksbar:GinTonic")
AddEventHandler("qb-rooksbar:GinTonic", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeGinTonic()
        else
            QBCore.Functions.Notify("You don't have any gin..", "error")
        end
      end, 'gin')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-rooksbar:NewWesternDry")
AddEventHandler("qb-rooksbar:NewWesternDry", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeNewWesternDry()
        else
            QBCore.Functions.Notify("You don't have any gin..", "error")
        end
      end, 'gin')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-rooksbar:OldTom")
AddEventHandler("qb-rooksbar:OldTom", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeOldTom()
        else
            QBCore.Functions.Notify("You don't have any gin..", "error")
        end
      end, 'gin')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-rooksbar:CedarRidge")
AddEventHandler("qb-rooksbar:CedarRidge", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeCedarRidge()
        else
            QBCore.Functions.Notify("You don't have any gin..", "error")
        end
      end, 'gin')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-rooksbar:Corn")
AddEventHandler("qb-rooksbar:Corn", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeCorn()
        else
            QBCore.Functions.Notify("You don't have any whiskey..", "error")
        end
      end, 'whiskey')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-rooksbar:GreenIsland")
AddEventHandler("qb-rooksbar:GreenIsland", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           MakeGreenIsland()
        else
            QBCore.Functions.Notify("You don't have any rum..", "error")
        end
      end, 'rum')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

-- Functions --

function MakeGinTonic()
    TriggerServerEvent('QBCore:Server:RemoveItem', "gin", 1)
	TriggerServerEvent('QBCore:Server:RemoveItem', "tonic", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "gin-tonic", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["gin-tonic"], "add")
    QBCore.Functions.Notify("You made a Gin Tonic", "success")
end

function MakeNewWesternDry()
    TriggerServerEvent('QBCore:Server:RemoveItem', "gin", 1)
	TriggerServerEvent('QBCore:Server:RemoveItem', "tonic", 1)
	TriggerServerEvent('QBCore:Server:RemoveItem', "lime", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "new-western-dry", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["new-western-dry"], "add")
    QBCore.Functions.Notify("You made a New Western Dry", "success")
end

function MakeOldTom()
    TriggerServerEvent('QBCore:Server:RemoveItem', "gin", 2)
	TriggerServerEvent('QBCore:Server:RemoveItem', "tonic", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "old-tom", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["old-tom"], "add")
    QBCore.Functions.Notify("You made a Old Tom", "success")
end

function MakeCedarRidge()
    TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
	TriggerServerEvent('QBCore:Server:RemoveItem', "water", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "cedar-ridge", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cedar-ridge"], "add")
    QBCore.Functions.Notify("You made a Cedar Ridge", "success")
end

function MakeCorn()
    TriggerServerEvent('QBCore:Server:RemoveItem', "whiskey", 1)
	TriggerServerEvent('QBCore:Server:RemoveItem', "water", 1)
	TriggerServerEvent('QBCore:Server:RemoveItem', "lime", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "corn", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["corn"], "add")
    QBCore.Functions.Notify("You made a Corn", "success")
end

function MakeGreenIsland()
    TriggerServerEvent('QBCore:Server:RemoveItem', "rum", 1)
	TriggerServerEvent('QBCore:Server:RemoveItem', "gin", 1)
	TriggerServerEvent('QBCore:Server:RemoveItem', "lime", 1)
    QBCore.Functions.Progressbar("pickup", "Filling a cup..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    })
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "green-island", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["green-island"], "add")
    QBCore.Functions.Notify("You made a Green Island", "success")
end
   
RegisterNetEvent("qb-rooksbar:shop")
AddEventHandler("qb-rooksbar:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "rooksbar", Config.Items)
end)

RegisterKeyMapping('rechnung', 'Rechnung austellen', 'keyboard', 'k')