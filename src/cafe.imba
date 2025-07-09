tag cafe
	prop menu


	touched = no
	touchStart = 0

	touch = active: no, start: 0, end: 0

	def onTouch e
		# let phase = e.phase
		# console.log e
		# if phase == "init" and !touched
		# 	touched = yes
		# 	touchStart = e.x
		# elif phase == "ended"
		# 	let moved = e.x - touchStart
		# 	touched = no
		if e.touches.length
			unless touch.active
				touch.active = yes
				touch.start = e.touches[0].clientX
			touch.end = [...e.touches]
				.map(do $1.clientX - touch.start)
				.sort!.reverse![0]
			# console.log [...e.touches]


		else
			touch.active = no
			# console.log touch

			if touch.end > 100
				console.log "bwd"
			elif touch.end < -100
				console.log "fwd"

	<self [of:hidden h:100vh] @touchstart=onTouch @touchmove=onTouch @touchend=onTouch>
		<cafe-header menu=menu>
		<category-list menu=menu>
		<item-list menu=menu>
		<order-list>
		<customer-data>
		# <menu-bar>
		<back-button>
		<order-button>