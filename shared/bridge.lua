CURRENT_RESOURCE = GetCurrentResourceName()

local function loadFile(filePath, resourceName)
    local file = LoadResourceFile(resourceName or CURRENT_RESOURCE, filePath)
    local path = string.format('%s%s', resourceName or CURRENT_RESOURCE, filePath)

    if not file then
        warn(string.format("No file was found with path %s", path))
        return
    end

    local func, err = load(file, path)
    if not func or err then
        error(err, 0)
    end

    return func()
end

local function doesExportExist(resource, export)
    return pcall(function()
    return exports[resource][exports]
    end)
end

local ENVIRONMENT <const> = IsDuplicityVersion() and 'server' or 'client'
local FRAMEWORK_EXPORTS <const> = {
    QB = doesExportExist('qb-core', 'GetCoreObject'),
    QBX = ENVIRONMENT == 'client' and doesExportExist('qbx_core', 'GetPlayerData') or doesExportExist('qbx_core', 'GetPlayer')
}

local framework = Config.Framework
if framework == 'auto' then
    if GetResourceState('ox_core') == 'started' then
        framework = 'ox'
    elseif FRAMEWORK_EXPORTS.QBX then
        framework = 'qbox'
    elseif FRAMEWORK_EXPORTS.QB then
        framework = 'qb' 
    elseif FRAMEWORK_EXPORTS.ESX then
        framework = 'esx'
    else
        framework = 'standalone'
    end
end

local inventory = Config.Inventory
if inventory == 'auto' then
    if doesExportExist('ox_inventory', 'Items') then
        inventory = 'ox'
    elseif FRAMEWORK_EXPORTS.QB then
        inventory = 'qb'
    elseif FRAMEWORK_EXPORTS.ESX then
        inventory = 'esx'
    else
        inventory = 'standalone'
    end
end

if ENVIRONMENT == 'client' then
    --     local notification = Config.Notification
    -- if notification == 'auto' then
    --     if doesExportExist('ox_lib', 'notify') then
    --         notification = 'ox'
    --     elseif FRAMEWORK_EXPORTS.QB then
    --         notification = 'qb'
    --     elseif FRAMEWORK_EXPORTS.ESX then
    --         notification = 'esx'
    --     else
    --         notification = 'standalone'
    --     end
    -- end

    -- if notification then
    --     loadFile(string.format('bridge/notification/%s.lua', notification))
    -- end

    local target = Config.Target

    if target then
        loadFile(string.format('bridge/target/%s.lua', target))
    end
end

loadFile(string.format('bridge/framework/%s/%s.lua', framework, ENVIRONMENT))
loadFile(string.format('bridge/inventory/%s/%s.lua', inventory, ENVIRONMENT))