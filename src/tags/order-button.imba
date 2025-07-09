tag order-button < button
	def submitAndShowMain
		let result = await submit!
		if result then show_categories!
	
	def onclick
		if currentTab == "category-list" or currentTab == "item-list"
			currentTab = "order-list"
		elif currentTab == "order-list"
			currentTab = "customer-data"
		elif currentTab == "customer-data"
			submit!

	get text
		if currentTab == "category-list" or currentTab == "item-list"
			"Посмотреть заказ: {order.total} ₽"
		elif currentTab == "order-list"
			"Оформить заказ"
		elif currentTab == "customer-data"
			"Заказать"
	

	<self @click=onclick
		[b:16px]=order.items.length
		[w:calc(100vw - 32px)]=currentTab=="category-list"
	> text

	css
		pos:fixed w:calc(100vw - 48px - 120px) h:48px r:16px b:-64px rd:24px fs:16px
		bg:#282828 @active:#343434 c:#C8C8C8 bxs: 0 0 0 1px #787878 inset
		d:hcc tween:all .3s ease