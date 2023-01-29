var customPlatePrice = 15;
var minCharPlate = 5;
var maxCharPlate = 1;
var currentCredit = 0;
var categories = [];
var vehicles = [];
var motos = [];
var helicopterItems = [];
var weapons = [];
var items = [];
var moneyItems = [];
var packsItems = [];
var language = [];

function setCategories() {
    $(".categorieItemList").empty();
    categories.forEach((element) => {
        $(".categorieItemList").append(`
            <div class="categorieItem" id="${element.categoryId}">${element.label}</div>
        `);
    });
}

function setVehiclesIntoCategory(data, itemType) {
    $(".rightCarListArea").empty();
    var i = 0;
    data.forEach((element) => {
        var carDataJson = JSON.stringify(element);
        $(".rightCarListArea").append(`
        <div class="carListItem" id="carListItem-${i}" data-carData = '${carDataJson}' data-type="${itemType}">
            <div class="listItemCarNameArea">
                <span class="carBrand">${element.brand}</span>
                <span class="carModel">${element.model}</span>
                <span class="caryearModel">${element.year}</span>
            </div>

            <div class="listItemCarImageArea">
                <img src=${element.carImage} alt="" />
            </div>

            <div class="listItemCreditArea">
                <i class="fa-solid fa-credit-card" id="creditCardIconList"></i>
                <span class="listItemPrice">${element.costCredit}</span>
                <span class="listItemPriceText">${language.credit}</span>
            </div>

            <div class="listItemMaxSpeedArea">
                <span class="material-icons" id="itemGraphIcon"> speed </span>
                <span class="itemMaxSpeedText">${element.topSpeed} ${language.speed}</span>
            </div>
        </div>
        `);
    });
}

$(document).on("click", ".leftBuyButton", function () {
    var selectedDiv = this;
    var typeItem = $(selectedDiv).attr("data-type");
    if (typeItem == "vehicle") {
        var carDataStr = $(selectedDiv).attr("data-selectedCar");
        var carData = JSON.parse(carDataStr);
        var customPlateCheck = document.getElementById("leftCheckBox").checked;
        var customPlateText = $(".leftItemPlateInput").val();
        if (customPlateCheck && customPlateText == "entrer la plaque...") {
            $(".leftItemPlateInput").css("border", "1px solid red");
            setTimeout(() => {
                $(".leftItemPlateInput").css("border", "1px solid rgba(255, 255, 255, 0.08)");
            }, 2000);
        } else {
            $(".popUpItemList").empty();
            $(".popUpItemList").append(`
                <div class="popUpItem">
                    <div class="popUpItemName">${carData.brand} ${carData.model}</div>
                    <div class="popUpItemCost">${carData.costCredit} ${language.credit}</div>
                </div>
            `);
            if (customPlateCheck) {
                $(".popUpItemList").append(`
                <div class="popUpItem">
                    <div class="popUpItemName">Custom Plate ( ${customPlateText} )</div>
                    <div class="popUpItemCost">${customPlatePrice} ${language.credit}</div>
                </div>
            `);
                $("#popUpBuy").attr("data-customPlate", customPlateText);
            } else {
                $("#popUpBuy").attr("data-customPlate", "undefined");
            }
            $("#popUpBuy").attr("data-itemType", typeItem);
            $("#popUpBuy").attr("data-itemInfo", carDataStr);
            $(".youWantBuySection").fadeIn(200);
        }
    }
});

$(document).on("click", ".rightTestButton", function () {
    var selectedDiv = this;
    var typeItem = $(selectedDiv).attr("data-type");
    if (typeItem == "vehicle") {
        var carDataStr = $(selectedDiv).attr("data-selectedCar");
        var carData = JSON.parse(carDataStr);

        $.post(
            `https://${GetParentResourceName()}/tryVehicle`,
            JSON.stringify({
                model: carData.spawnName,
            }),
            function (data) {
                if (data === true) {
                    $.post(`https://${GetParentResourceName()}/closeMenu`, JSON.stringify());
                    $(".youWantBuySection").hide();
                    $(".customizationSection").hide();
                    $(".succesfullyArea").hide();
                    $(".notifySectionXX").hide();
                    $(".generalContainer").fadeOut(200);
                    setTimeout(() => {
                        $(".generalContainer").hide();
                    }, 200);
                }
            }
        );
    }
});

$(document).on("click", ".categorieItem", function () {
    var current = document.getElementsByClassName("categorieItem selected");

    if (this.id === "money") {
        $.post(`https://${GetParentResourceName()}/openCaseSystem`, JSON.stringify({}));
        $.post(`https://${GetParentResourceName()}/closeMenu`, JSON.stringify());
        $(".youWantBuySection").hide();
        $(".customizationSection").hide();
        $(".succesfullyArea").hide();
        $(".notifySectionXX").hide();
        $(".generalContainer").fadeOut(200);
        setTimeout(() => {
            $(".generalContainer").hide();
        }, 200);
        return;
    }

    if (current.length > 0) {
        current[0].className = current[0].className.replace("categorieItem selected", "categorieItem");
    }
    this.className += " selected";

    $(".homeMenu").hide();
    $(".vehicleMenu").hide();
    $(".itemsMenu").hide();
    if (this.id === "vehicle") {
        setVehiclesIntoCategory(vehicles, "veh");
        $(".vehicleMenu").show();
        $(".carListItem:first-child").click();
    } else if (this.id === "motos") {
        setVehiclesIntoCategory(motos, "veh");
        $(".vehicleMenu").show();
        $(".carListItem:first-child").click();
    } else if (this.id === "weapon") {
        setItemIntoCategory(weapons, "weapon");
        $(".itemsMenu").show();
    } else if (this.id === "items") {
        setItemIntoCategory(items, "items");
        $(".itemsMenu").show();
    } else if (this.id === "helicopters") {
        setVehiclesIntoCategory(helicopterItems, "heli");
        $(".vehicleMenu").show();
        $(".carListItem:first-child").click();
    } else if (this.id === "money") {

    } else if (this.id === "packs") {
        setItemIntoCategory(packsItems, "packs");
        $(".itemsMenu").show();
    }
});

$(document).on("click", ".mainMenuButton", function () {
    var current = document.getElementsByClassName("categorieItem selected");
    if (current.length > 0) {
        current[0].className = current[0].className.replace("categorieItem selected", "categorieItem");
    }
    $(".homeMenu").show();
    $(".vehicleMenu").hide();
    $(".itemsMenu").hide();
    // this.className += " selected";
});

$(document).on("click", ".buyCreditButton", function () {
    window.invokeNative("openUrl", "https://bluestark.tebex.io/category/1864842");
});

$(document).on("click", ".itemsMenuItem", function () {
    var selectedDiv = this;
    var itemInfoStr = $(selectedDiv).attr("data-itemInfo");
    var itemType = $(selectedDiv).attr("data-type");
    var itemData = JSON.parse(itemInfoStr);
    if (itemType != "other") {
        $(".popUpItemList").empty();
        $(".popUpItemList").append(`
            <div class="popUpItem">
                <div class="popUpItemName">${itemData.label}</div>
                <div class="popUpItemCost">${itemData.costCredit} ${language.credit}</div>
            </div>
        `);
        $("#popUpBuy").attr("data-itemInfo", itemInfoStr);
        $("#popUpBuy").attr("data-itemType", itemType);
        $(".youWantBuySection").fadeIn(200);
    }
});

$(document).on("click", "#popUpCancel", function () {
    $(".youWantBuySection").fadeOut(200);
});

$(document).on("click", "#customizeUpCancel", function () {
    $(".customizationSection").fadeOut(200);
});

$(document).on("click", "#popUpBuy", function () {
    var selectedItemInfo = $("#popUpBuy").attr("data-itemInfo");
    var infoParse = JSON.parse(selectedItemInfo);
    var selectedItemType = $("#popUpBuy").attr("data-itemType");
    if (infoParse.costCredit <= currentCredit) {
        if (selectedItemType == "vehicle") {
            var customPlate = $("#popUpBuy").attr("data-customPlate");
            if (customPlate !== "undefined") {
                if (customPlate.length >= minCharPlate && customPlate.length <= maxCharPlate) {
                    $.post(
                        `https://${GetParentResourceName()}/getVehicle`,
                        JSON.stringify({
                            itemInfo: infoParse,
                            extra: customPlate,
                        }),
                        function (data) {
                            if (data === true) {
                                showSuccess();
                                currentCredit -= parseInt(infoParse.costCredit);
                                if (customPlate !== "undefined") {
                                    currentCredit -= customPlatePrice;
                                }
                                $(".youWantBuySection").fadeOut(200);
                                $(".creditCount").html(currentCredit);
                            } else {
                                $(".notifyArea").html(data);
                                $(".notifySectionXX").fadeIn(200);
                                setTimeout(() => {
                                    $(".notifySectionXX").fadeOut(200);
                                }, 3000);
                            }
                        }
                    );
                } else {
                    $(".notifyArea").html(language.minimumChar + minCharPlate + language.MaximumChar + maxCharPlate);
                    $(".notifySectionXX").fadeIn(200);
                    setTimeout(() => {
                        $(".notifySectionXX").fadeOut(200);
                    }, 3000);
                }
            } else {
                $.post(
                    `https://${GetParentResourceName()}/getVehicle`,
                    JSON.stringify({
                        itemInfo: infoParse,
                        extra: customPlate,
                    }),
                    function (data) {
                        if (data === true) {
                            showSuccess();
                            currentCredit -= parseInt(infoParse.costCredit);
                            if (customPlate !== "undefined") {
                                currentCredit -= customPlatePrice;
                            }
                            $(".youWantBuySection").fadeOut(200);
                            $(".creditCount").html(currentCredit);
                        } else {
                            $(".notifyArea").html(data);
                            $(".notifySectionXX").fadeIn(200);
                            setTimeout(() => {
                                $(".notifySectionXX").fadeOut(200);
                            }, 3000);
                        }
                    }
                );
            }
        } else if (selectedItemType == "weapon") {
            $.post(
                `https://${GetParentResourceName()}/getWeapon`,
                JSON.stringify({
                    itemInfo: infoParse,
                }),
                function (data) {
                    if (data === true) {
                        showSuccess();
                        currentCredit -= parseInt(infoParse.costCredit);
                        $(".youWantBuySection").fadeOut(200);
                        $(".creditCount").html(currentCredit);
                    } else {
                        $(".notifyArea").html(data);
                        $(".notifySectionXX").fadeIn(200);
                        setTimeout(() => {
                            $(".notifySectionXX").fadeOut(200);
                        }, 3000);
                    }
                }
            );
        } else if (selectedItemType == "items") {
            $.post(
                `https://${GetParentResourceName()}/getItem`,
                JSON.stringify({
                    itemInfo: infoParse,
                }),
                function (data) {
                    if (data === true) {
                        showSuccess();
                        currentCredit -= parseInt(infoParse.costCredit);
                        $(".youWantBuySection").fadeOut(200);
                        $(".creditCount").html(currentCredit);
                    } else {
                        $(".notifyArea").html(data);
                        $(".notifySectionXX").fadeIn(200);
                        setTimeout(() => {
                            $(".notifySectionXX").fadeOut(200);
                        }, 3000);
                    }
                }
            );
        } else if (selectedItemType == "money") {
            $.post(
                `https://${GetParentResourceName()}/getMoney`,
                JSON.stringify({
                    itemInfo: infoParse,
                }),
                function (data) {
                    if (data === true) {
                        showSuccess();
                        currentCredit -= parseInt(infoParse.costCredit);
                        $(".youWantBuySection").fadeOut(200);
                        $(".creditCount").html(currentCredit);
                    } else {
                        $(".notifyArea").html(data);
                        $(".notifySectionXX").fadeIn(200);
                        setTimeout(() => {
                            $(".notifySectionXX").fadeOut(200);
                        }, 3000);
                    }
                }
            );
        } else if (selectedItemType == "packs") {
            $.post(
                `https://${GetParentResourceName()}/getPacks`,
                JSON.stringify({
                    itemInfo: infoParse,
                }),
                function (data) {
                    if (data === true) {
                        showSuccess();
                        currentCredit -= parseInt(infoParse.costCredit);
                        $(".youWantBuySection").fadeOut(200);
                        $(".creditCount").html(currentCredit);
                    } else {
                        $(".notifyArea").html(data);
                        $(".notifySectionXX").fadeIn(200);
                        setTimeout(() => {
                            $(".notifySectionXX").fadeOut(200);
                        }, 3000);
                    }
                }
            );
        }
    } else {
        $(".notifyArea").html(language.dontHaveEnoughtCredit);
        $(".notifySectionXX").fadeIn(200);
        setTimeout(() => {
            $(".notifySectionXX").fadeOut(200);
        }, 3000);
    }
});

$(document).on("click", ".approveButton", function () {
    var codeInputValue = $("#redeemCodeInput").val();
    if (codeInputValue != "Remplir le code.." && codeInputValue.length > 0) {
        $.post(
            `https://${GetParentResourceName()}/sendInput`,
            JSON.stringify({
                input: codeInputValue,
            }),
            function (data) {
                if (data) {
                    showSuccess();
                    currentCredit += parseInt(data);
                    $(".creditCount").html(currentCredit);
                }
            }
        );
    }
});

$(document).on("click", ".carBoxButton", function () {
    $("#vehicle").click();
});
$(document).on("click", ".gunBoxButton", function () {
    $("#weapon").click();
});
$(document).on("click", ".otherBoxButton", function () {
    $("#packs").click();
});
$(document).on("click", ".moneyBoxButton", function () {
    $.post(`https://${GetParentResourceName()}/openCaseSystem`, JSON.stringify({}));
    $.post(`https://${GetParentResourceName()}/closeMenu`, JSON.stringify());
    $(".youWantBuySection").hide();
    $(".customizationSection").hide();
    $(".succesfullyArea").hide();
    $(".notifySectionXX").hide();
    $(".generalContainer").fadeOut(200);
    setTimeout(() => {
        $(".generalContainer").hide();
    }, 200);
});

$(document).on("click", ".carListItem", function () {
    var current = document.getElementsByClassName("carListItem selected");
    if (current.length > 0) {
        current[0].className = current[0].className.replace("carListItem selected", "carListItem");
    }
    this.className += " selected";
    var selectedDiv = this;
    var carDataStr = $(selectedDiv).attr("data-carData");
    var carData = JSON.parse(carDataStr);
    $(".leftCarBrand").html(carData.brand);
    $(".leftCarModel").html(carData.model);
    $(".leftCarYear").html(carData.year);
    $("#leftCarImage").attr("src", carData.carImage);
    $("#leftTopSpeedText").html(carData.topSpeedGraph + "%");
    $("#leftBrakeText").html(carData.brakingPower + "%");
    $("#leftRobustness").html(carData.robustness + "%");
    $("#leftSpeedGraph").css("width", carData.topSpeedGraph + "%");
    $("#leftBrakeGraph").css("width", carData.brakingPower + "%");
    $("#leftRobustnessGraph").css("width", carData.robustness + "%");
    document.getElementById("cstmPltPrice").innerHTML = `( ${customPlatePrice} ${language.credit} )`;
    $("#buyPrice").html(carData.costCredit);
    $("#buyPriceText").html(language.credit);
    $(".leftBuyButton").attr("data-selectedCar", carDataStr);
    $(".leftBuyButton").attr("data-type", "vehicle");
    $(".rightTestButton").attr("data-selectedCar", carDataStr);
    $(".rightTestButton").attr("data-type", "vehicle");
});

window.addEventListener("message", (event) => {
    if (event.data.type === "openUi") {
        currentCredit = event.data.currentCredit;
        $(".generalContainer").show();
        $(".charName").html(event.data.firstName);
        $(".charSurName").html(event.data.lastName);
        $(".creditCount").html(event.data.currentCredit);
    } else if (event.data.type === "setJs") {
        language = event.data.language;
        customPlatePrice = event.data.customPlatePrice;
        vehicles = event.data.vehicles;
        motos = event.data.motos;
        categories = event.data.categories;
        weapons = event.data.weapons;
        items = event.data.items;
        moneyItems = event.data.moneys;
        packsItems = event.data.packs;
        minCharPlate = event.data.minCharForPlate;
        maxCharPlate = event.data.maxCharForPlate;
        setCategories();

        $(".title1").html(language.title1);
        $(".title2").html(language.title2);

        $(".buyCreditButton").html(language.buyCreditButton);
        $(".creditText").html(language.credit);
        $(".customizeBuyText").html(language.customizeTitle);
        $(".customizeInfo").html(language.customizeInfo);
        $(".succesNotify").html(language.thanksForPurchasing);
        $("#checkBoxLabel").html(language.vehBuyCustomPlateText);

        $(".redeemText").html(language.redeemCodeTitle1);
        $(".codeText").html(language.redeemCodeTitle2);
        $(".redeemCodeDescArea").html(language.redeemCodeDesc);
        $(".redeemInfoText").html(language.redeemCodeBelow);
        $(".approveButton").html(language.approveButton);

        $(".buyPriceText").html(language.credit);
        $(".buyButtonBuyText").html(language.buyButtonText);
        $(".testButtonText").html(language.testButtonText);

        $(".carBoxDoYouNeed").html(language.carDoYouNeedTitle1);
        $(".boxACarText").html(language.carDoYouNeedTitle2);
        $(".carBoxInfoText").html(language.carButtonBelow);
        $(".carBoxDescription").html(language.carAreaDesc);
        $(".carBoxButton").html(language.carButtonText);
        $(".carButtonBelowText").html(language.carButtonInfo);

        $(".gunBoxInfoText").html(language.gunInfo);
        $(".gunDoYouNeedText").html(language.gunTitle1);
        $(".boxAGunText").html(language.gunTitle2);
        $(".gunBoxDescription").html(language.gunDesc);
        $(".gunBoxButton").html(language.gunButtonText);
        $(".gunButtonBelowText").html(language.gunTinyInfo);

        $(".otherBoxButton").html(language.otherButton);
        $(".otherBoxDescription").html(language.otherDesc);
        $(".otherBoxInfoText").html(language.otherInfo);

        $(".moneyBoxDescription").html(language.moneyDesc);
        $(".moneyBoxButton").html(language.moneyButtonText);
        $(".moneyBoxInfoText").html(language.moneyInfo);
    }
});

$(document).on("keydown", function () {
    switch (event.keyCode) {
        case 27: // ESC
            $.post(`https://${GetParentResourceName()}/closeMenu`, JSON.stringify());
            $(".youWantBuySection").hide();
            $(".customizationSection").hide();
            $(".succesfullyArea").hide();
            $(".notifySectionXX").hide();
            $(".generalContainer").fadeOut(200);
            setTimeout(() => {
                $(".generalContainer").hide();
            }, 200);
            break;
    }
});

function setItemIntoCategory(data, itemType) {
    $(".itemsMenuItemList").empty();
    data.forEach((element) => {
        $(".itemsMenuItemList").append(`
        <div class="itemsMenuItem" data-itemInfo='${JSON.stringify(element)}' data-type="${itemType}">
            <div class="itemMenuItemNameArea">${element.label}</div>
            <div class="itemMenuItemImageAreas">
                <img src=${element.image} alt="" />
            </div>
            <div class="itemMenuItemCreditArea">
                <i class="fa-solid fa-credit-card" id="creditCardIconItemList"></i>
                <span class="ItemMenuItemPrice">${element.costCredit}</span>
                <span class="ItemMenuItemPriceText">${language.credit}</span>
            </div>
        </div>
        `);
    });
}

function showSuccess() {
    $(".succesfullyArea").fadeIn(200);
    setTimeout(() => {
        $(".succesfullyArea").fadeOut(200);
    }, 3000);
}

function showError(message) {
    $(".errorNotify").html(message);
    $(".errorNotifyArea").fadeIn(200);
    setTimeout(() => {
        $(".errorNotifyArea").fadeOut(200);
    }, 3000);
}

var elements = document.getElementById("categorieItemListID");
elements.addEventListener("wheel", (event) => {
    event.preventDefault();
    elements.scrollBy({
        left: event.deltaY < 0 ? -30 : 30,
    });
});

$(document).on("click", ".buyPremiumButton", function () {
    inRedeemArea = true;
    $(".redeemCodeGeneral").show();
});

var elements = document.getElementById("categorieItemListID");
elements.addEventListener("wheel", (event) => {
    event.preventDefault();
    elements.scrollBy({
        left: event.deltaY < 0 ? -40 : 40,
    });
});