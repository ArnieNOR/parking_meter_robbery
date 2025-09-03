 exports.ox_target:addModel(Config.MeterModels, {
     {
         icon = Config.TargetIcon,
         label = "temp",
         distance = Config.TargetDistance,
         items = Config.RequiredItem,
         anyItem = true,
         export = 'onInteract',
         serverEvent = 'breakLockpick'
     }
 })