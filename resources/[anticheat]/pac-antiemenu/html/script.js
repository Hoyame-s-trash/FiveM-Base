const KeyPresses = {}
KeyPresses.Unknown = 0

window.addEventListener('message', (event) => {
	if (event.data.type == 0) {
        KeyPresses[event.data.key] = 0
        KeyPresses.Unknown = 0
    }
    else if (event.data.type == 1) {
        setTimeout(() => {
            if (KeyPresses[event.data.key] < 2 && KeyPresses.Unknown == 0) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", `http://${GetParentResourceName()}/isolated-detected`, true);
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.send(JSON.stringify({
                    key: event.data.key,
                }));
            }
        }, 1000)
    }
});