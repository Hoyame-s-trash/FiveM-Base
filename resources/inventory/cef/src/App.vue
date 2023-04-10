<template>
    <DndProvider :backend="TouchBackend" :options="{
        enableMouseEvents: true
    }">
        <Dragged />

        <div class="center-div">
            <Shortkeys />
        </div>

        <div class="center-div" @click="contextMenuStore.Close" v-if="inventoryStore.interfaceOpened">

            <div class="inventory-background" :style="{
                backgroundImage: `url(inventory-background.png)`
            }"></div>

            <Inventory v-if="inventoryStore.playerInventory" :is-local="true" :inventory="inventoryStore.playerInventory" />
            <Inventory v-if="inventoryStore.secondInventory" :inventory="inventoryStore.secondInventory" />
            <Inventory v-if="inventoryStore.shopInventory" :shop="inventoryStore.shopInventory" />

            <ActionPanels />
            <InputComponent />
            <ContextMenu />
            <NearbyComponent />

            <Clothes />
            <Settings />
        </div>
    </DndProvider>
</template>

<script lang="ts" setup>
import Inventory from './views/Inventory.vue';
import ActionPanels from './views/ActionPanels.vue';
import Dragged from './components/Dragged.vue';
import ContextMenu from './components/ContextMenu.vue';
import InputComponent from "./components/InputComponent.vue";
import { useContextMenuStore } from './store/contextmenu.store';
import { useInventoryStore } from './store/inventory.store';
import Clothes from './views/Clothes.vue';
import { onMounted } from 'vue';
import Shortkeys from './views/Shortkeys.vue';
import Settings from './views/Settings.vue';
import NearbyComponent from './components/NearbyComponent.vue';
import { DndProvider } from 'vue3-dnd';
import { TouchBackend } from 'react-dnd-touch-backend';
import eventPlugin from './plugins/event.plugin';

const contextMenuStore = useContextMenuStore();
const inventoryStore = useInventoryStore();

onMounted(() => {
    eventPlugin.post("CEF_LOADED");
});

</script>

<style lang="scss" scoped>
.inventory-background {
    width: 100%;
    height: 100%;
    background-position: center;
    background-size: cover;
    background-repeat: no-repeat;
}
</style>