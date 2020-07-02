Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
        name = 'stash',
        label = _U('stash'),
        slots = 100
    })
end)

Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
        name = 'motel',
        label = _U('motel'),
        slots = 100
    })
end)

Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
        name = 'yatak',
        label = _U('yatak'),
        slots = 100
    })
end)

Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
        name = 'cupboard',
        label = _U('home'),
        slots = 100
    })
end)