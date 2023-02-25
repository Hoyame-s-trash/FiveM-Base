ESX = {}
ESX.Players = {}
ESX.Jobs = {}
ESX.Orga = {}
ESX.Items = {}
Core = {}
Core.UsableItemsCallbacks = {}
Core.ServerCallbacks = {}
Core.ClientCallbacks = {}
Core.CurrentRequestId = 0
Core.TimeoutCount = -1
Core.CancelledTimeouts = {}
Core.RegisteredCommands = {}
Core.Pickups = {}
Core.PickupId = 0
Core.PlayerFunctionOverrides = {}

exports('getSharedObject', function()
  return ESX
end)

local function StartDBSync()
  CreateThread(function()
    while true do
      Wait(10 * 60 * 1000)
      Core.SavePlayers()
    end
  end)
end

MySQL.ready(function()
  local items = MySQL.query.await('SELECT * FROM items')
  for k, v in ipairs(items) do
    ESX.Items[v.name] = {label = v.label, weight = v.weight, rare = v.rare, canRemove = v.can_remove}
  end

  local Jobs = {}
  local jobs = MySQL.query.await('SELECT * FROM jobs')

  for _, v in ipairs(jobs) do
    Jobs[v.name] = v
    Jobs[v.name].grades = {}
  end

  local jobGrades = MySQL.query.await('SELECT * FROM job_grades')

  for _, v in ipairs(jobGrades) do
    if Jobs[v.job_name] then
      Jobs[v.job_name].grades[tostring(v.grade)] = v
    else
      print(('[^3WARNING^7] Ignoring job grades for ^5%s^0 due to missing job'):format(v.job_name))
    end
  end

  for _, v in pairs(Jobs) do
    if ESX.Table.SizeOf(v.grades) == 0 then
      Jobs[v.name] = nil
      print(('[^3WARNING^7] Ignoring job ^5%s^0 due to no job grades found'):format(v.name))
    end
  end

  if not Jobs then
    ESX.Jobs['unemployed'] = {label = 'Unemployed', grades = {['0'] = {grade = 0, label = 'Unemployed', salary = 200, skin_male = {}, skin_female = {}}}}
  else
    ESX.Jobs = Jobs
  end

  local Orga = {}
  local orga = MySQL.query.await('SELECT * FROM orga')

  for _, v in ipairs(orga) do
    Orga[v.name] = v
    Orga[v.name].grades = {}
  end

  local orgaGrades = MySQL.query.await('SELECT * FROM orga_grades')

  for _, v in ipairs(orgaGrades) do
    if Orga[v.job_name] then
      Orga[v.job_name].grades[tostring(v.grade)] = v
    else
      print(('[^3WARNING^7] Ignoring orga grades for ^5%s^0 due to missing orga'):format(v.orga_name))
    end
  end

  for _, v in pairs(Orga) do
    if ESX.Table.SizeOf(v.grades) == 0 then
      Orga[v.name] = nil
      print(('[^3WARNING^7] Ignoring orga ^5%s^0 due to no orga grades found'):format(v.name))
    end
  end

  if not Orga then
    ESX.Orga['unemployed'] = {label = 'Unemployed', grades = {['0'] = {grade = 0, label = 'Unemployed', salary = 200, skin_male = {}, skin_female = {}}}}
  else
    ESX.Orga = Orga
  end

  print('[^2INFO^7] BLUESTARK ^5 V2.0^0 initialized!')
  StartDBSync()
  StartPayCheck()
end)

RegisterServerEvent('esx:triggerServerCallback')
AddEventHandler('esx:triggerServerCallback', function(name, requestId,Invoke, ...)
  local source = source

  ESX.TriggerServerCallback(name, requestId, source,Invoke, function(...)
    TriggerClientEvent('esx:serverCallback', source, requestId,Invoke, ...)
  end, ...)
end)

RegisterNetEvent("esx:ReturnVehicleType", function(Type, Request)
  if Core.ClientCallbacks[Request] then
    Core.ClientCallbacks[Request](Type)
    Core.ClientCallbacks[Request] = nil
  end
end)
