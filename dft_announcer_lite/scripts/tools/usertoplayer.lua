local function UserToClient(input)
    if input == nil then
        return
    end

    local isdedicated = not TheNet:GetServerIsClientHosted()
    local clients = TheNet:GetClientTable()
    local numclients = isdedicated and #clients - 1 or #clients
    if numclients <= 0 then
        return
    end

    -- Match by player listing index first
    local inputidx = tonumber(input)
    if inputidx ~= nil and inputidx > 0 and inputidx <= numclients then
        local index = 1
        for i, client in ipairs(clients) do
            if isdedicated and client.performance ~= nil then
                --skip true dedicated server [Host] client

            elseif index == inputidx then
                return client
            else
                index = index + 1
            end
        end
        --should never get past this loop, but might as well handle it...
    end

    if type(input) ~= "string" then
        return
    end

    -- String matching priority (highest to lowest):
    --  3: userid
    --  2: case-sensitive name
    --  1: case-insensitive name 
    local clientmatch = nil
    local lowerinput = string.lower(input)
    local priority = 0
    for i, client in ipairs(clients) do
        if isdedicated and client.performance ~= nil then
            --skip true dedicated server [Host] client

        --Priority 3: match by userid
        elseif client.userid == input then
            return client

        --Priority 2: match by case-sensitive name
        elseif priority >= 2 then
        elseif client.name == input then
            clientmatch = client
            priority = 2

        --Priority 1: match by case-insensitive name
        elseif priority >= 1 then
        elseif string.lower(client.name) == lowerinput then
            clientmatch = client
            priority = 1
        end
    end
    return clientmatch
end


-- converts a variety of inputs that could be used in usercommands to a valid client id
local function UserToClientID(input)
    local client = UserToClient(input)
    return client ~= nil and client.userid or nil
end

-- converts a variety of inputs that could be used in usercommands to a valid player entity
local function UserToPlayer(input)
    local userid = UserToClientID(input)
    if userid == nil then
        return
    end
    for i, player in ipairs(AllPlayers) do
        if player.userid == userid then
            return player
        end
    end
end

return UserToPlayer