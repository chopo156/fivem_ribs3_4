Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.MafiaStations = {

  Mafia = {

    
    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 0.6,
      Colour  = 29,
    },
    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 40000 },
      { name = 'WEAPON_ASSAULTSMG',       price = 120000 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 140000 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 18000 },
      { name = 'WEAPON_STUNGUN',          price = 250 },
      { name = 'WEAPON_FLASHLIGHT',       price = 50 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { name = 'WEAPON_FLAREGUN',         price = 3000 },
      { name = 'GADGET_PARACHUTE',        price = 2000 },
      { name = 'WEAPON_SNIPERRIFLE',      price = 150000 },
      { name = 'WEAPON_FLARE',            price = 8000 },
      { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	    { name = 'WEAPON_POOLCUE',          price = 100 },
	  
    },
	  AuthorizedVehicles = {
		  { name = 'xls2', label = 'SUV' },
		  { name = 'baller5', label = 'SUV 2' },
	  },

    Cloakrooms = {
      { x = 4.666, y = -1106.012, z = 29.797 },
    },

    Armories = {
      { x = 13.625, y = -1111.643, z = 29.797 },
    },
    Vehicles = {
      {
        Spawner    = { x = 14.596, y = -1108.079, z = 29.797 },
        SpawnPoint = { x = -9.446, y = -1113.918, z = 28.259 },
        Heading    = 158.8,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = 6.56, y = -1109.644, z = 29.797 },
        SpawnPoint = { x = 19.447, y = -1111.572, z = 42.474 },
        Heading    = 343.742,
      }
    },

    VehicleDeleters = {
      { x = -0.845, y = -1113.782, z = 28.589 },
    },

    BossActions = {
      { x = 10.903, y = -1110.951, z = 29.797 }
    },

  },

}
