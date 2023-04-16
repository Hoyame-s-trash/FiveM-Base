function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function() 
    AddTextEntry('pgt322', "Porsche 911 GT3 RS")
end)