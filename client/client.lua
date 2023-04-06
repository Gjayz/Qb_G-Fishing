local QBCore = exports['qb-core']:GetCoreObject()

-- animation
local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end


--Ped All
Citizen.CreateThread(function()
    for k, v in pairs(Config.PedLocation) do
    local modelHash = GetHashKey(v.model)
    RequestModel(modelHash) 
    while ( not HasModelLoaded(modelHash) ) do
        Wait(1)
    end
    local ped = CreatePed(1, modelHash, v.coords, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true) 
    TaskStartScenarioInPlace(ped, v.scenario, -1, true) 
    -- FreezeEntityPosition(ped, true)
    end
end)

if Config.UseBlips then
    Citizen.CreateThread(function()
        -- All Blips
        for k, v in pairs(Config.Allblips) do
            local AllBlip = AddBlipForCoord(v.coords)
            SetBlipSprite(AllBlip, v.SetBlipSprite)
            SetBlipDisplay(AllBlip, v.SetBlipDisplay)
            SetBlipScale(AllBlip, v.SetBlipScale)
            SetBlipColour(AllBlip, v.SetBlipColour)
            SetBlipAsShortRange(AllBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.BlipName)
            EndTextCommandSetBlipName(AllBlip)
        end
        -- Fish Zone
        for k, v in pairs(Config.ZoneFish) do
            local FishZone = PolyZone:Create(v.zones, {
                name = v.label,
                minZ = v.minz,
                maxZ = v.maxz,
                debugPoly = false
            })
            FishZone:onPlayerInOut(function(isPointInside)
                if isPointInside then
                    exports['qb-core']:DrawText(Lang:t("label.PressStart"), 'left')
                    isZone = true
                else
                    exports['qb-core']:HideText()
                    isZone = false  
                end
            end)
        end
    end)
end
CreateThread(function()
    while true do
        Wait(0)
        if isZone then
            if IsControlJustReleased(0, 38) then  
                TriggerEvent('qb-fishing:client:StartFishing', src)
            end  
        end   
    end
end)


---Start Fishing Animation
function startFishing(dict, set, model)
    if isFishing then return end
    local animDict = dict
    local animName = set
    local trClassic = PlayerPedId() 
    isFishing = true
    local coords = GetEntityCoords(trClassic)
    bon = GetPedBoneIndex(trClassic, 18905)
    local rodHandle = CreateObject(GetHashKey(model), 0, 0, 0, true, true, true)
    CreateThread(function()
        while isFishing do
            AttachEntityToEntity(rodHandle, trClassic, bon, 0.1, 0.05, 0, 40.0, 80.0, 160.0, true, true, false, true, 1, true)
            loadAnimDict(animDict)
            TaskPlayAnim(trClassic, animDict, animName, 20.0, -8, -1, 17, 0, 0, 0, 0)
            Wait(Config.FishingWaitTime)
            isFishing = false
            exports['qb-core']:DrawText(Lang:t("label.PressStart"), 'left')
            loseBait()
            TriggerServerEvent('qb-fishing:server:FishingReward', src)
        end
        if rodHandle then
            ClearPedTasks(trClassic)
            DetachEntity(rodHandle, 1, true)
            DeleteEntity(rodHandle)
            rodHandled = nil
        end
    end)
end

-- Start Fishing
RegisterNetEvent('qb-fishing:client:StartFishing')
AddEventHandler('qb-fishing:client:StartFishing', function(args)
    QBCore.Functions.TriggerCallback('qb-fishing:server:FishinGrod-info', function(FishingGrod)
        if FishingGrod then
            QBCore.Functions.TriggerCallback('qb-fishing:server:FishBait-info', function(Fishbait)
                if Fishbait then
                    if IsPedSwimming(PlayerPedId()) then return QBCore.Functions.Notify(Lang:t("error.Swimming"), "error", 1000) end 
                    if IsPedInAnyVehicle(PlayerPedId()) then return QBCore.Functions.Notify(Lang:t("error.Driving"), "error" , 1000) end 
                    exports['qb-core']:HideText()
                    exports['ps-ui']:Circle(function(success)
                        if success then
                            startFishing('amb@world_human_stand_fishing@idle_a', 'idle_c', 'prop_fishing_rod_01')
                        else
                            QBCore.Functions.Notify(Lang:t('error.Field_try'), "error" , 1500)
                            exports['qb-core']:DrawText(Lang:t("label.PressStart"), 'left')
                        end
                    end, 2, 20)
                else
                    QBCore.Functions.Notify(Lang:t("error.No_fishbait"), "error", 1500)
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("error.No_fishgrod"), "error", 1500)
        end
    end)
end)



-- sell animation
RegisterNetEvent('qb-fishing:client:StartSelling')
AddEventHandler('qb-fishing:client:StartSelling', function(args)
    local animDict = "mp_common"
    local animName = "givetake2_a"
    local trClassic = PlayerPedId()
    local coords = GetEntityCoords(trClassic)
    local Siling= true
    FreezeEntityPosition(trClassic, true)        
    QBCore.Functions.Progressbar('Crushed Stone', Lang:t("label.StartSell"), 1000, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, }, {}, {}, {}, function() 
        ClearPedTasks(trClassic)
        TaskPlayAnim(trClassic, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        FreezeEntityPosition(trClassic, false)
        Siling = false
    end, function() 
        Siling = false
        TaskPlayAnim(trClassic, animDict, "exit", 3.0, 3.0, -1, 2, 0, 0, 0, 0)
        FreezeEntityPosition(trClassic, false)
    end)
    CreateThread(function()
        while Siling do                              
            loadAnimDict(animDict)
            TaskPlayAnim(trClassic, animDict, animName, 3.0, 3.0, -1, 2, 0, 0, 0, 0 )
            Wait(1000)
        end
    end)
end)
-- Lostbait
loseBait = function()
	local chance = math.random(1, 10)
	if chance <= 3 then
		TriggerServerEvent("qb-fishing:server:removeFishingFishBait")
	end
end

-- target
CreateThread(function()
    --Buy Item And Sell Fish
    for k, v in pairs(Config.PedLocationTarget) do
        exports["qb-target"]:AddBoxZone("Buy Fishing Item" .. k, v.coords, 0.8, 0.8, {
            name = "Buy Fishing Item" .. k,
            heading = v.heading,
            debugPoly = false,
            minZ = v.minZ ,
            maxZ = v.maxZ,
        }, {
            options = { 
              {
                --- Buy Item
                type = "client",
                event = "qb-fishing:client:MenubuyItemFishing",
                icon = "fa-solid fa-fish-fins",
                label = Lang:t("label.BuyItem"),
              },
              {
                --- Sell Item
                type = "client",
                event = "qb-fishing:client:MenuSellFishlist",
                icon = "fa-solid fa-fish-fins",
                label = Lang:t("label.SellFish"),
              },
            },
            distance = 1
        })
    end  
end)

-------Buy Item fishing
RegisterNetEvent('qb-fishing:client:MenubuyItemFishing')
AddEventHandler('qb-fishing:client:MenubuyItemFishing', function(src)
  local MenubuyItemFishing= {
    {
      header = "Fishing Industry",
      icon = 'fa-solid fa-fish-fins',
      isMenuHeader = true
    },
    {
        header = "Buy Fishing Grond",
        txt = "Price: 3500$",
        icon = Config.FishingGrod,
        params = {
        isServer = true,
        event = "qb-fishing:server:BuyItemFishing",
        args = 1
        }
    },
    {
        header = "Buy 10 Fish Biat",
        txt = "Price: 1000$",
        icon = Config.FishBait,
        params = {
        isServer = true,
        event = "qb-fishing:server:BuyItemFishing",
        args = 2
        }
    },
    {
        header = "Close",
        txt = "",
        params = {
            event = "qb-menu:closeMenu"
        }
    },
  }
exports['qb-menu']:openMenu(MenubuyItemFishing)
end)

-- menu Sell List
RegisterNetEvent('qb-fishing:client:MenuSellFishlist')
AddEventHandler('qb-fishing:client:MenuSellFishlist', function(src)
    local MemuSellFishlist= {
        {
            header = "Fishing Industry",
            icon = 'fa-solid fa-fish-fins',
            isMenuHeader = true
        },
        {
            header = "Sell Fish",
            txt = "Sell Stone Fish",
            icon = 'fa-solid fa-fish-fins',
            params = {
            event = "qb-fishing:client:MenuNormalSellFishList"
            }
        },
        {
            header = "Sell Tuna",
            txt = "Sell Tuna Fish",
            icon = 'fa-solid fa-fish-fins',
            params = {
            event = "qb-fishing:client:MenuTunaSellFishList"
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    }
exports['qb-menu']:openMenu(MemuSellFishlist)
end)

--- Tuna Sell Menu fish
RegisterNetEvent('qb-fishing:client:MenuTunaSellFishList')
AddEventHandler('qb-fishing:client:MenuTunaSellFishList', function(src)
  local MenuSellTunaFish= {
    {
        header = "Fishing Industry",
        icon = 'fa-solid fa-fish-fins',
        isMenuHeader = true
    },
    {
        header = "Sell Blackfin Tuna",
        txt = "Price: 2500$",
        icon = Config.BlackfinTuna,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellTuna",
        args = 1
        }
    },
    {
        header = "Sell YellowFin Tuna",
        txt = "Price: 2500$",
        icon = Config.YellowfinTuna,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellTuna",
        args = 2
        }
    },
    {
        header = "< Back",
        txt = "",
        params = {
            event = "qb-fishing:client:MenuSellFishlist"
        }
    },
  }
exports['qb-menu']:openMenu(MenuSellTunaFish)
end)

--- Normal Sell Menu fish
RegisterNetEvent('qb-fishing:client:MenuNormalSellFishList')
AddEventHandler('qb-fishing:client:MenuNormalSellFishList', function(src)
  local MenuSellNormalFish= {
    {
        header = "Fishing Industry",
        icon = 'fa-solid fa-fish-fins',
        isMenuHeader = true
    },
    {
        header = "Sell Cichlid",
        txt = "Price: 80$",
        icon = Config.Cichlid,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellNormal",
        args = 1
        }
    },
    {
        header = "Sell Horseye Jack",
        txt = "Price: 80$",
        icon = Config.HorseyeJack,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellNormal",
        args = 2
        }
    },
    {
        header = "Sell Lane Sanapper",
        txt = "Price: 80$",
        icon = Config.LaneSanapper,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellNormal",
        args = 3
        }
    },
    {
        header = "Sell Florida Pompano",
        txt = "Price: 80$",
        icon = Config.FloridaPompano,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellNormal",
        args = 4
        }
    },
    {
        header = "Sell Mutton Snapper",
        txt = "Price: 80$",
        icon = Config.MuttonSnapper,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellNormal",
        args = 5
        }
    },
    {
        header = "Sell PigFish",
        txt = "Price: 80$",
        icon = Config.PigFish,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellNormal",
        args = 6
        }
    },
    {
        header = "Sell Silver Perch",
        txt = "Price: 80$",
        icon = Config.SilverPerch,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellNormal",
        args = 7
        }
    },
    {
        header = "Sell Striped Bass",
        txt = "Price: 80$",
        icon = Config.StripedBass,
        params = {
        isServer = true,
        event = "qb-fishing:server:SellNormal",
        args = 8
        }
    },
    {
        header = "< Back",
        txt = "",
        params = {
            event = "qb-fishing:client:MenuSellFishlist"
        }
    },
  }
exports['qb-menu']:openMenu(MenuSellNormalFish)
end)



