local playerKillCooldown = {}

local function givePlayerReward(client)
    for name, count in pairs(Config.ItemRewards) do
        local amount = type(count) == "table" and math.random(count[1], count[2]) or count
        if amount > 0 then
            exports.ox_inventory:AddItem(client, name, amount)
        end
    end
end

RegisterNetEvent("esx:onPlayerDeath", function (data)
    local client = source
    if not data then return end
    if not data.killerServerId or not data.killedByPlayer then return end
    if client == data.killerServerId then return end
    if not Config.ItemRewards or next(Config.ItemRewards) == nil then return end
    if playerKillCooldown[client] then 
        return print("nlmt_killreward: Player kill reward cooldown active for player ID " .. client)
    end

    playerKillCooldown[client] = true

    if Config.DistanceCheck and Config.DistanceCheck.enabled then
        local killedCoords = GetEntityCoords(GetPlayerPed(client))
        local killerCoords = GetEntityCoords(GetPlayerPed(data.killerServerId))
        local distance = #(killedCoords - killerCoords)
        if distance > Config.DistanceCheck.maxDistance then
            return print("nlmt_killreward: Distance check failed for player ID " .. client .. " (Distance: " .. distance .. ")")
        end
    end

    givePlayerReward(data.killerServerId)

    SetTimeout(Config.PlayerKillCooldown, function ()
        if not playerKillCooldown[client] then return end
        playerKillCooldown[client] = nil
    end)
end)

AddEventHandler('playerDropped', function(reason)
    local client = source
    playerKillCooldown[client] = nil
end)