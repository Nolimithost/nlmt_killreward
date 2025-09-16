Config = {}

Config.PlayerKillCooldown = 2500 -- in milliseconds
Config.DistanceCheck = {
    -- Enabling this creates a distance check between killer and killed player
    -- This can also create performance issues on high population servers
    enabled = false,
    maxDistance = 100.0
}

Config.ItemRewards = {
    ["money"] = 500,
    -- ["WEAPON_KNIFE"] = {1,2} -- gives between 1 and 2 knives
}