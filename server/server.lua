local QBCore = exports['qb-core']:GetCoreObject()

--- Remove FishBait
RegisterNetEvent('qb-fishing:server:removeFishingFishBait')
AddEventHandler('qb-fishing:server:removeFishingFishBait', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local fishbait = Config.FishBait
    Player.Functions.RemoveItem(fishbait, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[fishbait], "remove", 1)
end)

-- Fishing Grod information
QBCore.Functions.CreateCallback('qb-fishing:server:FishinGrod-info', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.FishingGrod) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
--- FishBait information
QBCore.Functions.CreateCallback('qb-fishing:server:FishBait-info', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player ~= nil then
        if Player.Functions.GetItemByName(Config.FishBait) ~= nil then
            cb(true)
        else
            cb(false)
        end
    end
end)
-- Buy Item Fishing
RegisterNetEvent('qb-fishing:server:BuyItemFishing')
AddEventHandler('qb-fishing:server:BuyItemFishing', function(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local args = tonumber(args)
    if args == 1 then
        local FishingGrodAmount = 1
        local FishingGrod = Config.FishingGrod
        local FishingGrodPrice = Config.FishingGrodPrice
        if Player.Functions.RemoveMoney('cash', FishingGrodPrice) then
            Player.Functions.AddItem(FishingGrod, FishingGrodAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[FishingGrod], 'add', FishingGrodAmount)
            QBCore.Functions.Notify(src, ("Added 1 Fishing Rod to Inventory"), "success", 2000)
        else
            QBCore.Functions.Notify(src, Lang:t("error.no_cash"), "error", 2000)
        end
    elseif args == 2 then
        local FishBaitAmount = 10
        local FishBait = Config.FishBait
        local FishBaitPrice = Config.FishBaitPrice
        if Player.Functions.RemoveMoney('cash', FishBaitPrice) then
            Player.Functions.AddItem(FishBait, FishBaitAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[FishBait], 'add', FishBaitAmount)
            QBCore.Functions.Notify(src, ("Added 10 Fish Bait to Inventory"), "success", 2000)
        else
            QBCore.Functions.Notify(src, Lang:t("error.no_cash"), "error", 2000)
        end
    end
end)

-- Reward Fishing
RegisterNetEvent('qb-fishing:server:FishingReward')
AddEventHandler('qb-fishing:server:FishingReward', function(src)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local luck = math.random(1, 100)
    local amountReceived = 1
    if luck >= 95 and luck <= 100 then
        Player.Functions.AddItem(Config.BlackfinTuna, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.BlackfinTuna], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved BlackfinTuna"), "success", 2000)
    elseif luck >= 90 and luck <= 95 then
        Player.Functions.AddItem(Config.silverReward, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.YellowfinTuna], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved YellowfinTuna"), "success", 2000)
    elseif luck >= 80 and luck <= 90 then
        Player.Functions.AddItem(Config.FloridaPompano, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FloridaPompano], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved Florida Pompano"), "success", 2000)
    elseif luck >= 70 and luck <= 80 then
        Player.Functions.AddItem(Config.Cichlid, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Cichlid], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved Cichlid"), "success", 2000)
    elseif luck >= 60 and luck <= 70 then
        Player.Functions.AddItem(Config.HorseyeJack, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HorseyeJack], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved Horseye Jack"), "success", 2000)
    elseif luck >= 50 and luck <= 60 then
        Player.Functions.AddItem(Config.LaneSanapper, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LaneSanapper], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved Lane Sanapper"), "success", 2000)
    elseif luck >= 40 and luck <= 50 then
        Player.Functions.AddItem(Config.MuttonSnapper, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MuttonSnapper], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved Mutton Snapper"), "success", 2000)
    elseif luck >= 30 and luck <= 40 then
        Player.Functions.AddItem(Config.PigFish, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PigFish], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved PigFish"), "success", 2000)
    elseif luck >= 20 and luck <= 30 then
        Player.Functions.AddItem(Config.SilverPerch, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SilverPerch], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved Silver Perch"), "success", 2000)
    elseif luck >= 10 and luck <= 20 then
        Player.Functions.AddItem(Config.StripedBass, amountReceived)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StripedBass], 'add', amount)
        QBCore.Functions.Notify(src, ("You Recieved Striped Bass"), "success", 2000)
    elseif luck >= 0 and luck <= 10 then
        QBCore.Functions.Notify(src, "Sorry Try Again", "success", 2000)
    end
end)

--- Sell Normal Fish
RegisterNetEvent('qb-fishing:server:SellNormal')
AddEventHandler('qb-fishing:server:SellNormal', function(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local args = tonumber(args)
    local NormalPrice = Config.NormalFish
    local stillHaveItem = true
    local amountResources = 0
    local price = 0
    if args == 1 then 
        local Cichlid = Config.Cichlid
        if Cichlid and Player.Functions.GetItemByName(Config.Cichlid) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(Cichlid)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(Cichlid, 1)
                else
                    stillHaveItem = false
                    price = amountResources * NormalPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Cichlid], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Cichlid"), "error", 1500)
        end
    elseif args == 2 then
        local Horseyejack = Config.HorseyeJack
        if Horseyejack and Player.Functions.GetItemByName(Config.HorseyeJack) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(Horseyejack)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(Horseyejack, 1)
                else
                    stillHaveItem = false
                    price = amountResources * NormalPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Horseyejack], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Horseyejack"), "error", 1500)
        end
    elseif args == 3 then
        local Lanesanapper = Config.LaneSanapper
        if Lanesanapper and Player.Functions.GetItemByName(Config.LaneSanapper) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(Lanesanapper)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(Lanesanapper, 1)
                else
                    stillHaveItem = false
                    price = amountResources * NormalPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Lanesanapper], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Lanesanapper"), "error", 1500)
        end
    elseif args == 4 then
        local Floridapompano = Config.FloridaPompano
        if Floridapompano and Player.Functions.GetItemByName(Config.FloridaPompano) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(Floridapompano)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(Floridapompano, 1)
                else
                    stillHaveItem = false
                    price = amountResources * NormalPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Floridapompano], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Floridapompano"), "error", 1500)
        end
    elseif args == 5 then
        local Muttonsnapper = Config.MuttonSnapper
        if Muttonsnapper and Player.Functions.GetItemByName(Config.MuttonSnapper) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(Muttonsnapper)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(Muttonsnapper, 1)
                else
                    stillHaveItem = false
                    price = amountResources * NormalPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Muttonsnapper], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Muttonsnapper"), "error", 1500)
        end
    elseif args == 6 then 
        local Pigfish = Config.PigFish
        if Pigfish and Player.Functions.GetItemByName(Config.PigFish) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(Pigfish)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(Pigfish, 1)
                else
                    stillHaveItem = false
                    price = amountResources * NormalPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Pigfish], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Pigfish"), "error", 1500)
        end
    elseif args == 7 then
        local Silverperch = Config.SilverPerch
        if Silverperch and Player.Functions.GetItemByName(Config.SilverPerch) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(Silverperch)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(Silverperch, 1)
                else
                    stillHaveItem = false
                    price = amountResources * NormalPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Silverperch], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Silverperch"), "error", 1500)
        end
    elseif args == 8 then
        local Stripedbass = Config.StripedBass
        if Stripedbass and Player.Functions.GetItemByName(Config.StripedBass) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(Stripedbass)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(Stripedbass, 1)
                else
                    stillHaveItem = false
                    price = amountResources * NormalPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Stripedbass], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Stripedbass"), "error", 1500)
        end
    end
end)


---Sell Tuna Fish
RegisterNetEvent('qb-fishing:server:SellTuna')
AddEventHandler('qb-fishing:server:SellTuna', function(args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local args = tonumber(args)
    local TunaPrice = Config.TunaPrice
    local amountResources = 0
    local price = 0
    if args == 1 then 
        local stillHaveItem = true
        local BlackfinTuna = Config.BlackfinTuna
		if BlackfinTuna and Player.Functions.GetItemByName(Config.BlackfinTuna) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(BlackfinTuna)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(BlackfinTuna, 1)
                else
                    stillHaveItem = false
                    price = amountResources * TunaPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[BlackfinTuna], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Blackfintuna"), "error", 1500)
        end
    elseif args == 2 then
        local stillHaveItem = true
        local YellowfinTuna = Config.YellowfinTuna
		if YellowfinTuna and Player.Functions.GetItemByName(Config.YellowfinTuna) ~= nil then
            while stillHaveItem == true do
                local itemData = Player.Functions.GetItemByName(YellowfinTuna)
                if itemData ~= nil then
                    amountResources = amountResources + 1
                    Player.Functions.RemoveItem(YellowfinTuna, 1)
                else
                    stillHaveItem = false
                    price = amountResources * TunaPrice
                end
            end
            TriggerClientEvent('qb-fishing:client:StartSelling', src)
            Player.Functions.AddMoney('cash', price)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[YellowfinTuna], "remove", amountResources)
            QBCore.Functions.Notify(src, ( amountResources ..' gold sold for $'..price), "success", 1500)
        else
            QBCore.Functions.Notify(src, Lang:t("error.No_Yellowfintuna"), "error", 1500)
        end
    end
end)


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print("---------------------------------------------------------------------------------------------")
    print("       ^Github ^5 --> ^https://github.com/Gjayz         "," ^Author Gjayz")
    print("       ^Main Github ^5 --> ^https://github.com/gjayz099         ","QB_G-Fishing Job")
    print("---------------------------------------------------------------------------------------------")
end)