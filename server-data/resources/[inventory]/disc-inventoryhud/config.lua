Config = {}

Config.Locale = 'en'
Config.OpenControl = 289
Config.TrunkOpenControl = 47
Config.DeleteDropsOnStart = true
Config.HotKeyCooldown = 1000
Config.CheckLicense = false

Config.Shops = {
    ['Store'] = {
        coords = {
            vector3(374.225, 326.717, 102.800),
            vector3(25.8929, -1346.71, 28.597),
            vector3(-48.1829, -1756.99, 28.500),
            vector3(-707.769, -913.886, 18.315),
            vector3(-1223.69, -907.031, 11.426),
            vector3(-1487.15, -380.113, 39.2634),
            vector3(1163.24, -323.212, 68.3051),
            vector3(1136.09, -981.251, 45.5158),
            vector3(2556.55, 382.399, 107.723),
            vector3(547.382, 2670.33, 41.2565),
            vector3(1961.21, 3741.6, 31.4437),
            vector3(1698.95, 4924.46, 41.1637),
            vector3(1729.65, 6415.65, 34.1372),
            vector3(-3243.03, 1001.66, 11.9307),
            vector3(2678.06, 3281.11, 54.3411), 
        },
        items = {
            {name = 'water', price = 12, count = 5},
            {name = 'monster', price = 15, count = 5},
            {name = 'sprite', price = 13, count = 5},
            {name = 'soda', price = 13, count = 5},
            {name = 'chocolate', price = 7, count = 5},
            {name = 'bolchips', price = 5, count = 5},
            {name = 'vitelaass', price = 4, count = 5},
        },
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        blipColour = 2,
        blipSprite = 52,
        msg = 'Open Shop ~INPUT_CONTEXT~',
        enableBlip = true,
        job = 'all'
        },    
   ['Ammunation'] = {
        coords = {
            vector3(-662.180, -934.961, 20.929),
            vector3(810.25, -2157.60, 28.72),
            vector3(1693.44, 3760.16, 33.81),
            vector3(-330.24, 6083.88, 30.55),
            vector3(252.63, -50.00, 68.99),
            vector3(22.09, -1107.28, 28.90),
            vector3(2567.69, 294.38, 107.83),
            vector3(-1117.58, 2698.61, 17.65),
            vector3(842.44, -1033.42, 27.29), 
        },
        items = {
            { name = "WEAPON_KNIFE", price = 110, count = 5 },
            { name = "WEAPON_SNSPISTOL", price = 1950, count = 5 },
            { name = "WEAPON_STUNGUN", price = 150, count = 5 },              
            { name = "disc_ammo_pistol", price = 65, count = 5 },
        },
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        blipColour = 1,
        blipSprite = 110,
        msg = 'Open Shop ~INPUT_CONTEXT~',
        enableBlip = true,
        job = 'all'
        },   
    ['Coffee-Shop'] = {
        coords = {
            vector3(-633.09, 235.34, 81.08),
        },
        items = {
            { name = "Mocha", price = 14, count = 5 },
            { name = "latte", price = 15, count = 5 },
            { name = "donut", price = 12, count = 5 },
            { name = "cupcake", price = 10, count = 5 },
        },
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        blipColour = 2,
        blipSprite = 52,
        msg = 'Open Shop ~INPUT_CONTEXT~',
        enableBlip = false,
        job = 'all'
        },
    ['Pearls\'s-Seafood'] = {
            coords = {
                vector3(-1830.61, -1185.08, 13.90),
            },
            items = {
                { name = "polvogre", price = 24, count = 5 },
                { name = "wine", price = 19, count = 5 },
                { name = "prosecco", price = 72, count = 5 },
                { name = "loffe_fish", price = 22, count = 5 },
                
            },
            markerType = 27,
            markerColour = { r = 0, g = 0, b = 255 },
            blipColour = 2,
            blipSprite = 52,
            msg = 'Open Shop ~INPUT_CONTEXT~',
            enableBlip = false,
            job = 'all'
            },   

            ['BurgerShot'] = {
                coords = {
                    vector3(86.38, -231.41, 54.0),
                },
                items = {
                    { name = "moneyshot", price = 25, count = 5 },
                    { name = "hamburger", price = 22, count = 5 },
                    { name = "heartstopper", price = 30, count = 5 },
                    { name = "fries", price = 16, count = 5 },
                    { name = "soda", price = 11, count = 5 },
                    { name = "sprite", price = 11, count = 5 },
                },
                markerType = 27,
                markerColour = { r = 0, g = 0, b = 255 },
                blipColour = 2,
                blipSprite = 52,
                msg = 'Open Shop ~INPUT_CONTEXT~',
                enableBlip = false,
                job = 'all'
                }, 
            ['Tool Shop'] = {
                    coords = {
                        vector3(45.48, -1748.88, 28.95),
                    },
                    items = {
                        { name = "oxygen_mask", price = 75, count = 5 },
                        { name = "bulletproof", price = 225, count = 5 },
                        { name = "fixkit", price = 250, count = 5 },
                        
                    },
                    markerType = 27,
                    markerColour = { r = 0, g = 0, b = 255 },
                    blipColour = 2,
                    blipSprite = 52,
                    msg = 'Open Shop ~INPUT_CONTEXT~',
                    enableBlip = false,
                    job = 'all'
                    },
            ['Weed Shop'] = {
                        coords = {
                            vector3(-1169.06, -1572.72, 3.76),
                        },
                        items = {
                            { name = "drugbags", price = 15, count = 10 },
                            { name = "joint2g", price = 20, count = 5 },
                            { name = "hqscale", price = 70, count = 1 },
                            { name = "hqscale", price = 70, count = 1 },
                            
                        },
                        markerType = 27,
                        markerColour = { r = 0, g = 0, b = 255 },
                        blipColour = 2,
                        blipSprite = 52,
                        msg = 'Open Shop ~INPUT_CONTEXT~',
                        enableBlip = false,
                        job = 'all'
                        },
    ['Police-Armory'] = {
        coords = {
            vector3(-1106.13, -823.01, 14.28),
        },
        items = {
            { name = "WEAPON_COMBATPISTOL", price = 0, count = 1 },
            { name = "WEAPON_STUNGUN", price = 0, count = 1 },
            { name = "WEAPON_NIGHTSTICK", price = 0, count = 1 },
            { name = "WEAPON_PUMPSHOTGUN", price = 0, count = 1 },
            { name = "WEAPON_ADVANCEDRIFLE", price = 0, count = 1 },
            { name = "disc_ammo_pistol", price = 0, count = 5 },
            { name = "disc_ammo_rifle", price = 0, count = 5 },
            { name = "disc_ammo_shotgun", price = 0, count = 5 },
            { name = "bulletproof", price = 0, count = 5 },
        },
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        blipColour = 2,
        blipSprite = 52,
        msg = 'Open Shop ~INPUT_CONTEXT~',
        enableBlip = false,
        job = 'police'
    }
}

Config.Stash = {
    ['Police Evidance Locker'] = {
        coords = vector3(-1102.33, -819.87, 14.28),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        msg = 'Open Stash Locker ~INPUT_CONTEXT~'
    },
    ['Ambulance Stash Locker'] = {
        coords = vector3(310.75, -597.08, 42.70),
        size = vector3(1.0, 1.0, 1.0),
        job = 'ambulance',
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        msg = 'Open Stash Locker ~INPUT_CONTEXT~'
    },
    ['Police Junk Locker'] = {
        coords = vector3(-1103.12, -830.72, 14.28),
        size = vector3(1.0, 1.0, 1.0),
        job = 'police',
        markerType = 27,
        markerColour = { r = 0, g = 0, b = 255 },
        msg = 'Open Junk Locker ~INPUT_CONTEXT~'
    }
}

Config.Steal = {
    black_money = false,
    cash = true
}

Config.Seize = {
    black_money = true,
    cash = true
}

Config.Map = {
   {name="Trash Field",color=16, id=436, x= 1292.88, y= -1055.64,  z = 39.23},
   {name="Tomato Field",color=1, id=436, x= 566.45,  y= 6486.37,  z = 30.67},
   {name="Wash Ore",color=32, id=478, x= 92.83,  y= 3218.03,  z = 26.05},
   {name="Sell Gold",color=32, id=108, x= -621.1,  y= -228.38,  z = 38.06},
   {name="Fry Eggs",color=38, id=478, x= -1172.04,  y= -1434.1,  z = 4.44},
   {name="Sell Omelet",color=38, id=108, x= 374.05,  y= 329.35,  z = 103.57},
   {name="Log Field",color=27, id=436, x= 1701.25,  y= 2207.59,  z = 91.48},
   {name="Fry Chicken",color=14, id=478, x= 464.37,  y= 3565.27,  z = 33.24},
   {name="Sell Fried Chicken",color=14, id=108, x= -1535.13,  y= -454.15,  z = 35.92},
   {name="Gather Eggs",color=38, id=436, x= 2930.4,  y= 4641.36,  z = 48.54},
   {name="Honey Harvesting",color=76, id=514, x= 2060.9,  y= 5108.8,  z = 46.0},
   {name="Mimi\'s Burgers",color=3, id=52, x= 86.38,  y= -231.41,  z = 54.0},
   {name="Pearls\'s Seafood",color=3, id=52, x= -1830.61,  y= -1185.08,  z = 13.90},
   {name="Coffee Shop",color=3, id=52, x= -633.09,  y= 235.34,  z = 81.08},
   {name="Tool Shop",color=1, id=402, x= 44.24,  y= -1747.78,  z = 28.49},
   {name="Smoke on the water",color=52, id=140, x= -1169.06,  y= -1572.72,  z = 4.66},
}

Config.VehicleSlot = {
    [0] = 10, --Compact
    [1] = 15, --Sedan
    [2] = 20, --SUV
    [3] = 15, --Coupes
    [4] = 5, --Muscle
    [5] = 5, --Sports Classics
    [6] = 5, --Sports
    [7] = 0, --Super
    [8] = 2, --Motorcycles
    [9] = 10, --Off-road
    [10] = 20, --Industrial
    [11] = 20, --Utility
    [12] = 30, --Vans
    [13] = 0, --Cycles
    [14] = 0, --Boats
    [15] = 0, --Helicopters
    [16] = 0, --Planes
    [17] = 20, --Service
    [18] = 20, --Emergency
    [19] = 90, --Military
    [20] = 0, --Commercial
    [21] = 0 --Trains
}

Config.Throwables = {
    WEAPON_MOLOTOV = 615608432,
    WEAPON_GRENADE = -1813897027,
    WEAPON_STICKYBOMB = 741814745,
    WEAPON_PROXMINE = -1420407917,
    WEAPON_SMOKEGRENADE = -37975472,
    WEAPON_PIPEBOMB = -1169823560,
    WEAPON_SNOWBALL = 126349499
}

Config.FuelCan = 883325847