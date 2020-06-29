# Developer & API notes
## server.cfg host name
    ex: set colors
        ^0 is White (#F0F0F0)
        ^1 is Red (#F44336)
        ^2 is Green (#4CAF50)
        ^3 is Yellow (#FFEB3B)
        ^4 is Blue (#42A5F5)
        ^5 is Light Blue (#03A9F4)
        ^6 is Purple (#9C27B0)
        ^7 is White (#F0F0F0)
        ^8 is Orange (#FF5722)
        ^9 is Grey (#9E9E9E)

        Here is an example of how you would use these colours:

    sv_hostname "^1My ^2FXServer ^3Wew!"
## web refs
    https://pastebin.com/8EuSv2r1
    https://pastebin.com/QuDYpGHz
    https://www.se7ensins.com/forums/threads/gta-v-vehicle-hashes-list.988584/
    https://runtime.fivem.net/doc/natives/
    
    - GTA V non-steam launcher
    https://sourceforge.net/projects/gtavnonsteamlauncher/
    
    - player trust view Steam ID (requires steam API dev key)
    https://github.com/SaltyGrandpa/FiveM-PlayerTrust
    
## fivem natives
    - https://runtime.fivem.net/doc/natives/
    - print
        ref: https://forum.fivem.net/t/print-trace-events/16073/2?u=housesellout
        - to print in the server console use
            print(“Hello World”) 
        - to print in the client console aka F8 console use
            Citizen.Trace(“Hello World”)
            
        ref: https://forum.fivem.net/t/weird-chat-message-issue/37853/6?u=housesellout
        - invokes client side f8 console and chat prints from server side 'print()'
            .../server-data/resources/[system]/chat/cl_chat.lua
            AddEventHandler('__cfx_internal:serverPrint', function(msg)
                -- prints to f8 client console (when calling server side 'print()') 
                print(msg)
                
                -- prints to client side chat (when calling server side 'print()') 
                SendNUIMessage({
                    type = 'ON_MESSAGE',
                    message = {
                        templateId = 'print',
                        multiline = true,
                        args = { msg }
                    }
                })
            end)    
    - death
        ref: .../server-data/resources/[system]/baseevents/server.lua
        AddEventHandler('baseevents:onPlayerKilled', function(killedBy, data)
            local victim = source
        
            RconLog({msgType = 'playerKilled', victim = victim, attacker = killedBy, data = data})
        end)
        
        AddEventHandler('baseevents:onPlayerDied', function(killedBy, pos)
            local victim = source
        
            RconLog({msgType = 'playerDied', victim = victim, attackerType = killedBy, pos = pos})
        end)
        
        
    - IsPedArmed
        -- 0x475768A975D5AD17 0x0BFC892C
        -- IS_PED_ARMED
        local retval --[[ boolean ]] = IsPedArmed(
                                            ped --[[ Ped ]], 
                                            p1 --[[ integer ]]
                                        )
        p1 is anywhere from 4 to 7 in the scripts. Might be a weapon wheel group?  
        ^It's kinda like that.   
        7 returns true if you are equipped with any weapon except your fists.  
        6 returns true if you are equipped with any weapon except melee weapons.  
        5 returns true if you are equipped with any weapon except the Explosives weapon group.  
        4 returns true if you are equipped with any weapon except Explosives weapon group AND melee weapons.  
        3 returns true if you are equipped with either Explosives or Melee weapons (the exact opposite of 4).  
        2 returns true only if you are equipped with any weapon from the Explosives weapon group.  
        1 returns true only if you are equipped with any Melee weapon.  
        0 never returns true.  
        Note: When I say "Explosives weapon group", it does not include the Jerry can and Fire Extinguisher.
        
### console commands
    cfx> refresh; restart dm4c_util; restart dm4c_stamina; restart dm4c_wallet; restart dm4c_store; restart dm4c_ammo;
    cfx> refresh; restart dm4c_util; restart dm4c_wallet; restart dm4c_store; restart dm4c_ammo;
    
    cfx> refresh; restart dm4c_util; restart dm4c_wallet; restart dm4c_store; restart dm4c_ammo; restart dm4c_spawn;
    
    cfx> refresh; restart dm4c_spawn; restart esx_ambulancejob;
    
    cfx> refresh; restart dm4c_stamina;
    cfx> refresh; restart dm4c_wallet; 
    cfx> refresh; restart dm4c_store;
    cfx> refresh; restart dm4c_ammo;
    cfx> refresh; restart dm4c_util;
    cfx> refresh; restart dm4c_spawn;
    
    
    
## Lua general
    - get current time
        local funcname = os.time() .. '_[dm4c:weaponChanged]'
    - exception handling example
        if pcall(foo(bar)) then
            -- no errors while running `foo(bar)'
            while IsPedReloading(playerPed) do
                Citizen.Wait(10)
            end
        else
            local pass = 1
            -- `foo(bar)' raised an error: take appropriate actions
        end
        
## hot / live updates
    update resource (w/ __resources.lua file update)
        > refresh; restart <resource-name>
    
    update resuorce (w/o __resources.lua file update)
        > restart <resource-name>
        
## global keys
    - MP0_STAMINA
    - MP0_STRENGTH
    
## Classes
    - player.lua
        self.setMoney = function(money)
        self.setAccountMoney = function(acc, money)
        self.setJob = function(name, grade)
        self.addWeapon = function(weaponName, ammo)
        self.removeWeapon = function(weaponName, ammo)
        self.hasWeapon = function(weaponName)
        
## ESX
### server side
    - shared object 
        ESX = nil
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    - player
        local xPlayer = ESX.GetPlayerFromId(_source)
    - weapons
        local weapons = ESX.GetWeaponList()
        local weaponLabel = ESX.GetWeaponLabel(weaponName)
    - save ref: .../server-data/resources/[esx]/es_extended/server/functions.lua
        ESX.SavePlayer = function(xPlayer, cb)
        ESX.SavePlayers = function(cb)

### client side
    - .../server-data/resources/[esx]/es_extended/client/functions.lua
        ESX.ShowAdvancedNotification = function(title, subject, msg, icon, iconType)
        ESX.ShowHelpNotification = function(msg)
        ESX.ShowNotification = function(msg)

    - teleport
        ESX.Game.Teleport(PlayerPedId(), JailLocation)
    
    - sessionmanager/client/empty.lua (note about scheduler.lua):
        --This empty file causes the scheduler.lua to load clientside
        --scheduler.lua when loaded inside the sessionmanager resource currently manages remote callbacks.
        --Without this, callbacks will only work server->client and not client->server.
        
    - .../server-data/resources/[esx]/esx_ambulancejob/client/main.lua
        OnPlayerDeath()

    - emotes .../server-data/resources/radiant_animations/client.lua
        RegisterCommand("e",function(source, args)
        
### server callback
    - server side
        ESX.RegisterServerCallback('dm4c:clipfull', function(source, cb, activeAmmoCnt, currWeapon)
            cb(success, msg, _source)
        end)
        
        - client side (note: client does NOT block until callback is returned)
        ESX.TriggerServerCallback('dm4c:clipfull', function(hasCash, msg, reloadPlayID)
            if hasCash then
                showHelpNotification("hasCash is true", 3)
            else
                showHelpNotification(msg, 3)
            end
        end, activeAmmoCnt, currWeapon)

## MySql queries
### show users' name, steamID, cash (money), bank, ammo (black money)
    - display: name, steamID, cash, bank, ammo_cash, 
    mysql> select users.name,users.identifier, users.money, bank, user_accounts.money as ammo from users, user_accounts where users.identifier = user_accounts.identifier;

    - display: name, steamID, cash, bank, ammo_cash, is_dead
    mysql> select users.name,users.identifier, users.money, bank, user_accounts.money as ammo, is_dead from users, user_accounts where users.identifier = user_accounts.identifier;
    
    - display: name, steamID, cash, bank, ammo_cash, is_dead, last_property
    mysql> select users.name,users.identifier, users.money, bank, user_accounts.money as ammo, last_property as last_ammo, is_dead from users, user_accounts where users.identifier = user_accounts.identifier;
    
    - display: name, firstname, lastname, steamID, cash, bank, ammo_cash, is_dead, last_property
    mysql> select users.name,users.firstname,users.lastname,users.identifier, users.money, bank, user_accounts.money as ammo, last_property as last_ammo, is_dead from users, user_accounts where users.identifier = user_accounts.identifier;

## MySql in lua (server side)
    ex: mysql call from lua (select statement))
        MySQL.Async.fetchAll('SELECT * FROM `jobs` WHERE `name` = @name', {
            ['@name'] = name
        }, function(result)

            self.job['id']    = result[1].id
            self.job['name']  = result[1].name
            self.job['label'] = result[1].label
        end)
        
    ex: mysql call from lua (update statement)
        local xPlayer = ESX.GetPlayerFromId(source)
        MySQL.Async.execute('UPDATE users SET last_property = @last_property WHERE identifier = @identifier',
            {
                ['@last_property'] = property,
                ['@identifier']    = xPlayer.identifier
            })

## client side native/global functions
### unsorted
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    IsChoosing = false
    DisplayHud(true)
    DisplayRadar(true)
    DoScreenFadeIn(500)
    DisablePlayerVehicleRewards(PlayerId())
    ClearPedBloodDamage(ped)
    SetPlayerInvincible(ped, false)
    success, vec3 = GetSafeCoordForPed(vector.x, vector.y, vector.z, false, 28)
    SetPedAmmo(playerPed, weaponHash, 0) -- remove leftover ammo
    GetHashKey(weaponName)
    PlayerId()
    GetPlayerWantedLevel(playerId)
    SetPlayerWantedLevel(playerId, 0, false)
    SetPlayerWantedLevelNow(playerId, false)
    IsPlayerInCutscene(PlayerId())
    SetBlipNameToPlayerName(
        blip --[[ Blip ]], 
        player --[[ Player ]]
    )
    IsGameplayCamRendering()
    SetPlayerAngry(playerPed, false)
    SetPedDropsWeaponsWhenDead(playerPed, true)
    local vehicle = GetClosestVehicle(coords.x,coords.y,coords.z,radius,modelHash,flags)
        local radius = 2.0
        local modelHash = lastModelHash
        local flags = 70
        local coords = GetEntityCoords(playerPed)
    DeleteVehicle(vehicle)
    IsPedInParachuteFreeFall(playerPed)
    local intState = GetPedParachuteState(playerPed)
        Returns:  
        -1: Normal  
        0: Wearing parachute on back  
        1: Parachute opening  
        2: Parachute open  
        3: Falling to doom (e.g. after exiting parachute)  
        Normal means no parachute?  
    
### globalizing functions (export functions)
    - NOTE: exporting from a resource, does not require that resource to be added as a
             dependency in another resource to be used
    - added 'exprt' command to __resource.lua of function you want to be global
        __resource.lua in dm4c_wallet
            export 'cash2ammo' -- for client_scripts
            export_server 'cash2ammo' -- for server_scripts

    - invoke function from another .lua file
        server.lua in dm4c_ammo
            exports.dm4c_wallet:cash2ammo(_source, activeAmmoCnt, xPlayer)
            
### player id 
    - get dynamic server side player ID (displayed in lower left corner)
        _source == GetPlayerServerId(PlayerId())
    - get client side player ID from server side event handler 'source'
        PlayerId() == GetPlayerFromServerId(_source)

### notification
    #ref: https://forum.fivem.net/t/common-ways-to-display-help-text/292363
        function showHelpNotification(text, durSec)
            BeginTextCommandDisplayHelp("STRING")
            AddTextComponentSubstringPlayerName(text)

            -- shape (always 0), loop (bool), makeSound (bool), duration (0 for loop)
            -- EndTextCommandDisplayHelp(0, 1, 1, 0)

            -- shape (always 0), loop (bool), makeSound (bool), duration (5000 max 5 sec)
            EndTextCommandDisplayHelp(0, 0, 1, durSec * 1000)
            
            -- shape (always 0), loop (bool), makeSound (bool), duration (-1 for 10sec i think)
            -- EndTextCommandDisplayHelp(0, 0, 1, -1)
        end

### coordinates & spawning
    - check if coordinate is available
    ex:
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)
        while not HasCollisionLoadedAroundEntity(entity) do
            RequestCollisionAtCoord(coords.x, coords.y, coords.z)
            Citizen.Wait(0)
        end
        SetEntityCoords(entity, coords.x, coords.y, coords.z)
    
### ESX.Game.GetClosestPlayer()
    ex:
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        
### IsPedArmed()
    - checks is player (or ped) is armed
        pass 7 to include slapper weapons
        pass 4 to exclude slapper weapons
    ex:
        local armed = IsPedArmed(PlayerPedId(), 7)
        local armed = IsPedArmed(PlayerPedId(), 4)

### TriggerClientEvent()
    - set cash display
        TriggerClientEvent('es:activateMoney', self.source , self.money)
    - set bank display
        TriggerClientEvent('esx:setAccountMoney', self.source, account)
        
### StatSetInt()
    - set user status
        StatSetInt("MP0_STAMINA", 100, true)
        StatSetInt("MP0_STRENGTH", 100, true)
        
## server side global functions
### RegisterCommand()
    - register command instruction w/ function to run
    ex:
        RegisterCommand('setadmin', function(source, args, raw)
        
### DropPlayer()
    - server side function
    ex:
        DropPlayer(source, _U('afk_kicked_message'))
        
### PlayerId()
    - gets 'this' player's id (validated from client.lua)
    - PlayerId() == source (on server side event handler)
    ex: 
        local player = PlayerId()
   
## event handlers
### RegisterCommand()
    ex:
        RegisterCommand("anonym", function(source, args, raw)
            local msg = table.concat(args, ' ')
            TriggerClientEvent('chatMessage', -1, "^2Anonymous Message:", { 255, 255, 255 }, msg)
        end, false)

### TriggerServerEvent
    ex:
        TriggerServerEvent('ResetStamina')

### TriggerClientEvent
    ex:
        TriggerClientEvent('esx:removeWeapon', self.source, weaponName, ammo)

### TriggerEvent()
    ex:
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

### RegisterClientEvent
    ex:
        RegisterNetEvent('esx:removeWeapon')

### RegisterServerEvent
    ex:
        RegisterServerEvent('ResetStamina')
        
### AddEventHandler 
    - 'source' param in event handler function seems to be auto-included
    - 'source' == PlayerId()
    ex:
        AddEventHandler('es:playerLoaded', function(source, _player)
            local _source = source
            playerName   = GetPlayerName(_source)
    ex:
        AddEventHandler('es:playerLoaded', function(_player)
            local _source = source
            playerName   = GetPlayerName(_source)
        
    ex: 
        AddEventHandler('es:firstJoinProper', function()
            local Source = source

## mid-air /gps coords
[1557875828 gps][2] CURRENT GPS: {x = -1126.8367919922, y = -1325.073852539, z = 5.2550110816956}

[1557875989 gps][1] CURRENT GPS: {x = -1022.7122192382, y = -1312.993774414, z = 106.58131408692}
[1557876086 gps][2] CURRENT GPS: {x = -171.38845825196, y = -844.44146728516, z = 949.88934326172}

[1557876159 gps][2] CURRENT GPS: {x = -966.74725341796, y = -873.12329101562, z = 1209.9366455078}

[1557876168 gps][1] CURRENT GPS: {x = -1088.7420654296, y = -882.79608154296, z = 955.98266601562}
[1557876171 gps][1] CURRENT GPS: {x = -1091.0366210938, y = -876.01550292968, z = 891.66094970704}

[1557876176 gps][2] CURRENT GPS: {x = -945.14569091796, y = -939.29577636718, z = 722.42193603516}
[1557876180 gps][1] CURRENT GPS: {x = -1066.4953613282, y = -882.7719116211, z = 494.6128540039}
[1557876183 gps][1] CURRENT GPS: {x = -1015.9165039062, y = -848.6752319336, z = 359.12158203125}
[1557876206 gps][2] CURRENT GPS: {x = -574.02899169922, y = -952.97137451172, z = 393.60360717774}

[1557876515 gps][2] CURRENT GPS: {x = -1692.4022216796, y = -1068.1123046875, z = 1517.0888671875}

[1557876549 gps][2] CURRENT GPS: {x = -1408.3129882812, y = -1065.1821289062, z = 958.95379638672}
[1557876585 gps][2] CURRENT GPS: {x = -1270.2337646484, y = -1536.7869873046, z = 705.96697998046}
[1557876618 gps][2] CURRENT GPS: {x = -1316.5837402344, y = -1582.4014892578, z = 558.0853881836}
[1557876638 gps][2] CURRENT GPS: {x = -1252.374633789, y = -1310.0692138672, z = 464.71365356446}
[1557876655 gps][2] CURRENT GPS: {x = -1076.8654785156, y = -1137.6267089844, z = 348.22564697266}
[1557876665 gps][2] CURRENT GPS: {x = -915.49035644532, y = -1056.4127197266, z = 303.63766479492}
[1557876687 gps][2] CURRENT GPS: {x = -591.26379394532, y = -997.51177978516, z = 193.8314819336}
[1557876695 gps][2] CURRENT GPS: {x = -491.26034545898, y = -1010.7461547852, z = 154.91270446778}
[1557876706 gps][2] CURRENT GPS: {x = -340.89874267578, y = -1006.5526123046, z = 101.10076904296}
[1557876713 gps][2] CURRENT GPS: {x = -243.61392211914, y = -1026.8449707032, z = 69.291801452636}

[1557877322 gps][2] CURRENT GPS: {x = -690.22662353516, y = -466.0432434082, z = 977.06341552734}
[1557877336 gps][2] CURRENT GPS: {x = -821.86791992188, y = -309.21719360352, z = 914.15856933594}
[1557877370 gps][2] CURRENT GPS: {x = -888.05041503906, y = 7.0877676010132, z = 756.70556640625}
[1557877395 gps][2] CURRENT GPS: {x = -538.06463623046, y = 82.461128234864, z = 634.75512695312}
[1557877431 gps][2] CURRENT GPS: {x = -56.803043365478, y = 187.81939697266, z = 472.0386352539}
[1557877455 gps][2] CURRENT GPS: {x = 287.53518676758, y = 263.20767211914, z = 355.68991088868}
[1557877494 gps][2] CURRENT GPS: {x = 311.85949707032, y = -190.55319213868, z = 174.23927307128}

[1557877506 gps][2] CURRENT GPS: {x = 144.52592468262, y = -196.65585327148, z = 121.859085083}


