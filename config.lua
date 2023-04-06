Config = Config or {}

Config.UseBlips = true
Config.FishingWaitTime = math.random(20000, 40000)


--Fishing object Use
Config.FishingGrod = 'fishingrod'
Config.FishBait = 'fishbait'
--Fishing Object price
Config.FishingGrodPrice = 3500
Config.FishBaitPrice = 1000

--Fish Object 
-- [Tuna Fish]
Config.BlackfinTuna = 'blackfin_tuna'
Config.YellowfinTuna = 'yellowfin_tuna'
-- [Isda Sa Bato] [Fish Stone]
Config.FloridaPompano = 'florida_pompano'
Config.Cichlid = 'cichlid'
Config.HorseyeJack = 'horseye_jack'
Config.LaneSanapper = 'lane_sanapper'
Config.MuttonSnapper = 'mutton_snapper'
Config.PigFish = 'pig_fish'
Config.SilverPerch = 'silver_perch'
Config.StripedBass = 'striped_bass'

Config.TunaPrice = 2500
Config.NormalFish = 80

-- Ped
Config.PedLocation = {
    [1] = {
        coords = vector4(-1654.59, -1037.14, 13.15, 62.08),
        model = 'a_m_y_sunbathe_01',
        scenario = 'WORLD_HUMAN_AA_COFFEE',
    },
    [2] = {
        coords = vector4(-3421.86, 960.72, 11.91, 92.45),
        model = 'a_m_y_sunbathe_01',
        scenario = 'WORLD_HUMAN_AA_COFFEE',
    },
    [3] = {
        coords = vector4(-1597.21, 5206.11, 4.31, 24.4),
        model = 'a_m_y_sunbathe_01',
        scenario = 'WORLD_HUMAN_AA_COFFEE',
    },
    [4] = {
        coords = vector4(727.7, 4169.32, 40.71, 7.56),
        model = 'a_m_y_sunbathe_01',
        scenario = 'WORLD_HUMAN_AA_COFFEE',
    },
    [5] = {
        coords = vector4(1321.49, 4314.54, 38.33, 85.93),
        model = 'a_m_y_sunbathe_01',
        scenario = 'WORLD_HUMAN_AA_COFFEE',
    },
    [6] = {
        coords = vector4(1667.1, -62.45, 174.17, 261.29),
        model = 'a_m_y_sunbathe_01',
        scenario = 'WORLD_HUMAN_AA_COFFEE',
    } 
}

-- Target Ped
Config.PedLocationTarget = {
    [1] = {
        coords = vector3(-1654.57, -1037.2, 13.15),
        heading = 325,
        minZ = 10.15,
        maxZ = 14.15,
    },
    [2] = {
        coords = vector3(-3421.76, 960.66, 11.91),
        heading = 0,
        minZ = 8.71,
        maxZ = 12.71
    },
    [3] = {
        coords = vector3(-1597.27, 5206.06, 4.31),
        heading = 25,
        minZ = 1.11,
        maxZ = 5.11
    },
    [4] = {
        coords = vector3(727.71, 4169.3, 40.71),
        heading = 0,
        minZ = 37.51,
        maxZ = 41.51
    },
    [5] = {
        coords = vector3(1321.34, 4314.46, 38.22),
        heading = 350,
        minZ = 35.22,
        maxZ = 39.22,
    },
    [6] = {
        coords = vector3(1666.99, -62.4, 173.78),
        heading = 345,
        minZ = 170.98,
        maxZ = 174.98
    },
}

-- all blips
Config.Allblips = {
    [1] = {
        coords = vector4(1326.47, 4226.78, 33.92, 189.89),
        SetBlipSprite = 317,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 29,
        BlipName = "Fishing Spot",
    },
    [2] = {
        coords = vector4(712.98, 4101.22, 35.79, 192.93),
        SetBlipSprite = 317,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 29,
        BlipName = "Fishing Spot",
    },
    [3] = {
        coords = vector4(-1611.09, 5260.72, 3.34, 19.84),
        SetBlipSprite = 317,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 29,
        BlipName = "Fishing Spot",
    },
    [4] = {
        coords = vector4(-3428.34, 969.42, 8.35, 76.25),
        SetBlipSprite = 317,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 29,
        BlipName = "Fishing Spot",
    },
    [5] = {
        coords = vector4(-1857.0, -1241.23, 9.03, 146.77),
        SetBlipSprite = 317,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 29,
        BlipName = "Fishing Spot",
    },
    [6] = {
        coords = vector4(1692.7, 41.89, 161.77, 55.63),
        SetBlipSprite = 317,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 29,
        BlipName = "Fishing Spot",
    },
    ----buy Item and sell Fish
    [7] = {
        coords = vector4(-1654.59, -1037.14, 13.15, 62.08),
        SetBlipSprite = 88,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 65,
        BlipName = "Buy & Sell Fishing Item",
    },
    [8] = {
        coords = vector4(-3421.86, 960.72, 11.91, 92.45),
        SetBlipSprite = 88,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 65,
        BlipName = "Buy & Sell Fishing Item",
    },
    [9] = {
        coords = vector4(-1597.21, 5206.11, 4.31, 24.4),
        SetBlipSprite = 88,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 65,
        BlipName = "Buy & Sell Fishing Item",
    },
    [10] = {
        coords = vector4(727.7, 4169.32, 40.71, 7.56),
        SetBlipSprite = 88,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 65,
        BlipName = "Buy & Sell Fishing Item",
    },
    [11] = {
        coords = vector4(1321.49, 4314.54, 38.33, 85.93),
        SetBlipSprite = 88,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 65,
        BlipName = "Buy & Sell Fishing Item",
    },
    [12] = {
        coords = vector4(1667.1, -62.45, 174.17, 261.29),
        SetBlipSprite = 88,
        SetBlipDisplay = 6,
        SetBlipScale = 0.70,
        SetBlipColour = 65,
        BlipName = "Buy & Sell Fishing Item",
    },

    

}

---- all Zone
Config.ZoneFish = {
    {
        --Fish Zone 1
        zones = {
            vector2(-1863.5925292969, -1233.6607666016),
            vector2(-1866.8145751953, -1237.4653320312),
            vector2(-1826.4913330078, -1272.3984375),
            vector2(-1821.1169433594, -1266.5834960938),
            vector2(-1822.6434326172, -1265.3591308594),
            vector2(-1826.4290771484, -1269.4727783203),
            vector2(-1864.4986572266, -1237.2130126953),
            vector2(-1862.6270751953, -1234.7220458984)
        },
        minZ = 7.6383194923401,
        maxZ = 8.695611000061
    },
    {
        -- Fish Zone 2
        zones = {
            vector2(-3421.2346191406, 950.79071044922),
            vector2(-3429.7377929688, 950.53723144531),
            vector2(-3429.1833496094, 984.75048828125),
            vector2(-3419.4133300781, 984.97827148438),
            vector2(-3419.7377929688, 982.39044189453),
            vector2(-3427.65625, 982.36560058594),
            vector2(-3427.7216796875, 952.68133544922),
            vector2(-3421.4372558594, 952.20166015625)
        },
        minZ = 7.2947301864624,
        maxZ = 8.3466968536377
    },
    {
        --- Fish Zone 3
        zones = {
            vector2(-1605.1646728516, 5256.6821289062),
            vector2(-1608.3709716797, 5263.7763671875),
            vector2(-1607.7174072266, 5264.0854492188),
            vector2(-1607.1446533203, 5263.2060546875),
            vector2(-1605.7254638672, 5263.6918945312),
            vector2(-1606.3989257812, 5266.615234375),
            vector2(-1617.5167236328, 5262.2612304688),
            vector2(-1614.3298339844, 5251.8666992188),
            vector2(-1611.703125, 5253.2666015625),
            vector2(-1614.7576904297, 5261.2045898438),
            vector2(-1608.6413574219, 5263.7036132812),
            vector2(-1609.0421142578, 5261.833984375),
            vector2(-1606.5386962891, 5256.3999023438)
        },
        minZ = 2.0756027698517,
        maxZ = 3.974104642868
    },
    {
        --- Fish Zone 4
        zones = {
            vector2(710.92687988281, 4104.2368164062),
            vector2(710.54699707031, 4091.1447753906),
            vector2(716.52673339844, 4090.79296875),
            vector2(716.49133300781, 4094.7915039062),
            vector2(714.96716308594, 4095.4921875),
            vector2(714.95404052734, 4092.7009277344),
            vector2(711.98962402344, 4092.7194824219),
            vector2(712.16870117188, 4104.015625)
        },
        minZ = 34.388782501221,
        maxZ = 35.785228729248
    },
    {
        --- Fish Zone 5
        zones = {
            vector2(1343.0037841797, 4226.3901367188),
            vector2(1342.2092285156, 4221.9731445312),
            vector2(1307.4934082031, 4228.0678710938),
            vector2(1307.8107910156, 4230.0297851562),
            vector2(1340.2103271484, 4224.1069335938),
            vector2(1341.0378417969, 4226.640625)
        },
        minZ = 33.08810043335,
        maxZ = 34.36803817749
    },
    {
        --- Fish Zone 6
        zones = {
            vector2(1674.3619384766, 39.294448852539),
            vector2(1674.5516357422, 36.801651000977),
            vector2(1698.9616699219, 37.712928771973),
            vector2(1698.6870117188, 41.701229095459),
            vector2(1696.1945800781, 41.297962188721),
            vector2(1696.2170410156, 40.875602722168),
            vector2(1676.7904052734, 38.88748550415)
        },
        minZ = 161.73927307129,
        maxZ = 163.7801361084
    },
}


