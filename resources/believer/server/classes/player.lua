local SetTimeout = SetTimeout
local GetPlayerPed = GetPlayerPed
local DoesEntityExist = DoesEntityExist
local GetEntityCoords = GetEntityCoords
local GetEntityHeading = GetEntityHeading

function CreateExtendedPlayer(playerId, identifier, group, accounts, inventory, weight, job, loadout, name, coords, uniqueId, is_dead, first_connection)
	local targetOverrides = Config.PlayerFunctionOverride and Core.PlayerFunctionOverrides[Config.PlayerFunctionOverride] or {}
	
	local self = {}

	self.uniqueId = uniqueId
	self.accounts = accounts
	self.coords = coords
	self.group = group
	self.identifier = identifier
	self.inventory = inventory
	self.job = job
	self.loadout = loadout
	self.name = name
	self.playerId = playerId
	self.source = playerId
	self.variables = {}
	self.weight = weight
	self.maxWeight = Config.MaxWeight
	self.license = 'license:'..identifier
	self.is_dead = is_dead
	self.vip = vip or 1
	self.first_connection = first_connection

	ExecuteCommand(('add_principal identifier.%s group.%s'):format(self.license, self.group))
	
	Player(self.source).state:set("uniqueId", self.uniqueId, true)
	Player(self.source).state:set("identifier", self.identifier, true)
	Player(self.source).state:set("license", self.license, true)
	Player(self.source).state:set("job", self.job, true)
	Player(self.source).state:set("group", self.group, true)
	Player(self.source).state:set("name", self.name, true)

	function self.getUniqueId()
		return self.uniqueId
	end

	function self.getDead()
		return self.is_dead
	end

	function self.setDead(boolean)
		self.is_dead = boolean
	end

	function self.getFirstConnection()
		return self.first_connection
	end

	function self.getVip()
		return self.vip
	end

	function self.triggerEvent(eventName, ...)
		TriggerClientEvent(eventName, self.source, ...)
	end

	function self.savePosition(savePosition)
		if (savePosition == true) then
			self.position = nil
		else
			self.position = GetEntityCoords(self.getPed())
		end
	end

	function self.setCoords(coords)
		local Ped = GetPlayerPed(self.source)
		local vector = type(coords) == "vector4" and coords or type(coords) == "vector3" and vector4(coords, 0.0) or
		vec(coords.x, coords.y, coords.z, coords.heading or 0.0)
		SetEntityCoords(Ped, vector.xyz, false, false, false, false)
		SetEntityHeading(Ped, vector.w)
	end

	function self.updateCoords()
		SetTimeout(1000,function()
			local Ped = GetPlayerPed(self.source)
			if DoesEntityExist(Ped) then
				local coords = GetEntityCoords(Ped)
				local distance = #(coords - vector3(self.coords.x, self.coords.y, self.coords.z))
				if distance > 1.5 then
					local heading = GetEntityHeading(Ped)
					self.coords = {
						x = coords.x,
						y = coords.y, 
						z = coords.z, 
						heading = heading or 0.0
					}
				end
			end
			self.updateCoords()
		end)
	end

	function self.getCoords(vector)
		if vector then
			return vector3(self.coords.x, self.coords.y, self.coords.z)
		else
			return self.coords
		end
	end

	function self.onPosition(position, radius)
		local isOnPos = true
		if (#(self.getCoords(true)-position) > radius) then
			isOnPos = false
		end
		return isOnPos
	end

	function self.kick(reason, author)
		local kick = {
			reason = reason,
			date = os.date("%d/%m/%Y %H:%M:%S"),
			admin = author,
		}
	
		MySQL.insert('INSERT INTO user_sanctions (identifier, type, data) VALUES (?, ?, ?)', {self.identifier, "Kick", json.encode(kick)}, function()
			DropPlayer(self.source, "Vous avez été kick de BlueStark !\n"..reason)
		end)
	end

	function self.ban(reason, expiration, author)
		if (not reason or not expiration or type(expiration) ~= "number") then
			return
		end

		local playerIdentifier = self.getIdentifier()
		if (not playerIdentifier) then
			return
		end


		local currentBan = {
			reason = reason,
			expiration = expiration,
			author = author
		}
	
		GM.Connecting:ban(playerIdentifier, currentBan)
	end

	function self.setMoney(money)
		money = ESX.Math.Round(money)
		self.setAccountMoney('money', money)
	end

	function self.getMoney()
		return self.getAccount('money').money
	end

	function self.addMoney(money, reason)
		money = ESX.Math.Round(money)
		self.addAccountMoney('money', money, reason)
	end

	function self.removeMoney(money, reason)
		money = ESX.Math.Round(money)
		self.removeAccountMoney('money', money, reason)
	end

	function self.getIdentifier()
		return self.identifier
	end

	function self.setGroup(newGroup)
		ExecuteCommand(('remove_principal identifier.%s group.%s'):format(self.license, self.group))
		self.group = newGroup
		Player(self.source).state:set("group", self.group, true)
		ExecuteCommand(('add_principal identifier.%s group.%s'):format(self.license, self.group))
	end

	function self.getGroup()
		return self.group
	end

	function self.set(k, v)
		self.variables[k] = v
		Player(self.source).state:set(k, v, true)
	end

	function self.get(k)
		return self.variables[k] or false
	end

	function self.getAccounts(minimal)
		if minimal then
			local minimalAccounts = {}

			for i=1, #self.accounts do
				minimalAccounts[self.accounts[i].name] = self.accounts[i].money
			end

			return minimalAccounts
		else
			return self.accounts
		end
	end

	function self.getAccount(account)
		for i=1, #self.accounts do
			if self.accounts[i].name == account then
				return self.accounts[i]
			end
		end
	end

	function self.getInventory(minimal)
		if minimal then
			local minimalInventory = {}

			for k, v in ipairs(self.inventory) do
				if v.count > 0 then
					minimalInventory[v.name] = v.count
				end
			end

			return minimalInventory
		end

		return self.inventory
	end

	function self.getJob()
		return self.job
	end

	function self.getLoadout(minimal)
		if minimal then
			local minimalLoadout = {}

			for k,v in ipairs(self.loadout) do
				minimalLoadout[v.name] = {ammo = v.ammo}
				if v.tintIndex > 0 then minimalLoadout[v.name].tintIndex = v.tintIndex end

				if #v.components > 0 then
					local components = {}

					for k2,component in ipairs(v.components) do
						if component ~= 'clip_default' then
							components[#components + 1] = component
						end
					end

					if #components > 0 then
						minimalLoadout[v.name].components = components
					end
				end
			end

			return minimalLoadout
		else
			return self.loadout
		end
	end

	function self.getNickName()
		return GetPlayerName(self.source)
	end

	function self.getName()
		return self.name
	end

	function self.getPed()
		return GetPlayerPed(self.source)
	end

	function self.setName(newName)
		self.name = newName
		Player(self.source).state:set("name", self.name, true)
	end

	function self.setAccountMoney(accountName, money, reason)
		reason = reason or 'unknown'
		if not tonumber(money) then 
			print(('[^1ERROR^7] Tried To Set Account ^5%s^0 For Player ^5%s^0 To An Invalid Number -> ^5%s^7'):format(accountName, self.playerId, money))
			return
		end
		if money >= 0 then
			local account = self.getAccount(accountName)

			if account then
				money = account.round and ESX.Math.Round(money) or money
				self.accounts[account.index].money = money

				self.triggerEvent('esx:setAccountMoney', account)
				TriggerEvent('esx:setAccountMoney', self.source, accountName, money, reason)
			else 
				print(('[^1ERROR^7] Tried To Set Invalid Account ^5%s^0 For Player ^5%s^0!'):format(accountName, self.playerId))
			end
		else 
			print(('[^1ERROR^7] Tried To Set Account ^5%s^0 For Player ^5%s^0 To An Invalid Number -> ^5%s^7'):format(accountName, self.playerId, money))
		end
	end

	function self.addAccountMoney(accountName, money, reason)
		reason = reason or 'Unknown'
		if not tonumber(money) then 
			print(('[^1ERROR^7] Tried To Set Account ^5%s^0 For Player ^5%s^0 To An Invalid Number -> ^5%s^7'):format(accountName, self.playerId, money))
			return
		end
		if money > 0 then
			local account = self.getAccount(accountName)
			if account then
				money = account.round and ESX.Math.Round(money) or money
				self.accounts[account.index].money += money

				self.triggerEvent('esx:setAccountMoney', account)
				TriggerEvent('esx:addAccountMoney', self.source, accountName, money, reason)
			else 
				print(('[^1ERROR^7] Tried To Set Add To Invalid Account ^5%s^0 For Player ^5%s^0!'):format(accountName, self.playerId))
			end
		else 
			print(('[^1ERROR^7] Tried To Set Account ^5%s^0 For Player ^5%s^0 To An Invalid Number -> ^5%s^7'):format(accountName, self.playerId, money))
		end
	end

	function self.removeAccountMoney(accountName, money, reason)
		reason = reason or 'Unknown'
		if not tonumber(money) then 
			print(('[^1ERROR^7] Tried To Set Account ^5%s^0 For Player ^5%s^0 To An Invalid Number -> ^5%s^7'):format(accountName, self.playerId, money))
			return
		end
		if money > 0 then
			local account = self.getAccount(accountName)

			if account then
				money = account.round and ESX.Math.Round(money) or money
				self.accounts[account.index].money -= money

				self.triggerEvent('esx:setAccountMoney', account)
				TriggerEvent('esx:removeAccountMoney', self.source, accountName, money, reason)
			else 
				print(('[^1ERROR^7] Tried To Set Add To Invalid Account ^5%s^0 For Player ^5%s^0!'):format(accountName, self.playerId))
			end
		else 
			print(('[^1ERROR^7] Tried To Set Account ^5%s^0 For Player ^5%s^0 To An Invalid Number -> ^5%s^7'):format(accountName, self.playerId, money))
		end
	end

	function self.getInventoryItem(name, slot)
		if (not slot) then
			local inventoryItem = exports["believer"]:GetItemBy(self.source, {
				name = name,
			})
			return inventoryItem
		else
			local slotItem = exports["believer"]:GetItemBy(self.source, {
				name = name,
				slot = slot
			})
			return slotItem
		end
	end

	function self.addInventoryItem(name, count, metadata, slot)
		exports["believer"]:AddItem(self.source, name, count, metadata)
	end

	function self.removeInventoryItem(name, count, metadata, slot)
		exports["believer"]:RemoveItemBy(self.source, count, {
			name = name,
		})
	end

	function self.setInventoryItem(name, count, metadata)
		local item = self.getInventoryItem(name)

		if item and count >= 0 then
			count = ESX.Math.Round(count)

			if count > item.count then
				self.addInventoryItem(item.name, count - item.count)
			else
				self.removeInventoryItem(item.name, item.count - count)
			end
		end
	end

	function self.getWeight()
		return self.weight
	end

	function self.getMaxWeight()
		return self.maxWeight
	end

	function self.canCarryItem(name, count, metadata)
		local boolean = exports["believer"]:CanCarryItem(self.source, name, count)
		return boolean
	end

	function self.setMaxWeight(newWeight)
		self.maxWeight = newWeight
		self.triggerEvent('esx:setMaxWeight', self.maxWeight)
	end

	function self.setJob(job, grade)
		grade = tostring(grade)

		if ESX.DoesJobExist(job, grade) then
			local actualJob = self.job.name
			if (actualJob) then
				local actualJob = string.upper(string.sub(actualJob, 1, 1))..string.sub(actualJob, 2, #actualJob)

				if (GM[actualJob]) then
					if (GM[actualJob].registeredZones) then
						for zoneType, _ in pairs(GM[actualJob].registeredZones) do
							for zoneId, _ in pairs(GM[actualJob].registeredZones[zoneType]) do
								GM[actualJob].registeredZones[zoneType][zoneId]:allowedPlayer(self.source, false)
							end
						end
					end

					if (GM[actualJob].registeredBlips) then
						for blipType, _ in pairs(GM[actualJob].registeredBlips) do
							for blipId, _ in pairs(GM[actualJob].registeredBlips[blipType]) do
								GM[actualJob].registeredBlips[blipType][blipId]:allowedPlayer(self.source, false)
							end
						end
					end
				end
			end

			local newJob = job
			if (newJob) then
				local newJob = string.upper(string.sub(newJob, 1, 1))..string.sub(newJob, 2, #newJob)

				if (GM[newJob]) then
					if (GM[newJob].registeredZones) then
						for zoneType, _ in pairs(GM[newJob].registeredZones) do
							for zoneId, _ in pairs(GM[newJob].registeredZones[zoneType]) do
								GM[newJob].registeredZones[zoneType][zoneId]:allowedPlayer(self.source, true)
							end
						end
					end

					if (GM[newJob].registeredBlips) then
						for blipType, _ in pairs(GM[newJob].registeredBlips) do
							for blipId, _ in pairs(GM[newJob].registeredBlips[blipType]) do
								GM[newJob].registeredBlips[blipType][blipId]:allowedPlayer(self.source, true)
							end
						end
					end
				end
			end

			local jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]

			self.job.id    = jobObject.id
			self.job.name  = jobObject.name
			self.job.label = jobObject.label

			self.job.grade        = tonumber(grade)
			self.job.grade_name   = gradeObject.name
			self.job.grade_label  = gradeObject.label
			self.job.grade_salary = gradeObject.salary

			TriggerEvent('esx:setJob', self.source, self.job)
			self.triggerEvent('esx:setJob', self.job)
			Player(self.source).state:set("job", self.job, true)
		else
			print(('[believer] [^3WARNING^7] Ignoring invalid ^5.setJob()^7 usage for ID: ^5%s^7, Job: ^5%s^7'):format(self.source, job))
		end
	end

	function self.addWeapon(weaponName, ammo)
		if not self.hasWeapon(weaponName) then
			local weaponLabel = ESX.GetWeaponLabel(weaponName)

			table.insert(self.loadout, {
				name = weaponName,
				ammo = ammo,
				label = weaponLabel,
				components = {},
				tintIndex = 0
			})

			GiveWeaponToPed(GetPlayerPed(self.source), joaat(weaponName), ammo, false, false)
			self.triggerEvent('esx:addInventoryItem', weaponLabel, false, true)
		end
	end

	function self.addWeaponComponent(weaponName, weaponComponent)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if weapon then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				if not self.hasWeaponComponent(weaponName, weaponComponent) then
					self.loadout[loadoutNum].components[#self.loadout[loadoutNum].components + 1] = weaponComponent
					local componentHash = ESX.GetWeaponComponent(weaponName, weaponComponent).hash
					GiveWeaponComponentToPed(GetPlayerPed(self.source), joaat(weaponName), componentHash)
					self.triggerEvent('esx:addInventoryItem', component.label, false, true)
				end
			end
		end
	end

	function self.addWeaponAmmo(weaponName, ammoCount)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if weapon then
			weapon.ammo = weapon.ammo + ammoCount
			SetPedAmmo(GetPlayerPed(self.source), joaat(weaponName), weapon.ammo)
		end
	end

	function self.updateWeaponAmmo(weaponName, ammoCount)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if weapon then
			weapon.ammo = ammoCount
		end
	end

	function self.setWeaponTint(weaponName, weaponTintIndex)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if weapon then
			local weaponNum, weaponObject = ESX.GetWeapon(weaponName)

			if weaponObject.tints and weaponObject.tints[weaponTintIndex] then
				self.loadout[loadoutNum].tintIndex = weaponTintIndex
				self.triggerEvent('esx:setWeaponTint', weaponName, weaponTintIndex)
				self.triggerEvent('esx:addInventoryItem', weaponObject.tints[weaponTintIndex], false, true)
			end
		end
	end

	function self.getWeaponTint(weaponName)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if weapon then
			return weapon.tintIndex
		end

		return 0
	end

	function self.removeWeapon(weaponName)
		local weaponLabel

		for k,v in ipairs(self.loadout) do
			if v.name == weaponName then
				weaponLabel = v.label

				for k2,v2 in ipairs(v.components) do
					self.removeWeaponComponent(weaponName, v2)
				end

				table.remove(self.loadout, k)
				break
			end
		end

		if weaponLabel then
			self.triggerEvent('esx:removeWeapon', weaponName)
			self.triggerEvent('esx:removeInventoryItem', weaponLabel, false, true)
		end
	end

	function self.removeWeaponComponent(weaponName, weaponComponent)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if weapon then
			local component = ESX.GetWeaponComponent(weaponName, weaponComponent)

			if component then
				if self.hasWeaponComponent(weaponName, weaponComponent) then
					for k,v in ipairs(self.loadout[loadoutNum].components) do
						if v == weaponComponent then
							table.remove(self.loadout[loadoutNum].components, k)
							break
						end
					end

					self.triggerEvent('esx:removeWeaponComponent', weaponName, weaponComponent)
					self.triggerEvent('esx:removeInventoryItem', component.label, false, true)
				end
			end
		end
	end

	function self.removeWeaponAmmo(weaponName, ammoCount)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if weapon then
			weapon.ammo = weapon.ammo - ammoCount
			self.triggerEvent('esx:setWeaponAmmo', weaponName, weapon.ammo)
		end
	end

	function self.hasWeaponComponent(weaponName, weaponComponent)
		local loadoutNum, weapon = self.getWeapon(weaponName)

		if weapon then
			for k,v in ipairs(weapon.components) do
				if v == weaponComponent then
					return true
				end
			end

			return false
		else
			return false
		end
	end

	function self.hasWeapon(weaponName)
		for k,v in ipairs(self.loadout) do
			if v.name == weaponName then
				return true
			end
		end

		return false
	end

	function self.hasItem(item, metadata)
		for k,v in ipairs(self.inventory) do
			if (v.name == item) and (v.count >= 1) then
				return v, v.count
			end
		end

		return false
	end

	function self.getWeapon(weaponName)
		for k,v in ipairs(self.loadout) do
			if v.name == weaponName then
				return k, v
			end
		end
	end

	function self.showNotification(msg, options)
		self.triggerEvent('esx:showNotification', msg, options)
	end

	function self.showAdvancedNotification(sender, subject, msg, textureDict, options)
		self.triggerEvent('esx:showAdvancedNotification', sender, subject, msg, textureDict, options)
	end

	function self.showHelpNotification(msg, thisFrame, beep, duration)
		self.triggerEvent('esx:showHelpNotification', msg, thisFrame, beep, duration)
	end

	function self.setArmour(armour)
		SetPedArmour(GetPlayerPed(self.source), armour)
	end

	for fnName,fn in pairs(targetOverrides) do
		self[fnName] = fn(self)
	end

	return self
end
