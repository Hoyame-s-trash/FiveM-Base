if Config.Framework.Active == Framework.ESX then
    local SocietyList = {}

    for k, v in pairs(Config.MiniGameList) do
        SocietyList[v.Society] = {
            Job = v.Society,
            SocietyLabel = v.Society,
            Data = {
                -- knows types: public, private
                type = "private",
            },
        }
    end

    for k, v in pairs(Config.GiftShopLocation) do
        SocietyList[v.Society] = {
            Job = v.Society,
            SocietyLabel = v.Society,
            Data = {
                -- knows types: public, private
                type = "private",
            },
        }
    end

    CreateThread(function()
        local tableAccoun = MySQL.Sync.fetchAll("SELECT * FROM `addon_account`", {})

        for key, value in pairs(SocietyList) do
            local insert = true
            for k, v in pairs(tableAccoun) do
                if v.name == value.Job then
                    insert = false
                    break
                end
            end

            if insert then
                print("^1[======================]")
                for i = 0, 5 do
                    print(string.format("^1[%s][Warning!]^7 Society ^1'%s'^7 has been created in mysql! The server need to be restarted in order the addon account work properly!", GetCurrentResourceName(), value.Job))
                end
                print("^1[======================]")
                MySQL.Sync.execute([[ INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES (@name, @name, '1') ]], {
                    ["@name"] = value.Job,
                })
            end
        end
    end)
    for k, v in pairs(SocietyList) do
        --function(name, label, account, datastore, inventory, data)
        TriggerEvent('esx_society:registerSociety', v.Job, v.SocietyLabel, v.Job, v.Job, v.Job, v.Data)
    end
end

function GiveMoneyToSociety(money, society)
    if Config.Framework.Active == Framework.STANDALONE then
        return true
    end

    if Config.Framework.Active == Framework.QBCORE then
        xpcall(function()
            exports["qb-management"]:AddMoney(society, money)
        end, function(error)
            TriggerEvent("qb-bossmenu:server:addAccountMoney", society, money)
        end)
    end

    if Config.Framework.Active == Framework.ESX then
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            if account then
                account.addMoney(money)
            else
                print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(), society))
            end
        end)
    end
end