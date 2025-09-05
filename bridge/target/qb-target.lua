lib.locale()

exports['qb-target']:AddTargetModel(Config.MeterModels, {
    options = {
        {
            label = locale('target_label'),
            icon = Config.TargetIcon,
            item = Config.RequiredItem,
            action = function ()
                exports[CURRENT_RESOURCE]:onInteract()
            end
        }
    },
    distance = Config.TargetDistance
})