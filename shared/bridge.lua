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

local ENVIRONMENT <const> = IsDuplicityVersion() and 'server' or 'client'

if ENVIRONMENT == 'client' then
    local target = Config.Target

    if target then
        loadFile(string.format('bridge/target/%s.lua', target))
    end
end