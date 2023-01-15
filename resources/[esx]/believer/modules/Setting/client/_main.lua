GM.Setting = GM.Setting or {}

GM.Setting.localStorage = {}

function GM.Setting:loadSetting(name)
    if (not name) then return end

    local ressourceKvp = GetResourceKvpString("believer_settings_"..name)

    return ressourceKvp and json.decode(ressourceKvp) or 0
end

function GM.Setting:loadStorage(name)
    if not self.localStorage[name] then
        self.localStorage[name] = self.localStorage[name] or 0
    end
    return self.localStorage[name]
end

function GM.Setting:save(name, value)
    self.localStorage[name] = value

    SetResourceKvp("believer_settings_"..name, json.encode(self.localStorage[name]))
end

GM:newThread(function()
    local temp = {}

    for _, name in pairs(GM.Setting.defaultStorage) do
        local actualSetting = GM.Setting:loadSetting(name)
        temp[name] = actualSetting
    end
    GM.Setting.localStorage = temp
end)