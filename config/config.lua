Config = {}

lib.locale()

-- Supported Frameworks
-- 'qb-core'
-- 'ox_core'
-- 'qbx_core' (not supported yet)
-- 'standalone'
Config.Framework = 'standalone'

-- Supported Targets
-- 'ox_target'
-- 'qb-target'
Config.Target = 'ox_target'

-- Supported Inventories
-- 'ox'
-- 'qb'
Config.Inventory = 'ox'

-- The icon that shows when you target
Config.TargetIcon = 'fa-solid fa-magnifying-glass' -- https://fontawesome.com/

-- How far you can target
Config.TargetDistance = 0.7

-- Usable items
Config.RequiredItem = {
    'lockpick',
    'advancedlockpick'
}

-- Police check (Not used for now)
Config.PoliceCount = 0

-- Modelhashes (Not used, but added just in case)
Config.MeterModelHashes = {
    2108567945,
    -1940238623,
}

-- Models
Config.MeterModels = {
    'prop_parknmeter_01',
    'prop_parknmeter_02'
}

-- Progressbar
Config.ProgressBar = {
    duration = 2000,
    label = 'progressbar_label'
}

-- Payout
Config.Payout = {
    minCash = 25,
    maxCash = 250
}

-- Cooldown
Config.CooldownTime = 20000

-- The chance of lockpick breaking
Config.BreakChance = 10

-- Animation
Config.Emote = {
    dict = 'anim@gangops@facility@servers@',
    clip = 'hotwire'
}