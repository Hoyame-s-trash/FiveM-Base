window.addEventListener('message', (event) => {
	if (event.data.type === 'open') {
		openLeaderboard(event.data.ladder)
	} else if (event.data.type === 'close') {
		closeLeaderboard()
	} else if (event.data.type === 'nextPage') {
		nextPage()
	} else if (event.data.type === 'prevPage') {
		prevPage()
	}
})

let leaderboard = []
let page = 1
function openLeaderboard(ladder) {
	leaderboard = ladder

	$('body').show()

	page = 1

	for (let idx in leaderboard) {
		if (ladder[idx].me) {
			page = Math.ceil((parseInt(idx) + 1) / 10)
			break
		}
	}
	renderLeaderboard()
}

function nextPage() {
	const maxPage = Math.ceil((parseInt(leaderboard.length) + 1) / 10)

	page = Math.min(maxPage, page + 1)
	renderLeaderboard()
}

function prevPage() {
	if (page > 1) {
		page--
		renderLeaderboard()
	}
}

function closeLeaderboard() {
	$('body').hide()
}

function renderLeaderboard() {
	$('.body ol li').remove()
	for (let i = 10 * (page - 1); i < Math.min(leaderboard.length, 10 * page); i++) {
		let className = ''
		let item = leaderboard[i]

		if (i == 0) {
			className = 'pos-first'
		} else if (i == 1) {
			className = 'pos-second'
		} else if (i == 2) {
			className = 'pos-third'
		}

		if (item.me) {
			className += ' pos-me'
		}

		$('.body ol').append(`<li class="${className}">${i + 1}.&nbsp;<mark>${item.name}</mark><small>${item.elo}</small></li>`)
	}
}
