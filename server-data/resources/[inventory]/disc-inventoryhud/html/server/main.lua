ESX = nil
InvType = {
    ['unknown'] = { slots = 1, label = 'Unknown' },
}

RegisterServerEvent('disc-inventoryhud:RegisterInventory')
AddEventHandler('disc-inventoryhud:RegisterInventory', function(inventory)
    if inventory.name == nil then
        print('Requires inv name')
        return
    end

    if inventory.slots == nil then
        inventory.slots = 4
    end

    if inventory.getInventory == nil then
        print('Registering Default getInventory')
        inventory.getInventory = function(identifier, cb)
            getInventory(identifier, inventory.name, cb)
        end
    end

    if inventory.applyToInventory == nil then
        print('Registering Default applyToInventory')
        inventory.applyToInventory = function(identifier, f)
            applyToInventory(identifier, inventory.name, f)
        end
    end

    if inventory.saveInventory == nil then
        print('Registering Default saveInventory')
        inventory.saveInventory = function(identifier, toSave)
            if table.length(toSave) > 0 then
                saveInventory(identifier, inventory.name, toSave)
            else
                deleteInventory(identifier, inventory.name)
            end
        end
    end

    if inventory.getDisplayInventory == nil then
        print('Registering Default getDisplayInventory')
        inventory.getDisplayInventory = function(identifier, cb, source)
            getDisplayInventory(identifier, inventory.name, cb, source)
        end
    end

    InvType[inventory.name] = inventory
    loadedInventories[inventory.name] = {}
end)

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)


ESX.RegisterServerCallback('disc-inventoryhud:doesInvTypeExists', function(source, cb, type)
    cb(InvType[type] ~= nil)
end)


RegisterCommand('ensureInv', function(source)
    local owner = ESX.GetPlayerFromId(source).identifier
    MySQL.Async.fetchAll('DELETE FROM disc_inventory WHERE data = @data AND owner = @owner', { ['@data'] = "null", ['@owner'] = owner })  -- Tgiann "Null" Fix
    ensureInventories(source)
end)

function ensureInventories(source)
    local player = ESX.GetPlayerFromId(source)
    ensurePlayerInventory(player)
    TriggerClientEvent('disc-inventoryhud:refreshInventory', source)
end

--RegisterCommand('test', function(source, args, raw)
--    local str = 'x123y123z123'
--    print(getCoordsFromOwner(str))
--end)

AddEventHandler('esx:playerLoaded', function(data)
    local xPlayer = ESX.GetPlayerFromId(data)
    loadInventory(xPlayer.identifier, 'player', function()
    end)
    Citizen.Wait(1000)
    local dbInventory = MySQL.Sync.fetchAll('SELECT * FROM disc_inventory WHERE type = @type AND owner = @owner', {
        ['@type'] = 'player',
        ['@owner'] = xPlayer.identifier
    })

    if dbInventory[1] ~= nil then
        for k,v in pairs(xPlayer.getInventory()) do 
            if v['count'] > 0 then 
                for key, value in pairs(json.decode(dbInventory[1].data)) do 
                    if v['name'] == value['name'] then
                        print('v : ' .. v['name'] .. '-' .. v['count'] .. ' -- value: ' .. value['name'] .. ' - ' .. value['count'])   
                        if v['count'] ~= value['count'] then
                            TriggerEvent('disc-inventoryhud:rconLogEnsureInv', xPlayer.source)
                            TriggerEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Creating inventory...' })
                            break
                        end
                    end
                end
            end
        end
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        saveInventories()
    end
end)

AddEventHandler('esx:playerLoaded', function(data)
    local player = ESX.GetPlayerFromId(data)
    loadInventory(player.identifier, 'player', function()
    end)
end)

AddEventHandler('esx:playerDropped', function(source)
    local player = ESX.GetPlayerFromId(source)
    saveInventory(player.identifier, 'player')
    closeAllOpenInventoriesForSource(source)
end)

ESX.RegisterServerCallback('GetCharacterNameServer', function(source, cb, target)
    local xTarget = ESX.GetPlayerFromId(target)

    local result = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
        ['@identifier'] = xTarget.identifier
    })

    local firstname = result[1].firstname
    local lastname  = result[1].lastname

    cb(''.. firstname .. ' ' .. lastname ..'')
end)





