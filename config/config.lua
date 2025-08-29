return{

    lib.locale(),

    -- Target
    target = {
        icon = 'fa-solid fa-magnifying-glass', -- https://fontawesome.com/
        label = 'target_label', -- Defined in the locales file.
    },

    -- How far you can target the parking meter.
    targetDistance = 0.7,

    requiredItems = {
        'lockpick'
    },

    -- Police check
    policeCount = 0,

    -- Modelhashes
    meterModels = {
        2108567945,
        -1940238623
    }, 

    -- Progressbar
    progressBar = {
        duration = 2000,
        label = 'progressbar_label'
    },

    -- Payout
    payout = {
        minCash = 25,
        maxCash = 250
    },

    -- Cooldown
    cooldownTime = 20000,

    -- The chance of lockpick breaking
    breakChance = 10,

    -- Animation
    emote = {
        dict = 'anim@gangops@facility@servers@',
        clip = 'hotwire'
    }
}