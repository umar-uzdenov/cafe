
tag cafe-header
	prop menu
	get text
		if currentTab == "category-list"
			if headerCompact then "Меню" else "Кафе Васаби"
		elif currentTab == "item-list"
			menu.list[menu.current].name
		elif currentTab == "order-list"
			"Ваш заказ"
		elif currentTab == "customer-data"
			"Оформление заказа"

	<self
		[h:{headerHeight - 64}px pos:rel t:64px]
		[tween: height .2s ease]=!headerCompact
	>
		<img src="/img/logo.jpg" @click=(currentTab = "category-list")
			[s:128px t:32px l:calc(50% - 64px)]=!headerCompact
			[s:64px t:16px l:16px]=headerCompact>
		# <img src="/img/name.jpg" [h:64px b:16px]
		# 	[r:50% translate:50%]=!headerCompact
		# 	[r:16px]=headerCompact>
		<div
			[d:hcc w:calc(100vw - 96px) h:64px r:16px b:16px pos:abs fs:24px tween: all .3s ease]
			[r:50% translate:50% fs:36px]=!headerCompact
			[r:16px]=headerCompact
		> text
	css w:100vw pos:fixed l:0 r:0 tween: height .4s ease
		img pos:abs rd:4px tween: all .3s ease
