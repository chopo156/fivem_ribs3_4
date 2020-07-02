local drops = {}

Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
        name = 'drop',
        label = _U('drop'),
        slots = 25
    })
end)

MySQL.ready(function()
    if Config.DeleteDropsOnStart then
        MySQL.Async.execute('DELETE FROM disc_inventory WHERE type = \'drop\'')
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(0)
    MySQL.Async.fetchAll('SELECT * FROM disc_inventory WHERE type = \'drop\'', {}, function(results)
        for k, v in pairs(results) do
            drops[v.owner] = json.decode(v.data)
        end
        TriggerClientEvent('disc-inventoryhud:updateDrops', 1, drops)
    end)
end)

AddEventHandler('esx:playerLoaded', function(data)
    Citizen.Wait(5000)
    TriggerClientEvent('disc-inventoryhud:updateDrops', data, drops)
end)

RegisterServerEvent('disc-inventoryhud:modifiedInventory')
AddEventHandler('disc-inventoryhud:modifiedInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('disc-inventoryhud:updateDrops', 1, drops)
    end
end)

RegisterServerEvent('disc-inventoryhud:savedInventory')
AddEventHandler('disc-inventoryhud:savedInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('disc-inventoryhud:updateDrops', 1, drops)
    end
end)

RegisterServerEvent('disc-inventoryhud:createdInventory')
AddEventHandler('disc-inventoryhud:createdInventory', function(identifier, type, data)
    if type == 'drop' then
        drops[identifier] = data
        TriggerClientEvent('disc-inventoryhud:updateDrops', 1, drops)
    end
end)

RegisterServerEvent('disc-inventoryhud:deletedInventory')
AddEventHandler('disc-inventoryhud:deletedInventory', function(identifier, type)
    if type == 'drop' then
        drops[identifier] = nil
        TriggerClientEvent('disc-inventoryhud:updateDrops', 1, drops)
    end
end)
