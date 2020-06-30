Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1, y = 1, z = 1, r = 102, g = 0, b = 102, rotate = true } -- pillbox

Config.ReviveReward               = 130  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 5 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 3 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = false
Config.EnableSocietyOwnedVehicles = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 1000

Config.RespawnPoint = { coords = vector3(320.052, -593.575, 43.292), heading = 93.42} -- pillbox

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3( 297.895, -584.094, 43.261), --pillbox
			sprite = 61,
			scale  = 0.7,
			color  = 2
		},

		AmbulanceActions = {
			vector3(268.4, -1363.3, 23.5)
		},

		Pharmacies = {
			vector3(307.515, -594.306, 43.292) --pillbox
		},

		Vehicles = {
			{
				Spawner = vector3(297.12,-587.512,43.261), --pillbox
				InsideShop = vector3(289.532,-584.539, 42.832), --pillbox
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = { -- all pillbox
					{ coords = vector3(292.516,-609.973,43.042), heading = 68.186, radius = 4.0 }, 
					{ coords = vector3(287.627,-589.442,42.813), heading = 342.019, radius = 4.0 },
					{ coords = vector3(291.625,-571.292, 42.853), heading = 69.296, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(317.5, -1449.5, 46.5),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(313.5, -1465.1, 46.5), heading = 142.7, radius = 10.0 },
					{ coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(294.7, -1448.1, 29.0),
				To = { coords = vector3(272.8, -1358.8, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = { coords = vector3(295.8, -1446.5, 28.9), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = { coords = vector3(333.1, -1434.9, 45.5), heading = 138.6 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = { coords = vector3(249.1, -1369.6, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = { coords = vector3(320.9, -1478.6, 28.8), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, rotate = false }
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = { coords = vector3(238.6, -1368.4, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = { coords = vector3(251.9, -1363.3, 38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false },
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = { coords = vector3(235.4, -1372.8, 26.3), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

    ambulance = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'nhsford', label = 'ford', price = 40 },
		{ model = 'nhsmercedes', label = 'Ambulance2', price = 40 },
		{ model = 'police2', label = 'Ambocar', price = 40 }
    },

	doctor = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'nhsford', label = 'ford', price = 40 },
		{ model = 'nhsmercedes', label = 'Ambulance2', price = 40 },
		{ model = 'police2', label = 'Ambocar', price = 40 }    },


	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'nhsford', label = 'ford', price = 40 },
		{ model = 'nhsmercedes', label = 'Ambulance2', price = 40 },
		{ model = 'police2', label = 'Ambocar', price = 40 }    },


	boss = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'nhsford', label = 'ford', price = 40 },
		{ model = 'nhsmercedes', label = 'Ambulance2', price = 40 },
		{ model = 'police2', label = 'Ambocar', price = 40 }    },

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 150000
		}
	},

	chief_doctor = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 150000
		},

		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 300000
		}
	},

	boss = {
		{
			model = 'buzzard2',
			label = 'Nagasaki Buzzard',
			price = 100000
		},

		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 250000
		}
	}

}
