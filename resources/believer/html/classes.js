function ItemTooltip(itemOBJ, itemD) {
    $(itemOBJ).on("mouseenter", function (e, ui) {
        itemD = $(`#item-${itemD._id}`).data("itemData")

        if (itemD.isSearched) {
            var maintext = ""

            var itemFromBase = JSON.parse(JSON.stringify(ItemBase[itemD._tpl].item))

            var commonRate = itemFromBase._data.Rarity != undefined ? itemFromBase._data.Rarity : "Common"

            maintext += `<div class="tooltip-label">${itemD._data.Label}</div>`
            maintext += `<div class="tooltip-rarity">${commonRate}</div>`

            maintext += `<div class="tooltip-rarity-box"></div>`

            maintext += `<div class="tooltip-img"><img src="${GetItemImage(itemD)}"></div>`

            maintext += `<div class="tooltip-weight">${(itemD.info.CurrentStack * itemD._data.Weight).toFixed(1)} kg</div>`

            if (itemFromBase._data.Description != undefined)
                if (itemFromBase._data.Description != "")
                    maintext += `<div class="tooltip-desc">${itemFromBase._data.Description}</div>`
                else
                    maintext += `<div class="tooltip-desc">Aucune information n'a été donnée.</div>`

            if (itemFromBase._data.AttachableSlot != undefined)
                if (SlotIsClothing(itemFromBase._data.AttachableSlot))
                    maintext += `<div class="tooltip-clothing">${itemFromBase._data.AttachableSlot}</div>`

            if (itemFromBase._data.Type == "Weapon")
                if (itemD.info != undefined)
                    maintext += `<div class="tooltip-weapon"><span class="tool-qua">Quality</span> ${itemD.info.quality.toFixed(1)}/100 <br><span class="tool-ammo">Ammo</span> ${itemD.info.ammo}</div>`

            if (itemD.price != undefined)
                maintext += `<div class="tooltip-price">$${itemD.price} per amount!</div>`

            $(`<div class="tooltip" id="tooltip-item"><div class="tooltip-top"></div>${maintext}</div>`)
                .appendTo("body")
                .offset({ left: e.pageX + 40, top: e.pageY - 40 });

            var rarityColor = Config.RarityColors[commonRate.toLowerCase()]
            $(`.tooltip-rarity`).css("color", rarityColor)
            $(`.tooltip-img`).css("filter", `drop-shadow(0px 0px 7px ${rarityColor}`)
            $(`.tooltip-rarity-box`).css({ "background-color": rarityColor, "filter": `drop-shadow(0px 0px 2px ${rarityColor}` })

            $.each($(`.grid-item`), function (key, value) {
                if ($(value).data("itemData") != undefined)
                    if ($(value).data("itemData")._id != itemD._id)
                        $(value).css("opacity", 0.4)
            })
        }
    }).on("mouseleave", function (e, ui) {
        $(`.tooltip`).remove();
        $.each($(`.grid-item`), function (key, value) {
            $(value).css("opacity", 1)
        })
    }).on("mousemove", function (e, ui) {
        $(`#tooltip-item`).offset({ left: e.pageX + 40, top: e.pageY - 40 });
    })
}

function SetItemBG(itemDATA) {
    var commonRate = Config.Colors[itemDATA._data.Backgroundcolor]._colorRate
    $(`#item-${itemDATA._id}`).css({ "background": `radial-gradient(circle at bottom, ${commonRate} 0%, rgba(0,0,0,0) 58%)` })
}

function GetItemSlotInventory(slotID) {
    var found = false;
    var foundId = null;

    var beforeItem = findItemFromInventory(slotID)

    while (!found) {
        if (beforeItem == null) {
            found = false;
            foundId = firstInventory._inventoryId;
            break;
        }
        beforeItem = findItemFromInventory(beforeItem._parent);
        if (beforeItem == null) {
            found = false;
            break;
        }
        if (beforeItem._tpl == "c6jgbwjs9tc2vb8gtpwe7rywe") {
            found = true;
            foundId = firstInventory._inventoryId;
            break;
        } else if (beforeItem._tpl == "n6rko4gdc7h0cg8cd9xfsjkk") {
            found = false;
            foundId = secInventory._inventoryId;
            break;
        } else if (beforeItem._tpl == "zfrko4gdc7h0cg8cd9xfsjkk") {
            found = false;
            foundId = secInventory._inventoryId;
            break;
        }
    }

    return foundId;
}

function isInventoryPlayer(itemDATA) {
    var found = false;

    var beforeItem = findItemFromInventory(itemDATA._id)

    while (!found) {
        if (beforeItem == null) {
            found = false;
            break;
        }
        beforeItem = findItemFromInventory(beforeItem._parent);
        if (beforeItem == null) {
            found = false;
            break;
        }
        if (beforeItem._tpl == "c6jgbwjs9tc2vb8gtpwe7rywe") {
            found = true;
            break;
        } else if (beforeItem._tpl == "n6rko4gdc7h0cg8cd9xfsjkk") {
            found = false;
            break;
        } else if (beforeItem._tpl == "zfrko4gdc7h0cg8cd9xfsjkk") {
            found = false;
            break;
        }
    }


    return found;
}

function isItemContainAnyThing(itemDATA, gridID) {
    var found = true;

    var beforeItem = findItemFromInventory(gridID)

    if (Object.keys(beforeItem._data.Grids).length > 0) {
        if (beforeItem._parent == itemDATA._id) {
            found = false;
        } else {
            while (found) {
                if (beforeItem == null) {
                    found = false;
                    break;
                }
                beforeItem = findItemFromInventory(beforeItem._parent);
                if (beforeItem == null) {
                    found = false;
                    break;
                }
                if (beforeItem._parent == itemDATA._id) {
                    found = false;
                    break;
                }

                if (beforeItem._tpl == "n6rko4gdc7h0cg8cd9xfsjkk" || beforeItem._tpl == "c6jgbwjs9tc2vb8gtpwe7rywe" || beforeItem._tpl == "zfrko4gdc7h0cg8cd9xfsjkk") {
                    found = true;
                    break;
                }
            }
        }
    }

    return found;
}

function ReadyItems(data) {
    $.each(data.items, function (key, value) {
        if (ItemBase[value._tpl] != undefined) {
            var newItem = JSON.parse(JSON.stringify(ItemBase[value._tpl].item))
            $.each(value, function (k, v) {
                if (k != "_data")
                    newItem[k] = v
            })
            if (newItem.isSearched == undefined) {
                if (newItem._tpl == "n6rko4gdc7h0cg8cd9xfsjkk" || newItem._tpl == "zfrko4gdc7h0cg8cd9xfsjkk") {
                    newItem.isSearched = true;
                } else if (newItem._tpl == "c6jgbwjs9tc2vb8gtpwe7rywe") {
                    newItem.isSearched = true;
                } else {
                    if (isInventoryPlayer(newItem)) {
                        newItem.isSearched = true;
                    } else {
                        //newItem.isSearched = false;
                        newItem.isSearched = true;
                    }
                }
            } else {
                if (!isInventoryPlayer(newItem)) {
                    newItem.isSearched = false;
                }
            }
            data.items[key] = newItem
        }
    })

    return data.items
}

function FindGrids(itemD) {
    if (isInventoryPlayer(itemD)) {
        var found = false;
        var currentFound = {};
        var list = null;
        if ($(`.n6rko4gdc7h0cg8cd9xfsjkk`).css("display") != undefined) {
            list = $(`.n6rko4gdc7h0cg8cd9xfsjkk > div`)
        } else if ($(`.zfrko4gdc7h0cg8cd9xfsjkk`).css("display") != undefined) {
            list = $(`.zfrko4gdc7h0cg8cd9xfsjkk > div`)
        }
        $.each(list, function (key, value) {
            var parentD = $(value).data("itemData")
            $.each(parentD._data.Grids, function (key2, value2) {
                if (!found) {
                    var test = findEmptySlots(parentD, value2.cellsH, value2.cellsV, value2._name, itemD);
                    if (JSON.stringify(test) != "{}") {
                        found = true;
                        currentFound = { slots: test, parentId: parentD._id, slotId: value2._name };
                    }
                }
            })
        })

        return currentFound;
    } else {
        var found = false;
        var currentFound = {};
        $.each($(`.c6jgbwjs9tc2vb8gtpwe7rywe > div`), function (key, value) {
            var parentD = $(value).data("itemData")
            if (parentD != undefined) {
                $.each(parentD._data.Grids, function (key2, value2) {
                    if (!found) {
                        var test = findEmptySlots(parentD, value2.cellsH, value2.cellsV, value2._name, itemD);
                        if (JSON.stringify(test) != "{}") {
                            found = true;
                            currentFound = { slots: test, parentId: parentD._id, slotId: value2._name };
                        }
                    }
                })
            }
        })

        return currentFound;
    }
}

function SetupContextMenu(itemOBJ, itemD) {
    $(itemOBJ).contextmenu(function (e, ui) {
        if (IsInContextMenu)
            return;
        if (!itemD.isSearched)
            return;
        if (GetItemSlotInventory(itemD._id)) {
            AudioPlay('sounds/drag.wav')

            contextMenuItem = itemD
            let icon = ``
            if (contextMenuItem._data.Type == "Weapon") {
                icon = `<div class="item">
                <i class="fas fa-wrench"></i> Edit Weapon
            </div>`
            }
            let use = `<div class="item"><i class="fas fa-hand-holding"></i> <b>Use
            </div>`
            if (contextMenuItem._data.Type == "Weapon") {
                use = ``
            }

            $(`<div class="flip-in-hor-bottom" id="context-menu" >
        
            ${use}
            ${icon}
            </div>`)
                .appendTo("body")
                .offset({ left: e.pageX, top: e.pageY });
            IsInContextMenu = true
        }

    });
}

$(document).on("mousedown", ".item", function (e) {
    switch (e.which) {
        case 1:
            e.preventDefault();
            var currentSituation
            if ($(this).html().includes("Use"))
                currentSituation = "use"
            else if ($(this).html().includes("Edit Weapon"))
                currentSituation = "atch"

            if (currentSituation == "use") {
                AudioPlay("sounds/click.wav", 0.8);

                UseItemContext(contextMenuItem)
            } else if (currentSituation == "atch") {
                AudioPlay("sounds/click.wav", 0.8);

                AttachmentMenu(contextMenuItem)
            } else {
                AudioPlay("sounds/fail.wav", 1.2);
                IsInContextMenu = false
                $("#context-menu").remove();
            }
            break;
    }
});

function UpdateItem(data) {
    var oldItem = firstInventory.items[data.itemID]

    $.each(data.newD, function (key, value) {
        oldItem.info[key] = value
    });

    firstInventory.items[data.itemID] = oldItem;

    $(`#item-${data.itemID}`).data("itemData", oldItem)

    $.post("https://believer/UpdateItem", JSON.stringify({
        itemData: oldItem,
        inventoryId: data.inventoryID,
        itemIdentifier: data.itemID,
    }));
}

function CheckGridIsClothe(itemGRID) {
    if (itemGRID == "grid-parent-n6rko4gdc7h0cg8cd9xfsjkk-backpack") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-backpack") {
        return true;
    } else if (itemGRID == "grid-parent-n6rko4gdc7h0cg8cd9xfsjkk-rig") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-rig") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-pants") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-shirts") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-shoes") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-top") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-mask") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-gloves") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-hat") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-glasses") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-ear") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-bracelet") {
        return true;
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-watch") {
        return true;
    } else if (itemGRID == "grid-parent-n6rko4gdc7h0cg8cd9xfsjkk-firstweapon") {
        return "weaponslot";
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-firstweapon") {
        return "weaponslot";
    } else if (itemGRID == "grid-parent-n6rko4gdc7h0cg8cd9xfsjkk-secondweapon") {
        return "weaponslot";
    } else if (itemGRID == "grid-parent-c6jgbwjs9tc2vb8gtpwe7rywe-secondweapon") {
        return "weaponslot";
    }
    return false;
}

function ThisSlotHaveAnyContainerInUI(slotID) {
    if (slotID == "firstweapon")
        return true;
    else if (slotID == "secondweapon")
        return true;
    else if (SlotIsClothing(slotID))
        return true;

    return false
}

function SlotIsClothing(slotID) {
    if (slotID == "backpack")
        return true;
    else if (slotID == "rig")
        return true;
    else if (IsClotheHaveAnyClothe(slotID))
        return true;

    return false
}

function IsClotheHaveAnyClothe(slotID) {
    if (slotID == "shirts")
        return true;
    else if (slotID == "pants")
        return true;
    else if (slotID == "top")
        return true;
    else if (slotID == "shoes")
        return true;
    else if (slotID == "mask")
        return true;
    else if (slotID == "gloves")
        return true;
    else if (slotID == "shirts")
        return true;
    else if (slotID == "hat")
        return true;
    else if (slotID == "glasses")
        return true;
    else if (slotID == "ear")
        return true;
    else if (slotID == "bracelet")
        return true;
    else if (slotID == "watch")
        return true;

    return false;
}

function getWidth(itemD) {
    if (itemD._data.AttachableSlot == "backpack")
        return "110"
    else if (itemD._data.Name == "Pockets")
        return "73";
    else if (itemD._data.AttachableSlot == "rig")
        return "130";

    return "140";
}


function checkClothing(itemDATA, toInventory, slot) {
    if (SlotIsClothing(itemDATA.slotId)) {
        if (slot != itemDATA.slotId) {
            $.post("https://believer/changeClothes", JSON.stringify({
                animation: true,
                clothingname: itemDATA._data.AttachableSlot,
                dress: false,
                inventoryid: toInventory,
            }));
            OccupiedClothingSlots[itemDATA._data.AttachableSlot] = false
        }
    } else {
        if (SlotIsClothing(slot)) {
            $.post("https://believer/changeClothes", JSON.stringify({
                animation: true,
                clothingname: itemDATA._data.AttachableSlot,
                dress: true,
                inventoryid: toInventory,
                clothedata: itemDATA.info.clothData,
            }));
            OccupiedClothingSlots[itemDATA._data.AttachableSlot] = true
        }
    }
}
var OccupiedClothingSlots = {}

function CheckClothesFully() {
    $.each(ItemBase["c6jgbwjs9tc2vb8gtpwe7rywe"].item._data.Grids, function (key, value) {
        if (SlotIsClothing(value._name))
            OccupiedClothingSlots[value._name] = false
    })
    $.each(firstInventory.items, function (key, value) {
        if (SlotIsClothing(value.slotId)) {
            $.post("https://believer/changeClothes", JSON.stringify({
                animation: false,
                clothingname: value._data.AttachableSlot,
                dress: true,
                clothedata: value.info.clothData,
                inventoryid: firstInventory._inventoryId
            }));
            OccupiedClothingSlots[value._data.AttachableSlot] = true
        }
    })

    $.each(OccupiedClothingSlots, function (key, value) {

        if (!value) {
            $.post("https://believer/changeClothes", JSON.stringify({
                animation: false,
                clothingname: key,
                dress: false,
                inventoryid: firstInventory._inventoryId
            }));
        }
    })
}

function CheckClothes() {
    $.each(OccupiedClothingSlots, function (key, value) {
        if (key == "gloves") {
            if (!value) {
                $.post("https://believer/changeClothes", JSON.stringify({
                    animation: false,
                    clothingname: key,
                    dress: false,
                    inventoryid: firstInventory._inventoryId
                }));
            }
        }
    })
}

function SetItemText(itemD) {
    var result = '';
    return result;
}

function SetItemLabel(itemDATA) {
    if ((itemDATA._data.Width * 50) + (itemDATA._data.Width * 2) >= GetTextWidth(itemDATA._data.Label, "15px Poppins")) {
        return itemDATA._data.Label
    } else {
        return SetItemText(itemDATA)
    }
}

function GetTextWidth(txt, font) {
    this.element = document.createElement('canvas');
    this.context = this.element.getContext("2d");
    this.context.font = font;
    let txtwidt = this.context.measureText(txt).width;
    this.element.remove();
    return txtwidt
}

function SetItemWidthNHeight(slotID, isWidth) {
    if (IsClotheHaveAnyClothe(slotID)) {
        if (slotID == "pants")
            if (!isWidth)
                return "120px";
            else
                return "60px";

        else if (slotID == "top")
            if (!isWidth)
                return "130px";
            else
                return "60px";
        else
            return "60px";
    } else {
        return "75px";
    }
}

function GetItemImage(itemDATA) {
    if (itemDATA._tpl != undefined)
        if (ItemBase[itemDATA._tpl] != undefined)
            return ItemBase[itemDATA._tpl].item._data.Itemimage;
        else
            return itemDATA._data.Itemimage
    else
        return itemDATA._data.Itemimage
}

function CalculateSize(size) {
    var width = $(window).width();

    var reso = 0;

    if (width > 1920) {
        reso = size * 2
    } else if (width <= 1920 && width > 1600) {
        reso = size
    } else if (width <= 1600 && width > 1366) {
        reso = size
    } else if (width <= 1366) {
        reso = size / 2
    }

    if (reso == 0)
        console.log("SCREEN SIZE NOT FOUNDED!\nREPORT SERVER OWNER YOUR SCREEN RESOLUTION: " + width);
    return reso
}


function ResponsiveGridSize() {
    return 50
}

function ResponsiveWeaponSlot(isWidth) {
    if (isWidth) {
        return 200
    } else {
        return 100
    }
}