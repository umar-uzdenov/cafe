extend tag element
	get rect
		# let rect = this.getBoundingClientRect()
		let rect = window.getComputedStyle self
		return 
			top: rect.top,
			right: rect.right,
			bottom: rect.bottom,
			left: rect.left,
			width: rect.width,
			height: rect.height,
			x: rect.x,
			y: rect.y

def animas element
	let previous
	let animating = false
	let prevCls
	let removedCls
	let observer = new MutationObserver do(mutations, observer)

		# console.log element.rect

		unless prevCls
			previous = element.rect
			prevCls = [...element.classList] 
			return

		unless animating
			let current = element.rect
			removedCls = [...element.classList].filter do -1 == prevCls.indexOf $1
			removedCls.forEach do element.classList.remove $1
			console.log {removedCls}

			let from = {}
			let to = {}
			for own key, value of current
				if previous[key] != value
					from[key] = previous[key]
					to[key] = value
			animating = true
			console.log {from}
			let style = ""
			# style += "width: {from.width or 20}px;"
			# style += "height: {from.height or 20}px;"
			let time = 3000
			element.style = style + "
				height: 32px; width: 116px; bottom: 16px; right: 16px;
				animation: anim {time}ms ease;
			"
			var styleTag = document.createElement "style"
			styleTag.textContent = "
				@keyframes anim \{
					0% \{ transform: scale3d(1, 1, 1) \}
					100% \{ transform: scale3d(2, 2, 1) \}
				\}
			"
			document.body.appendChild styleTag

			setTimeout(&, time) do
					element.style = ""
					animating = false
					removedCls.forEach do element.classList.add $1
					document.body.removeChild styleTag
					prevCls = null

	observer.observe element, { attributes: true, attributeFilter: ['class'], }
	return observer

extend tag element 
	get anima do self..animaConfig or yes
	set anima object
		console.log object
		let x = object
                

tag logo < img
	<self>