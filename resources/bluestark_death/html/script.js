
time = 0
seconds = 0
resetseconds = 0

window.addEventListener("message", function (event) {
  time = event.data.time
  if (event.data.type == true) {
    $("body").fadeIn(800);
    startTimer(event.data.time)
  } else {
    $("body").fadeOut(800);
    reset()
  }
});

init = ""
testint = ""
function startTimer(time) {
  reset()
  let counter = document.getElementById('counter'),
    seconds = time,
    init;
  init = setInterval(() => {
    seconds--;

    let minutes = Math.floor(seconds / 60)
    let scss = seconds % 60;

    counter.innerHTML = minutes + ":" + (scss < 10 ? "0" : "") + String(scss);
    if (seconds == 0) {
      clearInterval(init);
      reset()
      $.post('http://bluestark_death/respawn', JSON.stringify({}));
    }
  }, 1000);
}

function reset() {
  let counter = document.getElementById("counter");
  let minutes = Math.floor(time / 60)
  let scss = time % 60
  counter.innerHTML = `${minutes}:${scss}`
  $(".svg").css({ 'left': '38rem', 'top': '19.6rem', 'width': '15rem' })
  $(".svg2").css({ 'left': '62rem', 'top': '19.6rem', 'width': '15rem' })
}

function countdown(time) {
  seconds = time;
  function tick() {
    var counter = document.getElementById("counter");
    seconds--;
    let minutes = Math.floor(seconds / 60)
    let scss = seconds % 60
    counter.innerHTML = minutes + ":" + (scss < 10 ? "0" : "") + String(scss);
    if (seconds > 0) {
      setTimeout(tick, 1000);
    } else {
      setTimeout(() => {
        reset()
        seconds = time
        $("body").fadeOut(800);
        $(".svg").css({ 'left': '38rem', 'top': '19.6rem', 'width': '15rem' })
        $(".svg2").css({ 'left': '62rem', 'top': '19.6rem', 'width': '15rem' })
        $.post('http://bluestark_death/respawn', JSON.stringify({}));
      }, 3000);
    }
  }
  tick();
}

document.addEventListener("keydown", (event) => {
  if (event.key === "g") {
    $.post('http://bluestark_death/sendDispatch', JSON.stringify({}));
  }
});

document.addEventListener("keydown", (event) => {
  if (event.key === "e") {
    $.post('http://bluestark_death/respawn', JSON.stringify({}));
  }
});