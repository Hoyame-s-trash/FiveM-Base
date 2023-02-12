GM.Logs = GM.Logs or {}

GM.Logs["List"] = {
	["screenshot"] = "https://ptb.discord.com/api/webhooks/1056204603085037600/C32ykE2p7S8Qa_Tzp-P8EtkktcF-lHWcqY1PZS9xTpPDO5jACpL-cayYTXIdpPS7NSh-",
}

function GM.Logs:GetIdentifier(source, type)
    local identifier = GetPlayerIdentifiers(source)
    for k, v in pairs(identifier) do
        if string.sub(v, 1, string.len(type)) == type then
            return tostring(v)
        end
    end
    return (type .. "unknownlicense")
end

function GM.Logs:ConstructScreenshotEmbed(source, fileName)
	local embed = {}

    embed = {{
        ["author"] = {
            ["name"] = "EasyTrust",
            ["icon_url"] = "https://media.discordapp.net/attachments/1028726669554499644/1074365864343785624/easytrust.png",
            ["url"] = "https://discord.gg/bluestark"
        },
        ["color"] = 3447003,
        ["fields"] = {
            { ["name"] = "Détails du joueur", ["value"] = "\n**`Nom:`** "..GetPlayerName(source).."\n**`Ingame ID:`** "..source.."\n**`Steam:`** "..self:GetIdentifier(source, "steam:").."\n**`FiveM:`** "..self:GetIdentifier(source, "fivem:").."\n**`License:`** "..self:GetIdentifier(source, "license:").."\n**`Discord:`** <@!"..string.gsub(self:GetIdentifier(source, "discord:"), "discord:", "")..">", ["inline"] = true },
        },
		["image"] = {
            ["url"] = "attachment://" .. fileName
        },
        ["footer"] = {
            ["text"] = os.date("%d/%m/%Y %H:%M:%S"),
			["icon_url"] = "https://media.discordapp.net/attachments/1028726669554499644/1074365864343785624/easytrust.png"
        }
    }}

	return embed
end

function GM.Logs:ConstructEmbed(source, title, description)
	local embed = {}

    embed = {{
        ["author"] = {
            ["name"] = "EasyTrust",
            ["icon_url"] = "https://media.discordapp.net/attachments/1028726669554499644/1074365864343785624/easytrust.png",
            ["url"] = "https://discord.gg/bluestark"
        },
        ["color"] = 3447003,
        ["fields"] = {
            { ["name"] = "Détails du joueur", ["value"] = "\n**`Nom:`** "..GetPlayerName(source).."\n**`Ingame ID:`** "..source.."\n**`Steam:`** "..self:GetIdentifier(source, "steam:").."\n**`FiveM:`** "..self:GetIdentifier(source, "fivem:").."\n**`License:`** "..self:GetIdentifier(source, "license:").."\n**`Discord:`** <@!"..string.gsub(self:GetIdentifier(source, "discord:"), "discord:", "")..">", ["inline"] = true },
			{ ["name"] = "Détails du log", ["value"] = "\n**`Raison:`** "..title.."\n**`Détails:`**```"..description.."```", ["inline"] = true }
		},
        ["footer"] = {
            ["text"] = os.date("%d/%m/%Y %H:%M:%S"),
			["icon_url"] = "https://media.discordapp.net/attachments/1028726669554499644/1074365864343785624/easytrust.png"
        }
    }}

	return embed
end

function GM.Logs:sendLogs(logName, source, title, description)
	if (GM.Logs["List"][logName] == nil) then
		print("Log name ("..logName..") not found")
	end

	PerformHttpRequest(GM.Logs["List"][logName], function(err, text, headers) end, 'POST', json.encode(GM.Logs:ConstructEmbed(source, title, description)), { 
        ['Content-Type'] = 'application/json' 
    })
end

exports("sendLogs", function(logName, source, title, description)
	GM.Logs:sendLogs(logName, source, title, description)
end)

AddEventHandler("Logs:sendLogs", function(logName, source, title, description)
	GM.Logs:sendLogs(logName, source, title, description)
end)