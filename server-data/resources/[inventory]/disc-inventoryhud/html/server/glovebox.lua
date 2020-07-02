Citizen.CreateThread(function()
    TriggerEvent('disc-inventoryhud:RegisterInventory', {
        name = 'glovebox',
        label = _U('glove'),
        slots = 20
    })
end)
