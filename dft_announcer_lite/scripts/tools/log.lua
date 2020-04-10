local json = require('tools/json')

local function parsePlayer( player ) 
    return {
        name = player:GetDisplayName(),
        guid = player.guid,
        userid = player.userid,
        prefab = player.prefab,
    }
end
local function parseObject( object )
    local owner = {} 
    if object.dfta_owner then 
        owner = parsePlayer(object.dfta_owner)
    end
    return {
        name = object:GetDisplayName(),
        guid = object.guid,
        userid = object.userid,
        prefab = object.prefab,
        owner = owner,
        burnt = object:HasTag("burnt"),
    }
end 

local function parseFood( food, player )
    return {
        name = food:GetDisplayName(),
        prefab = food.prefab,
        val_health = food.components.edible.healthvalue * player.components.eater.healthabsorption,
        val_sanity = food.components.edible.sanityvalue * player.components.eater.hungerabsorption,
        val_hunger = food.components.edible.hungervalue * player.components.eater.sanityabsorption,        
    }, {
        name = player:GetDisplayName(),
        guid = player.guid,
        userid = player.userid,
        prefab = player.prefab,
        stats = {
            maxhealth = player.components.health.maxhealth,
            maxsanity = player.components.sanity.max,
            maxhunger = player.components.hunger.max,
            maxhealth_penalty = player.components.health.penalty,
            maxsanity_penalty = player.components.sanity.penalty,
            health = player.components.health.currenthealth,
            sanity = player.components.sanity.current,
            hunger = player.components.hunger.current,
            invincible = player.components.health.invincible,
        }
    }

end

return function ( result )
    
    
    if result.near and result.near.structures then 
        local structures = {}
        for k,v in ipairs(result.near.structures) do
            if v ~= result.object then 
                table.insert(structures, parseObject(v))    
            end
        end
        result.near.structures = structures
    end
    
    -- needs to be food before player
    if result.food and result.player then 
        local food, player = parseFood(result.food, result.player)
        result.food, result.player = food, player
    elseif result.player then 
        local player = parsePlayer(result.player)
        result.player = player
    end
    if result.object then
        local object = parseObject(result.object)
        result.object = object
    end
    if result.feeder then 
        local feeder = parsePlayer(result.feeder)
        result.feeder = feeder
    end
    print('[DFTA] ' .. json.encode(result))
end
  

