# Commands
## in-game commands (parameterized)
### > addwl [ hex | dec ] [streamId]
    - ex: /addwl dec 12345678901234567
    
### > setjob [playerId] [jobName] [jobGrade]
    - ex: /setjob 21 mechanic 3
    
### > start [resourceName]
    - ex: /start esx_whitelistEnhanced
    
### > stop [resourceName]
    - ex: /stop esx_whitelistEnhanced
    
### > restart [resourceName]
    - ex: /restart esx_whitelistEnhanced

### > jail [playerId] [jailTimeMin]
    - ex: /jail 21 60
    
### > setjob [dynamic-in-game-id] [jobstring] [job-grade]
    - ex: /setjob 1 police 4
    
### revive [player-id]
    - ex: /revive 1
    
### car [car model] | cardel
    - ex: /car police | police2 | police3 | policet | policeb | police cruiser
    - ex: /car fbi | fbi2
    - ex: /car ambulance | ambulance van
    - ex: /car buzzard | buzzard2 | seasparrow | polmav / maverick
    - ex: /car 1200rt (BMWpolicebike) | srt8police [pc1] | 2015polstang (pc2) | srt8police (pc3 - duplicate?)
    - ex: /car sfbc1 | sfbc2 | sfbc3 | sfbc4 | sfbc5 |sfum1 | sfum2 | sftsu (pp1)
    - ex: /car titan | cargoplane 
    - ex: /car rhino | ruiner2 | thruster
    - ex: /car deluxo
    - ex: /cardel
    - models listed:
        .../server-data/resources/[esx]/esx_policejob/config.lua
        .../serverstsst-data/resources/[esx]/esx_ambulancejob/config.lua
        

## spawning ref: https://wiki.gtanet.work/index.php?title=Peds
    - hookers: /spawnped 42647445
    - whales: /spawnped -1920284487
    - dogs (small): /spawnped -1384627013
## in-game commands (non-parameterized)
### revive yourself
    > /revive

### get current gps position
    > /getpos
    
### remove car
    > /cardel

### show car details
    > /carshow

## server CLI commands
### > add_principal indentifier.steam:[hex] group.[superadmin|admin]
    - ex: > add_principal indentifier.steam:<hex> group.superadmin


## in-game hot keys
    f12 = screenshot
    f10 = scoreboard
    f9 = <unknown>
    f8 = opens running/live CLI output
    f7 = alternate job menu? ('invoices/fines' for police)
    f6 = job menu
    f5 = <unknown>
    f4 = <unknown>
    f3 = walking style menu
    f2 = inventory
    f1 = phone
    home = admin menu
        - bringto, goto
    f10 = scoreboard
    f = vehicle enter/steal/exit
    e = action menu (inside colored action sphere)
    v = change view
    #pad = air vehicle pitch/yaw 
    x = put your hands up (for arrest)
    q = get down (under fire)
    h = unlock car door
    
## in-game common emotes (hit 't' + [type])
    - sit down: /e groundsit
    - lay down: /e bum
    - kneel: /e kneel
    - shrug shoulders: /e shrug
    - wall spy: /e wallspy
    - dance: /e ohsnap | ohsnap2 | disco | disco2
    - play dead: /e dead
    - do situps: /e situps
    - do pushup: /e pushups
    - do yoga: /e yoga
    - do cheer: /e cheer
    - shake head no: /e no
    - strip tease: /e st1 | st2
    - wall lean: /e leanwall | lean

# misc web refs
## github
    - https://github.com/ESX-PUBLIC
    - https://github.com/FiveM-Scripts
    - https://github.com/topics/fivem
    
## relevent
    - https://billing.low.ms/knowledgebase.php?action=displayarticle&id=24
    - http://rebelmafiagaming.com/forums/index.php?/topic/236-esx-8162018-current-server-commands/
    - https://www.unknowncheats.me/forum/fivem/290558-esx-triggerserverevent.html

## other
    - https://www.cfd-online.com/Forums/cfx/171576-working-cfx-command-line.html
    - https://pastebin.com/QuDYpGHz
    - https://sourceforge.net/projects/gtavnonsteamlauncher/
    - https://www.gta5-mods.com/tools/verify-game-files-without-steam
    - https://github.com/SaltyGrandpa/esx_nocarjack
    - https://github.com/SaltyGrandpa/FiveM-PlayerTrust

