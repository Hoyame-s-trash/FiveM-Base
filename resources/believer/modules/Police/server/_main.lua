GM.Police = GM.Police or {}

exports("any_function_name", function(source, item)
    print("debug 1")
    print(source)
    print("debug 2")
    print(json.encode(item, { indent = true }))
end)