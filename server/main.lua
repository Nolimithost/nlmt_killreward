local playerKillCooldown = {}

local function givePlayerReward(client)
    for name, count in pairs(Config.ItemRewards) do
        local amount = type(count) == "table" and math.random(count[1], count[2]) or count
        if amount > 0 then
            exports.ox_inventory:AddItem(client, name, amount)
        end
    end
end

local function handlePlayerDeath(killed, killer)
    if not Config.ItemRewards or next(Config.ItemRewards) == nil then return end
    if Config.PlayerKillCooldown then
        if playerKillCooldown[killed] then 
            return print("nlmt_killreward: Player kill reward cooldown active for player ID " .. killed)
        end

        playerKillCooldown[killed] = true

        SetTimeout(Config.PlayerKillCooldown, function ()
            if not playerKillCooldown[killed] then return end
            playerKillCooldown[killed] = nil
        end)
    end

    if Config.DistanceCheck and Config.DistanceCheck.enabled then
        local killedCoords = GetEntityCoords(GetPlayerPed(killed))
        local killerCoords = GetEntityCoords(GetPlayerPed(killer))
        local distance = #(killedCoords - killerCoords)
        if distance > Config.DistanceCheck.maxDistance then
            return print("nlmt_killreward: Distance check failed for player ID " .. killed .. " (Distance: " .. distance .. ")")
        end
    end

    givePlayerReward(killer)
end

AddEventHandler('playerDropped', function(reason)
    local client = source
    playerKillCooldown[client] = nil
end)

if Config.KillerHandler == "ESX" then
    RegisterNetEvent("esx:onPlayerDeath", function (data)
        local client = source
        if not data then return end
        if not data.killerServerId or not data.killedByPlayer then return end
        if client == data.killerServerId then return end

        handlePlayerDeath(client, data.killerServerId)
    end)
elseif Config.KillerHandler == "txAdmin" then
    RegisterNetEvent("txsv:logger:deathEvent", function (killer)
        local client = source
        if not killer or killer == 0 then return end
        if client == killer then return end
        handlePlayerDeath(client, killer)
    end)
end