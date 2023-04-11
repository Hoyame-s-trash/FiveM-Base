ScriptShared.Items:Add("money", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Money",
    weight = 0.0,
    category = "Currency"
})

ScriptShared.Items:Add("apple", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Pomme",
    weight = 1.0,
    usable = true,
    category = "Fruits",
    server = {
        export = "appleuse",
        onUseDeleteAmount = 1
    }
})