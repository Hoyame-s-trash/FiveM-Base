$(function(){
    let Animations = [
        {
            title: 'Smiling 4',
            likes: false,
            liked: false,
            name: "smiling4",
            category: 'other',
        },
        {
            title: 'Smiling 3',
            likes: false,
            liked: true,
            name: "smiling3",
            category: 'style',
        },
        {
            title: 'Smiling 3',
            likes: false,
            name: "usmiechniet3",
            liked: true,
        },
        {
            title: 'Smiling 3',
            likes: false,
            name: "smiling3",
            liked: true,
        },
        {
            title: 'Smiling 3',
            likes: false,
            name: "smiling3",
            liked: true,
        },
        {
            title: 'Smiling 3',
            likes: false,
            name: "smiling3",
            liked: true,
        },
    ];

    let settings = [0, 0, 0];
    let showFavoris = false;
    let chosenSet = 0;
    let category = 'stand';

    let sets = [
        [],
        [],
        [],
        [],
        [],
    ];

    function OpenEmptyBar() {
        $('#bottom-panel .option').remove();
        $('#bottom-panel').append(`<div class="option" id="categories" style="width: 100%;"></div>`)
    }

    function OpenMainBar() {
        $('#top-panel .option').remove();
        $('#top-panel').append(`<div class="option" id="categories">Categories</div>`)
        $('#top-panel').append(`<div class="option" id="settings">Animation settings</div>`)
        $('#top-panel').append(`<div class="option" id="Favoris">Favorites</div>`)
        $('#categories').click(function(e) {
            showFavoris = !showFavoris;
            CreateItems(Animations);
        });
        $('#settings').click(function(e) {
            OpenSettingsChoiceBar();
        });
        $('#Favoris').click(function(e) {
            showFavoris = !showFavoris;
            CreateItems(Animations.filter((elem) => {
                return !showFavoris && elem.category !== 'face' && elem.category !== 'style' || elem.liked === showFavoris;
            }));
            
            showFavoris ? OpenFavorisBar() : OpenEmptyBar();
        });
    }

    function OpenFavorisBar() {
        $('#bottom-panel .option').remove();
        $('#bottom-panel').append(`<div class="option" id="save">Save</div>`);
        $('#bottom-panel').append(`<div class="option set" id="1">Set 1</div>`);
        $('#bottom-panel').append(`<div class="option set" id="2">Set 2</div>`);
        $('#bottom-panel').append(`<div class="option set" id="3">Set 3</div>`);
        $('#bottom-panel').append(`<div class="option set" id="4">Set 4</div>`);
        $('#bottom-panel').append(`<div class="option set" id="5">Set 5</div>`);
        
        $('#save').click(function(e) {
            showFavoris = false;
            CreateItems(Animations.filter((elem) => {
                return !showFavoris || elem.liked === showFavoris;
            }));
            chosenSet = 0;
            $.post(`https://${GetParentResourceName()}/saveFavoris`, JSON.stringify({sets: sets}));
            OpenMainBar();
        });
        $('.set').click(function(e) {
            $('.set').removeClass('active');
            $(this).addClass('active');
            chosenSet = parseInt($(this).attr('id'));
            // console.log(chosenSet)
            CreateItems(Animations.filter((elem) => {
                return !showFavoris || elem.liked === showFavoris;
            }));
        })
    }

    function OpenSettingsBar() {
        $('#bottom-panel .option').remove();
        $('#bottom-panel').append(`<div class="option" id="return">Return</div>`);
        $('#bottom-panel').append(`<div class="option ${settings[0] == 0 ? 'active' : ''}" id="whole-body">Whole Body</div>`)
        $('#bottom-panel').append(`<div class="option ${settings[0] == 48 ? 'active' : ''}" id="upper-body">Upper Body</div>`)
        $('#bottom-panel').append(`<div class="option ${settings[1] == 0 ? 'active' : ''}" id="play-once">Play Once</div>`)
        $('#bottom-panel').append(`<div class="option ${settings[1] == 1 ? 'active' : ''}" id="play-repeat">Loop</div>`)
        $('#bottom-panel').append(`<div class="option ${settings[1] == 14 ? 'active' : ''}" id="play-freeze">Freeze</div>`)

        $('#return').click(function(e) {
            OpenSettingsChoiceBar();
        });
        $('#whole-body').click(function(e) {
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({index: 1, flag: 8}));
            settings[0] = 8;
            $('#upper-body').removeClass('active');
            $(this).addClass('active');
        });
        $('#upper-body').click(function(e) {
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({index: 1, flag: 48}));
            settings[0] = 48;
            $('#whole-body').removeClass('active');
            $(this).addClass('active');
        });
        $('#play-once').click(function(e) {
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({index: 2, flag: 0}));
            settings[1] = 0;
            $('#play-repeat').removeClass('active');
            $('#play-freeze').removeClass('active');
            $(this).addClass('active');
        });
        $('#play-repeat').click(function(e) {
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({index: 2, flag: 1}));
            settings[1] = 1;
            $('#play-freeze').removeClass('active');
            $('#play-once').removeClass('active');
            $(this).addClass('active');
        });
        $('#play-freeze').click(function(e) {
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({index: 2, flag: 14}));
            settings[1] = 14;
            $('#play-repeat').removeClass('active');
            $('#play-once').removeClass('active');
            $(this).addClass('active');
        });
    }

    function OpenSettingsChoiceBar() {
        $('#bottom-panel .option').remove();
        $('#bottom-panel').append(`<div class="option" id="categories"></div>`)
        $('#bottom-panel').append(`<div class="option" id="default">Standard</div>`)
        $('#bottom-panel').append(`<div class="option" id="custom">Own</div>`)
        $('#bottom-panel').append(`<div class="option" id="categories"></div>`)

        $('#default').click(function(e) {
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({default: 1}));
            $(this).addClass('active');
        });
        $('#custom').click(function(e) {
            OpenSettingsBar();
        });
    }

    function OpenCategoriesBar() {
        $('#bottom-panel .option').remove();
        $('#bottom-panel').append(`<div class="option category" id="stand"><i class="fa-solid fa-user"></i></div>`);
        $('#bottom-panel').append(`<div class="option category" id="party"><i class="fas fa-music"></i></div>`);
        $('#bottom-panel').append(`<div class="option category" id="help"><i class="fa-solid fa-kit-medical"></i></div>`);
        $('#bottom-panel').append(`<div class="option category" id="sport"><i class="fas fa-volleyball-ball"></i></div>`);
        $('#bottom-panel').append(`<div class="option category" id="other"><i class="fa-solid fa-gear"></i></div>`);
        $('#bottom-panel').append(`<div class="option category" id="prop"><i class="fas fa-box"></i></div>`);
        $('#bottom-panel').append(`<div class="option category" id="face"><i class="fa-solid fa-face-smile-wink"></i></div>`);
        $('#bottom-panel').append(`<div class="option category" id="main"><i class="fas fa-couch"></i></div>`);
        $('#bottom-panel').append(`<div class="option category" id="style"><i class="fa-solid fa-person-walking"></i></div>`);
        $('#bottom-panel').append(`<div class="option category" id="synced"><i class="fas fa-people-arrows"></i></div>`);

        $('.category').click(function(e) {
            const id = $(this).attr('id');
            category = id;

            CreateItems(Animations);
        })
    }

    function FindAnimation(name) {
        for (const animation of Animations) {
            if (animation.name === name) {
                return animation
            }
        }
        return null
    }

    function CreateItems(animations) {
        OpenCategoriesBar();
        // console.log($('input').val())
        if ($('input').val()) {
            animations = animations.filter(anim => (anim.title.toLowerCase().includes($('input').val().toLowerCase()) || anim.name.toLowerCase().includes($('input').val().toLowerCase())) )
        }

        if (category) {
            if (category === 'all') {
                animations = animations.filter(anim => anim.category !== 'face' && anim.category !== 'style');
            } else {
                animations = animations.filter(anim => anim.category === category);
            }
        }

        if (showFavoris) {
            animations = animations.filter(anim => anim.liked);
        }
        
        $('.box').html('');
        for (const animation of animations) {
            if (animation.category == 'test') {
                $('.box').append(`<div class="item" id="${animation.name}"><div class="popularity"><i class="fas fa-heart ${animation.liked ? 'red' : ''}"></i><span class="counter">${animation.likes ? animation.likes : 0}</span></div><div class="info"><div class="title">${animation.title}</div></div</div>`)
            } else {
                let likes = false;
                let additional = '';
                if (animation.liked) {
                    for (let seti = 0; seti < sets.length; seti++) {
                        const set = sets[seti];
                        for (let index = 0; index < set.length; index++) {
                            const setAnim = set[index];
                            if (setAnim === animation.name) {
                                likes = index + 1;
                                animation.likes = likes;
                                additional += seti + 1;
                            }
                        }
                    }
                }
                $('.box').append(`<div class="item" id="${animation.name}"<div class="info"><div class="title">${animation.title}</div></div</div><div class="popularity"><i class="far fa-star ${animation.liked ? 'red' : ''}"></i><span class="counter">${likes ? additional + '-' + likes : ''}</span></div>`)
            }
        }
        $(".popularity i").click(function(e) {
            if (showFavoris) return;
            e.stopPropagation();
    
            const classes = $(this).attr('class')
            if (classes.search('red') != -1 ) {
                const id = $(this).parent().parent().attr('id');
                const animation = FindAnimation(id);
                if (animation.likes) return;
                if (animation) {
                    animation.liked = false;
                }
                $(this).removeClass('red');
                $.post(`https://${GetParentResourceName()}/dislikeAnim`, JSON.stringify({name: id}));
            } else {
                const id = $(this).parent().parent().attr('id');
                const animation = FindAnimation(id);
                if (animation) {
                    animation.liked = true;
                }
                $(this).addClass('red');
                $.post(`https://${GetParentResourceName()}/likeAnim`, JSON.stringify({name: id}));
            }
        });
        $(".item").click(function(e) {
            const id = $(this).attr('id');
            if (chosenSet > 0) {
                const setAnims = sets[chosenSet-1];

                const animation = FindAnimation(id);
                if (animation.likes) {
                    for (let seti = 0; seti < sets.length; seti++) {
                        const set = sets[seti];
                        for (let index = 0; index < set.length; index++) {
                            const setAnim = set[index];
                            if (setAnim === animation.name && chosenSet !== seti+1) {
                                // console.log(animation.name);
                                // console.log(seti);
                                return;
                            }
                        }
                    }
                    setAnims.splice(animation.likes-1, 1);
                    animation.likes = false;
                    $(this).find('.counter').text('');
                    CreateItems(Animations.filter((elem) => {
                        return !showFavoris || elem.liked === showFavoris;
                    }));
                    $.post(`https://${GetParentResourceName()}/saveFavoris`, JSON.stringify({sets: sets}));
                } else {
                    if (setAnims.length >= 5 ) {
                        return;
                    }
                    animation.likes = setAnims.length+1;
                    setAnims.push(id);
                    $(this).find('.counter').text(chosenSet + '-' + animation.likes);
                    $.post(`https://${GetParentResourceName()}/saveFavoris`, JSON.stringify({sets: sets}));
                }
            } else {
                // console.log("repcak")
                $.post(`https://${GetParentResourceName()}/playAnim`, JSON.stringify({name: id}));
                
                e.stopPropagation();
                $('.box-wrapper').fadeOut(400);
                $('#popup').hide();
            }
        });

    }

    $(document).keyup(function(e) {
        if(e.keyCode == 27){
            $('.box-wrapper').fadeOut(400);
            $('#popup').hide();
            $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        }
    })

    $(document).mousedown(function(ev){
        if(ev.which == 3)
        {
            $('.box-wrapper').fadeOut(400);
            $('#popup').hide();
            $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        }
  });

	window.addEventListener('message', function(event) {
		if(event.data.status === 'show'){
            $('.box-wrapper').fadeIn(400);
            $('input').text('');
            settings = event.data.settings;
		} else if (event.data.status === 'hide') {
            $('.box-wrapper').fadeOut(400);
            $('#popup').hide();
        } else if (event.data.status === 'update') {
            Animations = event.data.animations;
            sets = event.data.sets;
            CreateItems(Animations.filter((elem) => {
                return elem.category !== 'face' && elem.category !== 'style';
            }));
        }

	});
    $("input").on('input propertychange', function() {
        CreateItems(Animations)
    });

    OpenCategoriesBar();
    CreateItems(Animations.filter((elem) => {
        return elem.category !== 'face' && elem.category !== 'style';
    }));

    function createPopup(elementId, message) {
        $('#popup').text(message)

        const rect = document.querySelector(elementId).getBoundingClientRect()
        const x = (rect.left + rect.width/2) - (document.querySelector('#popup').getBoundingClientRect().width / 2);
        const y = rect.top - rect.height - rect.height/2;

        $('#popup').css("top", y)
        $('#popup').css("left", x)
        $('#popup').show()
    }

    $('#setting-loop').mousemove(e => {
        createPopup('#setting-loop', "Lire l'animation en boucle")
        e.stopPropagation();
    })

    $('#setting-loop').click(e => {
        if (settings[1] == 0) {
            settings[1] = 1;
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({index: 2, flag: 1}));
            $('#setting-loop').addClass('active');
        } else {
            settings[1] = 0;
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({index: 2, flag: 0}));
            $('#setting-loop').removeClass('active');
        }
    })

    $('#setting-body').click(e => {
        if (settings[0] == 0) {
            settings[0] = 48;
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({index: 1, flag: 48}));
            $('#setting-body').addClass('active');
        } else {
            settings[0] = 0;
            $.post(`https://${GetParentResourceName()}/settingsAnim`, JSON.stringify({index: 1, flag: 0}));
            $('#setting-body').removeClass('active');
        }
    })

    $('#setting-body').mousemove(e => {
        createPopup('#setting-body', "Only upper body")
        e.stopPropagation();
    })

    $('#setting-stop').mousemove(e => {
        createPopup('#setting-stop', "Arrêter l'animation")
        e.stopPropagation();
    })

    $('#setting-stop').click(e => {
        createPopup('#setting-stop', "Arrêter l'animation")
        $.post(`https://${GetParentResourceName()}/stop`, JSON.stringify({}));
    })

    $('#favourite').mousemove(e => {
        createPopup('#favourite', "Voir vos emotes favoris")
        e.stopPropagation();
    })

    $('#favourite').click(e => {
        chosenSet = 0;
        // console.log(showFavoris)
        showFavoris = !showFavoris;
        if (showFavoris) {
            $("#favourite").addClass("active")
        } else {
            $("#favourite").removeClass("active")
        }
        CreateItems(Animations);
    })

    $('#exit').click(e => {
        chosenSet = 0;
        $('.box-wrapper').fadeOut(400);
        $('#popup').hide();
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
    })

    $('.set').mousemove(e => {
        createPopup(`#${e.target.id}`, "Slot animation")
        e.stopPropagation();
    })
    
    $('.set').click(e => {
        showFavoris = true;
        chosenSet = parseInt(e.target.id.substr(-1));
        CreateItems(Animations);
    })

    $('.option').mouseleave(e => {
        $('#popup').hide()
    })

    $('#exit').mousemove(e => {
        createPopup('#exit', "Exit")
        e.stopPropagation();
    })

});

