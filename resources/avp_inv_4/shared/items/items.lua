ScriptShared.Items:Add("money", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Money",
    weight = 0.0,
    category = "Currency"
})
ScriptShared.Items:Add("gold", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Gold",
    weight = 1.5,
    usable = true,
    category = "Raw material",
    server = {
        export = "av_inventory_2_remastered.test",
        onUseDeleteAmount = 1
    }
})
ScriptShared.Items:Add("cognac", {
    stackable = false,
    deletable = true,
    tradable = true,
    label = "Hennessy Cognac",
    weight = 0.75,
    droppedModel = `prop_cs_script_bottle`,
    category = "Drink"
})
ScriptShared.Items:Add("hotdog", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Hot-Dog",
    weight = 0.25,
    category = "Food"
})
ScriptShared.Items:Add("hamburger", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Hamburger",
    weight = 0.25,
    category = "Food"
})
ScriptShared.Items:Add("ironingot", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Iron Ingot",
    weight = 0.75,
    category = "Raw material"
})
ScriptShared.Items:Add("reddiamond", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Red Diamond",
    weight = 0.1,
    category = "Raw material"
})
ScriptShared.Items:Add("apple", {
    stackable = true,
    deletable = true,
    tradable = true,
    label = "Apple",
    weight = 0.25,
    category = "Fruit"
})
