local log = require('tools/log')

AddSimPostInit(function()
    -- NOT LOADED
    GLOBAL.TheWorld:ListenForEvent("ms_clientdisconnected", function(inst)
        parseAll("disconnected")
        --return
    end)
    GLOBAL.TheWorld:ListenForEvent("ms_clientauthenticationcomplete", function(inst)
        --print("ms_clientauthenticationcomplete")
        parseAll("connected")
    end)
    

    -- NOT LOADED
    GLOBAL.TheWorld:ListenForEvent("ms_playerspawn", function(inst)
        --print("ms_playerspawn")
        --parseAll("spawned")
    end)
    GLOBAL.TheWorld:ListenForEvent("ms_playerdespawn", function(inst)
        -- DROP ITEMS HERE
        return
        --print("ms_playerdespawn")
        --parseAll("despawned")
        
    end)

    -- LOADED
    GLOBAL.TheWorld:ListenForEvent("ms_playerjoined", function(inst)
        --print("ms_playerjoined")
        parseAll("joined")
    end)
    GLOBAL.TheWorld:ListenForEvent("ms_playerleft", function(inst)
        --print("ms_playerleft")
        parseAll("left")
    end)

    --[[
    -- Synonym to ms_playerleft and ms_playerjoined
    GLOBAL.TheWorld:ListenForEvent("playerentered", function(inst)
        print("playerentered")
    end)
    GLOBAL.TheWorld:ListenForEvent("playerexited", function(inst)
        print("playerexited")
    end)
    --]]
    --[[
    -- Doesnt work
    GLOBAL.TheWorld:ListenForEvent("playeractivated", function(inst)
        print("playeractivated")
    end)
    GLOBAL.TheWorld:ListenForEvent("playerdeactivated", function(inst)
        print("playerdeactivated")
    end)
    -- ]]
end)