var GameType = {
    NONE: 0,
    BANG_BEAVER:  1,
    FORTUNE_TELLER: 2,
    BALLOON_SHOOTER: 3,
    TARGET_SHOOTER: 4,
    BASKET_THROW: 5,
}

var GameTypeTimerAllowed = {
    [GameType.BASKET_THROW]: true,
    [GameType.TARGET_SHOOTER]: true,
    [GameType.BALLOON_SHOOTER]: true,
}

var AppCarnival = new Vue({
	el: '#body',
	data:
	{
		ActiveGameType: GameType.NONE,
		hideMouse: false,
		GameType: GameType,

		aimDisabled: false,

		BalloonMaxDarts: 5,
		BalloonDartsLeft: 5,

		BalloonDifficulty: 0,

		highScores: [],

		ClosestPlayers: [],

		modalHighestScoreTitle: "",
		difficultyTitle: "",

		time: 60,
	},

    methods: {

        CanCountTime: function(){
            return GameTypeTimerAllowed[this.ActiveGameType] != null;
        },

        CloseHighScoreModal: function(){
            $("#highscore_modal").modal("hide");
            $.post('https://rcore_carnival/hideMouse', JSON.stringify({}));
        },

        selectPlayer: function(id){
            $("#close_players").modal("hide");
            $.post('https://rcore_carnival/userSelectedPlayer', JSON.stringify({ SelectedID: id}));
        },

        Close: function(){
            $("#close_players").modal("hide");
            $("#textboard").modal("hide");
            $.post('https://rcore_carnival/hideMouse', JSON.stringify({}));
        },

 	    GetDartsLeft: function(){
            return (this.BalloonMaxDarts - this.BalloonDartsLeft)
 	    },
 	    GetMaxDartsLeft: function(){
            return (this.BalloonMaxDarts - (this.BalloonMaxDarts - this.BalloonDartsLeft))
 	    },
    },
})


$(document).ready(function(){
    $(document).mousedown(function(event) {
        if(event.button == 0){
            if(AppCarnival.BalloonDifficulty != 0){
                $.post('https://rcore_carnival/mouseclick', JSON.stringify({
                    x: (event.clientX - offsetX) + randomOffsetNowX,
                    y: (event.clientY - offsetY) + randomOffsetNowY,
                }));
                }else{
                $.post('https://rcore_carnival/mouseclick', JSON.stringify({
                    x: (event.clientX - offsetX),
                    y: (event.clientY - offsetY),
                }));
            }
        }
    });

    $(document).on("keydown", function(event) {
        if(event.keyCode == 8){
            $.post('https://rcore_carnival/backspace', JSON.stringify({}));
        }
    });
});

var offsetX = window.screen.availHeight * 0.025;
var offsetY = window.screen.availWidth * 0.013;

var lerpSpeed = 0.1;

var randomOffGeneratedX = 0
var randomOffGeneratedY = 0

var maxRandomPercentage = 0.055;

var maxRandomX = window.screen.availHeight * maxRandomPercentage;
var maxRandomY = window.screen.availWidth * maxRandomPercentage;

var randomOffsetNowX = 0
var randomOffsetNowY = 0

var event = null;

setInterval(function(){
    if(AppCarnival.ActiveGameType == GameType.BALLOON_SHOOTER){
        randomOffsetNowX = lerp(randomOffsetNowX, randomOffGeneratedX, lerpSpeed)
        randomOffsetNowY = lerp(randomOffsetNowY, randomOffGeneratedY, lerpSpeed)

        if(event){
            if(AppCarnival.BalloonDifficulty != 0){
                $(".aim").css({top: (event.clientY - offsetY) + randomOffsetNowY, left: (event.clientX - offsetX) + randomOffsetNowX, position:'absolute'});
             }else{
                $(".aim").css({top: (event.clientY - offsetY), left: (event.clientX - offsetX), position:'absolute'});
            }
        }
    }
}, 16)

function GenerateRandomPositionOnScreen(){
    if(AppCarnival.ActiveGameType == GameType.BALLOON_SHOOTER){
        randomOffGeneratedX = randomIntFromInterval(maxRandomX * -1, maxRandomX);
        randomOffGeneratedY = randomIntFromInterval(maxRandomY * -1, maxRandomY);
    }
}

var randomLerpTimer = setInterval(GenerateRandomPositionOnScreen, 100)

function lerp(a, b, t){
    return a + (b - a) * 0.5 * t
}

function randomIntFromInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min)
}

function mousemove(event_){
    event = event_;
}

window.addEventListener('mousemove', mousemove);

$(document).ready(function(){
    $.post('https://rcore_carnival/init', JSON.stringify({}));
})

// display close players
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

        if(item.type === "display_closest_players_keys"){
            AppCarnival.ClosestPlayers = item.closestPlayers;

            AppCarnival.$nextTick(function () {
                $('#close_players').modal({
                    backdrop: 'static',
                    keyboard: false
                });
            });
        }
	})
});

// notification about confirmation
$(function(){
	window.addEventListener('message', function(event) {
        var item = event.data;

		if(item.type === "hideNotifTest"){
           $("#notification").hide(1500);
		}

		if(item.type === "showNotifTest"){
            $("#notification").show(1500);
		}
	})
});

$(function(){
	window.addEventListener('message', function(event) {
		var item = event.data;
        switch(item.type)
        {
            case "aimDisabled":
                AppCarnival.aimDisabled = item.enabled;
                break;
            case "display_for_copy":
                $('#textboard').modal("show");
                $(".textarea").val(item.text);
                break;

            case "highscore":
                endAnimation = false;
                $(".text3d").slideDown();
                autoClick();
                setCanvasSize();

                $(".text3d").text(item.text)

                setTimeout(function(){
                    endAnimation = true;
                    $(".text3d").slideUp();
                }, 4500);
                break;

            case "time":
            	AppCarnival.time = item.time;
                break;

            case "highScores":
                $("#highscore_modal").modal("show");

                AppCarnival.modalHighestScoreTitle = item.modalHighestScoreTitle;
                AppCarnival.difficultyTitle = item.difficultyTitle;
            	AppCarnival.highScores = item.highScores;

                break;

            case "baloonDifficulty":
                AppCarnival.BalloonDifficulty = item.BalloonDifficulty;

                if(item.BalloonDifficulty == 1){
                    lerpSpeed = 0.05;

                    maxRandomPercentage = 0.035;
                    maxRandomX = window.screen.availHeight * maxRandomPercentage;
                    maxRandomY = window.screen.availWidth * maxRandomPercentage;

                    clearInterval(randomLerpTimer);
                    randomLerpTimer = setInterval(GenerateRandomPositionOnScreen, 300);
                }
                if(item.BalloonDifficulty == 2){
                    lerpSpeed = 0.1;

                    maxRandomPercentage = 0.055;
                    maxRandomX = window.screen.availHeight * maxRandomPercentage;
                    maxRandomY = window.screen.availWidth * maxRandomPercentage;

                    clearInterval(randomLerpTimer);
                    randomLerpTimer = setInterval(GenerateRandomPositionOnScreen, 100);
                }
                break;

            case "updateMaxDarts":
            	AppCarnival.BalloonMaxDarts = item.BalloonMaxDarts;
                break;

            case "updateDartsLeft":
                AppCarnival.BalloonDartsLeft = item.BalloonDartsLeft;
                AppCarnival.BalloonMaxDarts = AppCarnival.BalloonMaxDarts;
                break;

            case "leftGame":
                AppCarnival.ActiveGameType = GameType.NONE;
                AppCarnival.hideMouse = false;
                break;

            case "activeGame":
                AppCarnival.ActiveGameType = item.gameType;

                if(item.gameType == GameType.BALLOON_SHOOTER){
                    AppCarnival.hideMouse = true;
                }

                AppCarnival.$nextTick(function () {
                    $("#game").fadeIn(1500);
                })
                break;
		}
	})

});