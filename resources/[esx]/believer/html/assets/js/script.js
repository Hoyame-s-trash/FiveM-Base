const app = new Vue({
    el: '.hud',
    data: {
        show: false,
        announce: {
            show: false,
            texts: "",
        },
        admin: {
            show: false,
        },
        noclip: {
            show: false,
        },
        safezone: false,
        reports: {
            show: false,
            currentReports: 0,
            totalReports: 0,
        },
        id: 0,
        online: 0,
        slots: 0,
        microphone: false,
        datetime: [
            "00.00.0000",
            "00:00"
        ],
        chat: {
            history: [
                // {
                //     type: "STAFF",
                //     id: 1,
                //     name: "Believer :",
                //     text: "BlueStark grosse mise à jour !"
                // },
            ],
            showInput: false,
            activeMode: "ALL",
            modes: ["ALL", "STAFF"],
            submodes: ["ME"],
            msg: ""
        },
        logo: hudConfig.logo,
        wanted: 0,
        prize: "14 часов",
        weapon: {
            show: false,
            icon: "weapon_assaultrifle",
            ammo: [42, 128]
        },
        score: {
            show: false,
            time: "05:34",
            leftTeam: {
                id: "vagos",
                count: 32,
            },
            rightTeam: {
                id: "families",
                count: 32,
            }
        },
        gps: {
            direction: "NE",
            texts: [
                "Los Santos",
                "Ocean Drive Way"
            ]
        },
        vehicle: {
            show: false,
            speed: 99,
            gear: 4,
            rpm: 0.7,
            fuel: {
                value: 42,
                max: 80
            },

            states: {
                doors: false,
                engine: false,
                light: false
            }
        },
        money: {
            cash: {
                value: 0,
                modifier: {
                    type: "plus",
                    value: 650000,
                }
            },
            bank: {
                value: 0,
                modifier: {
                    type: "minus",
                    value: 650,
                }
            }
        },
        action: null,
        notifys: []
    },
    computed: {
        speed() {
            let speed = this.vehicle.speed,
                speedText = "";

            if (speed < 100) speedText += "0";
            if (speed < 10) speedText += "0";

            return speedText + speed;
        }
    },
    methods: {
        sendMsg() {
            fetch(`https://${GetParentResourceName()}/sendMsg`, {
                method: 'POST',
                body: JSON.stringify({
                    content: this.chat.msg,
                    mode: this.chat.activeMode
                })
            })
        },
        t(id) {
            return hudConfig.localization[id] || id;
        },
        team(id) {
            return hudConfig.teams[id]
        },
        gc(id) {
            return hudConfig.colors[id] || '#ffffff';
        },
        format(summ) {
            const formatter = new Intl.NumberFormat('en-US', {
                style: 'currency',
                currency: 'USD',
                maximumFractionDigits: 0,
            });
            return formatter.format(summ)
        },
        transitionEnter(el, done) {
            gsap.timeline()
                .from(el, 0.6, { margin: 0, ease: 'power3.out' })
                .from(el, 0.4, { x: "-300%", height: 0, onComplete: done })
        },
        transitionLeave(el, done) {
            gsap.timeline()
                .to(el, 0.4, { y: "300%", opacity: 0 })
                .to(el, 0.6, { height: 0, margin: 0, onComplete: done, ease: 'power3.out' })
        }
    },
    mounted() {
        window.addEventListener("message", async (e) => {
            const data = e.data;

            switch (data.type) {
                case "updateGps":
                    this.gps.direction = data.direction;
                    this.gps.texts = data.texts;
                    break;
                case "updateId":
                    this.id = data.id;
                    break;
                case "updateDate":
                    this.datetime[0] = data.value;
                    break;
                case "updateTime":
                    this.datetime[1] = data.value;
                    break;

                case "updateVehicle":
                    this.vehicle.show = data.show;
                    this.vehicle.speed = data.speed;
                    this.vehicle.gear = data.gear;
                    this.vehicle.rpm = data.rpm;
                    this.vehicle.fuel.value = data.fuel;
                    this.vehicle.fuel.max = data.fuel;
                    this.vehicle.states.doors = data.doors;
                    this.vehicle.states.engine = data.engine;
                    this.vehicle.states.light = data.light;
                    break;

                case "hideVehicle":
                    this.vehicle.show = false;
                    break;
                case "updateMoney":
                    this.money.cash.value = data.cash;
                    break;
                case "updateBank":
                    this.money.bank.value = data.bank;
                    break;
                case "updateMicrophone":
                    this.microphone = data.microphone;
                    break;
                case "updatePlayers":
                    this.online = data.online;
                    break;
                case "updateSlots":
                    this.slots = data.slots;
                    break;
                case "toggleHud":
                    this.show = data.showHud;
                    break;
                case "updateWeapon":
                    this.weapon.show = data.show;
                    this.weapon.icon = data.icon;
                    this.weapon.ammo = data.ammo;
                    break;
                case "updateAdmin":
                    this.admin.show = data.admin;
                    this.reports.show = data.reports;
                    this.reports.currentReports = data.currentReports;
                    this.reports.totalReports = data.totalReports;
                    break;
                case "updateReports":
                    this.reports.currentReports = data.currentReports;
                    break;
                case "updateNoclip":
                    this.noclip.show = data.noclip
                    break;
                case "updateReports":
                    this.admin.reports.show = data.show;
                    this.admin.reports.currentReports = data.currentReports;
                    this.admin.reports.totalReports = data.totalReports;
                    break;
                case "updateAnnounce":
                    this.announce.show = data.show;
                    this.announce.texts = data.text;
                    break;
                case "updateSafeZone":
                    this.safezone = data.show;
                    break;
                case "updateData":
                    this[data.where] = data.value;
                    break;
                case "updateParams":
                    let temp = JSON.parse(data.params);
                    for (const key in temp) {
                        this[key] = temp[key]
                    }
                    break;
            }
        });
    }
})
