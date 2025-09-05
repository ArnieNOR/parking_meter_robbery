lib.locale()

exports.ox_target:addModel(Config.MeterModels, {
     {
         icon = Config.TargetIcon,
         label = locale('target_label'),
         distance = Config.TargetDistance,
         items = Config.RequiredItem,
         anyItem = true,
         export = 'onInteract',
         serverEvent = 'breakLockpick'
     }
 })