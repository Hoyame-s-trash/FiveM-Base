window.addEventListener("load", function () {

});

window.addEventListener("message", function (event) {
  var v = event.data;

  switch (v.action) {
    case "show":
      ShowSettings();
      break;

    case "showData":
      $("#name").text(`${v.name}`);
      $("#playTime").text(`${v.playTime}`);
      $("#players").text(`${v.players}/${v.slots}`);
      $("#serverId").text(`${v.serverId}`);
      $("#uniqueId").text(`${v.uniqueId}`);
      $("#job").text(`${v.job}`);
      $("#job2").text(`${v.job2}`);
      setValue("bank", v.bank);
      setValue("money", v.money);
      setValue("black_money", v.black_money);
      setCoins("coins", v.coins);
      break;
  }
});

function setValue(key, value) {
  if ($("#" + key + "").text() != value) {
    if (!isNaN(value)) {
      var $this = $("#" + key + "");
      jQuery({ Counter: parseInt($this.text(), 10) }).animate(
        { Counter: value },
        {
          duration: 2000,
          easing: "swing",
          step: function (now) {
            $this.text("$ " + Math.ceil(now));
          },
        }
      );
    } else {
      $("#" + key + "").text("" + value + "");
    }
  }
}

function setCoins(key, value) {
  if ($("#" + key + "").text() != value) {
    if (!isNaN(value)) {
      var $this = $("#" + key + "");
      jQuery({ Counter: parseInt($this.text(), 10) }).animate(
        { Counter: value },
        {
          duration: 2000,
          easing: "swing",
          step: function (now) {
            $this.text(Math.ceil(now));
          },
        }
      );
    } else {
      $("#" + key + "").text("" + value + "");
    }
  }
}

function ShowSettings() {
  $("body").show(500);
  quit = true;
  openUi = true;
}

$(function () {
  $("#settings").click(function () {
    $.post(
      "https://pause/SendAction",
      JSON.stringify({ action: "settings" })
    );
    tgl = true;
    CloseAll();
  });
  $("#map").click(function () {
    $.post("https://pause/SendAction", JSON.stringify({ action: "map" }));
    tgl = true;
    CloseAll();
  });
  $("#getinventory").click(function () {
    $.post(
      "https://pause/SendAction",
      JSON.stringify({ action: "getinventory" })
    );
    CloseAll();
  });
  $("#report").click(function () {
    $.post(
      "https://pause/SendAction",
      JSON.stringify({ action: "report" })
    );
    tgl = true;
    CloseAll();
  });
  $("#quit").click(function () {
    $.post("https://pause/SendAction", JSON.stringify({ action: "quit" }));
    CloseAll();
  });
  $("#resume").click(function () {
    tgl = true;
    CloseAll();
  });
  $("#discordinv").click(function () {
    window.invokeNative("openUrl", "https://discord.gg/bluestark"),
      $.post(
        "https://pause/SendAction",
        JSON.stringify({ action: "discordinv" })
      )
    CloseAll();
  });
  $("#achievements-random-button").click(function () {
    window.invokeNative("openUrl", "https://bluestark.tebex.io/category/1864842"),
      $.post(
        "https://pause/SendAction",
        JSON.stringify({ action: "achievements-random-button" })
      )
    CloseAll();
  });
});

function CloseAll() {
  $("body").hide(500);
  $.post("https://pause/exit", JSON.stringify({}));
}

var tgl = true;

function escape() {
  tgl ?
    console.log("") :
    CloseAll();
  tgl = !tgl;
}

document.addEventListener("keyup", function (e) {
  if (e.key === "Escape") escape();
});