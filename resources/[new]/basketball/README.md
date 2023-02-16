Before running this script, put db.sql in your database and configure your framework in rcore_basketball/config.lua

If you are using QBCore, add the following to your `qb-core/shared/items.lua`
```lua
 ['basketball'] = {['name'] = 'basketball', ['label'] = 'Basketball', ['weight'] = 0, ['type'] = 'item', ['image'] = 'basketball.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Play basketball with your friends on any court'},
 ['basketball_hoop'] = {['name'] = 'basketball_hoop', ['label'] = 'Basketball Hoop', ['weight'] = 0, ['type'] = 'item', ['image'] = 'basketball_hoop.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Place anywhere and play basketball wherever you want'},

```

If you are using OxInventory, add the following to your `/data/items.lua` (or replace, if it already exists)
```lua
['basketball_hoop'] = {
    label = 'Basketball Hoop',
    weight = 250,
    close = true,
    consume = 0,
    client = {},
    server = {
        export = 'rcore_basketball.basketball_hoop',
    },
},
```

If you run into any issues, please create a ticket on our discord - https://discord.gg/F28PfsY
