import { defineStore } from "pinia";
import { onMounted, ref, watch } from "vue";
import { I_Inventory } from "../types/inventory";
import { I_ShopInventory } from "../types/shop";
import { useContextMenuStore } from "./contextmenu.store";
import eventPlugin from "../plugins/event.plugin";

export interface I_Takeoffable {
    id: number;
    prop: boolean;
    isWeared: boolean;
}

export interface I_Variations {
    id: number;
    prop: boolean;
    isAvailable: boolean;
}

interface DataState {
    cursorX: number;
    cursorY: number;
}

export const useInventoryStore = defineStore("InventoryStore", () => {

    const interfaceOpened = ref(false);
    const playerInventory = ref<I_Inventory | null>(null);
    const secondInventory = ref<I_Inventory | null>(null);
    const shopInventory = ref<I_ShopInventory | null>(null);

    const store = ref<DataState>({
        cursorX: 0,
        cursorY: 0
    })

    const playerHeader = ref("");
    const quantityInput = ref(0);

    const takeoffable = ref<I_Takeoffable[] | null>([
        {
            id: 0,
            prop: true,
            isWeared: true
        }
    ]);
    const variations = ref<I_Variations[] | null>(null);

    if (import.meta.env.DEV) {
        onMounted(() => {
            window.addEventListener("keyup", (e) => {
                if (e.key == "e" && playerInventory.value) {
                    playerInventory.value.items[0].slot = 6;
                }
            })

            interfaceOpened.value = true;

            shopInventory.value = {
                items: [
                    {
                        price: 100,
                        name: "cognac",
                        meta: {},
                        data: {
                            weight: 0.5
                        }
                    }
                ],
                shopId: "General",
                shopName: "General Shop"
            }

            // secondInventory.value = {
            //     inventoryName: "Vehicle trunk",
            //     uniqueID: "target-inv-unique-id",
            //     slotsAmount: 65,
            //     items: [
            //         {
            //             meta: {},
            //             name: "cognac",
            //             quantity: 3,
            //             data: {}
            //         },
            //     ],
            //     maxWeight: 100
            // }

            playerInventory.value = {
                inventoryName: "Player Stash",
                uniqueID: "player-inv-unique-id",
                slotsAmount: 60,
                maxWeight: 100,
                items: [
                    {
                        meta: {},
                        name: "cognac",
                        quantity: 1,
                        data: {
                            stackable: false,
                            label: 'Hennessy',
                            weight: 1.5
                        },
                        slot: 1,
                        itemHash: 'abc-1'
                    },
                    {
                        meta: {},
                        name: "hamburger",
                        quantity: 5,
                        data: {
                            label: 'Hamburger',
                            stackable: true,
                            weight: 0.5
                        },
                        slot: 3,
                        itemHash: 'abc-2'
                    },
                    {
                        meta: {
                            durability: 35,
                            serial: "0000-1111-2222",
                            note: "Random Note"
                        },
                        name: "gold",
                        quantity: 15,
                        data: {
                            label: 'Gold ore',
                            stackable: true,
                            weight: 0.5,
                            description: "Nagyon értékes, te jó ég."
                        },
                        slot: 10,
                        itemHash: 'abc-3'
                    },
                    {
                        meta: {
                            durability: 75,
                            serial: "0000-1111-2222",
                            note: "Random Note",
                            attachments: [
                                "at_suppressor_light"
                            ]
                        },
                        name: "pistol",
                        quantity: 1,
                        data: {
                            category: "Weapon",
                            label: 'Pistol',
                            stackable: false,
                            weight: 0.5,
                            description: "Durva fegya",
                            weaponHash: 45545445
                        },
                        slot: 8,
                        itemHash: 'abc-4'
                    }
                ]
            }
        });
    }

    const event_mousemove = (ev: MouseEvent) => {
        store.value.cursorX = ev.clientX;
        store.value.cursorY = ev.clientY;
    }

    watch(() => interfaceOpened.value, (newValue) => {
        eventPlugin.post("CLIENT_SET_INTERFACE_STATE", {
            state: newValue
        })

        if (newValue) {
            addEventListener("mousemove", event_mousemove);
        }
        else {
            removeEventListener("mousemove", event_mousemove);

            if (secondInventory.value) {
                eventPlugin.post("CLOSE_SECOND_INVENTORY", {
                    uniqueID: secondInventory.value.uniqueID
                });
            }

            if (shopInventory.value) {
                shopInventory.value = null;
            }
        }
    });

    return {
        store,
        interfaceOpened,
        playerInventory,
        secondInventory,
        shopInventory,
        variations,
        takeoffable,
        playerHeader,
        quantityInput
    }
});

eventPlugin.on("SET_INTERFACE_OPEN", ({ state }) => {
    const inventoryStore = useInventoryStore();
    inventoryStore.interfaceOpened = state;
});
eventPlugin.on("SET_PLAYER_HEADER", ({ playerHeader }) => {
    const inventoryStore = useInventoryStore();
    inventoryStore.playerHeader = playerHeader;
});
eventPlugin.on("ADD_OPENED_INVENTORY", ({ isLocal, inventoryName, slotsAmount, items, uniqueID, maxWeight }) => {
    const inventoryStore = useInventoryStore();
    if (isLocal) {
        inventoryStore.playerInventory = {
            inventoryName: inventoryName,
            slotsAmount: slotsAmount,
            items: items,
            uniqueID: uniqueID,
            maxWeight: maxWeight,
            isLocal: false
        }
    } else {
        inventoryStore.secondInventory = {
            inventoryName: inventoryName,
            slotsAmount: slotsAmount,
            items: items,
            uniqueID: uniqueID,
            maxWeight: maxWeight,
            isLocal: false
        }
    }
});
eventPlugin.on("REMOVE_OPENED_INVENTORY", ({ uniqueID }) => {
    const inventoryStore = useInventoryStore();
    if (inventoryStore.secondInventory?.uniqueID == uniqueID) {
        inventoryStore.secondInventory = null;
    }
});
eventPlugin.on("REMOVE_INVENTORY_ITEM", ({ itemHash, uniqueID }) => {
    const inventoryStore = useInventoryStore();

    let inventory: I_Inventory | null = null;
    if (uniqueID == inventoryStore.playerInventory?.uniqueID)
        inventory = inventoryStore.playerInventory;
    else if (uniqueID == inventoryStore.secondInventory?.uniqueID)
        inventory = inventoryStore.secondInventory;

    if (!inventory) return;

    const idx = inventory.items.findIndex(a => a.itemHash == itemHash);
    if (idx >= 0) {
        inventory.items.splice(idx, 1);
    }

    const contextMenuStore = useContextMenuStore();
    if (contextMenuStore.store?.invItem?.item.itemHash == itemHash) {
        contextMenuStore.Close();
    }
});
eventPlugin.on("UPDATE_INVENTORY_ITEM", ({ uniqueID, itemHash, item }) => {
    const inventoryStore = useInventoryStore();

    let inventory: I_Inventory | null = null;
    if (uniqueID == inventoryStore.playerInventory?.uniqueID)
        inventory = inventoryStore.playerInventory;
    else if (uniqueID == inventoryStore.secondInventory?.uniqueID)
        inventory = inventoryStore.secondInventory;

    if (!inventory) return;

    const idx = inventory.items.findIndex(a => a.itemHash == itemHash);
    if (idx >= 0) {
        const contextMenuStore = useContextMenuStore();
        if (contextMenuStore.store && contextMenuStore.store.invItem && contextMenuStore.store.invItem.item.itemHash == itemHash) {
            contextMenuStore.store.invItem.item = item;
        }
        inventory.items[idx].quantity = item.quantity;
        inventory.items[idx].itemHash = item.itemHash;
        inventory.items[idx].meta = item.meta;
    }
    else {
        inventory.items.push(item);
    }
});
eventPlugin.on("OPEN_SHOP", ({ items, shopId, shopName }) => {
    const inventoryStore = useInventoryStore();
    inventoryStore.shopInventory = {
        items: items,
        shopId: shopId,
        shopName: shopName
    }
});
eventPlugin.on("SET_TAKEOFFABLE", ({ table }) => {
    const inventoryStore = useInventoryStore();
    inventoryStore.takeoffable = table;
});
eventPlugin.on("SET_VARIATIONS", ({ table }) => {
    const inventoryStore = useInventoryStore();
    inventoryStore.variations = table;
});