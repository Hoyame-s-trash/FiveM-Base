GM.Admin = GM.Admin or {}
GM.Admin.Ranks = {}
GM.Admin.Ranks["list"] = {}
GM.Admin.Ranks["players"] = {}
GM.Admin.Ranks["rank_user"] = 0

function GM.Admin.Ranks:new(id, name, players, commands, permissions)
    local newAdminRanks = {}

    setmetatable(newAdminRanks, self)
    self.__index = self

    if (GM.Admin.Ranks["list"][id] ~= nil) then return end

    newAdminRanks.id = id

    newAdminRanks.name = name
    newAdminRanks.players = players
    newAdminRanks.commands = commands
    newAdminRanks.permissions = permissions

    for playerIdentifier, playerValues in pairs(newAdminRanks.players) do
        if (not GM.Admin.Ranks["players"][playerIdentifier]) then
            GM.Admin.Ranks["players"][playerIdentifier] = {}
        end
        GM.Admin.Ranks["players"][playerIdentifier] = {
            rankId = newAdminRanks.id,
            name = newAdminRanks.name,
            reports = playerValues.reports
        }
    end

    if (newAdminRanks.name == "user") then
        GM.Admin.Ranks["rank_user"] = newAdminRanks.id
    end

    GM.Admin.Ranks["list"][newAdminRanks.id] = newAdminRanks

    print("Admin rank created: " .. newAdminRanks.name .. " (" .. newAdminRanks.id .. ")")

    return newAdminRanks
end

function GM.Admin.Ranks:getFromId(rankId)
    return GM.Admin.Ranks["list"][rankId]
end

function GM.Admin.Ranks:getFromName(rankName)
    for rankId, rankValues in pairs(GM.Admin.Ranks["list"]) do
        if (rankValues.name == rankName) then
            return rankValues
        end
    end
end

function GM.Admin.Ranks:getCommandValue(commandName, playerSrc)
    if (not self.commands[commandName]) then
        if (not GM.Command.List[commandName]) then return end
        self.commands[commandName] = GM.Command.List[commandName]
        MySQL.update('UPDATE user_admin SET commands = ? WHERE id = ?', {
            json.encode(self.commands), 
            self.id
        }, function()
            for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", self.id, self)
            end
        end)
    end
    if (self.commands[commandName].value == nil) then
        self.commands[commandName].value = false
    end
    if (self.commands[commandName].value == false) then
        if (playerSrc) then
            TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous n'avez pas la permission d'utiliser la commande /"..commandName..".")
        end
        return false
    end
    return true
end

function GM.Admin.Ranks:getPermissionsValue(permissionName, playerSrc)
    if (not self.permissions[permissionName]) then

        if (not GM.Admin.Permissions[permissionName]) then
            print("Permission not found: " .. permissionName)
            return true
        end

        self.permissions[permissionName] = GM.Admin.Permissions[permissionName]

        MySQL.update('UPDATE user_admin SET permissions = ? WHERE id = ?', {
            json.encode(self.permissions), 
            self.id
        }, function()
            for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", self.id, self)
            end
        end)
    end
    if (self.permissions[permissionName].value == false) then
        if (self.name == "founder") then
            self.permissions[permissionName].value = true
            MySQL.update('UPDATE user_admin SET permissions = ? WHERE id = ?', {
                json.encode(self.permissions), 
                self.id
            }, function()
                for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                    TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", self.id, self)
                end
            end)
            return true
        end
        if (playerSrc) then
            TriggerClientEvent("esx:showNotification", playerSrc, self.permissions[permissionName].error)
        end
        return false
    end
    return true
end

GM:newThread(function()
    loadAllRanks = false
    MySQL.query("SELECT * FROM user_admin", {}, function(results)
        if (results[1]) then
            for _, rankValues in pairs(results) do
                GM.Admin.Ranks:new(rankValues.id, rankValues.name, json.decode(rankValues.players), json.decode(rankValues.commands), json.decode(rankValues.permissions))
            end
            loadAllRanks = true
        end
    end)
end)

function GM.Admin.Ranks:actualizeCommands()
    for allCommandName, allCommandValues in pairs(GM.Command.List) do
        if (not self.commands[allCommandName]) then
            self.commands[allCommandName] = allCommandValues
            MySQL.update('UPDATE user_admin SET commands = ? WHERE id = ?', {
                json.encode(self.commands), 
                self.id
            }, function()
                for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                    TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", self.id, self)
                end
            end)
        end
    end
    for commandName, _ in pairs(self.commands) do
        if (not GM.Command.List[commandName]) then
            self.commands[commandName] = nil
            MySQL.update('UPDATE user_admin SET commands = ? WHERE id = ?', {
                json.encode(self.commands), 
                self.id
            }, function()
                for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                    TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", self.id, self)
                end
            end)
        end
    end
end

function GM.Admin.Ranks:actualizePermissions()
    for allPermissionName, allPermissionValues in pairs(GM.Admin.Permissions) do
        if (not self.permissions[allPermissionName]) then
            self.permissions[allPermissionName] = allPermissionValues
            MySQL.update('UPDATE user_admin SET permissions = ? WHERE id = ?', {
                json.encode(self.permissions), 
                self.id
            }, function()
                for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                    TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", self.id, self)
                end
            end)
        end
    end
    for permissionName, _ in pairs(self.permissions) do
        if (not GM.Admin.Permissions[permissionName]) then
            self.permissions[permissionName] = nil
            MySQL.update('UPDATE user_admin SET permissions = ? WHERE id = ?', {
                json.encode(self.permissions), 
                self.id
            }, function()
                for adminSrc,_ in pairs(GM.Admin.inAdmin) do
                    TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", self.id, self)
                end
            end)
        end
    end
end

GM:newThread(function()
    while (not loadAllRanks) do
        Wait(50)
    end
    print("Admin: Ranks loaded !")
    for rankId, _ in pairs(GM.Admin.Ranks["list"]) do
        local selectedRank = GM.Admin.Ranks:getFromId(rankId)
        selectedRank:actualizeCommands()
        selectedRank:actualizePermissions()
    end
end)

RegisterServerEvent("Admin:requestRanks", function()
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    TriggerClientEvent("Admin:updateValue", playerSrc, "ranks", GM.Admin.Ranks["list"])
end)

RegisterServerEvent("Admin:createRank", function(rankName)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("CREATE_RANKS", playerSelected.source)) then return end

    if (GM.Admin.Ranks:getFromName(rankName) ~= nil) then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Un rank existe déjà avec ce nom.")
        return
    end

    if (rankName == nil or rankName == "") then
        TriggerClientEvent("esx:showNotification", playerSrc, "~r~Vous devez entrer un nom de rank valide.")
        return
    end

    for commandName, commandValues in pairs(GM.Command.List) do
        GM.Command.List[commandName].value = false
    end

    print("debug admin 1")

    MySQL.insert('INSERT INTO user_admin (name, players, commands, permissions) VALUES (?, ?, ?, ?)', {
        rankName,
        json.encode({}),
        json.encode(GM.Command.List),
        json.encode(GM.Admin.Permissions)
    }, function(rankId)
        local newRank = GM.Admin.Ranks:new(rankId, rankName, {}, GM.Command.List, {})
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, newRank)
        end
    end)
end)

RegisterServerEvent("Admin:deleteRank", function(rankId, input)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("DELETE_RANKS", playerSelected.source)) then return end

    -- Todo check if rank exist 

    if (GM.Admin.Ranks["list"][rankId] == nil) then return end

    MySQL.Async.execute("DELETE FROM user_admin WHERE id = ?", {
        rankId
    }, function()
        GM.Admin.Ranks["list"][rankId] = nil
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", GM.Admin.Ranks["list"])
        end
        -- Todo refresh for all admin present in the current rank and refresh
    end)
end)

RegisterServerEvent("Admin:recruitPlayerRank", function(rankId, input)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("RECRUIT_PLAYER_RANKS", playerSelected.source)) then return end

    -- Todo check if rank exist 

    -- Todo check if input is license

    local selectedRank = GM.Admin.Ranks:getFromId(rankId)
    if (not selectedRank) then return end

    local targetSelected = ESX.GetPlayerFromId(tonumber(input))
    if (not targetSelected) then return end

    local targetIdentifier = targetSelected.getIdentifier()
    if (not targetIdentifier) then return end

    -- Todo check if player is already in rank

    if (GM.Admin.Ranks["players"][targetIdentifier]) then
        print("Player already in rank")
        return
    end

    selectedRank.players[targetIdentifier] = {
        name = targetSelected.getName(),
        arrival_date = os.date("%d-%m-%Y %H:%M:%S"),
        reports = 0
    }

    MySQL.update('UPDATE user_admin SET players = ? WHERE id = ?', {
        json.encode(selectedRank.players), 
        selectedRank.id
    }, function()
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, selectedRank)
        end
    end)
end)

RegisterServerEvent("Admin:updateRankCommands", function(rankId, commandName, commandValue)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("UPDATE_RANK_COMMANDS", playerSelected.source)) then return end

    local selectedRank = GM.Admin.Ranks:getFromId(rankId)
    if (not selectedRank) then return end

    -- if (selectedRank.name == "founder") then
    --     print("You can't change founder rank")
    --     return
    -- end

    selectedRank.commands[commandName].value = commandValue

    MySQL.update('UPDATE user_admin SET commands = ? WHERE id = ?', {
        json.encode(selectedRank.commands), 
        selectedRank.id
    }, function()
        playerSelected.showNotification("~b~Vous avez mis à jour la permission pour la commande /"..commandName.." pour le grade "..selectedRank.name)
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, selectedRank)
        end
    end)
end)

RegisterServerEvent("Admin:updateRankPermissions", function(rankId, permissionName, permissionValue)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("UPDATE_RANK_PERMISSIONS", playerSelected.source)) then return end

    local selectedRank = GM.Admin.Ranks:getFromId(rankId)
    if (not selectedRank) then return end

    -- if (selectedRank.name == "founder") then
    --     print("You can't change founder rank")
    --     return
    -- end

    selectedRank.permissions[permissionName].value = permissionValue

    MySQL.update('UPDATE user_admin SET permissions = ? WHERE id = ?', {
        json.encode(selectedRank.permissions), 
        selectedRank.id
    }, function()
        TriggerClientEvent("esx:showNotification", playerSrc, "~b~Vous avez mis à jour les permissions du grade "..permissionName..".")

        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, selectedRank)
        end
    end)
end)

RegisterServerEvent("Admin:kickPlayerRank", function(rankId, playerIdentifier)
    local playerSrc = source
    if (not playerSrc) then return end

    local playerSelected = ESX.GetPlayerFromId(playerSrc)
    if (not playerSelected) then return end

    if (playerSelected.getGroup() == "user") then return end

    local selectedRank = GM.Admin.Ranks:getFromId(playerSelected.get("rank_id"))
    if (not selectedRank) then return end

    if (not selectedRank:getPermissionsValue("KICK_PLAYER_RANKS", playerSelected.source)) then return end

    local selectedRank = GM.Admin.Ranks:getFromId(rankId)
    if (not selectedRank) then return end

    local selectedPlayer = GM.Player:getFromIdentifier(playerIdentifier)

    if (not selectedRank.players[playerIdentifier]) then
        print("Player not in rank")
        return
    end

    selectedRank.players[playerIdentifier] = nil
    GM.Admin.Ranks["players"][playerIdentifier] = nil

    MySQL.update('UPDATE user_admin SET players = ? WHERE id = ?', {
        json.encode(selectedRank.players), 
        selectedRank.id
    }, function()
        if (selectedPlayer) then
            selectedPlayer:setMetadata("rank_id", GM.Admin.Ranks["rank_user"])
            selectedPlayer:setMetadata("rank", "user")
        end
        for adminSrc,_ in pairs(GM.Admin.inAdmin) do
            TriggerClientEvent("Admin:updateValue", adminSrc, "ranks", rankId, selectedRank)
        end
    end)
end)