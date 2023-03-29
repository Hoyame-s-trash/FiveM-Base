ESX = exports['believer']:getSharedObject()

RegisterServerEvent('bluestark_bank:Deposit')
AddEventHandler('bluestark_bank:Deposit', function(amount)
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end

	if amount == nil or amount <= 0 or amount > playerSelected.getMoney() then
		playerSelected.showNotification("~r~Montant invalide.")
		return
	end

	playerSelected.removeMoney(amount)
	playerSelected.addAccountMoney('bank', tonumber(amount))
	playerSelected.showNotification("Vous avez déposé un montant de ~b~"..tonumber(amount).."$.")
end)


RegisterServerEvent('bluestark_bank:Withdraw')
AddEventHandler('bluestark_bank:Withdraw', function(amount)
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end

	amount = tonumber(amount)

	if (amount == 0 or amount == nil) then
		playerSelected.showNotification("~r~Montant invalide.")
		return
	end

	local playerBankBalance = playerSelected.getAccount('bank').money


	if amount > playerBankBalance then
		playerSelected.showNotification("~r~Vous n'avez pas assez d'argent en banque.")
		return
	end

	playerSelected.removeAccountMoney('bank', amount)
	playerSelected.addMoney(amount)
	playerSelected.showNotification("Vous avez retiré un montant de ~b~"..tonumber(amount).."$.")
end)


RegisterServerEvent('bluestark_bank:Transfer')
AddEventHandler('bluestark_bank:Transfer', function(playerId, amount)
	local playerSrc = source
	if (not playerSrc) then return end

	local playerSelected = ESX.GetPlayerFromId(playerSrc)
	if (not playerSelected) then return end

	if (playerSrc == playerId) then
		playerSelected.showNotification("~r~Vous ne pouvez pas faire de transfert à vous même.")
		return
	end

	local playerTarget = ESX.GetPlayerFromId(playerId)
	if (not playerTarget) then
		playerSelected.showNotification("~r~Destinataire introuvable.")
		return
	end

	amount = tonumber(amount)
	if (amount == 0 or amount == nil) then
		playerSelected.showNotification("~r~Montant invalide.")
		return
	end

	local playerBankBalance = playerSelected.getAccount('bank').money
	if amount > playerBankBalance then
		playerSelected.showNotification("~r~Vous n'avez pas assez d'argent en banque.")
		return
	end

	playerSelected.removeAccountMoney('bank', tonumber(amount))
	playerTarget.addAccountMoney('bank', tonumber(amount))

	playerSelected.showNotification("Vous avez transféré un montant de ~b~"..tonumber(amount).."$ à "..playerTarget.getName()..".")
	playerTarget.showNotification("Vous avez reçu un transfert de ~b~"..tonumber(amount).."$ de la part de "..playerSelected.getName()..".")
end)

ESX.RegisterUsableItem('cartebancaire', function(source)
    TriggerClientEvent('bluestark_bank:UseAtm', source)
end)   

RegisterCommand("bank", function(source)
	TriggerClientEvent('bluestark_bank:UseAtm', source)
end)