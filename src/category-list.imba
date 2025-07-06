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
		[w:80px l:0px]=(currentTab == "item-list")
		[w:80px l:-100vw]=(currentTab == "order-list" or currentTab == "customer-data")
		[h:calc($main-height - {headerHeight}px)]
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
		

tag category
	prop categoryKey
	prop category
	prop menu

	<self @click=(emit "select", categoryKey)
		[px=8px w:80px h:72px mih:72px]=(currentTab != "category-list")
		[h: 88px mih=88px]=(menu.current == categoryKey and currentTab != "category-list")
		[bg:#282828 bxs:0px 4px #282828, 0px -4px #282828 rdr:4px]=(menu.current != categoryKey and currentTab != "category-list")
	>
		<img src="/img/category/{category.img}.jpg" [rd:4px s:108px transition:$tween]
			[s:64px]=(currentTab == "item-list")
		> # category.icon
		<div [h:96px d:vtl g:8px o:1 tween:$tween]
			[o:0]=(currentTab != "category-list")>

			<span [fs:20px d:hcl h:32px d:hcl]> category.name
			<div [w:64px mih:1px bg:#505050]>
			<div [d:vcl]> for own _, item of (index = 0, category.items) # hack
				<span [h:24px d:hcc]> item.name if ++index <= 2

	css
		d:hcl px:16px g:24px c:white h:128px mih:128px w:100vw
		tween:$tween

tag category-separator
	<self [w:calc(100vw - 16px) h:1px mih:1px bg:#505050]
		[h:0px bg:#282828]=(currentTab != "category-list")
	>