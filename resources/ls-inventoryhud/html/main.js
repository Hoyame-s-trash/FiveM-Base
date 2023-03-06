var objectPlacable = false;
var objectPuttable = false;
var objectStackable = false;
var objectAttachable = false;

var puttableSlots = {}

var searchList = {}
var currentItem = 0;

var isSearching = false;
var isSearchingContainer = false;

var containerSearchSound = null;
var containerParentID = null;

var minutesLabel = null;
var secondsLabel = null;

var currentTimer = null;
var totalSeconds = 0;

var cancelled = false;
var interruptTimeout = null;
var interruptInterval = null;

var temporaryRotated = false;
var itemDrag = {
    "isDragging": false,
    "itemDATA": { }
};







// Weight variables
var weightDivide = 1
var maxWeight = 0
var currentWeight = 0.0

// Slot variables
var paintedBefore = {}
var locatedSlots = {}

// Context Menu variables
var IsInContextMenu = false
var contextMenuItem = null
var inAttachmentMenu = false

var allItemsAttachments = {}

var hudHA = true

mousePOS = {
    x: 0,
    y: 0,
}

$(document).on("keydown", function(event) {
    if (event.repeat) {
        return;
    }
    switch (event.keyCode) {
        case 27: // ESC
            CloseInventory();
            break;
        case 9: // TAB
            CloseInventory();
            break;
    }
});

function WeightReCalculate() {
    setTimeout(function() {
        currentWeight = 0.0;
        $.each($(`.grid-item`), function(key, value) {
            var item = $(value).data("itemData")
            if (item != undefined) {
                if (item.info != undefined) {
                    if (isInventoryPlayer(item)) {
                        item.info.CurrentStack == undefined ? item.info.CurrentStack = 1 : item.info.CurrentStack = item.info.CurrentStack

                        currentWeight += item._data.Weight*item.info.CurrentStack
                    }
                }
            }
        })

        $.each($(`.container-grid-top`), function(key, value) {
            var item = $(value).data("itemData");
            if (item != undefined) {
                $(`#clothe-container-slots-${item._id}`).find(".grid-container-label").each(function(test, value2) {
                    if ($(value2)[0].classList[1] != undefined) {
                        if (!$(value2)[0].classList[1].includes("weapon") && !SlotIsClothing($(value2)[0].classList[1].split("-")[3])) {
                            $(value2).html(`<span class="grid-bottom-label2">  ${item._data.Label}        </span><br>  ${item.isSearched ? AddWeight(item).toFixed(1) : "??"} kg ${AddEmpty(item)} `)
                        }
                    } else {
                        $(value2).html(`<span class="grid-bottom-label2">  ${item._data.Label}        </span><br>  ${item.isSearched ? AddWeight(item).toFixed(1) : "??"} kg ${AddEmpty(item)} `)
                    }
                })
            }
        })
    
        var weight = (currentWeight/weightDivide).toFixed(2)
    
        let color = "rgb(39, 174, 96, 0.5)";
    
        if (maxWeight/4 > weight) {
            color = "rgb(39, 174, 96, 0.5)";
        } else if (maxWeight/2.5 > weight) {
            color = "rgb(172, 209, 35, 0.5)";
        } else if (maxWeight/2 > weight) {
            color = "rgb(141, 159, 34, 0.5)";
        } else if(maxWeight/1.5 > weight) {
            color = "rgb(230, 126, 34, 0.5)";
        } else if(maxWeight/1.2 > weight) {
            color = "rgb(192, 57, 43, 0.5)";
        } else {
            color = "rgb(238, 41, 21, 0.5)";
        }
    
        $("#weightLabelFirst").html(`<p>Weight</p>`);
        $("#weightLabel").html(`<p>${weight}/${maxWeight}kg</p>`);
    
        if (maxWeight >= weight) {
            $("#weightProgress").css({"width": ((weight/maxWeight)*100)+"%", "background-color": color});
        } else {
            $("#weightProgress").css({"width": "100%", "background-color": color});
        }
        $("#weightProgress").css("box-shadow", `0 0 .2rem ${color}, 0 0 .7rem ${color}, 0 0 1.2rem ${color}, 0 0 1.8rem ${color}`)
        

        $.post("https://ls-inventoryhud/WeightChanged", JSON.stringify({
            weightData: currentWeight,
        }));
    },10)
}

function FindItemHasAttachment(item, attach) {
    let _ = false
    $.each(allItemsAttachments, function(key, value){
        if (value != undefined && item != undefined){
            if (value.name == item._name) {
                $.each(value.components, function(key, value2) {
                    if (value2.name == attach.info.component) {
                        _ = true;
                    }
                })
            }
        }
    })
    return _;
}

$(document).ready(function (){
    window.addEventListener('message', function (event) {
        var data = event.data
        if (data.action == "ui") {
            if (data.type) {
                OpenInventory();
            } else {
                CloseInventory();
            }
        }else if (data.action == "setupInventory") {
            ItemBase = data.items;
            allItemsAttachments = data.weapons;
            hudHA = data.hahud;

            weightDivide = data.weight.Divide
            maxWeight = data.weight.MaxPlayerWeight

            Inventory(data);
        } else if (data.action == "setupSecondInventory") {
            InventorySec(data)
        } else if (data.action == "AddItem") {
            AddItem(data.itemData, "c6jgbwjs9tc2vb8gtpwe7rywe");
        } else if (data.action == "RemoveItem") {
            RemoveItem(data);
        } else if (data.action == "UpdateItem") {
            UpdateItem(data);
        } else if (data.action == "UseItemHotbar") {
            UseItemHotbar(data.key);
        } else if (data.action == "ItemChanged") {
            ItemChanged(data);
        }  else if (data.action == "RefreshPlayerData") {
            SetPlayerData(data)
        }  else if (data.action == "DeleteInventory") {
            DeleteInventory()
        }
        
        
        else if (data.action == "attachment") {
            SetupAttachment(data.attachmentList)
        } else if (data.action == "updateAttachment"){
            EditAttachment(data.attachmentList)
        } 
        
        
        
        
        
        else if (data.action == "refreshClothes") {
            CheckClothes()
        } else if (data.action == "refreshClothesFully") {
            CheckClothesFully()
        }

        else if (data.action == "setupShopInventory") {
            SetupShop(data)
        }
    })
});

function DeleteInventory() {
    $(`body`).html(`        <div id="inventory">
    <div id="info-box"></div>
</div>

<div id="fastuse"></div>

<div id="split-item">
    <input type="range" min="1" max="9999" value="1" class="slider" id="split-range" oninput="changeValue(this.value)">
    <span id="range-value">1</span>
</div>

<!-- Development suspended TBA -->
<div id="attachment"></div>

<canvas id="canvas"></canvas>
<!-- Development suspended TBA -->
`);
    firstInventory = {};
    secInventory = {};
}

function DebugMode(data, data2) {
    ItemBase = data.items;
    allItemsAttachments = data.weapons;
    OpenInventory();

    Inventory(data);
    
    InventorySec(data2)
}

function ItemChanged(data) {
    var itemTemporary = null
    if (data.fromInventory != null) {
        if (data.fromInventory == firstInventory._inventoryId) {
            itemTemporary =firstInventory.items[data.itemD._id];
            delete firstInventory.items[data.itemD._id];
        } else if(data.fromInventory == secInventory._inventoryId) {
            itemTemporary = secInventory.items[data.itemD._id];
            delete secInventory.items[data.itemD._id];
        }
    }

    if (data.toInventory != null && data.fromInventory != null) {
        if (data.toInventory != data.fromInventory) {
            var slotID = GetItemAnyHotbar(data.itemD._id)
            if (slotID != "empty") {
                CleanFastUse(slotID)
            }
        }
    }

    if (itemTemporary != undefined) {
        if (CreateXYITEM(itemTemporary) != data.toLocation || itemTemporary.slotId != data.toSlot || itemTemporary._parent != data.toParent) {
            let size_x = parseInt(itemTemporary.loc.x) + parseInt(itemTemporary._data.Width)
            let size_y = parseInt(itemTemporary.loc.y) + parseInt(itemTemporary._data.Height)
            
            for (y_value= parseInt(itemTemporary.loc.y); y_value < size_y; y_value++) {
                for (x_value= parseInt(itemTemporary.loc.x); x_value < size_x; x_value++) {
                    let current_slot = x_value + "-" + y_value

                    $(`#grid-${itemTemporary._parent}-${current_slot}-${itemTemporary.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""}).data("isTaken", false);
                }
            }
            $(`#item-${itemTemporary._id}`).remove();

            if (document.getElementById(`clothe-container-slots-${data.itemD._id}`) !== null)
                    $(`#clothe-container-slots-${data.itemD._id}`).remove();
        }
    }

    if (data.toInventory != null) {
        if(!$(`#item-${data.itemD._id}`).length) {
            var item = data.itemD

            if (firstInventory._inventoryId == data.toInventory || secInventory._inventoryId == data.toInventory) {
                var itemC = ColorSettings[item._data.Backgroundcolor]

                let size_x = parseInt(item.loc.x) + parseInt(item._data.Width)
                let size_y = parseInt(item.loc.y) + parseInt(item._data.Height)

                for (y_value= parseInt(item.loc.y); y_value < size_y; y_value++) {
                    for (x_value= parseInt(item.loc.x); x_value < size_x; x_value++) {
                        let current_slot = x_value + "-" + y_value
                        $(`#grid-${item._parent}-${current_slot}-${item.slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                .data({"isTaken": true, "itemData": item});
                    }
                }

                $(`#item-${item._id}`).appendTo(`#grid-${item._parent}-${CreateXYITEM(item)}-${item.slotId}`);

                if (data.toInventory == firstInventory._inventoryId) 
                    firstInventory.items[item._id] = item;
                else if (data.toInventory == secInventory._inventoryId) 
                    secInventory.items[item._id] = item;

            } else {
                let size_x = parseInt(item.loc.x) + parseInt(item._data.Width)
                let size_y = parseInt(item.loc.y) + parseInt(item._data.Height)

                for (y_value= parseInt(item.loc.y); y_value < size_y; y_value++) {
                    for (x_value= parseInt(item.loc.x); x_value < size_x; x_value++) {
                        let current_slot = x_value + "-" + y_value
                        $(`#grid-${item._parent}-${current_slot}-${item.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""}).data("isTaken", false);
                    }
                }
                $(`#item-${item._id}`).remove();

                if (document.getElementById(`clothe-container-slots-${data.itemD._id}`) !== null)
                    $(`#clothe-container-slots-${item._id}`).remove(); 

                if (data.toInventory == firstInventory._inventoryId) 
                    delete firstInventory.items[item._id];
                else if (data.toInventory == secInventory._inventoryId) 
                    delete secInventory.items[item._id];   
            }
        } else {
            var item = data.itemD
            if (firstInventory._inventoryId != data.toInventory && secInventory._inventoryId != data.toInventory) {
                let size_x = parseInt(item.loc.x) + parseInt(item._data.Width)
                let size_y = parseInt(item.loc.y) + parseInt(item._data.Height)

                for (y_value= parseInt(item.loc.y); y_value < size_y; y_value++) {
                    for (x_value= parseInt(item.loc.x); x_value < size_x; x_value++) {
                        let current_slot = x_value + "-" + y_value
                        $(`#grid-${item._parent}-${current_slot}-${item.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""}).data("isTaken", false);
                    }
                }
                $(`#item-${item._id}`).remove();

                if (document.getElementById(`clothe-container-slots-${data.itemD._id}`) !== null)
                    $(`#clothe-container-slots-${item._id}`).remove(); 

                if (data.toInventory == firstInventory._inventoryId) 
                    delete firstInventory.items[item._id];
                else if (data.toInventory == secInventory._inventoryId) 
                    delete secInventory.items[item._id];   
            } else {
                if (!$(`#item-${item._id}`).length) {
                    var itemC = ColorSettings[item._data.Backgroundcolor]

                    let size_x = parseInt(item.loc.x) + parseInt(item._data.Width)
                    let size_y = parseInt(item.loc.y) + parseInt(item._data.Height)

                    for (y_value= parseInt(item.loc.y); y_value < size_y; y_value++) {
                        for (x_value= parseInt(item.loc.x); x_value < size_x; x_value++) {
                            let current_slot = x_value + "-" + y_value
                            $(`#grid-${item._parent}-${current_slot}-${item.slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                    .data({"isTaken": true, "itemData": item});
                        }
                    }
                    $(`#grid-${item._parent}-${CreateXYITEM(item)}-${item.slotId}`).append(`<div class="grid-item" id="item-${item._id}"><span class="grid-item-name">${SetItemLabel(item)}</span>${AppendItemAmount(item)}<img src="${GetItemImage(item)}" alt="${item._id}" style="width: ${(parseInt(item._data.Width)*ResponsiveGridSize())+(parseInt(item._data.Width)*2)}px; height: ${(parseInt(item._data.Height)*ResponsiveGridSize())+(parseInt(item._data.Height)*2)}px"></div>`)
                    SetItemBG(item);
                    $(`#item-${item._id}`).css({ "width": (parseInt(item._data.Width)*ResponsiveGridSize())+(parseInt(item._data.Width)*2)+"px", "height": (parseInt(item._data.Height)*ResponsiveGridSize())+(parseInt(item._data.Height)*2)+"px" })
                                            .data("itemData", item);

                    if (document.getElementById(`clothe-container-slots-${data.itemD._id}`) === null) {
                        if (ThisSlotHaveAnyContainerInUI(item.slotId)) {
                            $(`#item-${item._id}`).css({ "width": SetItemWidthNHeight(item.slotId, true), "height": SetItemWidthNHeight(item.slotId, false) }).find("img").css({ "width": SetItemWidthNHeight(item.slotId, true), "height": SetItemWidthNHeight(item.slotId, false) }); 
                            if ($(`#clothe-container-slots-${item._id}`).css("display") == undefined)
                                CreateTopGrid(item._id, item._tpl, item);
                        }
                        if (item._data.Type == "container" && !ThisSlotHaveAnyContainerInUI(item.slotId)) {
                            if ($(`#clothe-container-slots-${item._id}`).css("display") == undefined)
                                CreateTopGrid(item._id, item._tpl, item);

                            $(`#clothe-container-slots-${item._id}`).appendTo("#inventory").hide();
                        }
                    }
                    ItemDraggable(itemC, item, $(`#item-${item._id}`), true);
                }

                if (data.toInventory == firstInventory._inventoryId) 
                    firstInventory.items[item._id] = item;
                else if (data.toInventory == secInventory._inventoryId) 
                    secInventory.items[item._id] = item;
            }
        }
    }

    if (data.toInventory == firstInventory._inventoryId) {
        if (data.itemD.slotId == "firstweapon") {
            AttachToFastUse(1, data.itemD)
        } else if (data.itemD.slotId  == "secondweapon") {
            AttachToFastUse(2, data.itemD)
        }
    }

    WeightReCalculate()
}

function RemoveItem(RemoveData) {
    var item = firstInventory.items[RemoveData.itemID]
    var amount = RemoveData.amount

    if (item.info.CurrentStack > amount) {
        item.info.CurrentStack = parseInt(item.info.CurrentStack) - parseInt(amount);
        $(`#item-${item._id}`).find(".grid-item-amount").html(item.info.CurrentStack);
		$(`#item-${item._id}`).data("itemData", item);

        firstInventory.items[RemoveData.itemID] = item

        $.post("https://ls-inventoryhud/RemoveItem", JSON.stringify({
            itemData: item,
            isFullyRemove: false,
            inventoryId: firstInventory._inventoryId,
        }));
    } else if (item.info.CurrentStack == amount) {
        let size_x = item.loc.x + item._data.Width
        let size_y = item.loc.y + item._data.Height
        for (y_value= item.loc.y; y_value < size_y; y_value++) {
            for (x_value= item.loc.x; x_value < size_x; x_value++) {
                let current_slot = x_value + "-" + y_value

                $(`#grid-${item._parent}-${current_slot}-${item.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""}).data("isTaken", false);
            }
        }
        $(`#item-${item._id}`).remove();

        delete firstInventory.items[RemoveData.itemID];

        $.post("https://ls-inventoryhud/RemoveItem", JSON.stringify({
            itemData: item,
            isFullyRemove: true,
            inventoryId: firstInventory._inventoryId,
        }));
		
		if (GetItemAnyHotbar(RemoveData.itemID) != "empty" ) {
			CleanFastUse(GetItemAnyHotbar(RemoveData.itemID));
		}
    }

    WeightReCalculate()
}

function UseItemHotbar(key) {
    if (firstInventory.fastUse["Item"+key] != undefined) {
        AudioPlay("sounds/"+firstInventory.fastUse["Item"+key]._data.ItemSound+"_use.wav", 0.5)
        $.post("https://ls-inventoryhud/UseItem", JSON.stringify({
            fastUseInventory: firstInventory._inventoryId,
            key: key,
        }));
    }
}

function UseItemContext(itemD) {
    if (IsInContextMenu)
        IsInContextMenu = false; $("#context-menu").remove();

    AudioPlay("sounds/"+itemD._data.ItemSound+"_use.wav", 0.5)
    $.post("https://ls-inventoryhud/UseItemContext", JSON.stringify({
        inventoryItem: itemD,
    }));
}

function CloseInventory() {
    $("#inventory").fadeOut(500);
    $(`#fastuse`).fadeOut(500);

    $(`#attachment`).html(``);
    $(`#attachment`).fadeOut(500);

    IsInContextMenu = false
    $("#context-menu").remove();

    $(`#${secInventory._inventoryId}`).remove();
    $("#grid-container-label-secinventory").remove();
    secInventory = {};

    $.post("https://ls-inventoryhud/closeNUI", JSON.stringify({}));

    $(`#split-item`).hide();
    $("body").unbind("keypress");

    $(`.weight`).fadeOut(500);

    $(`.tooltip`).remove();
    $.each($(`.grid-item`), function(key, value) {
        $(value).css("opacity", 1)
    });

    InterruptSearchAction(containerParentID, searchFromProgress);
    
    var canvas = document.querySelector('#canvas');
    var context = canvas.getContext('2d');
    context.clearRect(0, 0, canvas.width, canvas.height);
}

$( "body" ).mousedown(function(e, ui){
    if ($(e.target).parent().parent().attr('id') != "context-menu" && IsInContextMenu) {
        IsInContextMenu = false
        $("#context-menu").remove();
    }
    if($(e.target).attr('id') != "split-range") {
        $(`#split-item`).hide();
        $("body").unbind("keypress");
    }

})

function OpenInventory() {
    $("#inventory").fadeIn(500);
    $(`#fastuse`).css("display", "flex");

    $(`.weight`).fadeIn(500);
}


var ColorSettings = Config.Colors

var ItemBase = {}

var firstInventory = {}
var secInventory = {}

function AudioPlay(name, volume) {
    $("#soundcheck").load(name, function(response, status, xhr) {
        $("#soundcheck").html("")
        if (status != "error") {
            var sound = new Audio(name);

            if (volume == undefined)
                volume = 1.0;
            sound.volume = volume;
            sound.play();
            return sound;
        }
    });
}

function AddItem(itemD, InventoryID) {
    var found = false;
    var currentFound = {};
    $.each($(`.${InventoryID} > div`), function(key ,value) {
        var parentD = $(value).data("itemData");
        if (parentD != undefined) {
            $.each(parentD._data.Grids, function(key2, value2) {
                if (!found) {
                    var test = findEmptySlots(parentD, value2.cellsH, value2.cellsV, value2._name, itemD);
                    if (JSON.stringify(test) != "{}") {
                        found = true;
                        currentFound = {slots: test, parentId: parentD._id, slotId: value2._name};
                    }
                }
            })
        }
    })
    console.log(currentFound)
    console.log(JSON.stringify(currentFound))
    if (JSON.stringify(currentFound) != "{}" && currentFound != undefined) {
        var objectKeysBefore = Object.keys(currentFound.slots)
        var len_before = objectKeysBefore.length, i = 0;

        var itemC = ColorSettings[itemD._data.Backgroundcolor]

        for (i; i < len_before; i++) {
            var key = objectKeysBefore[i]
            $(`#grid-${currentFound.parentId}-${key}-${currentFound.slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                .data({"isTaken": true, "itemData": itemD});
        }

        itemD._parent = currentFound.parentId
        var splitLOC = objectKeysBefore[0].split("-"); var x = parseInt(splitLOC[0]); var y = parseInt(splitLOC[1]);
        itemD.loc.x = x;
        itemD.loc.y = y;
        itemD.slotId = currentFound.slotId
        itemD.loc.r = temporaryRotated;

        $(`#inventory`).append(`<div class="grid-item" id="item-${itemD._id}"><span class="grid-item-name">${SetItemLabel(itemD)}</span>${AppendItemAmount(itemD)}<img src=${GetItemImage(itemD)} alt=${itemD._id} style="width: ${(itemD._data.Width*ResponsiveGridSize())+(itemD._data.Width*2)}px; height: ${(itemD._data.Height*ResponsiveGridSize())+(itemD._data.Height*2)}px"></div>`)
        SetItemBG(itemD);
        $(`#item-${itemD._id}`).css({ "width": (itemD._data.Width*ResponsiveGridSize())+(itemD._data.Width*2)+"px", "height": (itemD._data.Height*ResponsiveGridSize())+(itemD._data.Height*2)+"px" })
                                .data("itemData", itemD);

        $(`#item-${itemD._id}`).appendTo(`#grid-${currentFound.parentId}-${objectKeysBefore[0]}-${currentFound.slotId}`);

        if (ThisSlotHaveAnyContainerInUI(currentFound.slotId)) {
            $(`#item-${itemD._id}`).css({ "width": SetItemWidthNHeight(itemD.slotId, true), "height": SetItemWidthNHeight(itemD.slotId, false) }).find("img").css({ "width": SetItemWidthNHeight(itemD.slotId, true), "height": SetItemWidthNHeight(itemD.slotId, false) });
            CreateTopGrid(itemD._id, itemD._tpl, itemD);
        }
        
        if (itemD._data.Type == "container" && !ThisSlotHaveAnyContainerInUI(currentFound.slotId)) {
            CreateTopGrid(itemD._id, itemD._tpl, itemD);

            $(`#clothe-container-slots-${itemD._id}`).appendTo("#inventory").hide();
        }

        firstInventory.items[itemD._id] = itemD
        SetItem(itemD, null, GetItemSlotInventory(itemD._id), objectKeysBefore[0], temporaryRotated, currentFound.slotId, currentFound.parentId)
        ItemDraggable(itemC, itemD, $(`#item-${itemD._id}`), true)

        checkClothing(itemD, firstInventory._inventoryId, itemD.slotId)
    }
}

function Inventory(inventoryD) {
    var data = inventoryD.inventory

    firstInventory = data;
    



    data.items = ReadyItems(data);

    SetupInventory(data);

    var text = ""
    if (hudHA)
        text = `<div class="healthbar"> <div class="icon"><i class="fas fa-heart"></i></div><div class="label-first" id="healthLabelFirst"></div><div class="label-sec" id="healthLabel"></div> <div class="bar-progress"> <div class="progress-bar-circ" id="healthProgess" style="height:100%; width:100%"></div> </div> </div> <div class="stamina"> <div class="icon"><i class="fas fa-user-shield"></i></div><div class="label-first" id="staminaLabelFirst"></div><div class="label-sec" id="staminaLabel"></div> <div class="bar-progress"> <div class="progress-bar-circ" id="staminaProgess" style="height:100%; width:100%"></div> </div> </div>`
    $(`#${firstInventory._inventoryId}`).append(`            <div id="clothing-circle">

    ${text}
    <div class="weight">
        <div class="icon"><i class="fas fa-cubes"></i></div><div class="label-first" id="weightLabelFirst"></div><div class="label-sec" id="weightLabel"></div>
        <div class="bar-progress">
            <div class="progress-bar-circ" id="weightProgress" style="height:100%; width:0"></div>
        </div>
    </div>
</div>`);

    SetupFastAccess(data);
    
}

function SetupFastAccess(data) {
    for(i=1; i<11; i++) {
        if (i != 10) {
            $(`#fastuse`).append(`<div class="fastuse-item" id="Item${i}"><h1>${i}</h1></div>`)
            if (i == 2)
                $(`#fastuse`).append('<span class="space-betweerweapon"></span>');
        } else {
            $(`#fastuse`).append(`<div class="fastuse-item" id="Item${i-10}"><h1>${i-10}</h1></div>`)
        }
    }

    if (Object.keys(data.fastUse).length > 0) {
        $.each(data.fastUse, function(key, value) {
            var itemSlot = parseInt(key.replace("Item", ""))

            AttachToFastUse(itemSlot, data.items[value])
        })
    }
}

function GetItemAnyHotbar(itemID) {
    for(i=0; i<10; i++) {
        var quickUseKey = $(`#Item${i}`).data("itemData")
        if (quickUseKey != undefined) {
            if (quickUseKey._id == itemID) {
                return i;
            }
        }
    }
    return "empty";
}


function CleanFastUse(key) {
    $(`#Item${key}`).data("itemData", "")
                        .html(`<h1>${key}</h1>`);

    SetFastUse("Remove", firstInventory._inventoryId, firstInventory.fastUse["Item"+key], key)
    delete firstInventory.fastUse["Item"+key];
}

function AttachToFastUse(key, itemData) {
    if(itemData == undefined)
        return;
    
    $(`#Item${key}`).data("itemData", itemData)
                        .html(`<h1>${key}</h1><img src="${GetItemImage(itemData)}" alt="${itemData._id}">`);

    firstInventory.fastUse["Item"+key] = itemData;

    SetFastUse("Add", firstInventory._inventoryId, itemData._id, key)
}

function SetFastUse(status, toInventory, itemData, fastUseKey) {
    $.post("https://ls-inventoryhud/FastUseChanged", JSON.stringify({
        typeFastUse: status,
        fastUseInventory: toInventory,
        fastUseItemData: itemData,
        fastUseKey: fastUseKey,
    }));
}

$(document).keydown(function(e) {
    if (e.keyCode >= 48 && e.keyCode <= 57) {
        let codeOfKey = e.keyCode-48
        if (codeOfKey > 2 || codeOfKey == 0) {
            let elements = document.elementsFromPoint(mousePOS.x, mousePOS.y);
            let fastLen = elements.length, k = 0;
            for (k; k < fastLen; k++) {
                value = elements[k]
                if (value.tagName === "DIV") {
                    if (value.classList.contains("grid-item")) {
                        var itemD = $(value).data("itemData")

                        if (!isInventoryPlayer(itemD))
                            return;
                        
                        if (itemD._data.Type == "Weapon" || itemD._data.Type == "container" || itemD._data.Type == "Clothing")
                            return;
                        
                        var quickUseKey = $(`#Item${codeOfKey}`).data("itemData")
                        var isInHotbar = GetItemAnyHotbar(itemD._id)

                        if (quickUseKey == undefined) {
                            if (isInHotbar == "empty") {
                                AttachToFastUse(codeOfKey, itemD)
                            } else {
                                if (isInHotbar != codeOfKey) {
                                    CleanFastUse(isInHotbar);

                                    AttachToFastUse(codeOfKey, itemD);
                                } else {
                                    CleanFastUse(codeOfKey);
                                }
                            }
                        } else {
                            if (isInHotbar == "empty") {
                                CleanFastUse(codeOfKey)

                                AttachToFastUse(codeOfKey, itemD)
                            } else {
                                if (isInHotbar != codeOfKey) {
                                    CleanFastUse(isInHotbar);

                                    AttachToFastUse(codeOfKey, itemD);
                                } else {
                                    CleanFastUse(codeOfKey);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
});

function changeValue(data) {
    $(`#range-value`).html(data)
}

function InventorySec(inventoryData) {
    var data = inventoryData.inventory
    secInventory = data;

    data.items = ReadyItems(data)

    SetupInventory(data);
}

function SetupShop(inventoryData) {
    var data = inventoryData.inventory
    secInventory = data;

    data.items = ReadyItems(data)

    SetupGrids(data);

    $.each(data.shopItems[0], function(key, value) {
        AddItem(value, "zfrko4gdc7h0cg8cd9xfsjkk")
    })

}

function GenerateID(length) {
    var result           = '';
    var characters       = 'abcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}


function SetupInventory(data) {
    SetupGrids(data);

    SetupItems(data);
}

function ParentSlotIDClothing(itemD, itemLIST) {
    if (ThisSlotHaveAnyContainerInUI(itemD.slotId))
        return true;
    

    return false;
}

function SetupItems(data) {
    
    $.each(data.items, function(key ,value) {
        if (value.loc) {
            if (!ParentSlotIDClothing(value, data.items))
                SetupItemSlots(value._parent, parseInt(value.loc.x), parseInt(value.loc.y), parseInt(value.loc.r), ColorSettings[value._data.Backgroundcolor], value)
            else {
                SetupItemSlots(value._parent, parseInt(value.loc.x), parseInt(value.loc.y), parseInt(value.loc.r), ColorSettings[value._data.Backgroundcolor], value, false)
            }
        }

        if (!value.isSearched) {
            if (value._data.Grids != undefined) {
                if (Object.keys(value._data.Grids).length > 0){
                    $(`#clothe-container-slots-${value._id} > div`).hide();
                    $(`#clothe-container-slots-${value._id}`).append(`<div class="non-searched-container" id="non-searched-container-${value._id}"><span>UNSEARCHED</span></div>`)
                    MakeContainerSearch(value);
                }
            }
        }

    })
}

function AppendItemAmount(itemD) {
    if (itemD._data.MaxStack > 1) {
        if (itemD.info == undefined)
            itemD.info = {}
        
        if (itemD.info.CurrentStack == undefined)
            itemD.info.CurrentStack = 1
        
        return `<span class="grid-item-amount">${itemD.info.CurrentStack}</span>`
    }
    return ``
}

function SetupItemSlots(itemP, itemX, itemY, itemR, itemC, itemD, status) {
    if (status == undefined)
        status = true;
    
    var gridFirstBlock =  $(`.grid-${itemP}-${itemX}-${itemY}-${itemD.slotId}`);
    if (status) {
        $(gridFirstBlock).append(`<div class="grid-item" id="item-${itemD._id}"><span class="grid-item-name">${SetItemLabel(itemD)}</span>${AppendItemAmount(itemD)}<img src=${GetItemImage(itemD)} alt=${itemD._id} style="width: ${(itemD._data.Width*ResponsiveGridSize())+(itemD._data.Width*2)}px; height: ${(itemD._data.Height*ResponsiveGridSize())+(itemD._data.Height*2)}px"></div>`)
        SetItemBG(itemD);
        $(`#item-${itemD._id}`).css({ "width": (itemD._data.Width*ResponsiveGridSize())+(itemD._data.Width*2)+"px", "height": (itemD._data.Height*ResponsiveGridSize())+(itemD._data.Height*2)+"px" })
                                .data("itemData", itemD);
    } else {
        if (itemD._data.Type != "Weapon") {
            $(`#image-grid-${itemD._parent}-0-0-${itemD._data.AttachableSlot}`).hide();
            $(`.grid-container-label-${itemD._data.AttachableSlot}-${itemD._parent}`).hide();
            
            $(gridFirstBlock).append(`<div class="grid-item" id="item-${itemD._id}"><span class="grid-item-name">${SetItemLabel(itemD)}</span>${AppendItemAmount(itemD)}<img src=${GetItemImage(itemD)} alt=${itemD._id} style="width: ${SetItemWidthNHeight(itemD.slotId, true)}; height: ${SetItemWidthNHeight(itemD.slotId, false)}"></div>`)
            SetItemBG(itemD);
            $(`#item-${itemD._id}`).css({ "width": SetItemWidthNHeight(itemD.slotId, true), "height": SetItemWidthNHeight(itemD.slotId, false) })
                                    .data("itemData", itemD);
        } else {
            $(gridFirstBlock).append(`<div class="grid-item" id="item-${itemD._id}"><span class="grid-item-name">${SetItemLabel(itemD)}</span>${AppendItemAmount(itemD)}<img src=${GetItemImage(itemD)} alt=${itemD._id} style="width: ${ResponsiveWeaponSlot(true)}; height: ${ResponsiveWeaponSlot(false)}"></div>`)
            SetItemBG(itemD);
            $(`#item-${itemD._id}`).css({ "width": ResponsiveWeaponSlot(true), "height": ResponsiveWeaponSlot(false) })
                                    .data("itemData", itemD);
        }
    }
	
	if (itemD.loc.r == 1) {
		$(`#item-${itemD._id}`).css("transform", "rotate(-90deg) translateX(-100%)");
		var tempH = JSON.parse(JSON.stringify(itemD._data.Height));
		var tempW = JSON.parse(JSON.stringify(itemD._data.Width));
		itemD._data.Height = tempW;
		itemD._data.Width = tempH;
	}
		


    for (y_v = itemY; y_v< itemD._data.Height + itemY; y_v++) {
        for (x_v = itemX; x_v < itemD._data.Width + itemX; x_v++) {
            var slot_id = x_v +"-"+y_v
            var currentGrid = $(`.grid-${itemP}-${slot_id}-${itemD.slotId}`);
            $(currentGrid).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                          .data({"isTaken": true, "itemData": itemD});
        }
    }

    ItemDraggable(itemC, itemD, $(`#item-${itemD._id}`), status)
}

function findItemFromInventory(id) {
    var item = null;
    $.each(firstInventory.items, function(key, value){
        if (value != undefined) {
            if (id == value._id) {
                item = value
            }
        }
    })

    $.each(secInventory.items, function(key, value){
        if (value != undefined) {
            if (id == value._id) {
                item = value
            }
        }
    })

    return item;
}


function ContainerCanPlaceable(itemD, gridD) {
    var _ = true;
    _ = isItemContainAnyThing(itemD, gridD)

    if (gridD != undefined) {
        if (itemD._id == gridD) {
            _ = false;
        }
    }

    return _;
}

function CanBeAttachableToSlots(slotID, itemD) {
    if (itemD._data.AttachableSlot != undefined)
        if (slotID == itemD._data.AttachableSlot.toLowerCase())
            return true;
    return false;
}

function CheckSlotIsClothing(slotID, itemD) {
    if (ThisSlotHaveAnyContainerInUI(slotID))
        if (slotID == "firstweapon" || slotID == "secondweapon")
            if (itemD.type == "Weapon")
                return true;

    if (ThisSlotHaveAnyContainerInUI(slotID))
        if (itemD._data.AttachableSlot == undefined || slotID != itemD._data.AttachableSlot.toLowerCase())
            return false;

    return true;
}

function IsItemWeapon(slotID, itemD) {
    if (slotID == "firstweapon" || slotID == "secondweapon") 
        if (itemD._data.Type != undefined)
            if (itemD._data.Type == "Weapon")
                return true;

    return false;
}

function findEmptySlots(parentD, Width, Height, slotID, itemD) {
    let fResult = {}
    
    let result = {}
    let realFound = false
    var tempITEM = JSON.parse(JSON.stringify(itemD))
    if (CheckSlotIsClothing(slotID, tempITEM)) {
        if (ThisSlotHaveAnyContainerInUI(slotID)){
            tempITEM._data.Width = 1; tempITEM._data.Height = 1;
        }
        
        for(x_value = 0; x_value<Width; x_value++) {
            for(y_value = 0; y_value<Height; y_value++) {
            
                let x_found = false
                let isSlotOccupied = isAnySlotOccupied(parentD, x_value, y_value, slotID, tempITEM._data.Width)
                if(typeof(isSlotOccupied) !== "object"){
                    x_found = false;
                    x_value = isSlotOccupied;
                } else if (JSON.stringify(isSlotOccupied) == "{}") {
                    x_found = false;
                    x_value = isSlotOccupied;
                } else {
                    x_found = true
                    result = isSlotOccupied
                }
                if (x_found) {
                    let y_found = false
                    let isSlotOccupiedY = isAnySlotOccupiedY(parentD, isSlotOccupied, slotID, tempITEM._data.Height, tempITEM)
                    if(!isSlotOccupiedY){
                        result = {}
                        y_found = false;
                    } else {
                        y_found = true
                        $.each(isSlotOccupiedY, function(key, value){
                            result[key] = value
                        })
                    }
                    if (y_found && !realFound) {
                        fResult = result
                        realFound = true
                        break;
                    }
                    
                }
                
            }
        }
    }
    return fResult;
}

function findListObject(list, index, val_) {
    let value = Object.keys(list)[index];
    let split_ = value.split("-")
    let val = parseInt(split_[val_])
    return val
}

function isAnySlotOccupiedY(parentD, data_table, slotID, size, itemD) {
    let returnList = {}
    let found = true
    let x_first = findListObject(data_table, 0, 0)
    let y_first = findListObject(data_table, 0, 1)
    size = size+y_first
    $.each(data_table, function(key, _){
        let split_ = key.split("-")
        let x = parseInt(split_[0])
        let y = parseInt(split_[1])
        for (x_value=x_first; x_value<(x+1); x_value++)  {
            for(i=y; i<size; i++) {

                let current_slot = x_value +"-"+ i

                if (($(`#grid-${parentD._id}-${current_slot}-${slotID}`).data("isTaken") || $(`#grid-${parentD._id}-${current_slot}-${slotID}`).data("isTaken") == undefined) && !$(`#grid-${parentD._id}-${current_slot}-${slotID}`).length) {
                    returnList = {}
                    found = false
                    return;
                } else {
                    returnList[current_slot] = true
                }
            }
        }
    })
    if (found) 
        return returnList
    else
        return false
}

function isAnySlotOccupied(parentD, start_slot, second_slot, slotID, size) {
    let returnList = {}
    let found = true
    size = start_slot + size
    for (i=start_slot; i<size; i++) {
        let current_slot = i +"-"+ second_slot
        if ($(`#grid-${parentD._id}-${current_slot}-${slotID}`).data("isTaken") || $(`#grid-${parentD._id}-${current_slot}-${slotID}`).data("isTaken") == undefined) {
            returnList = {}
            found = false
            return i;
        } else {
            returnList[current_slot] = true
        }
    }
    if (found) 
        return returnList
}

function FindEmptySlot(parentD, itemD) {
    var found = false;
    var currentFound = {};
    $.each(parentD._data.Grids, function(key ,value) {
        if (!found) {
            var test = findEmptySlots(parentD, value.cellsH, value.cellsV, value._name, itemD);
            if (JSON.stringify(test) != "{}") {
                found = true;
                currentFound = {slots: test, parentId: parentD._id, slotId: value._name};
            }
        }
    });
    if (found)
        return currentFound;
    else
        return false;
}

function CheckSlotIsWeaponSlot(temporaryValue, itemD) {
    if (temporaryValue.slotId == "firstweapon" || temporaryValue.slotId == "secondweapon") {
        if (IsItemWeapon(temporaryValue.slotId, itemD)) {
            if(!temporaryValue.isTaken) {
                objectPlacable = true;
                objectPuttable = false;
            }else {
                objectPlacable = false;
                objectPuttable = false;
            }
        } else {
            objectPlacable = false;
            objectPuttable = false;
        }
    }
}

function CheckAndSetupStacks(itemD, targetD) {
    if (itemD.info != undefined) {
        if (targetD.itemData.info == undefined)
            targetD.itemData.info = { "CurrentStack": 1 }

        if (itemD.info.CurrentStack == undefined)
            itemD.info.CurrentStack = 1

        if (targetD.itemData.info.CurrentStack == undefined)
            targetD.info.CurrentStack = 1

    } else {
        itemD.info = { "CurrentStack": 1 }
        if (targetD.itemData.info == undefined)
            targetD.itemData.info = { "CurrentStack": 1 } 
        
        if (targetD.itemData.info.CurrentStack == undefined)
            targetD.info.CurrentStack = 1
    }
}

function UpdateDrawSlots(value, itemD) {
    var dataList = $(value).data()
    var gridSQ = $(`.grid-${dataList.parentId}-${dataList.slotLocation}-${dataList.slotId}`)
    if (paintedBefore._slots != undefined) {
        let objectKeysBefore = Object.keys(paintedBefore._slots)
        var len_before = objectKeysBefore.length, i = 0;
        for (i; i < len_before; i++) {
            let key = objectKeysBefore[i]
            if ($(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).data("isTaken")) {
                var tempC = ColorSettings[$(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).data("itemData")._data.Backgroundcolor]
                $(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).css({"background": "var(--grid-color)", "border-color": tempC._borderColor})
            } else {
                $(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""})
            }
        }
    }

    let slots = DragSlots(gridSQ, dataList, itemD)
    
    let objectKeys = Object.keys(slots)
    var len = objectKeys.length, i = 0;
    for (i; i < len; i++) {
        let key = objectKeys[i];
        let value_ = slots[key];

        objectPlacable = false;
        objectPuttable = false;
        objectStackable = false;
        objectAttachable = false; 
        
        var temporaryValue = $(`#grid-${dataList.parentId}-${objectKeys[0]}-${dataList.slotId}`).data();
        
        if (!value_) {
            if (ParentSlotIDClothing(dataList)) {
                if ((objectKeys[0] == CreateXYITEM(itemD) && itemD._parent == temporaryValue.parentId && temporaryValue.slotId == itemD.slotId && itemD.loc.r == temporaryRotated)) {
                    objectPlacable = false; 
                } else {
                    if (CanBeAttachableToSlots(temporaryValue.slotId, itemD)) {
                        if(!temporaryValue.isTaken) {
                            objectPlacable = true;
                        }
                    }
                }
                CheckSlotIsWeaponSlot(temporaryValue, itemD)
            } else {
                CheckSlotIsWeaponSlot(temporaryValue, itemD)
                if (temporaryValue.itemData != undefined) {
                    if (temporaryValue.itemData._data.Type == "container" && temporaryValue.itemData._id != itemD._id) {
                        var isFoundEmpty = FindEmptySlot(temporaryValue.itemData, itemD)
                        if (isFoundEmpty) {
                            if (!objectPuttable) {
                                let objectKeys_ = Object.keys(isFoundEmpty.slots)
                                var len = objectKeys_.length, i = 0;
                                for (i; i < len; i++) {
                                    let key_ = objectKeys_[i]; let value__ = isFoundEmpty.slots[key_]
                                    if (value__) {
                                        objectPuttable = true;
                                        puttableSlots = isFoundEmpty;
                                    }
                                }
                            } else {
                                objectPuttable = true;
                            }
                        }
                    }
                }
            }

            if (temporaryValue.itemData != undefined) {
                if (itemD._name == temporaryValue.itemData._name) {
                    CheckAndSetupStacks(itemD, temporaryValue);
                    if (temporaryValue.itemData.info.CurrentStack < itemD._data.MaxStack){
                        if (temporaryValue.itemData._id != itemD._id){
                            objectStackable = true;
                        }
                    }
                }
            }

            if (temporaryValue.itemData != undefined){
                if (temporaryValue.itemData._data.Type == "Weapon") {
                    if(temporaryValue.itemData._id != itemD._id) {
                        if (FindItemHasAttachment(temporaryValue.itemData, itemD)) {
                            var list = {}
                            if (temporaryValue.itemData.info.attachment != undefined && JSON.stringify(temporaryValue.itemData.info.attachment) != "[]") 
                                list = temporaryValue.itemData.info.attachment;
                            
                            if (list[itemD.info.attach_component] == undefined) {
                                objectAttachable = true
                            }
                        }
                    }
                }
            }

        } else {
            if (ContainerCanPlaceable(itemD, $(`#grid-${dataList.parentId}-${key}-${dataList.slotId}`).data("parentId") )) {
                objectPlacable = true;
            }
            CheckSlotIsWeaponSlot(temporaryValue, itemD)
            if (!CheckSlotIsClothing(temporaryValue.slotId, itemD)) {
                objectPlacable = false;
            }
        }

        if (firstInventory.items[temporaryValue.parentId] != undefined) {
            var item = firstInventory.items[temporaryValue.parentId]

            var value =  ControlItemCanPlacedContanier(item, itemD)

            if (value.IsChanged) {
                if (objectPlacable)
                    objectPlacable = value.CanBePlaced
            }

            if (objectPuttable) {
                var value2 =  ControlItemCanPlacedContanier(temporaryValue.itemData, itemD)
                if (value2.IsChanged)
                    objectPuttable = value2.CanBePlaced
            }
        } else if (secInventory.items[temporaryValue.parentId] != undefined) {
            var item = secInventory.items[temporaryValue.parentId]

            var value =  ControlItemCanPlacedContanier(item, itemD)

            if (value.IsChanged) {
                if (objectPlacable)
                    objectPlacable = value.CanBePlaced
            }

            if (objectPuttable) {
                var value2 =  ControlItemCanPlacedContanier(temporaryValue.itemData, itemD)
                if (value2.IsChanged)
                    objectPuttable = value2.CanBePlaced
            }
        }



        if (GetItemSlotInventory(temporaryValue.parentId) == secInventory._inventoryId) {
            if (secInventory._inventoryId.includes("SHOP")) {
                objectPlacable = false;
                objectPuttable = false;
                objectStackable = false;
                objectAttachable = false; 
            }
        }

        
        if (GetItemSlotInventory(itemD._parent) == secInventory._inventoryId) {
            if (secInventory._inventoryId.includes("SHOP")) {
                objectPuttable = false; objectStackable = false; objectAttachable = false; 
            }
        }


        if (objectPlacable || objectStackable) {
            $(`#grid-${dataList.parentId}-${key}-${dataList.slotId}`).css("background-color", "green")
        } else if (objectAttachable || objectPuttable){
            $(`#grid-${dataList.parentId}-${key}-${dataList.slotId}`).css("background-color", "white")
        } else {
            $(`#grid-${dataList.parentId}-${key}-${dataList.slotId}`).css("background-color", "red")
        }
    }
    
    locatedSlots = slots
    paintedBefore = {"_slots": slots, "_parentId": dataList.parentId, "_slotId": dataList.slotId}
}

function ControlItemCanPlacedContanier(item, itemD) {
    var canBePlaced = false;
    var isChanged = false;
    if (item._data.authorizedCategory != undefined) {
        if (item._data.authorizedCategory[itemD._data.Type] != undefined && item._data.authorizedCategory[itemD._data.Type]) {
            canBePlaced = true;
            isChanged = true;
        } else {
            canBePlaced = false;
            isChanged = true;
        }
    }

    if (item._data.authorizedItems != undefined) {
        if (item._data.authorizedItems[itemD._tpl] != undefined && item._data.authorizedItems[itemD._tpl]) {
            canBePlaced = true;
            isChanged = true;
        }
    }

    if (item._data.restrictedItems != undefined) {
        if (item._data.restrictedItems[itemD._tpl] != undefined && item._data.restrictedItems[itemD._tpl]) {
            canBePlaced = false;
            isChanged = true;
        }
    }

    return {CanBePlaced: canBePlaced, IsChanged: isChanged}
}

function ItemDraggable(itemC, itemD, itemOBJ, status) {
    $(itemOBJ).draggable({
        revertDuration: 0,
        revert: "invalid",
        cursorAt: {
            top: 10,
            left: 10
        },
        scroll: false,
        helper: function(){
            $copy = $(this).clone();
            $copy.css("z-index", "999999")
            return $copy;},

        appendTo: 'body',
        drag: function(e , ui) {
            var isAnySlotPainted = false

            let elements = document.elementsFromPoint(e.pageX, e.pageY);

            let fastLen = elements.length, k = 0;
            for (k; k < fastLen; k++) {
                value = elements[k]
                if (value.tagName === "DIV") {
                    if (value.classList.contains("grid")) {
                        UpdateDrawSlots(value, itemD)
                        isAnySlotPainted = true;
                        break;
                    }
                }
            }

            if (!isAnySlotPainted) {
                if (paintedBefore._slots != undefined) {
                    let objectKeysBefore = Object.keys(paintedBefore._slots)
                    var len_before = objectKeysBefore.length, i = 0;
                    for (i; i < len_before; i++) {
                        let key = objectKeysBefore[i]
                        $(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""})
                    }

                    objectPlacable = false;
                }
            }
        },
        start: function(e,ui) {
            AudioPlay("sounds/"+itemD._data.ItemSound+"_pickup.wav", 0.5)

            var dataList = $(`.grid-${itemD._parent}-${itemD.loc.x}-${itemD.loc.y}-${itemD.slotId}`).data();

            var gridSQ = $(`.grid-${dataList.parentId}-${dataList.slotLocation}-${dataList.slotId}`)

            let slots = DragSlots(gridSQ, dataList, itemD)
            baseSlots = slots;

            let objectKeys = Object.keys(slots)
            var len = objectKeys.length, i = 0;

            for (i; i < len; i++) {
                let key = objectKeys[i]
                $(`#grid-${dataList.parentId}-${key}-${dataList.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""})
                                                                         .data("isTaken", false);
            }

            itemDrag = {
                "isDragging": true,
                "itemDATA": itemD,
            }

            temporaryRotated = itemD.loc.r

            $(this).css({"isolation": "unset"});
        },
        stop: function(e,ui) {
            $(this).css("z-index", "");
            itemDrag = {
                "isDragging": false,
                "itemDATA": "",
            }
            itemD = $(`#item-${itemD._id}`).data("itemData")

            AudioPlay("sounds/"+itemD._data.ItemSound+"_drop.wav", 0.5)
            var gridSQ = $(`.grid-${itemD._parent}-${itemD.loc.x}-${itemD.loc.y}-${itemD.slotId}`);
            var dataList = $(gridSQ).data();
            let slots = baseSlots;

            if (paintedBefore._slots != undefined) {
                var objectKeysBefore = Object.keys(paintedBefore._slots)
                var len_before = objectKeysBefore.length, i = 0;
                for (i; i < len_before; i++) {
                    var key = objectKeysBefore[i]
                    $(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""})
                }
            }

            if (objectPlacable) {

                if (e.shiftKey) {
                    RevertGrids(itemC, slots, dataList, true)
                    if (1 < itemD._data.MaxStack) {
                        if (itemD.info != undefined) {
                            if (itemD.info.CurrentStack != undefined) {
                                if (itemD.info.CurrentStack > 1) {
                                    $(`#split-item`).show();
                                    $(`#split-item`).css({"top": mousePOS.y-20, "left": mousePOS.x-100});
                                    $(`#split-range`).prop("max", itemD.info.CurrentStack-1);
                                    $(`#split-range`).prop("value", 1);
                                    $(`#range-value`).html("1")
                                    $("body").keypress(function(event) {
                                        var keycode = (event.keyCode ? event.keyCode : event.which);
                                        if(keycode == '13'){
                                            var amount = $(`#split-range`).val()

                                            if (GetItemSlotInventory(dataList.parentId) == secInventory._inventoryId && secInventory._inventoryId.includes("SHOP-")) {
                                                $.post('https://ls-inventoryhud/checkPrice', JSON.stringify({
                                                    item: itemD,
                                                    amount: amount
                                                }), function( callback ) {
                                                    if (callback) {
                                                        itemD.info.CurrentStack = parseInt(itemD.info.CurrentStack) - parseInt(amount);

                                                        SetItem(itemD, null, GetItemSlotInventory(itemD._id), CreateXYITEM(itemD), itemD.loc.r, itemD.slotId, itemD._parent, true)
                                                        $(`#item-${itemD._id}`).find(".grid-item-amount").html(itemD.info.CurrentStack);
                                                        var newID = GenerateID(22)
            
                                                        var newItem = JSON.parse(JSON.stringify(itemD))
                                                        newItem.info.CurrentStack = parseInt(amount)
                                                        newItem._id = newID;
            
                                                        var objectKeysBefore = Object.keys(paintedBefore._slots)
                                                        var len_before = objectKeysBefore.length, i = 0;
            
                                                        for (i; i < len_before; i++) {
                                                            var key = objectKeysBefore[i]
                                                            $(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                                                                .data({"isTaken": true, "itemData": newItem});
                                                        }
            
                                                        newItem._parent = paintedBefore._parentId
                                                        var splitLOC = objectKeysBefore[0].split("-"); var x = parseInt(splitLOC[0]); var y = parseInt(splitLOC[1]);
                                                        newItem.loc.x = x;
                                                        newItem.loc.y = y;
                                                        newItem.slotId = paintedBefore._slotId
                                                        newItem.loc.r = temporaryRotated;

                                                        newItem.price = undefined;
            
                                                        if(GetItemSlotInventory(paintedBefore._parentId)) {
                                                            firstInventory.items[newItem._id] = newItem;
                                                        } else {
                                                            secInventory.items[newItem._id] = newItem;
                                                        }
                                                        SetItem(newItem, null, GetItemSlotInventory(paintedBefore._parentId), objectKeysBefore[0], temporaryRotated, paintedBefore._slotId, paintedBefore._parentId)
            
                                                        $(`#inventory`).append(`<div class="grid-item" id="item-${newItem._id}"><span class="grid-item-name">${SetItemLabel(newItem)}</span>${AppendItemAmount(newItem)}<img src=${GetItemImage(newItem)} alt=${newItem._id} style="width: ${(newItem._data.Width*ResponsiveGridSize())+(newItem._data.Width*2)}px; height: ${(newItem._data.Height*ResponsiveGridSize())+(newItem._data.Height*2)}px"></div>`)
                                                        SetItemBG(newItem);
                                                        $(`#item-${newItem._id}`).css({ "width": (newItem._data.Width*ResponsiveGridSize())+(newItem._data.Width*2)+"px", "height": (newItem._data.Height*ResponsiveGridSize())+(newItem._data.Height*2)+"px" })
                                                                                .data("itemData", newItem);
            
                                                        $(`#item-${newItem._id}`).appendTo(`#grid-${paintedBefore._parentId}-${objectKeysBefore[0]}-${paintedBefore._slotId}`);
                                                        $(`.grid-${newItem._parent}-${objectKeysBefore[0]}-${newItem.slotId}`).data("itemData", newItem);
            
                                                        ItemDraggable(itemC, newItem, $(`#item-${newItem._id}`), true);
                                                    } else {
                                                        RevertGrids(itemC, slots, dataList, true)
                        
                                                        temporaryRotated = itemD.loc.r;
                                                        itemD.loc.r = temporaryRotated;
                                        
                                                        FixPlacing(itemD, itemOBJ);
                                        
                                                        SetupDrag(itemD, temporaryRotated)
                                                    }
                                                });
                                            } else {
                                                itemD.info.CurrentStack = parseInt(itemD.info.CurrentStack) - parseInt(amount);
                                                    SetItem(itemD, null, GetItemSlotInventory(itemD._id), CreateXYITEM(itemD), itemD.loc.r, itemD.slotId, itemD._parent, true)
                                                    $(`#item-${itemD._id}`).find(".grid-item-amount").html(itemD.info.CurrentStack);
                                                    var newID = GenerateID(22)
        
                                                    var newItem = JSON.parse(JSON.stringify(itemD))
                                                    newItem.info.CurrentStack = parseInt(amount)
                                                    newItem._id = newID;
        
                                                    var objectKeysBefore = Object.keys(paintedBefore._slots)
                                                    var len_before = objectKeysBefore.length, i = 0;
        
                                                    for (i; i < len_before; i++) {
                                                        var key = objectKeysBefore[i]
                                                        $(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                                                            .data({"isTaken": true, "itemData": newItem});
                                                    }
        
                                                    newItem._parent = paintedBefore._parentId
                                                    var splitLOC = objectKeysBefore[0].split("-"); var x = parseInt(splitLOC[0]); var y = parseInt(splitLOC[1]);
                                                    newItem.loc.x = x;
                                                    newItem.loc.y = y;
                                                    newItem.slotId = paintedBefore._slotId
                                                    newItem.loc.r = temporaryRotated;
        
                                                    if(GetItemSlotInventory(paintedBefore._parentId)) {
                                                        firstInventory.items[newItem._id] = newItem;
                                                    } else {
                                                        secInventory.items[newItem._id] = newItem;
                                                    }
                                                    SetItem(newItem, null, GetItemSlotInventory(paintedBefore._parentId), objectKeysBefore[0], temporaryRotated, paintedBefore._slotId, paintedBefore._parentId)
        
                                                    $(`#inventory`).append(`<div class="grid-item" id="item-${newItem._id}"><span class="grid-item-name">${SetItemLabel(newItem)}</span>${AppendItemAmount(newItem)}<img src=${GetItemImage(newItem)} alt=${newItem._id} style="width: ${(newItem._data.Width*ResponsiveGridSize())+(newItem._data.Width*2)}px; height: ${(newItem._data.Height*ResponsiveGridSize())+(newItem._data.Height*2)}px"></div>`)
                                                    SetItemBG(newItem);
                                                    $(`#item-${newItem._id}`).css({ "width": (newItem._data.Width*ResponsiveGridSize())+(newItem._data.Width*2)+"px", "height": (newItem._data.Height*ResponsiveGridSize())+(newItem._data.Height*2)+"px" })
                                                                            .data("itemData", newItem);
        
                                                    $(`#item-${newItem._id}`).appendTo(`#grid-${paintedBefore._parentId}-${objectKeysBefore[0]}-${paintedBefore._slotId}`);
                                                    $(`.grid-${newItem._parent}-${objectKeysBefore[0]}-${newItem.slotId}`).data("itemData", newItem);
        
                                                    ItemDraggable(itemC, newItem, $(`#item-${newItem._id}`), true);
                                            }
                                        }

                                        $(`#split-item`).hide();
                                        $("body").unbind("keypress");
                                    });
                                }
                            }
                        }
                    }
                } else {
                    if (GetItemSlotInventory(dataList.parentId) == secInventory._inventoryId && secInventory._inventoryId.includes("SHOP-")) { 
                        $.post('https://ls-inventoryhud/checkPrice', JSON.stringify({
                            item: itemD,
                            amount: itemD.info.CurrentStack,
                        }), function( callback ) {
                            if (callback) {
                                RevertGrids(itemC, slots, dataList, false)

                                itemD.price = undefined;

                                if (ParentSlotIDClothing(itemD)) {
                                    DragFromClothContainer(itemD, itemOBJ)
                                }
            
                                
                                var objectKeysBefore = Object.keys(paintedBefore._slots)
                                var len_before = objectKeysBefore.length, i = 0;
                                for (i; i < len_before; i++) {
                                    var key = objectKeysBefore[i]
                                    $(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                                        .data({"isTaken": true, "itemData": itemD});
                                }
            
                                SetItem(itemD, GetItemSlotInventory(itemD._id), GetItemSlotInventory(paintedBefore._parentId), objectKeysBefore[0], temporaryRotated, paintedBefore._slotId, paintedBefore._parentId)
                                    
                                itemD._parent = paintedBefore._parentId
                                var splitLOC = objectKeysBefore[0].split("-"); var x = parseInt(splitLOC[0]); var y = parseInt(splitLOC[1]);
                                itemD.loc.x = x;
                                itemD.loc.y = y;
                                itemD.slotId = paintedBefore._slotId
                                itemD.loc.r = temporaryRotated;
            
                                $(itemOBJ).appendTo(`#grid-${paintedBefore._parentId}-${objectKeysBefore[0]}-${paintedBefore._slotId}`)
            
                                FixPlacing(itemD, itemOBJ);
            
                                var isInHotbar = GetItemAnyHotbar(itemD._id)
                                if (isInHotbar != "empty") {
                                    if (!isInventoryPlayer(itemD))
                                        CleanFastUse(isInHotbar)
                                    else
                                        AttachToFastUse(isInHotbar, itemD)
            
                                    if (isInHotbar == 1 || isInHotbar == 2) {
                                        if (paintedBefore._slotId != "firstweapon" || paintedBefore._slotId != "secondweapon") {
                                            if (firstInventory.items[paintedBefore._parentId] != undefined) {
                                                CleanFastUse(isInHotbar)
                                            }
                                        }
                                    }
                                }
            
                                if (ParentSlotIDClothing(itemD)) {
                                    if (itemD._data.Type == "container") {
                                        if (secInventory.items[paintedBefore._parentId] != undefined) {
                                            var oldOffset = $(`#clothe-container-slots-${itemD._id}`).data("mainOffset")
                                            $(`#clothe-container-slots-${itemD._id}`).appendTo(".n6rko4gdc7h0cg8cd9xfsjkk")
                                                                                    .show()
                                                                                    .css({top: oldOffset.top, right: oldOffset.right, left: "", "background-color": "rgb(0,0,0, 0.0)"});
                                        } else {
                                            var oldOffset = $(`#clothe-container-slots-${itemD._id}`).data("mainOffset")
                                            $(`#clothe-container-slots-${itemD._id}`).appendTo(".c6jgbwjs9tc2vb8gtpwe7rywe")
                                                                                    .show()
                                                                                    .css({top: oldOffset.top, right: oldOffset.right, left: "", "background-color": "rgb(0,0,0, 0.0)"});
            
                                        }
                                        if ($(`#clothe-container-slots-${itemD._id}`).hasClass("ui-draggable"))
                                            $(`#clothe-container-slots-${itemD._id}`).draggable( "destroy" )
                                    }
            
            
                                    $(`#item-${itemD._id}`).css("transform", "rotate(0deg)")
            
                                    itemD._data.Width = ItemBase[itemD._tpl].item._data.Width
                                    itemD._data.Height = ItemBase[itemD._tpl].item._data.Height
                                    itemD.loc.r = 0;
            
                                    if (itemD._data.Type == "container" || itemD._data.Type == "Clothing") {
                                        $(`#item-${itemD._id}`).css({"width": SetItemWidthNHeight(itemD.slotId, true), "height": SetItemWidthNHeight(itemD.slotId, false)}).find("img").css({"width": SetItemWidthNHeight(itemD.slotId, true), "height": SetItemWidthNHeight(itemD.slotId, false)});
                                    } else if (itemD._data.Type == "Weapon") {
                                        $(`#item-${itemD._id}`).css({"width": ResponsiveWeaponSlot(true), "height": ResponsiveWeaponSlot(false)}).find("img").css({"width": ResponsiveWeaponSlot(true), "height": ResponsiveWeaponSlot(false)});
            
                                        if (firstInventory.items[paintedBefore._parentId] != undefined) {
                                            if (paintedBefore._slotId == "firstweapon") {
                                                AttachToFastUse(1, itemD)
                                            } else {
                                                AttachToFastUse(2, itemD)
                                            }
                                        }
                                    }
                                }
                            } else {
                                RevertGrids(itemC, slots, dataList, true)

                                temporaryRotated = itemD.loc.r;
                                itemD.loc.r = temporaryRotated;
                
                                FixPlacing(itemD, itemOBJ);
                
                                SetupDrag(itemD, temporaryRotated)
                            }
                        });   
                    } else {
                        RevertGrids(itemC, slots, dataList, false)

                        if (ParentSlotIDClothing(itemD)) {
                            DragFromClothContainer(itemD, itemOBJ)
                        }
    
                        
                        var objectKeysBefore = Object.keys(paintedBefore._slots)
                        var len_before = objectKeysBefore.length, i = 0;
                        for (i; i < len_before; i++) {
                            var key = objectKeysBefore[i]
                            $(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                                .data({"isTaken": true, "itemData": itemD});
                        }
    
                        SetItem(itemD, GetItemSlotInventory(itemD._id), GetItemSlotInventory(paintedBefore._parentId), objectKeysBefore[0], temporaryRotated, paintedBefore._slotId, paintedBefore._parentId)
                            
                        itemD._parent = paintedBefore._parentId
                        var splitLOC = objectKeysBefore[0].split("-"); var x = parseInt(splitLOC[0]); var y = parseInt(splitLOC[1]);
                        itemD.loc.x = x;
                        itemD.loc.y = y;
                        itemD.slotId = paintedBefore._slotId
                        itemD.loc.r = temporaryRotated;
    
                        $(itemOBJ).appendTo(`#grid-${paintedBefore._parentId}-${objectKeysBefore[0]}-${paintedBefore._slotId}`)
    
                        FixPlacing(itemD, itemOBJ);
    
                        var isInHotbar = GetItemAnyHotbar(itemD._id)
                        if (isInHotbar != "empty") {
                            if (!isInventoryPlayer(itemD))
                                CleanFastUse(isInHotbar)
                            else
                                AttachToFastUse(isInHotbar, itemD)
    
                            if (isInHotbar == 1 || isInHotbar == 2) {
                                if (paintedBefore._slotId != "firstweapon" || paintedBefore._slotId != "secondweapon") {
                                    if (firstInventory.items[paintedBefore._parentId] != undefined) {
                                        CleanFastUse(isInHotbar)
                                    }
                                }
                            }
                        }
    
                        if (ParentSlotIDClothing(itemD)) {
                            if (itemD._data.Type == "container") {
                                if (secInventory.items[paintedBefore._parentId] != undefined) {
                                    var oldOffset = $(`#clothe-container-slots-${itemD._id}`).data("mainOffset")
                                    $(`#clothe-container-slots-${itemD._id}`).appendTo(".n6rko4gdc7h0cg8cd9xfsjkk")
                                                                            .show()
                                                                            .css({top: oldOffset.top, right: oldOffset.right, left: "", "background-color": "rgb(0,0,0, 0.0)"});
                                } else {
                                    var oldOffset = $(`#clothe-container-slots-${itemD._id}`).data("mainOffset")
                                    $(`#clothe-container-slots-${itemD._id}`).appendTo(".c6jgbwjs9tc2vb8gtpwe7rywe")
                                                                            .show()
                                                                            .css({top: oldOffset.top, right: oldOffset.right, left: "", "background-color": "rgb(0,0,0, 0.0)"});
    
                                }
                                if ($(`#clothe-container-slots-${itemD._id}`).hasClass("ui-draggable"))
                                    $(`#clothe-container-slots-${itemD._id}`).draggable( "destroy" )
                            }
    
    
                            $(`#item-${itemD._id}`).css("transform", "rotate(0deg)")
    
                            itemD._data.Width = ItemBase[itemD._tpl].item._data.Width
                            itemD._data.Height = ItemBase[itemD._tpl].item._data.Height
                            itemD.loc.r = 0;
    
                            if (itemD._data.Type == "container" || itemD._data.Type == "Clothing") {
                                $(`#item-${itemD._id}`).css({"width": SetItemWidthNHeight(itemD.slotId, true), "height": SetItemWidthNHeight(itemD.slotId, false)}).find("img").css({"width": SetItemWidthNHeight(itemD.slotId, true), "height": SetItemWidthNHeight(itemD.slotId, false)});
                            } else if (itemD._data.Type == "Weapon") {
                                $(`#item-${itemD._id}`).css({"width": ResponsiveWeaponSlot(true), "height": ResponsiveWeaponSlot(false)}).find("img").css({"width": ResponsiveWeaponSlot(true), "height": ResponsiveWeaponSlot(false)});
    
                                if (firstInventory.items[paintedBefore._parentId] != undefined) {
                                    if (paintedBefore._slotId == "firstweapon") {
                                        AttachToFastUse(1, itemD)
                                    } else {
                                        AttachToFastUse(2, itemD)
                                    }
                                }
                            }
                        }
                    }
                    }
            } else if (objectPuttable) {
                RevertGrids(itemC, slots, dataList, false)

                if (ParentSlotIDClothing(itemD)) {
                    DragFromClothContainer(itemD, itemOBJ)
                }
                
                var objectKeysBefore = Object.keys(puttableSlots.slots)
                var len_before = objectKeysBefore.length, i = 0;
                
                for (i; i < len_before; i++) {
                    var key = objectKeysBefore[i]
                    $(`#grid-${puttableSlots.parentId}-${key}-${puttableSlots.slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                        .data({"isTaken": true, "itemData": itemD});
                }

                SetItem(itemD, GetItemSlotInventory(itemD._id), GetItemSlotInventory(puttableSlots.parentId), objectKeysBefore[0], temporaryRotated, puttableSlots.slotId, puttableSlots.parentId)

                itemD._parent = puttableSlots.parentId
                var splitLOC = objectKeysBefore[0].split("-"); var x = parseInt(splitLOC[0]); var y = parseInt(splitLOC[1]);
                itemD.loc.x = x;
                itemD.loc.y = y;
                itemD.slotId = puttableSlots.slotId
                itemD.loc.r = temporaryRotated;

                $(itemOBJ).appendTo(`#grid-${puttableSlots.parentId}-${objectKeysBefore[0]}-${puttableSlots.slotId}`);

                SetupDrag(itemD, temporaryRotated);

                FixPlacing(itemD, itemOBJ);

                var item = $(`#item-${puttableSlots.parentId}`).data("itemData")
                var objectKeysBefore = Object.keys(paintedBefore._slots)
                var len_before = objectKeysBefore.length, i = 0;
                for (i; i < len_before; i++) {
                    var key = objectKeysBefore[i]
                    var tempColor = ColorSettings[item._data.Backgroundcolor]
                    if ($(`#grid-${paintedBefore._parentId}-${key}-${puttableSlots.slotId}`).data("isTaken")) {
                        $(`#grid-${paintedBefore._parentId}-${key}-${puttableSlots.slotId}`).css({"background": "var(--grid-color)", "border-color": tempColor._borderColor});
                    } else {
                        $(`#grid-${paintedBefore._parentId}-${key}-${puttableSlots.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""})
                    }
                }

                var isInHotbar = GetItemAnyHotbar(itemD._id)
                if (isInHotbar != "empty") {
                    if (!isInventoryPlayer(itemD))
                        CleanFastUse(isInHotbar)
                    else
                        AttachToFastUse(isInHotbar, itemD)

                    if (isInHotbar == 1 || isInHotbar == 2) {
                        if (paintedBefore._slotId != "firstweapon" || paintedBefore._slotId != "secondweapon") {
                            if (firstInventory.items[paintedBefore._parentId] != undefined) {
                                CleanFastUse(isInHotbar)
                            }
                        }
                    }
                }
            } else if(objectStackable){
                var secItem = $(`#grid-${paintedBefore._parentId}-${Object.keys(paintedBefore._slots)[0]}-${paintedBefore._slotId}`).data("itemData")

                var gridITEMDATA = null;
                if(GetItemSlotInventory(paintedBefore._parentId)) {
                    gridITEMDATA = firstInventory.items[secItem._id];
                } else {
                    gridITEMDATA = secInventory.items[secItem._id];
                }

                if (gridITEMDATA.info.CurrentStack + itemD.info.CurrentStack <= gridITEMDATA._data.MaxStack) {
                    
                    RevertGrids(itemC, slots, dataList, false)
                    gridITEMDATA.info.CurrentStack = parseInt(gridITEMDATA.info.CurrentStack) + parseInt(itemD.info.CurrentStack);
                    $(`#item-${itemD._id}`).remove();

                    if(GetItemSlotInventory(itemD._parent)) {
                        delete firstInventory.items[itemD._id]
                    } else {
                        delete secInventory.items[itemD._id];
                    }

                    $.post("https://ls-inventoryhud/RemoveItem", JSON.stringify({
                        itemData: itemD,
                        isFullyRemove: true,
                        inventoryId: GetItemSlotInventory(itemD._id),
                    }));
                } else {
                    var neededAmount = gridITEMDATA._data.MaxStack - gridITEMDATA.info.CurrentStack

                    gridITEMDATA.info.CurrentStack = parseInt(gridITEMDATA.info.CurrentStack) + parseInt(neededAmount);
                    itemD.info.CurrentStack = parseInt(itemD.info.CurrentStack) - parseInt(neededAmount);
                    $(`#item-${itemD._id}`).find(".grid-item-amount").html(itemD.info.CurrentStack)

                    $.post("https://ls-inventoryhud/RemoveItem", JSON.stringify({
                        itemData: itemD,
                        isFullyRemove: false,
                        inventoryId: GetItemSlotInventory(itemD._id),
                    }));
                    RevertGrids(itemC, slots, dataList, true)

                    firstInventory.items[itemD._id] = itemD;

                    SetItem(itemD, null, GetItemSlotInventory(itemD._id), CreateXYITEM(itemD), itemD.loc.r, itemD.slotId, itemD._parent)
                }
                if(GetItemSlotInventory(gridITEMDATA._parent)) {
                    firstInventory.items[gridITEMDATA._id] = gridITEMDATA;
                } else {
                    secInventory.items[gridITEMDATA._id] = gridITEMDATA;
                }
                SetItem(gridITEMDATA, null, GetItemSlotInventory(gridITEMDATA._id), CreateXYITEM(gridITEMDATA), gridITEMDATA.loc.r, gridITEMDATA.slotId, gridITEMDATA._parent)
                
                var objectKeysBefore = Object.keys(paintedBefore._slots)
                var len_before = objectKeysBefore.length, i = 0;
                for (i; i < len_before; i++) {
                    var key = objectKeysBefore[i]
                    $(`#grid-${paintedBefore.parentId}-${key}-${paintedBefore.slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                        .data({"isTaken": true, "itemData": gridITEMDATA});
                }

                
            } else if(objectAttachable) {
                RevertGrids(itemC, slots, dataList, false)
                var gridITEMDATA = $(`#grid-${paintedBefore._parentId}-${Object.keys(paintedBefore._slots)[0]}-${paintedBefore._slotId}`).data("itemData")

                var list = {}
                if (gridITEMDATA.info.attachment != undefined && JSON.stringify(gridITEMDATA.info.attachment) != "[]") 
                    list = gridITEMDATA.info.attachment;

                if (list[itemD.info.attach_component] == undefined) {
                    list[itemD.info.attach_component] = {component: itemD.info.component, name: itemD.name,  attach_component: itemD.info.attach_component}
                }

                gridITEMDATA.info.attachment = list

                $.post("https://ls-inventoryhud/checkCurrentWeapon", JSON.stringify({
                    currentWeapon: gridITEMDATA,
                    component: itemD.info.component,
                    remove: false
                }));

                SetItem(gridITEMDATA, null, GetItemSlotInventory(gridITEMDATA._id), CreateXYITEM(gridITEMDATA), gridITEMDATA.loc.r, paintedBefore._slotId, paintedBefore._parentId)

                $(itemOBJ).remove();
                $.post("https://ls-inventoryhud/RemoveItem", JSON.stringify({
                    itemData: itemD,
                    isFullyRemove: true,
                    inventoryId: GetItemSlotInventory(itemD._id),
                }));

                var objectKeysBefore = Object.keys(paintedBefore._slots)
                var len_before = objectKeysBefore.length, i = 0;
                for (i; i < len_before; i++) {
                    var key = objectKeysBefore[i]
                    $(`#grid-${paintedBefore._parentId}-${key}-${paintedBefore._slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor});
                }
            } else {
                RevertGrids(itemC, slots, dataList, true)

                temporaryRotated = itemD.loc.r;
                itemD.loc.r = temporaryRotated;

                FixPlacing(itemD, itemOBJ);

                SetupDrag(itemD, temporaryRotated)
            }

            objectPlacable = false;
            objectPuttable = false;
            objectStackable = false;
            objectMergeable = false;

            temporaryRotated = 0;
            baseSlots = {};
        }
    });

    if (!ParentSlotIDClothing) {
        ContainerOpen(itemD, itemOBJ);
    } else {
        if (itemD._data.Grids != undefined)
            if (Object.keys(itemD._data.Grids).length > 0)
                ContainerOpen(itemD, itemOBJ);
    }

    ItemTooltip(itemOBJ, itemD)

    SetupContextMenu(itemOBJ, itemD)

    $(itemOBJ).dblclick(function(e){
        if (e.ctrlKey && itemD.isSearched && !secInventory._inventoryId.includes("SHOP")) {
            var currentFound = FindGrids(itemD)

            if (JSON.stringify(currentFound) != "{}" && currentFound != undefined) {
                AudioPlay("sounds/"+itemD._data.ItemSound+"_drop.wav", 0.5)

                var dataList = $(`.grid-${itemD._parent}-${itemD.loc.x}-${itemD.loc.y}-${itemD.slotId}`).data();
        
                var gridSQ = $(`.grid-${dataList.parentId}-${dataList.slotLocation}-${dataList.slotId}`)
    
                let slots = DragSlots(gridSQ, dataList, itemD)
                baseSlots = slots;
    
                let objectKeys = Object.keys(slots)
                var len = objectKeys.length, i = 0;
    
                for (i; i < len; i++) {
                    let key = objectKeys[i]
                    $(`#grid-${dataList.parentId}-${key}-${dataList.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""}).data("isTaken", false);
                }
    
                if (ParentSlotIDClothing(itemD)) {
                    DragFromClothContainer(itemD, itemOBJ)
                }
                
                var objectKeysBefore = Object.keys(currentFound.slots)
                var len_before = objectKeysBefore.length, i = 0;
                
                for (i; i < len_before; i++) {
                    var key = objectKeysBefore[i]
                    $(`#grid-${currentFound.parentId}-${key}-${currentFound.slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                                        .data({"isTaken": true, "itemData": itemD});
                }

                SetItem(itemD, GetItemSlotInventory(itemD._id), GetItemSlotInventory(currentFound.parentId), objectKeysBefore[0], temporaryRotated, currentFound.slotId,currentFound.parentId)
    
                itemD._parent = currentFound.parentId
                var splitLOC = objectKeysBefore[0].split("-"); var x = parseInt(splitLOC[0]); var y = parseInt(splitLOC[1]);
                itemD.loc.x = x;
                itemD.loc.y = y;
                itemD.slotId = currentFound.slotId
    
    
                $(itemOBJ).appendTo(`#grid-${currentFound.parentId}-${objectKeysBefore[0]}-${currentFound.slotId}`);
    
                SetupDrag(itemD, temporaryRotated);
    
                FixPlacing(itemD, itemOBJ);
    
                var item = $(`#item-${currentFound.parentId}`).data("itemData")
                var objectKeysBefore = Object.keys(currentFound.slots)
                var len_before = objectKeysBefore.length, i = 0;
                for (i; i < len_before; i++) {
                    var key = objectKeysBefore[i]
                    var tempColor = itemC
                    if ($(`#grid-${currentFound.parentId}-${key}-${currentFound.slotId}`).data("isTaken")) {
                        $(`#grid-${currentFound.parentId}-${key}-${currentFound.slotId}`).css({"background": "var(--grid-color)", "border-color": tempColor._borderColor});
                    } else {
                        $(`#grid-${currentFound.parentId}-${key}-${currentFound.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""})
                    }
                }
    
                var isInHotbar = GetItemAnyHotbar(itemD._id)
                if (isInHotbar != "empty") {
                    if (!isInventoryPlayer(itemD))
                        CleanFastUse(isInHotbar)
                    else
                        AttachToFastUse(isInHotbar, itemD)
    
                    if (isInHotbar == 1 || isInHotbar == 2) {
                        if (currentFound.slotId != "firstweapon" || currentFound.slotId != "secondweapon") {
                            if (firstInventory.items[currentFound.parentId] != undefined) {
                                CleanFastUse(isInHotbar)
                            }
                        }
                    }
                }
            }
        }
    })

    if (status) {
        if (!itemD.isSearched) {
            $(itemOBJ).draggable ( "disable" );
            
            $(itemOBJ).addClass("non-searched");
            $(itemOBJ).css("background", "");
            if(!$(`#non-searched-img-${itemD._id}`).length) {
                $(itemOBJ).append('<div class="non-searched-img" id="non-searched-img-'+itemD._id+'"></div>');
                MakeItemSearch(itemD, itemOBJ);
            }

            
        }
    }

    WeightReCalculate()
}

function DragFromClothContainer(itemD, itemOBJ, status) {
    if (status == undefined)
        status = true;
    
    if (temporaryRotated == 1) {
        $(`#clothe-container-slots-${itemD._id}`).appendTo("#inventory")
                                                 .hide();

        $(`#item-${itemD._id}`).css({"height": (itemD._data.Width*ResponsiveGridSize())+(itemD._data.Width*2)+"px", "width": (itemD._data.Height*ResponsiveGridSize())+(itemD._data.Height*2)+"px"});
        $(`#item-${itemD._id} > img`).css({"height": (itemD._data.Width*ResponsiveGridSize())+(itemD._data.Width*2)+"px", "width": (itemD._data.Height*ResponsiveGridSize())+(itemD._data.Height*2)+"px"});
        if (status)
            ContainerOpen(itemD, itemOBJ);
    } else {
        $(`#clothe-container-slots-${itemD._id}`).appendTo("#inventory")
                                                 .hide();

        $(`#item-${itemD._id}`).css({"width": (itemD._data.Width*ResponsiveGridSize())+(itemD._data.Width*2)+"px", "height": (itemD._data.Height*ResponsiveGridSize())+(itemD._data.Height*2)+"px"});
        $(`#item-${itemD._id} > img`).css({"width": (itemD._data.Width*ResponsiveGridSize())+(itemD._data.Width*2)+"px", "height": (itemD._data.Height*ResponsiveGridSize())+(itemD._data.Height*2)+"px"});
        if (status)
            ContainerOpen(itemD, itemOBJ);
    }
}

var zIndex = 101;

function ContainerOpen(itemD, itemOBJ) {
    if (itemD._data.Grids != undefined) {
        if (Object.keys(itemD._data.Grids).length > 0) {
            var curOffset = {}
            curOffset = {
                top: $(`.container-grid-${itemD._tpl}`).css("top"),
                right:   $(`.container-grid-${itemD._tpl}`).css("right"),
            }

            $(`#clothe-container-slots-${itemD._id}`).data("mainOffset", curOffset)
            $(itemOBJ).dblclick(function(e,ui) {
                if (itemD.isSearched) {
                    if ($(`#clothe-container-slots-${itemD._id}`).css("display") == "none") {
                        AudioPlay("sounds/"+itemD._data.ItemSound+"_use.wav", 0.5)
                        $(`#clothe-container-slots-${itemD._id}`).show()
                                                                .css("z-index", zIndex)
                                                                .draggable({})
                                                                .append(`<span class="close-inventory" id="close-inventory-${itemD._id}">X</span>`)
                                                                .data("mainOffset", curOffset)
                                                                .css({"background-color": "rgb(0,0,0)"})
                                                                .offset({ top: mousePOS.y, left: mousePOS.x});
                        zIndex++;
                        $(`#close-inventory-${itemD._id}`).mousedown(function(){$(`#clothe-container-slots-${itemD._id}`).hide(); $(this).remove(); })
                    }
                }
            })
        }
    }
}

function FixPlacing(itemD, itemOBJ) {
    if (itemD.loc.r == 1) {
        $(itemOBJ).css({"top": "", "left": ""})
    } else {
        $(itemOBJ).css({"top": "", "left": ""})
    }
}

$(document).keydown(function(e, ui) {
    if (e.keyCode == 82) {
        if (itemDrag.isDragging) {    
            if (itemDrag.itemDATA != null && itemDrag.itemDATA != undefined) {

                AudioPlay("sounds/"+itemDrag.itemDATA._data.ItemSound+"_pickup.wav", 0.5)

                if (temporaryRotated == 0) {
                    temporaryRotated = 1

                    SetupDrag(itemDrag.itemDATA, temporaryRotated)
                } else {
                    temporaryRotated = 0

                    SetupDrag(itemDrag.itemDATA, temporaryRotated)
                }
                
                let elements = document.elementsFromPoint(mousePOS.x, mousePOS.y);

                let fastLen = elements.length, k = 0;
                for (k; k < fastLen; k++) {
                    value = elements[k]
                    if (value.tagName === "DIV") {
                        if (value.classList.contains("grid")) {
                            if (!objectPuttable) {
                                UpdateDrawSlots(value, itemDrag.itemDATA)
                            } else {
                                var dataList = $(value).data()

                                var temporaryValue = $(`#grid-${dataList.parentId}-${dataList.slotLocation}-${dataList.slotId}`).data();

                                var isFoundEmpty = FindEmptySlot(temporaryValue.itemData, itemDrag.itemDATA)
                                if (isFoundEmpty) {
                                    let objectKeys_ = Object.keys(isFoundEmpty.slots)
                                    var len = objectKeys_.length, i = 0;
                                    for (i; i < len; i++) {
                                        let key_ = objectKeys_[i]; let value__ = isFoundEmpty.slots[key_]
                                        if (value__) {
                                            objectPlacable = false;
                                            objectPuttable = true;
                                            puttableSlots = isFoundEmpty;
                                        } else {
                                            objectPlacable = false;
                                            objectPuttable = false;
                                        }
                                    }   
                                } else {
                                    objectPlacable = false;
                                    objectPuttable = false; 
                                }
                            }
                            isAnySlotPainted = true;
                            break;
                        }
                    }
                }
            }
        }
    }
});

$("body").mousemove(function(e) {
    mousePOS = {
        x: e.pageX,
        y: e.pageY
    }
})

function SetupDrag(itemD, rotateS) {
    if (rotateS == 1) {
        $(`#item-${itemD._id}`).css("transform", "rotate(-90deg) translateX(-100%)")

        itemD._data.Width = ItemBase[itemD._tpl].item._data.Height
        itemD._data.Height = ItemBase[itemD._tpl].item._data.Width
    } else {
        $(`#item-${itemD._id}`).css("transform", "rotate(0deg)")

        itemD._data.Width = ItemBase[itemD._tpl].item._data.Width
        itemD._data.Height = ItemBase[itemD._tpl].item._data.Height
    }
}

function ReSetupItem(itemD, itemOBJ) {
    itemD.isSearched = true;
    
    $(`.non-searched > img`).css({opacity: 1.0});
    $(itemOBJ).draggable ( "enable" );
    $(itemOBJ).removeClass("non-searched");
    SetItemBG(itemD)
    $(itemOBJ).find('.non-searched-img').remove();
    $(`#search-thing-${itemD._id}`).remove();
    
    SetItem(itemD, null, GetItemSlotInventory(itemD._id), CreateXYITEM(itemD), itemD.loc.r, itemD.slotId, itemD._parent)
}

function ReSetupItemContainer(itemD, itemOBJ) {
    searchList = {}
    itemD.isSearched = true;
    
    $(itemOBJ).remove();
    $(`#search-thing-inv-${itemD._id}`).remove();

    $(`#clothe-container-slots-${itemD._id} > div`).show();

    $.each($(`#clothe-container-slots-${itemD._id} > div > div > div`), async function(key, value){
        var _item = $(value).data("itemData")
        if (_item != undefined) {
            if (!_item.isSearched) {
                searchList[Object.keys(searchList).length++] = _item
            }
        }
    });

    if (Object.keys(searchList).length > 0)
        setTimeout( function() { SearchContainerInsideItems(searchList[currentItem]); } , 250)
    else
        stopContainerSound();

    SetItem(itemD, null, GetItemSlotInventory(itemD._id), CreateXYITEM(itemD), itemD.loc.r, itemD.slotId, itemD._parent)
}

function stopContainerSound () {
    isSearchingContainer = false;
    clearInterval(currentTimer);
    $(`#search-icon-${containerParentID}`).remove();

    containerSearchSound.pause();

    containerSearchSound = null;
}


function SearchContainerInsideItems(_item) {
    if (_item == undefined)
        return stopContainerSound();

    if (!isSearching) {
        $(`#item-${_item._id}`).append('<div class="search-thing" id="search-thing-'+ _item._id+'"><div class="loader-percent" id="percent-thing-'+ _item._id+'">0</div><div class="loader"></div></div>')
        $(`#non-searched-img-${_item._id}`).animate({opacity: 0}, 100);

        $(`.non-searched > img`).animate({opacity: 1}, 100);
        isSearching = true;
        var interval = setInterval(function () {
            var value = parseInt($(`#percent-thing-${_item._id}`).html())
            value += 1
            $(`#percent-thing-${_item._id}`).html(value)
        }, _item._data.ExamineTime * 10);
        interruptInterval = interval;
        interruptTimeout = setTimeout( function() {
            isSearching = false;
            clearInterval(interval)
            ReSetupItem(_item, $(`#item-${_item._id}`))

            AudioPlay("sounds/"+_item._data.ItemSound+"_pickup.wav", 0.5)

            currentItem++;
            setTimeout( function() { SearchContainerInsideItems(searchList[currentItem]); } , 250)
        }, _item._data.ExamineTime * 1000);
    }
}

//|| secInventory.items[itemDATA._id] != undefined

function SetItem(itemDATA, fromInventory, toInventory, toLOC, rotate, slot, parent, doNotDelete) {
    if (doNotDelete == undefined)
        doNotDelete = false;

    if (Config.Slotlabeling[itemDATA._data.AttachableSlot] != undefined) {

        if (Config.Slotlabeling[itemDATA.slotId]) {
            $(`#image-grid-${fromInventory}-0-0-${itemDATA._data.AttachableSlot}`).show();

            $(`.grid-container-label-${itemDATA._data.AttachableSlot}-${fromInventory}`).show();
        }

        if (Config.Slotlabeling[slot]) {
            $(`#image-grid-${toInventory}-0-0-${slot}`).hide();  

            $(`.grid-container-label-${slot}-${toInventory}`).hide();
        }
    }

    $.post("https://ls-inventoryhud/ItemChanged", JSON.stringify({
        fromInventory: fromInventory,
        itemD: itemDATA,
        toInventory: toInventory,
        toLocation: toLOC,
        toRotate: rotate,
        toSlot: slot,
        toParent: parent,
        notGonnaBeDeleted: doNotDelete,
    }));
    

    checkClothing(itemDATA, fromInventory, slot)
    
    if (toInventory != null)
        checkClothing(itemDATA, toInventory, slot)

    if(toInventory == firstInventory._inventoryId) {
        if (fromInventory != toInventory) {
            $.each(secInventory.items, function(key, value) {
                if (value != undefined) {
                    if (value._parent == itemDATA._id) {
                        SetItem(value, fromInventory, toInventory, CreateXYITEM(value), value.loc.r, value.slotId, itemDATA._id, false)
                    }
                }
            })
        } else {
            $.each(firstInventory.items, function(key, value) {
                if (value != undefined) {
                    if (value._parent == itemDATA._id) {
                        SetItem(value, fromInventory, toInventory, CreateXYITEM(value), value.loc.r, value.slotId, itemDATA._id, false)
                    }
                }
            })
        }
    } else if (toInventory == secInventory._inventoryId) {
        if (fromInventory != toInventory) {
            $.each(firstInventory.items, function(key, value) {
                if (value != undefined) {
                    if (value._parent == itemDATA._id) {
                        SetItem(value, fromInventory, toInventory, CreateXYITEM(value), value.loc.r, value.slotId, itemDATA._id, false)
                    }
                }
            })
        } else {
            $.each(secInventory.items, function(key, value) {
                if (value != undefined) {
                    if (value._parent == itemDATA._id) {
                        SetItem(value, fromInventory, toInventory, CreateXYITEM(value), value.loc.r, value.slotId, itemDATA._id, false)
                    }
                }
            })
        }
    }

    var splitLOC = toLOC.split("-"); var x = parseInt(splitLOC[0]); var y = parseInt(splitLOC[1]);
    itemDATA.loc.x = x
    itemDATA.loc.y = y
    itemDATA.loc.r = rotate
    itemDATA.slotId = slot
    itemDATA._parent = parent

    if(toInventory == firstInventory._inventoryId) {
        if (fromInventory != firstInventory._inventoryId && fromInventory != null)
            delete secInventory.items[itemDATA._id];
        
        firstInventory.items[itemDATA._id] = itemDATA;
    } else if (toInventory == secInventory._inventoryId) {
        if (fromInventory == firstInventory._inventoryId && fromInventory != null)
            delete firstInventory.items[itemDATA._id];
        
        secInventory.items[itemDATA._id] = itemDATA;
    }

    $(`#item-${itemDATA._id}`).find(".grid-item-amount").html(itemDATA.info.CurrentStack);
    $(`#item-${itemDATA._id}`).data("itemData", itemDATA)

    WeightReCalculate()
}


function MakeContainerSearch(itemD) {
    var itemOBJ = $(`#non-searched-container-${itemD._id}`)
    $(itemOBJ).mousedown(function(e) {
        if (e.which == 2) {
           e.preventDefault();
           StartContainerSearch(itemD, itemOBJ)
        }
     });

     $(itemOBJ).contextmenu(function(e) {
        e.preventDefault();
        return false;
     });
}

function setTime() {
  ++totalSeconds;
  secondsLabel.innerHTML = pad(totalSeconds % 60);
  minutesLabel.innerHTML = parseInt(totalSeconds / 60);
}

function pad(val) {
  var valString = val + "";
  if (valString.length < 2) {
    return "0" + valString;
  } else {
    return valString;
  }
}
var searchFromProgress = null;
function StartProgress(itemD) {
    totalSeconds = 0;
    searchFromProgress = itemD;
    $(`#search-icon-${containerParentID}`).html(`   <div class="loader-search-icon"></div>  <span class="searching-text">Searching</span> <div class="button-cancel-search">x</div><span class="searching-time-passed"><label id="minutes">0</label>:<label id="seconds">00</label></span>`)
    minutesLabel = document.getElementById("minutes");
    secondsLabel = document.getElementById("seconds");

    currentTimer = setInterval(setTime, 1000);

    $(`.button-cancel-search`).click(function(){
        InterruptSearchAction(containerParentID, itemD)
    })
}

function InterruptSearchAction(containerParentID, itemD) {
    if (containerSearchSound) {
        clearInterval(interruptInterval);
        clearTimeout(interruptTimeout);

        console.log(itemD)
        if (itemD != null) {
            if ($(`.search-thing`) != undefined)
                $(`.search-thing`).remove();

            isSearching = false;
            $(`.non-searched-img`).css("opacity", 0.35)
            $(`#non-searched-container-${containerParentID}`).find("span").show();
            $(`#search-icon-${containerParentID}`).html(`   <i class="fas fa-search"></i>    Search`);

            $(`#search-thing-${containerParentID}`).remove();

            if ($(`.search-thing`) != undefined)
                $(`.search-thing`).remove();

            isSearching = false;
        } else {
            isSearching = false;
        }
        isSearchingContainer = false;
        clearInterval(currentTimer);

        secondsLabel = null;
        minutesLabel = null;
    
        containerSearchSound.pause();
    
        containerSearchSound = null;
        searchFromProgress = null;
    }
}


function StartContainerSearch(itemD, itemOBJ) {
    if (!isSearching && !isSearchingContainer) {
        isSearchingContainer = true;

        $(itemOBJ).find("span").hide();

        containerParentID = itemD._id;
        containerSearchSound = AudioPlay("sounds/looting_body_extended.wav", 0.7);

        $(itemOBJ).append('<div class="search-thing-inv" id="search-thing-'+ itemD._id+'"><div class="loader-percent" id="percent-thing-'+ itemD._id+'">0</div><div class="loader"></div></div>')
        $(`#non-searched-img-${itemD._id}`).animate({opacity: 0}, 100);

        $(`.non-searched-inv > img`).animate({opacity: 1}, 100);
        isSearching = true;
        var interval = setInterval(function () {
            var value = parseInt($(`#percent-thing-${itemD._id}`).html())
            value += 1
            $(`#percent-thing-${itemD._id}`).html(value)
        }, itemD._data.ExamineTime * 10);
        interruptInterval = interval;
        interruptTimeout = setTimeout( function() {
            isSearching = false;

            clearInterval(interval)
            ReSetupItemContainer(itemD, itemOBJ)

            AudioPlay("sounds/"+itemD._data.ItemSound+"_pickup.wav", 0.5)

        }, itemD._data.ExamineTime * 1000);

        StartProgress(itemD)
    }
}

function MakeItemSearch(itemD, itemOBJ) {
    $(itemOBJ).mousedown(function(e) {
        if (e.which == 2) {
           e.preventDefault();
           if (!itemD.isSearched && !isSearching && !isSearchingContainer) {
                var searchSound = AudioPlay("sounds/looting_body_extended.wav", 0.7)
                $(itemOBJ).append('<div class="search-thing" id="search-thing-'+ itemD._id+'"><div class="loader-percent" id="percent-thing-'+ itemD._id+'">0</div><div class="loader"></div></div>')
                $(`#non-searched-img-${itemD._id}`).animate({opacity: 0}, 100);

                $(`.non-searched > img`).animate({opacity: 1}, 100);
                isSearching = true;
                var interval = setInterval(function () {
                    var value = parseInt($(`#percent-thing-${itemD._id}`).html())
                    value += 1
                    $(`#percent-thing-${itemD._id}`).html(value)
                }, itemD._data.ExamineTime * 10);

                setTimeout( function() {
                    isSearching = false;
                    clearInterval(interval)
                    ReSetupItem(itemD, itemOBJ)

                    searchSound.pause();
                    AudioPlay("sounds/"+itemD._data.ItemSound+"_pickup.wav", 0.5)
                }, itemD._data.ExamineTime * 1000)
            }
        }
     });

     $(itemOBJ).contextmenu(function(e) {
        e.preventDefault();
        return false;
     });
}

function RevertGrids(itemC, slotL, dataL, revertT) {
    if (revertT) {
        var objectKeys = Object.keys(slotL)
        var len = objectKeys.length, i = 0;
        for (i; i < len; i++) {
            let key = objectKeys[i]
            $(`#grid-${dataL.parentId}-${key}-${dataL.slotId}`).css({"background": "var(--grid-color)", "border-color": itemC._borderColor})
                                                                .data("isTaken", true);
        }
    } else {
        var objectKeys = Object.keys(slotL)
        var len = objectKeys.length, i = 0;

        if (dataL.itemData.loc.r != temporaryRotated) {
            for (i; i < len; i++) {
                let key = objectKeys[i]
                $(`#grid-${dataL.parentId}-${key}-${dataL.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""})
                                                                    .data("isTaken", false);
            }
        } else {
            var newIT = JSON.parse(JSON.stringify(dataL.itemData))
            newIT.loc.r = temporaryRotated
            var newSlots = DragSlots("WASNTIMP", dataL, newIT)

            var objectKeys = Object.keys(newSlots)
            var len = objectKeys.length, i = 0;
            for (i; i < len; i++) {
                let key = objectKeys[i]
                $(`#grid-${dataL.parentId}-${key}-${dataL.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""})
                                                                    .data("isTaken", false);
            }
        }
    }
}

function CreateXYITEM(itemDATA) {
    return itemDATA.loc.x + "-" + itemDATA.loc.y
}

function DragSlots(gridOBJ, gridDATA, itemDATA) {
    let result={}
    if (gridDATA.slotLocation == undefined) { return result; }
    let slot_id = gridDATA.slotLocation
    let split_ = slot_id.split("-")
    let x = parseInt(split_[0])
    let y = parseInt(split_[1])

    let size_x = x + itemDATA._data.Width
    let size_y = y + itemDATA._data.Height
    for (y_value=y; y_value < size_y; y_value++) {
        for (x_value=x; x_value < size_x; x_value++) {
            let current_slot = x_value + "-" + y_value
            if ($(`#grid-${gridDATA.parentId}-${current_slot}-${gridDATA.slotId}`).data("isTaken") || $(`#grid-${gridDATA.parentId}-${current_slot}-${gridDATA.slotId}`).data("isTaken") == undefined) {
                result[current_slot] = false;
            } else {
                result[current_slot] = true;
            }
        }
    }


    if (slot_id == CreateXYITEM(itemDATA) && gridDATA.parentId == itemDATA._parent && gridDATA.slotId == itemDATA.slotId && itemDATA.loc.r == temporaryRotated) {
        $.each(result, function(key, _){
            result[key] = false;
        });
    }

    let objectKeys = Object.keys(result)
    var len = objectKeys.length, i = 0;
    let found = false
    for (i; i < len; i++) {
        let key = objectKeys[i]
        let value = result[key]
        if (!value) {
            found = true;
        }
    }
    if (found) {
        var len_2 = objectKeys.length, j = 0;
        for (j; j < len_2; j++) {
            let key = objectKeys[j]
            result[key] = false
        }
    }
    return result;
}

function SetupGrids(data) {
    $("#inventory").append(`<div id="${data.items[data._inventoryId]._id}" class="${data.items[data._inventoryId]._tpl}"></div>`)

    $.each(data.items, function(key, value){
        if (value._data.Grids != undefined)
            if (Object.keys(value._data.Grids).length > 0)
                CreateTopGrid(value._id, value._tpl, value);
    })
}

function AddContainerSearchButton(itemD) {
    if (!itemD.isSearched) {
        return '<span class="grid-container-search" id="search-icon-'+itemD._id+'" style="left: '+getWidth(itemD)+'px;">   <i class="fas fa-search"></i>    Search</span>'
    }
    return '';
}

function AddWeight(itemDATA) {
    var weightToReturn = 0;
    $.each($(`#clothe-container-slots-${itemDATA._id}`).find(".grid-item"), function(key, value) {
        var items = $(value).data("itemData")
        if (items != undefined) {
            weightToReturn += items.info.CurrentStack*items._data.Weight;

            if (items._data != undefined) {
                if (items._data.Type == "container") {
                    weightToReturn += AddWeight(items)
                }
            }
        }
    })

    return weightToReturn;
}

function AddEmpty(itemDATA) {
    if (itemDATA.isSearched) {
        var emptySlotData = { MaxEmpty: 0, CurrentEmpty: 0};
        $.each(itemDATA._data.Grids, function(key, value) {
            emptySlotData.CurrentEmpty += value.cellsV*value.cellsH; emptySlotData.MaxEmpty += value.cellsV*value.cellsH;
        })

        $.each($(`#clothe-container-slots-${itemDATA._id}`).find(".grid-item"), function(key, value) {
            var items = $(value).data("itemData")
            if (items != undefined) {
                emptySlotData.CurrentEmpty -= items._data.Width*items._data.Height
            }
        })
        var text = Math.abs(emptySlotData.CurrentEmpty-emptySlotData.MaxEmpty)+"/"+emptySlotData.MaxEmpty


        return text;
    }
    return "??/??";
}


function CreateTopGrid(gridID, gridCLASS, gridDATA) {
    if (gridDATA._parent == "")
        gridDATA._parent = gridDATA._id;

    if ($(`#${gridDATA._parent}`).css("display") != undefined)
        if (gridCLASS != "c6jgbwjs9tc2vb8gtpwe7rywe" && gridCLASS != "n6rko4gdc7h0cg8cd9xfsjkk" && gridCLASS != "zfrko4gdc7h0cg8cd9xfsjkk")
            $(`#${gridDATA._parent}`).append(`<div id="clothe-container-slots-${gridID}" class="container-grid-${gridCLASS} container-grid-top"><span class="grid-container-label">  ${gridDATA._data.Label}    <br>  ${AddWeight(gridDATA)} kg ${AddEmpty(gridDATA)}</span>${AddContainerSearchButton(gridDATA)}</div>`)
        else
            $(`#${gridDATA._parent}`).append(`<div id="clothe-container-slots-${gridID}" class="container-grid-${gridCLASS} container-grid-top"</div>`)
        
    else {
        if($(`#clothe-container-slots-${gridID}`).length) {
            $(`#clothe-container-slots-${gridID}`).html(`<span class="grid-container-label">  ${gridDATA._data.Label}    <br>  ${AddWeight(gridDATA)} kg ${AddEmpty(gridDATA)}</span>${AddContainerSearchButton(gridDATA)}`).appendTo("#inventory")
            $(`#clothe-container-slots-${gridID}`).hide();
        } else {
            if (gridCLASS != "c6jgbwjs9tc2vb8gtpwe7rywe" && gridCLASS != "n6rko4gdc7h0cg8cd9xfsjkk" && gridCLASS != "zfrko4gdc7h0cg8cd9xfsjkk")
                $(`#inventory`).append(`<div id="clothe-container-slots-${gridID}" class="container-grid-${gridCLASS} container-grid-top"><span class="grid-container-label">  ${gridDATA._data.Label}    <br>  ${AddWeight(gridDATA)} kg ${AddEmpty(gridDATA)}</span>${AddContainerSearchButton(gridDATA)}</div>`)
            else
                $(`#inventory`).append(`<div id="clothe-container-slots-${gridID}" class="container-grid-${gridCLASS} container-grid-top"></div>`)
            $(`#clothe-container-slots-${gridID}`).hide();
        }
    }

    if (gridDATA._parent == secInventory._inventoryId) {
        $(`#inventory`).append(`<span id="grid-container-label-secinventory" class="grid-container-label grid-container-label-secinventory"><span class="grid-bottom-label2">  ${gridDATA._data.Label}    </span><br>  ${AddWeight(gridDATA)} kg ${AddEmpty(gridDATA)}</span>`);
    }


    $(`#clothe-container-slots-${gridID}`).data("itemData", gridDATA)

    if (!gridDATA.isSearched)
        $(`#search-icon-${gridDATA._id}`).mousedown(function(e,u) { var itemOBJ = $(`#non-searched-container-${gridDATA._id}`); StartContainerSearch(gridDATA, itemOBJ); });
    
    var parentOBJECT = $(`#clothe-container-slots-${gridID}`)

    $.each(gridDATA._data.Grids, function(k, v) {
        if (Config.Slotlabeling[v._name] != undefined) {
            if (v._name == "firstweapon" || v._name == "secondweapon") {
                $(`#clothe-container-slots-${gridID}`).append(`<span class="grid-container-label grid-container-label-${v._name}-${gridCLASS}">  ${Config.Slotlabeling[v._name]}    </span>`)
            }
            
        }
        CreateGrids(v._name, v._id, v._name, v.cellsH, v.cellsV, v, parentOBJECT, gridDATA)
    })
}

function CreateGrids(gridNAME, gridID, gridCLASS, gridHEIGHT, gridWIDTH, gridD, gridPARENT, gridPARENDATA) {
    $(gridPARENT).append(`<div class="grid-parent-${gridPARENDATA._id}-${gridCLASS} grid-parent-${gridPARENDATA._tpl}-${gridCLASS}"></div>`)

    var gridStatus = CheckGridIsClothe(`grid-parent-${gridPARENDATA._tpl}-${gridCLASS}`);
    if (gridStatus != "weaponslot" && gridStatus == true) {
        $(`.grid-parent-${gridPARENDATA._tpl}-${gridCLASS}`).css({"width":SetItemWidthNHeight(gridNAME, true), "height": SetItemWidthNHeight(gridNAME, false)})
    } else if(gridStatus == "weaponslot"){
        $(`.grid-parent-${gridPARENDATA._tpl}-${gridCLASS}`).css({"width":ResponsiveWeaponSlot(true), "height": ResponsiveWeaponSlot(false)})
    } else {
        $(`.grid-parent-${gridPARENDATA._tpl}-${gridCLASS}`).css({"width": (gridWIDTH*ResponsiveGridSize())+(2*gridWIDTH)+"px", "height": (gridHEIGHT*ResponsiveGridSize())+(2*gridHEIGHT)+"px"})
    }

    for (y_v = 0; y_v< gridHEIGHT; y_v++) {
        for (x_v = 0; x_v < gridWIDTH; x_v++) {
            var slot_id = x_v +"-"+y_v
            $(`.grid-parent-${gridPARENDATA._id}-${gridCLASS}`).append(`<div class="grid grid-${gridPARENDATA._id}-${slot_id}-${gridCLASS}" id="grid-${gridPARENDATA._id}-${slot_id}-${gridCLASS}"></div>`)
            $(`#grid-${gridPARENDATA._id}-${slot_id}-${gridCLASS}`).data({"slotId": gridNAME, "parentId": gridPARENDATA._id, "slotLocation": slot_id, "isTaken": false})
        }
    }

    if (Config.Slotlabeling[gridNAME] != undefined) {
        if (gridNAME != "firstweapon" && gridNAME != "secondweapon") {
            $(`#grid-${gridPARENDATA._id}-0-0-${gridNAME}`).html(`<img class="image-grid" id="image-grid-${gridPARENDATA._id}-0-0-${gridNAME}" src="need_icons/${gridNAME}.png">`)
        } 
    }
}








/////// ATTACHMENT \\\\\\\

var AttachmentDragging  = false
var attachmentItem = null;

var lastX = null;
var lastY = null;
var isBlocked = false;

function AttachmentMenu(contextMenuItem) {
    attachmentItem = contextMenuItem

    $("#inventory").fadeOut(250);
    $("#attachment").fadeIn(250);

    $.post("https://ls-inventoryhud/attachmentOpen", JSON.stringify({
        weapon: attachmentItem._name
    }));
    IsInContextMenu = false
    $("#context-menu").remove();
    inAttachmentMenu = true
    isBlocked = false;

    $('#attachment').mousedown(function(event) {
        AttachmentDragging = true
        var x = event.clientX;
        var y = event.clientY;

        lastX = x;
        lastY = y;
    })

    $('#attachment').mouseup(function(e) {
        AttachmentDragging = false
    })

    $( "#attachment" ).mousemove(function( event ) {
        var x = event.clientX;
        var y = event.clientY;
        if (AttachmentDragging && !itemDrag.isDragging && !isBlocked) {

            var factor = 10/ parseInt($('#attachment').css("height").replace("px", ""));

            var dx = (factor * (x - lastX)) * 4.0;
            var dy = (factor * (y - lastY)) * 4.0;

            $.post("https://ls-inventoryhud/updateAttachRotate", JSON.stringify({
                x: dx,
                y: dy
            }));
        }

        lastX = x;
        lastY = y;
    });
}

var anyScreenIsOpen = false;

function SetupAttachment(data) {
    var objectKeys = Object.keys(data)
    var len = objectKeys.length, i = 0;
    for (i; i < len; i++) {
        var key = objectKeys[i]
        var value = data[key]
        $("#attachment").append(`<div class="attachment-box" id="attachment-box-${value.attach_component}"><div class="attachment-box-label"><p>${value.label}</p></div><div class="attachment-box-select-attach attach-clickable" id="attach-clickabe-${value.attach_component}"><span>^</span></div></div>`)
        $(`#attach-clickabe-${value.attach_component}`).data({"label": value.label, "attach_component": value.attach_component})
        $(`#attachment-box-${value.attach_component}`).css({"left": value.x + "%", "top": value.y + "%"}).data({"label": value.label, "attach_component": value.attach_component, "isAttached": false})
    }

    $.each(attachmentItem.info.attachment, function(key, value) {
        if (value != undefined) {
            $(`#attachment-box-${value.attach_component}`).html(`<div class="attachment-box-label"><p>${$(`#attachment-box-${value.attach_component}`).data("label")}</p></div><img src="${GetItemImage(FindItemFromName(value.attach_component))}"><div class="attachment-box-select-attach attach-clickable" id="attach-clickabe-${value.attach_component}"><span>^</span></div>`)
            $(`#attach-clickabe-${value.attach_component}`).data({"label": value.label, "attach_component": value.attach_component})
            $(`#attachment-box-${value.attach_component}`).data({"attach_component": value.attach_component, "isAttached": true, "component": value.component});

            $.post("https://ls-inventoryhud/addAttachment", JSON.stringify({
                name: attachmentItem._name,
                component: value.component,
                attach_component: value.attach_component,
            }));
        }
    });

    EnableReClick()
}

function EnableReClick() {
    $(`.attachment-box-select-attach`).unbind ( "click" )
    $(`.attachment-box-select-attach`).click(function() {
        if (!anyScreenIsOpen) {
            anyScreenIsOpen = true;
            $( this ).css({"width": "140px", "right": "-145px", "height": "280px"})
            $( this ).find("span").css({ transform: 'rotate(180deg)' });
            var compatch = $( this ).data("attach_component")

            $(`#attach-clickabe-${compatch}`).append(`<div class="attach-item-box" id="item-box-delete"><h1>X</h1></div>`);
            $(`#item-box-delete`).data("isDelete", true)
            $.each(firstInventory.items, function(key ,value){
                if (value != undefined) {
                    if (value.info != undefined) {
                        if (value.info.attach_component != undefined) {
                            if (value.info.attach_component == compatch) {
                                $(`#attach-clickabe-${compatch}`).append(`<div class="attach-item-box" id="item-box-${value._id}"><img src="${GetItemImage(value)}"></div>`);
                                $(`#item-box-${value._id}`).data("itemData", value)
                            }
                        }
                    }
                }
            });

            $(`.attach-item-box`).click(function(){
                if ($(this).data("isDelete") == undefined) {
                    if(!$(`#attachment-box-${compatch}`).data("isAttached")) {

                        var foundItem = $(this).data("itemData")

                        var list = {}
                        if (attachmentItem.info.attachment != undefined && JSON.stringify(attachmentItem.info.attachment) != "[]") 
                            list = attachmentItem.info.attachment;
        
                        if (list[foundItem.info.attach_component] == undefined) {
                            list[foundItem.info.attach_component] = {component: foundItem.info.component, name: foundItem.name,  attach_component: foundItem.info.attach_component}
                        }
                        attachmentItem.info.attachment = list

                        SetItem(attachmentItem, null, GetItemSlotInventory(attachmentItem._id), CreateXYITEM(attachmentItem), attachmentItem.loc.r, attachmentItem.slotId, attachmentItem._parent)

                        $(`#item-${foundItem._id}`).remove();
                        $.post("https://ls-inventoryhud/RemoveItem", JSON.stringify({
                            itemData: foundItem,
                            isFullyRemove: true,
                            inventoryId: GetItemSlotInventory(foundItem._id),
                        }));
                        firstInventory.items[foundItem._id] = undefined

                        $.post("https://ls-inventoryhud/addAttachment", JSON.stringify({
                            name: attachmentItem._name,
                            component: foundItem.info.component,
                            attach_component: foundItem.info.attach_component,
                        }));

                        $.post("https://ls-inventoryhud/checkCurrentWeapon", JSON.stringify({
                            currentWeapon: attachmentItem,
                            component: foundItem.info.component,
                            remove: false
                        }));

                        let size_x = foundItem.loc.x + foundItem._data.Width
                        let size_y = foundItem.loc.y + foundItem._data.Height
                        for (y_value= foundItem.loc.y; y_value < size_y; y_value++) {
                            for (x_value= foundItem.loc.x; x_value < size_x; x_value++) {
                                let current_slot = x_value + "-" + y_value
                
                                $(`#grid-${foundItem._parent}-${current_slot}-${foundItem.slotId}`).css({"background-color": "var(--grid-color)", "background-image": ""}).data("isTaken", false);
                            }
                        }

                        $(`#attachment-box-${compatch}`).html(`<div class="attachment-box-label"><p>${$(`#attachment-box-${compatch}`).data("label")}</p></div><img src="${GetItemImage(FindItemFromName(compatch))}"><div class="attachment-box-select-attach attach-clickable" id="attach-clickabe-${compatch}"><span>^</span></div>`)
                        $(`#attach-clickabe-${compatch}`).data({"attach_component": compatch})
                        $(`#attachment-box-${compatch}`).data("isAttached", true)
                        EnableReClick();
                    }
                } else {
                    if($(`#attachment-box-${compatch}`).data("isAttached")) {
                        var foundItem = FindItemFromName($(`#attachment-box-${compatch}`).data("attach_component"))
                        attachmentItem.info.attachment[$(`#attachment-box-${compatch}`).data("attach_component")] = undefined

                        SetItem(attachmentItem, null, GetItemSlotInventory(attachmentItem._id), CreateXYITEM(attachmentItem), attachmentItem.loc.r, attachmentItem.slotId, attachmentItem._parent);

                        $.post("https://ls-inventoryhud/AddItemFromAttachment", JSON.stringify({
                            itemData: foundItem,
                        }));

                        $.post("https://ls-inventoryhud/removeAttachment", JSON.stringify({
                            name: attachmentItem._name,
                            component: $(`#attachment-box-${compatch}`).data("attach_component"),
                            attach_component: $(`#attachment-box-${compatch}`).data("attach_component"),
                        }));

                        $.post("https://ls-inventoryhud/checkCurrentWeapon", JSON.stringify({
                            currentWeapon: attachmentItem,
                            component: $(`#attachment-box-${compatch}`).data("attach_component"),
                            remove: true
                        }));

                        $(`#attachment-box-${compatch}`).html(`<div class="attachment-box-label"><p>${$(`#attachment-box-${compatch}`).data("label")}</p></div><div class="attachment-box-select-attach attach-clickable" id="attach-clickabe-${compatch}"><span>^</span></div>`)
                        $(`#attach-clickabe-${compatch}`).data({"attach_component": compatch})
                        $(`#attachment-box-${compatch}`).data("isAttached", false)
                        EnableReClick();
                    }
                }
            })
        } else {
            anyScreenIsOpen = false
            $.each($(`.attachment-box-select-attach`), function(key, value) {
                $(this).html(`<span>^</span>`).css({ "width": "10px", "height": "100%", "right": "-15px"})
            })
            EnableReClick()
        }
    }).mouseenter(function(){
        isBlocked = true;
    }).mouseleave(function() {
        isBlocked = false;
    });
}

function FindItemFromName(name) {
    var item = null;
    $.each(ItemBase, function(key, value) {
        if (value.item._name == name)
            item = value.item;
    })
    return item
}

function drawLine(context, x1, y1, x2, y2) {

    context.beginPath();
    context.moveTo(x1, y1);
    context.lineTo(x2, y2);
    context.strokeStyle = '#ffff';
    context.stroke();
}

function EditAttachment(data) {
    
    var canvas = document.querySelector('#canvas');
    var context = canvas.getContext('2d');

    canvas.width = $(window).width(); //document.width is obsolete
    canvas.height = $(window).height(); //document.height is obsolete

    context.clearRect(0, 0, canvas.width, canvas.height);

    let objectKeys = Object.keys(data)
    var len = objectKeys.length, i = 0;
    for (i; i < len; i++) {
        let key = objectKeys[i]
        let value = data[key]
        let start = $(`#attachment-box-${value.attach_component}`).offset();
        if (start == undefined)
            return;

        drawLine(context, start.left + 42 ,start.top + 42, (value.x * document.body.clientWidth)  , (value.y * document.body.clientHeight ))
        
        $(`#attachment-box-${value.attach_component}`).css({"left": (value.x * document.body.clientWidth) + value.add_left + "px", "top": (value.y * document.body.clientHeight ) + value.add_top + "px"})
    }
}