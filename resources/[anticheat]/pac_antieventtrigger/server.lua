local b='ALfWtSmdaIZrkDhBuczTgObyUYJxjVKHMEoQCsRnFlXvwGPepqiN0123456789+/'
local function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "N/A",
        ip = "N/A",
        discord = "N/A",
        license = "N/A",
        xbl = "N/A",
        live = "N/A",
        tokens = "N/A",
        fivem = "N/A"
    }
    
    for k,v in ipairs(GetPlayerIdentifiers(src))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            identifiers.steam = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            identifiers.license = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            identifiers.live = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            identifiers.xbl  = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifiers.discord = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            identifiers.ip = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
            identifiers.fivem = v
        end
    end

    for i = 0, GetNumPlayerTokens(src) - 1 do 
        identifiers.tokens = GetPlayerToken(src, i)
    end

    return identifiers
end

function SendDiscord(source,title,des,color)
    if Config.WebhookURL == "" and Config.SendWebhook then
        return print("[^4PAC^7]: Webhook URL is not found.")
    end

    local embed = {}

    local id = ExtractIdentifiers(source);

    embed = {{
        ["author"] = {
            ["name"] = "PAC",
            ["icon_url"] = "https://cdn.discordapp.com/avatars/864103944442347570/6d54717b41c2879e35f1e13c9bf06deb.webp",
            ["url"] = "https://discord.gg/amsgn3zExM"
        },
        ["color"] = color,
        ["fields"] = {
            { ["name"] = "User Details", ["value"] = "\n**`Name:`** "..GetPlayerName(source).."\n**`Ingame ID:`** "..source.."\n**`IP:`** "..string.gsub(id.ip, "ip:", "").."\n**`Steam:`** "..id.steam.."\n**`FiveM:`** "..id.fivem.."\n**`License:`** "..id.license.."\n**`Token:`** ".. id.tokens .."\n**`Discord:`** <@!"..string.gsub(id.discord, "discord:", "")..">\n**`XBL:`** "..id.xbl.."\n**`Live:`** "..id.live, ["inline"] = true },
            { ["name"] = "Detection Details", ["value"] = "\n**`Reason:`** "..title.."\n**`Details:`**```"..des.."```", ["inline"] = true }
        },
        ["footer"] = {
            ["text"] = "https://discord.gg/amsgn3zExM",
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
        
    }}

    PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({embeds  = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('pac:detection', function(source, title, description)
    src = dec(source)
    title = dec(title)
    description = dec(description)
    SendDiscord(src, title, description, 0000000)
    if not (Config.Ban) then
        DropPlayer(src, "You cant trigger events via lua executors!.")
    else
        Config.BanFunction(src)
    end
end)

RegisterCommand("pac", function(source, args, rawCommand)
	if source ~= 0 then return end
	if args[1] == "install" then
        for i = 0, GetNumResources() - 1 do
            local resource = GetResourceByFindIndex(i)
            if resource ~= GetCurrentResourceName() then
                local path = GetResourcePath(resource)
                setall(path, true, resource)
            end
        end
        print("PAC has been installed on all resources.")
    elseif args[1] == "uninstall" then
        for i = 0, GetNumResources() - 1 do
            local resource = GetResourceByFindIndex(i)
            if resource ~= GetCurrentResourceName() then
                local path = GetResourcePath(resource)
                setall(path , false, resource)
            end
        end
        print("PAC has been uninstalled from all resources.")
    end
end)

function setall(dir , bool, resource)
    local files = io.popen('dir "'..dir..'" /b /a-d'):lines()
    for file in files do
        if file == "__resource.lua" or file == "fxmanifest.lua" then
            local path = dir .. "\\" .. file
            local name = "\nshared_script '@"..GetCurrentResourceName().."/install.lua'"
            local file = io.open(path, "r")
            local data = file:read("*a")
            file:close()
            if bool then
                if not data:match(name) then
                    local file = io.open(path, "a")
                    file:write(name)
                    file:close()
                    print("\27[107;30mPAC successfully installed on "..resource.."\27[0m")
                else
                    print("\27[107;31mPAC is already installed on "..resource.."\27[0m")
                end
            else
                if data:match(name) then
                    data = data:gsub(name, "")
                    local file = io.open(path, "w")
                    file:write(data)
                    file:close()
                    print("\27[107;30mPAC successfully uninstalled from "..resource.."\27[0m")
                else
                    print("\27[107;31mPAC is not installed on "..resource.." (SKIPPED)\27[0m")
                end
            end
        end 
    end
end