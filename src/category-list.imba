tag category-list
	prop menu
	def setCategory key
		console.log {key}
		self.scrollTop = self.scrollTop - 272 if headerCompact and currentTab == "category-list"
		menu.current = key
		currentTab = "item-list"

		# Сделать переход лучше, чтобы учитывалась текущая категория,
		# а также верхняя или нижняя категория
		# сделать красиво, в общем

	<self @scroll=scrollCategories
		[t:{headerHeight}px]
		[w:80px l:0px]=(currentTab == "item-list")
		[w:80px l:-100vw]=(currentTab == "order-list" or currentTab == "customer-data")
		# [h:calc($main-height - {headerHeight}px)]
	>
		for own key, category of menu.list
			<category-separator>
			<category categoryKey=key category=category menu=menu @select=(setCategory e.detail)>

		<category-separator>
	
	css
		mask-image: linear-gradient(to bottom, transparent 0%, white 16px, white calc(100% - 16px), transparent 100%)
		d:vtc pos:fixed l:0px w:100vw b:$bottom py:16px scrollbar-width:none
		c:white ofy:scroll
		tween:all .3s ease, height .7s ease
		$tween:all .3s ease