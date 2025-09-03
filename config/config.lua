Config = {}

lib.locale()

-- Target
-- 'ox_target'
-- 'qb-target'
Config.Target = 'ox_target'

Config.TargetIcon = 'fa-solid fa-magnifying-glass' -- https://fontawesome.com/

-- How far you can target the parking meter.
Config.TargetDistance = 0.7

Config.RequiredItem = 'lockpick'

-- Police check
Config.PoliceCount = 0

-- Modelhashes
Config.MeterModels = {
    2108567945,
    -1940238623
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