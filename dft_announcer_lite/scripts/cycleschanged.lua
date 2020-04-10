local log = require('tools/log')
local UserToPlayer = require('tools/usertoplayer')

function parseAll(category)
        local data = nil
        if GLOBAL.TheWorld.components.worldstate and GLOBAL.TheWorld.components.worldstate.data then 
            data = GLOBAL.TheWorld.components.worldstate.data 
        end

        local players = {}
        for i, v in ipairs(GLOBAL.TheNet:GetClientTable()) do
            if GLOBAL.TheNet:GetServerIsClientHosted() or v.performance == nil then 
                local in_cave = (UserToPlayer(v.userid) == nil)
                table.insert(players, {
                    prefab = v.prefab,
                    age = v.playerage,
                    flags = v.userflags,
                    cave = in_cave,
                    userid = v.userid,
                    name = v.name
                })
                
            end
        end
        
        log({
            category=category,
            day=data.cycles+1,
            remainingdaysinseason=data.remainingdaysinseason,
            season=data.season,
            phase=data.phase,
            moonphase=data.moonphase,
            maxplayers=GLOBAL.TheNet:GetServerMaxPlayers(),
            players=players,
            isCave=not GLOBAL.TheShard:IsMaster()
    
        })
end
local function listeners ()
    GLOBAL.TheWorld:ListenForEvent("cycleschanged", function()
        parseAll("newday")
    end)

    GLOBAL.TheWorld:ListenForEvent("phasechanged", function(src, phase)
        if GetModConfigData("debug") then 
            _G.TheNet:Announce(phase)
        end
        log({
            category="newphase",
            phase=phase,
        })
    end)
end

AddSimPostInit(listeners)