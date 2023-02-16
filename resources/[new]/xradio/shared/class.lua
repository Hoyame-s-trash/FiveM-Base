Locales = {}

-- this is for translation
function _U(str, ...)
    if type(Locales) ~= "table" then
        return string.format("[%s] the locales is wrong type, it is not a table..", GetCurrentResourceName())
    end
    if not Locales[Config.Locale] then
        return string.format("[%s] The language does not exists: %s", GetCurrentResourceName(), Config.Locale)
    end
    if not Locales[Config.Locale][str] then
        return string.format("[%s] There isnt such [%s] translation", GetCurrentResourceName(), str)
    end
    return string.format(Locales[Config.Locale][str], ...)
end

-- Will register a key bind for action defined in "fc" argument name
--- @param fc delegate
--- @param uniqid string
--- @param description string
--- @param key string
--- @param device string
function RegisterKey(fc, uniqid, description, key, device)
    RegisterCommand(uniqid, fc, false)
    RegisterKeyMapping(uniqid, description, device or 'keyboard', key)
end